**
**We rerun the multivariate logistic regression model but only include 
**individuals who did not use opioid during pregnancy 
**
*Change working pathway to the dataset folder*
cd "/Users/linqing/Library/CloudStorage/Dropbox-Personal/Lucy's thesis/SAS_data/"
*The finaldataset.sas7bdat is stored Dropbox (Brown)\Lucy_thesis\SAS_data
import sas finaldataset.sas7bdat
*Set Weight 
svyset _n [pweight= WTANAL], strata(sud_nest) fpc(totcnt)

*recode pregnancy opioid use  PregPR= 1 is yes and PregPR = 0 is No **
gen PregPR = .
replace PregPR = 1 if DP_PPR_HCOD == 2 | DP_PPR_COD == 2 | DP_PPR_OCOD == 2 | ///
                      DP_PPR_TRA == 2 | DP_PPR_HMOR == 2 | DP_PPR_OMOR == 2 | ///
                      DP_PPR_MOR == 2 | DP_PPR_FENT == 2
					  
replace PregPR = 0 if DP_PPR_HCOD==1 & DP_PPR_COD==1 & DP_PPR_OCOD==1 ///
                       & DP_PPR_TRA==1 & DP_PPR_HMOR==1 & DP_PPR_OMOR==1 ///
					   & DP_PPR_MOR==1 & DP_PPR_FENT ==1

*create in sample label, we are doing a complete case analysis 
*and we are only include individuals who never used opioids during pregnancy*
gen insampleOpioidNaive = insample
replace insampleOpioidNaive = 0 if PregPR == 1 | PregPR ==. 
**because insurance 3 is empty, so we need to remove insurance 3 from our insurance variable
**new insurance3 variable def: Medicaid=1, Private = 2, Missing or No prenatal Care = 3
gen insurance3 = .
replace insurance3 = 1 if insurance ==1
replace insurance3 = 2 if insurance ==2 
replace insurance3 = 3 if insurance ==4 

**cross tabulate previous opioid use and insurance variable 
svy, subpop(if insample==1):  tabulate PregPR insurance, row percent ci obs

** cross tabulation of previous opioid use and insurance variable among those who used postpartum opioid for one month or more
svy, subpop(if insample==1 & postPartumTreat1Month==1):  tabulate PregPR insurance, row percent ci obs



***output table ***
  cap cd "/Users/linqing/Library/CloudStorage/Dropbox-Personal/Lucy's thesis/Manuscript/Final submission to Pregnancy/Major Revision/Tables and Figures"
  putexcel set OpioidNaive.xlsx, modify 

svy, subpop(insampleOpioidNaive): logistic postPartumTreat1Month i.pregDepression i.ageGroup i.raceEthn i.education i.insurance3 i.cesarean i.preterm 
margins, dydx(*) post

 matrix define b=r(table)
 matrix list b
**Store prenatal depression****
 local m_diff1=string(b[1,2]*100,"%10.1fc")
 local lci_diff1=string(b[5,2]*100,"%10.1fc")
  local uci_diff1=string(b[6,2]*100,"%10.1fc")
  local imAdjust1=" `m_diff1' (`lci_diff1', `uci_diff1')" 
  display "`imAdjust1'"
  putexcel G32= "`imAdjust1'"
  ***Store age Group2 
 local m_diff2=string(b[1,4]*100,"%10.1fc")
 local lci_diff2=string(b[5,4]*100,"%10.1fc")
  local uci_diff2=string(b[6,4]*100,"%10.1fc")
local imAdjust2=" `m_diff2' (`lci_diff2', `uci_diff2')" 
  display "`imAdjust2'"
    putexcel G7="`imAdjust2'" 
  ***Store age Group 3
 local m_diff3=string(b[1,5]*100,"%10.1fc")
 local lci_diff3=string(b[5,5]*100,"%10.1fc")
 local uci_diff3=string(b[6,5]*100,"%10.1fc")
local imAdjust3=" `m_diff3' (`lci_diff3', `uci_diff3')" 
 display "`imAdjust3'"
 putexcel G8="`imAdjust3'"
 ***Store age Group 4
  local m_diff4=string(b[1,6]*100,"%10.1fc")
 local lci_diff4=string(b[5,6]*100,"%10.1fc")
 local uci_diff4=string(b[6,6]*100,"%10.1fc")
local imAdjust4=" `m_diff4' (`lci_diff4', `uci_diff4')" 
 display "`imAdjust4'"
 putexcel G9= "`imAdjust4'"
 ***Store raceEthn Group 2
 local m_diff5=string(b[1,8]*100,"%10.1fc")
 local lci_diff5=string(b[5,8]*100,"%10.1fc")
 local uci_diff5=string(b[6,8]*100,"%10.1fc")
local imAdjust5=" `m_diff5' (`lci_diff5', `uci_diff5')" 
 display "`imAdjust5'"
 putexcel G12= "`imAdjust5'"
 
  ***Store raceEthn Group 3
 local m_diff6=string(b[1,9]*100,"%10.1fc")
 local lci_diff6=string(b[5,9]*100,"%10.1fc")
 local uci_diff6=string(b[6,9]*100,"%10.1fc")
local imAdjust6=" `m_diff6' (`lci_diff6', `uci_diff6')" 
 display "`imAdjust6'"
 putexcel G13= "`imAdjust6'"
 
 ****Store raceEthn Group 4
  local m_diff7=string(b[1,10]*100,"%10.1fc")
 local lci_diff7=string(b[5,10]*100,"%10.1fc")
 local uci_diff7=string(b[6,10]*100,"%10.1fc")
local imAdjust7=" `m_diff7' (`lci_diff7', `uci_diff7')" 
 display "`imAdjust7'"
 putexcel G14= "`imAdjust7'"
 
  ****Store raceEthn Group 5
  local m_diff8=string(b[1,11]*100,"%10.1fc")
 local lci_diff8=string(b[5,11]*100,"%10.1fc")
 local uci_diff8=string(b[6,11]*100,"%10.1fc")
local imAdjust8=" `m_diff8' (`lci_diff8', `uci_diff8')" 
 display "`imAdjust8'"
 putexcel G15= "`imAdjust8'"

    ****Store educational level Group 2
 local m_diff9=string(b[1,13]*100,"%10.1fc")
 local lci_diff9=string(b[5,13]*100,"%10.1fc")
 local uci_diff9=string(b[6,13]*100,"%10.1fc")
local imAdjust9=" `m_diff9' (`lci_diff9', `uci_diff9')" 
 display "`imAdjust9'"
 putexcel G18= "`imAdjust9'"
 
****Store educational level Group 3
 local m_diff10=string(b[1,14]*100,"%10.1fc")
 local lci_diff10=string(b[5,14]*100,"%10.1fc")
 local uci_diff10=string(b[6,14]*100,"%10.1fc")
local imAdjust10=" `m_diff10' (`lci_diff10', `uci_diff10')" 
 display "`imAdjust10'"
 putexcel G19= "`imAdjust10'"
 
 ****Store insurance level Group 2
 local m_diff11=string(b[1,16]*100,"%10.1fc")
 local lci_diff11=string(b[5,16]*100,"%10.1fc")
 local uci_diff11=string(b[6,16]*100,"%10.1fc")
local imAdjust11=" `m_diff11' (`lci_diff11', `uci_diff11')" 
 display "`imAdjust11'"
 putexcel G22= "`imAdjust11'"
 
  ****Store insurance level Group 4
 local m_diff22=string(b[1,17]*100,"%10.1fc")
 local lci_diff22=string(b[5,17]*100,"%10.1fc")
  local uci_diff22=string(b[6,17]*100,"%10.1fc")
  local imAdjust22=" `m_diff22' (`lci_diff22', `uci_diff22')" 
  display "`imAdjust22'"
  putexcel G24= "`imAdjust22'"
  

  ****Store cesarean
 local m_diff12=string(b[1,19]*100,"%10.1fc")
 local lci_diff12=string(b[5,19]*100,"%10.1fc")
 local uci_diff12=string(b[6,19]*100,"%10.1fc")
local imAdjust12=" `m_diff12' (`lci_diff12', `uci_diff12')" 
 display "`imAdjust12'"
 putexcel G26= "`imAdjust12'"
 
 ****Store preterm
  local m_diff13=string(b[1,21]*100,"%10.1fc")
 local lci_diff13=string(b[5,21]*100,"%10.1fc")
 local uci_diff13=string(b[6,21]*100,"%10.1fc")
local imAdjust13=" `m_diff13' (`lci_diff13', `uci_diff13')" 
 display "`imAdjust13'"
 putexcel G29= "`imAdjust13'"
 *********
 
 

