


/*merge two dataset together*/
Data data1;
set x.opioidSupplement (rename=(sud_nest=sud_nest_OS totcnt=totcnt_OS ));;

proc sort data=data1;
by ID;
run; 

Data data2;
set x.Steenland_ocbs;
proc sort data=data2;
by ID;
run; 

Data x.final;
merge data1 data2;
by ID;
run;


proc sort data=x.final;
by sud_nest;
run; 

Data y.mergeDataset;
set x.final;
run;

/*code provided from the PRAMS set up file
*Construct a new SAS dataset describing the population count for each sampling stratum.  
*The new dataset will have one observation per sampling stratum, and
*two variables:  SUD_NEST (the sampling stratum) and _TOTAL_ (the population count).*/
Data totals_for_sas;
Set x.final(keep= sud_nest totcnt);
By sud_nest;
If first.sud_nest;
_total_=totcnt;
Keep sud_nest _total_;
Run;


/*recode our analytic dataset*/
data reCode;
set  x.final;

/*recode cesarean delivery*/
if DEL_VAG=1 then cesarean = 1;
else if DEL_VAG=2 then cesarean = 0;
else cesarean=.; 


/*recode postpartum relievers 1=Yes 0=No*/
if PP_PPR_HCOD=2 OR PP_PPR_COD=2 OR PP_PPR_OCOD=2 OR PP_PPR_TRA=2 OR PP_PPR_HMOR=2 OR PP_PPR_OMOR=2
OR PP_PPR_MOR=2 OR PP_PPR_FENT =2 then PostPR=1;
else if PP_PPR_HCOD=1 AND PP_PPR_COD=1 AND PP_PPR_OCOD=1 AND PP_PPR_TRA=1 AND PP_PPR_HMOR=1 AND PP_PPR_OMOR=1
AND PP_PPR_MOR=1 AND PP_PPR_FENT =1 then PostPR=0;
else PostPR=.;


/*recode race group 1=white, 2=black, 3=Asian and Pacific Islanders, 4=Other */
if MRACE_WHT=1 then race=1;/*white*/
if MRACE_BLK=1 then race=2; /*black*/
if MRACE_ASN_NAPHSIS =1 OR MRACE_CHN=1 OR MRACE_FLP=1 OR MRACE_JPN=1 OR MRACE_NHW=1 then race=3; /*asian*/
if MRACE_AMI=1 OR MRACE_OTH=1 then race=4;/*natives and others*/

/*recode ethnicity 1=hispanic*/
if HISP_BC=1 then ethn=1;
else if HISP_BC=2 then ethn=0;
else ethn=.;

/*combine race and ethnicity*/
if race = 1 AND ethn=0 then raceEthn=1;/*White non-hispanic*/
else if ethn=1 then raceEthn=2;/*Hispanic*/
else if race = 2 AND ethn=0 then raceEthn=3;/*Black non-hispanic*/
else if race=3 AND ethn=0 then raceEthn=4;/*non-hispanic Asian and Pacific Islanders*/
else if race=4 AND ethn=0 then raceEthn=5; /*Non-hispanic others*/

/*recode ageGroup*/
if 0<MAT_AGE_NAPHSIS<3 then ageGroup=1;/*19 or less*/
else if MAT_AGE_NAPHSIS=3 then ageGroup=2;
else if 3<MAT_AGE_NAPHSIS<6 then ageGroup=3;
else if 5<MAT_AGE_NAPHSIS<8 then ageGroup=4;
else ageGroup=.;

/*recode education level 1= less than 12 years, 2=12-15, 3=16 or more, representing high school, high school graduates and college graduates*/
if 0<MAT_ED<3 then education=1;
else if 2<MAT_ED<5 then education=2;
else if MAT_ED=5 then education=3;
else education=.; 

/*recoding insurance variable using pp8* from core questionaire Q10: prenatal insurance/
if /*Medicaid, chipra, and state specific government plans */
if PP_MEDIC=2 OR PP_CHIP=2 OR PP_GOV=2 then insurance=1;

/*private insurance: job, parent, healthcare exchange, TRICARE and Military*/
if PP8_HCEX=2 OR PP8_PAR=2 OR  PP8_WORK=2 OR PP_MILIT=2 then insurance=2;

/*combine no, having other insurance as one  */
if PP_NONE=2 OR PP_IHS=2 OR PP_GOV2=2 OR PP_OTH=2 then insurance=3;

/*missing and no prenatal care as one*/
if PP8_NOPNC=2 then insurance=.;


/*recode insurance2 to only distinguish private and public insurance*/
if insurance=1 then insurance2=1;
else if insurance = 2 then insurance2=2;
else insurance2=.; 

/*postpartum opioid duration use*/
/*recode duration of opioid use during postpartum*/ 
if 0<PP_PPRTM_LNGTH<41 then postRawLength=PP_PPRTM_LNGTH;
else if PP_PPRTM_LNGTH=41 then postRawLength=0.5;
else if PP_PPRTM_LNGTH=.B AND PostPR=1 then postRawLength=.;
else if PostPR=. then postRawLength=.;
else postRawLength=0;

/*if unit is in months*/
if PP_PPRTM_UNIT=2 then postLength=postRawLength*4;
else postLength=postRawLength;

/*if treatment duration for postpartum is 2 weeks or more*/
if postLength>1.99 then postPartumTreat2Week= 1;
else if postRawLength=. then postPartumTreat2Week=.;
else postPartumTreat2Week=0;

/*if treatment duration for pospartum is 1 month*/
if postLength>3.99 then postPartumTreat1Month= 1;
else postPartumTreat1Month=0;

/*depression during pregnancy*/
if MH_PGDX8 =2 then pregDepression=1;
else if MH_PGDX8 =1 then pregDepression=0;
else pregDepression=.;

***preterm birth is defined as gestational age less than 37 weeks ***;
if 0<GEST_WK_NAPHSIS<4 then preterm=1;
else if 3<GEST_WK_NAPHSIS<6 then preterm=0;
else preterm=.;

run;

data excludeWV;
set reCode;
if STATE in ("MA","PA","KY","LA","MO","UT") then rawSample=1;
else rawSample=0;
run; 

/*create an inSample variable 1=Yes 0 = No*/
data Supplement;
set reCode;
/*only include state that participated in the opioid supplement survey*/
if STATE in ("MA","PA","KY","LA","MO","UT")
/*find rows with no missing values for cesarean delivery, prescribed pain relivers */
then do;
/*if our recoded variables are missing, then we exclude the row*/
	if ageGroup=. OR raceEthn=. OR education=. OR cesarean=. OR preterm=. OR postPR=. OR pregDepression=. then insample=0;
	else insample=1;

end; /*in-state do end*/

else insample=0; /*we exclude row that has states that did not participate in the opioid survey*/
run;

data finalDataset;
set Supplement;
if missing(insurance) then insurance=4;
if missing(insurance2) then insurance2=3;
run;


data y.finalDataset;
set finalDataset;
run;

/*Weighted total frequency: 154,878*/
proc surveyfreq data=finalDataset nomcar total=totals_for_sas;                                                                                         
strata sud_nest;                                                                                                                        
weight wtanal;                                                                                                                          
tables state/nostd row cl;
where insample=1;
run;
/*table 2*/
proc surveyfreq data=finalDataset nomcar total=totals_for_sas;                                                                                         
strata sud_nest;                                                                                                                        
weight wtanal;                                                                                                                          
tables pregDepression* (PostPR postPartumTreat1Month)/nostd row cl nowt nototal;
where insample=1;
run;

/*1807 total respondents in 6 states*/
/*PostPR and PostLength miss n=39 1768*/
/*PregDepression miss n=30 1738*/
/*Other variables miss n=58 1680*/
proc surveyfreq data=excludeWV nomcar total=totals_for_sas;                                                                                         
strata sud_nest;                                                                                                                        
weight wtanal;                                                                                                                          
tables PostPR*PostLength*PregDepression;
where rawSample=1;
run;
/*After exclusion n=1680*/
proc surveyfreq data=Supplement nomcar total=totals_for_sas;                                                                                         
strata sud_nest;                                                                                                                        
weight wtanal;                                                                                                                          
tables PostPR;
where insample=1;
run;





