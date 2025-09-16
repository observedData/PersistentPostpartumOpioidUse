*Change working pathway to the dataset folder*

import sas finalDataset.sas7bdat
*Set Weight 
svyset _n [pweight= WTANAL], strata(sud_nest) fpc(totcnt)


***Histogram weighted percentage ***
svy, subpop(if insample==1): tabulate postLength, percent 

***Histogram weighted percentage for vaginal delivery***
 svy, subpop(if insample==1): tabulate postLength if cesarean==0, percent 
***Histogram weighted percentage for cesarean delivery***
  svy, subpop(if insample==1): tabulate postLength if cesarean==1, percent 

***Descriptive statistics CI is calculated based on logit transform
**store output 

putexcel set statades.xlsx, modify 
 
*used package  ssc install estout
estpost svy, subpop(if insample==1): tabulate ageGroup, ci obs percent 
matrix define a=e(obs)
  matrix list a
  matrix define b=e(b)
  matrix list b
  matrix define lb=e(lb)
  matrix list lb
  matrix define ub=e(ub)
  matrix list ub 
  
  **store unweighted frequency 
  local o1=string(a[1,1])
  local o2=string(a[1,2])
  local o3=string(a[1,3])
  local o4=string(a[1,4])
   putexcel B3= "`o1'"
   putexcel B4= "`o2'"
   putexcel B5= "`o3'"
   putexcel B6= "`o4'"
   
  ** Store weighted percentage 
  local p1=string(b[1,1],"%10.1fc")
  local p2=string(b[1,2],"%10.1fc")
  local p3=string(b[1,3],"%10.1fc")
  local p4=string(b[1,4],"%10.1fc")
  
  **Store CI 
  local l1=string(lb[1,1],"%10.1fc")
  local l2=string(lb[1,2],"%10.1fc")
  local l3=string(lb[1,3],"%10.1fc")
  local l4=string(lb[1,4],"%10.1fc")
  local u1=string(ub[1,1],"%10.1fc")
  local u2=string(ub[1,2],"%10.1fc")
  local u3=string(ub[1,3],"%10.1fc")
  local u4=string(ub[1,4],"%10.1fc")
  
  local pp1= " `p1' (`l1', `u1')" 
  local pp2= " `p2' (`l2', `u2')" 
  local pp3= " `p3' (`l3', `u3')" 
  local pp4= " `p4' (`l4', `u4')" 
  
   putexcel C3= "`pp1'"
   putexcel C4= "`pp2'"
   putexcel C5= "`pp3'"
   putexcel C6= "`pp4'"
 
  *** Race/ ethnicity 
estpost svy, subpop(if insample==1): tabulate raceEthn, ci obs percent 
matrix define a=e(obs)
  matrix list a
  matrix define b=e(b)
  matrix list b
  matrix define lb=e(lb)
  matrix list lb
  matrix define ub=e(ub)
  matrix list ub 
  
  **store unweighted frequency 
  local o1=string(a[1,1],"%8.0gc")
  local o2=string(a[1,2],"%8.0gc")
  local o3=string(a[1,3],"%8.0gc")
  local o4=string(a[1,4],"%8.0gc")
  local o5=string(a[1,5],"%8.0gc")
   putexcel B8= "`o1'"
   putexcel B9= "`o2'"
   putexcel B10= "`o3'"
   putexcel B11= "`o4'"
   putexcel B12= "`o5'"
  ** Store weighted percentage 
  local p1=string(b[1,1],"%10.1fc")
  local p2=string(b[1,2],"%10.1fc")
  local p3=string(b[1,3],"%10.1fc")
  local p4=string(b[1,4],"%10.1fc")
  local p5=string(b[1,5],"%10.1fc")
  **Store CI 
  local l1=string(lb[1,1],"%10.1fc")
  local l2=string(lb[1,2],"%10.1fc")
  local l3=string(lb[1,3],"%10.1fc")
  local l4=string(lb[1,4],"%10.1fc")
  local l5=string(lb[1,5],"%10.1fc")
  local u1=string(ub[1,1],"%10.1fc")
  local u2=string(ub[1,2],"%10.1fc")
  local u3=string(ub[1,3],"%10.1fc")
  local u4=string(ub[1,4],"%10.1fc")
  local u5=string(ub[1,5],"%10.1fc")
  local pp1= " `p1' (`l1', `u1')" 
  local pp2= " `p2' (`l2', `u2')" 
  local pp3= " `p3' (`l3', `u3')" 
  local pp4= " `p4' (`l4', `u4')" 
  local pp5= " `p5' (`l5', `u5')" 
   putexcel C8= "`pp1'"
   putexcel C9= "`pp2'"
   putexcel C10= "`pp3'"
   putexcel C11= "`pp4'"
   putexcel C12= "`pp5'"




estpost svy, subpop(if insample==1): tabulate education, ci obs percent 
matrix define a=e(obs)
  matrix list a
  matrix define b=e(b)
  matrix list b
  matrix define lb=e(lb)
  matrix list lb
  matrix define ub=e(ub)
  matrix list ub 
  
  **store unweighted frequency 
  local o1=string(a[1,1])
  local o2=string(a[1,2])
  local o3=string(a[1,3])
   putexcel B14= "`o1'"
   putexcel B15= "`o2'"
   putexcel B16= "`o3'"
   
  ** Store weighted percentage 
  local p1=string(b[1,1],"%10.1fc")
  local p2=string(b[1,2],"%10.1fc")
  local p3=string(b[1,3],"%10.1fc")
  
  **Store CI 
  local l1=string(lb[1,1],"%10.1fc")
  local l2=string(lb[1,2],"%10.1fc")
  local l3=string(lb[1,3],"%10.1fc")

  local u1=string(ub[1,1],"%10.1fc")
  local u2=string(ub[1,2],"%10.1fc")
  local u3=string(ub[1,3],"%10.1fc")

  
  local pp1= " `p1' (`l1', `u1')" 
  local pp2= " `p2' (`l2', `u2')" 
  local pp3= " `p3' (`l3', `u3')" 

  
   putexcel C14= "`pp1'"
   putexcel C15= "`pp2'"
   putexcel C16= "`pp3'"



estpost svy, subpop(if insample==1): tabulate insurance, ci obs percent 
matrix define a=e(obs)
  matrix list a
  matrix define b=e(b)
  matrix list b
  matrix define lb=e(lb)
  matrix list lb
  matrix define ub=e(ub)
  matrix list ub 
  
  **store unweighted frequency 
  local o1=string(a[1,1])
  local o2=string(a[1,2])
  local o3=string(a[1,3])
  local o4=string(a[1,4])
   putexcel B18= "`o1'"
   putexcel B19= "`o2'"
   putexcel B20= "`o3'"
   putexcel B21= "`o4'"
   
  ** Store weighted percentage 
  local p1=string(b[1,1],"%10.1fc")
  local p2=string(b[1,2],"%10.1fc")
  local p3=string(b[1,3],"%10.1fc")
  local p4=string(b[1,4],"%10.1fc")
  
  **Store CI 
  local l1=string(lb[1,1],"%10.1fc")
  local l2=string(lb[1,2],"%10.1fc")
  local l3=string(lb[1,3],"%10.1fc")
  local l4=string(lb[1,4],"%10.1fc")
  local u1=string(ub[1,1],"%10.1fc")
  local u2=string(ub[1,2],"%10.1fc")
  local u3=string(ub[1,3],"%10.1fc")
  local u4=string(ub[1,4],"%10.1fc")
  
  local pp1= " `p1' (`l1', `u1')" 
  local pp2= " `p2' (`l2', `u2')" 
  local pp3= " `p3' (`l3', `u3')" 
  local pp4= " `p4' (`l4', `u4')" 
  
   putexcel C18= "`pp1'"
   putexcel C19= "`pp2'"
   putexcel C20= "`pp3'"
   putexcel C21= "`pp4'"


estpost svy, subpop(if insample==1): tabulate cesarean, ci obs percent 
matrix define a=e(obs)
  matrix list a
  matrix define b=e(b)
  matrix list b
  matrix define lb=e(lb)
  matrix list lb
  matrix define ub=e(ub)
  matrix list ub 
  
  **store unweighted frequency 
  local o1=string(a[1,1])
  local o2=string(a[1,2])

   putexcel B23= "`o1'"
   putexcel B24= "`o2'"

   
  ** Store weighted percentage 
  local p1=string(b[1,1],"%10.1fc")
  local p2=string(b[1,2],"%10.1fc")

  
  **Store CI 
  local l1=string(lb[1,1],"%10.1fc")
  local l2=string(lb[1,2],"%10.1fc")

  local u1=string(ub[1,1],"%10.1fc")
  local u2=string(ub[1,2],"%10.1fc")

  
  local pp1= " `p1' (`l1', `u1')" 
  local pp2= " `p2' (`l2', `u2')" 

  
   putexcel C23= "`pp1'"
   putexcel C24= "`pp2'"





estpost svy, subpop(if insample==1): tabulate preterm, ci obs percent 
matrix define a=e(obs)
  matrix list a
  matrix define b=e(b)
  matrix list b
  matrix define lb=e(lb)
  matrix list lb
  matrix define ub=e(ub)
  matrix list ub 
  
  **store unweighted frequency 
  local o1=string(a[1,1])
  local o2=string(a[1,2])

   putexcel B26= "`o1'"
   putexcel B27= "`o2'"

   
  ** Store weighted percentage 
  local p1=string(b[1,1],"%10.1fc")
  local p2=string(b[1,2],"%10.1fc")

  
  **Store CI 
  local l1=string(lb[1,1],"%10.1fc")
  local l2=string(lb[1,2],"%10.1fc")

  local u1=string(ub[1,1],"%10.1fc")
  local u2=string(ub[1,2],"%10.1fc")

  
  local pp1= " `p1' (`l1', `u1')" 
  local pp2= " `p2' (`l2', `u2')" 

  
   putexcel C26= "`pp1'"
   putexcel C27= "`pp2'"




estpost svy, subpop(if insample==1): tabulate pregDepression, ci obs percent 

matrix define a=e(obs)
  matrix list a
  matrix define b=e(b)
  matrix list b
  matrix define lb=e(lb)
  matrix list lb
  matrix define ub=e(ub)
  matrix list ub 
  
  **store unweighted frequency 
  local o1=string(a[1,1])
  local o2=string(a[1,2])

   putexcel B29= "`o1'"
   putexcel B30= "`o2'"

   
  ** Store weighted percentage 
  local p1=string(b[1,1],"%10.1fc")
  local p2=string(b[1,2],"%10.1fc")

  
  **Store CI 
  local l1=string(lb[1,1],"%10.1fc")
  local l2=string(lb[1,2],"%10.1fc")

  local u1=string(ub[1,1],"%10.1fc")
  local u2=string(ub[1,2],"%10.1fc")

  
  local pp1= " `p1' (`l1', `u1')" 
  local pp2= " `p2' (`l2', `u2')" 

  
   putexcel C29= "`pp1'"
   putexcel C30= "`pp2'"

   
   
 **Prevalence of any postpartum use and persistent use over pregnancy depression status
 
 **two way tabulate table 
 
 estpost svy, subpop(if insample==1):  tabulate pregDepression PostPR, row percent ci obs

 estpost svy, subpop(if insample==1):  tabulate pregDepression postPartumTreat1Month, row percent ci obs
 
 
 
 ***Calculate marginal effects ****************
 
 ***output table ***
  cap cd "/Users/linqing/Library/CloudStorage/Dropbox-Personal/Tables and Figures"
  putexcel set Robust_Analysis.xlsx, modify 

****Unadjusted any postpartum opioid use models ******

***AgeGroup********************************
****Run Regression model
svy, subpop( insample): logistic PostPR i.ageGroup
margins, dydx(*) post
 matrix define b=r(table)
 local m_diff1=string(b[1,2]*100,"%10.1fc")
 local lci_diff1=string(b[5,2]*100,"%10.1fc")
  local uci_diff1=string(b[6,2]*100,"%10.1fc")
  local imAdjust1=" `m_diff1' (`lci_diff1', `uci_diff1')" 
  display "`imAdjust1'"
  putexcel B7= "`imAdjust1'"
  
 local m_diff2=string(b[1,3]*100,"%10.1fc")
 local lci_diff2=string(b[5,3]*100,"%10.1fc")
  local uci_diff2=string(b[6,3]*100,"%10.1fc")
  local imAdjust2=" `m_diff2' (`lci_diff2', `uci_diff2')" 
  display "`imAdjust2'"
  putexcel B8= "`imAdjust2'"
  
 local m_diff3=string(b[1,4]*100,"%10.1fc")
 local lci_diff3=string(b[5,4]*100,"%10.1fc")
  local uci_diff3=string(b[6,4]*100,"%10.1fc")
  local imAdjust3=" `m_diff3' (`lci_diff3', `uci_diff3')" 
  display "`imAdjust3'"
  putexcel B9= "`imAdjust3'"

**********************************************

***Race and Ethnicity*************************
****Run Regression model
 *Find marginal effect for the rest of race and ethnicity groups 
svy, subpop( insample): logistic PostPR i.raceEthn
margins, dydx(*) post
matrix define b=r(table)
 local m_diff1=string(b[1,2]*100,"%10.1fc")
 local lci_diff1=string(b[5,2]*100,"%10.1fc")
  local uci_diff1=string(b[6,2]*100,"%10.1fc")
  local imAdjust1=" `m_diff1' (`lci_diff1', `uci_diff1')" 
  display "`imAdjust1'"
  putexcel B12= "`imAdjust1'"
  
 local m_diff2=string(b[1,3]*100,"%10.1fc")
 local lci_diff2=string(b[5,3]*100,"%10.1fc")
  local uci_diff2=string(b[6,3]*100,"%10.1fc")
  local imAdjust2=" `m_diff2' (`lci_diff2', `uci_diff2')" 
  display "`imAdjust2'"
  putexcel B13= "`imAdjust2'"
  
 local m_diff3=string(b[1,4]*100,"%10.1fc")
 local lci_diff3=string(b[5,4]*100,"%10.1fc")
  local uci_diff3=string(b[6,4]*100,"%10.1fc")
  local imAdjust3=" `m_diff3' (`lci_diff3', `uci_diff3')" 
  display "`imAdjust3'"
  putexcel B14= "`imAdjust3'"
  
   local m_diff4=string(b[1,5]*100,"%10.1fc")
 local lci_diff4=string(b[5,5]*100,"%10.1fc")
  local uci_diff4=string(b[6,5]*100,"%10.1fc")
  local imAdjust4=" `m_diff4' (`lci_diff4', `uci_diff4')" 
  display "`imAdjust4'"
  putexcel B15= "`imAdjust4'"

************************************************

***Educational Level *****************************
*Find marginal effect for the rest of education level
svy, subpop( insample): logistic PostPR i.education
margins, dydx(*) post
 matrix define b=r(table)
  local m_diff1=string(b[1,2]*100,"%10.1fc")
 local lci_diff1=string(b[5,2]*100,"%10.1fc")
  local uci_diff1=string(b[6,2]*100,"%10.1fc")
  local imAdjust1=" `m_diff1' (`lci_diff1', `uci_diff1')" 
  display "`imAdjust1'"
  putexcel B18= "`imAdjust1'"
   
 local m_diff2=string(b[1,3]*100,"%10.1fc")
 local lci_diff2=string(b[5,3]*100,"%10.1fc")
  local uci_diff2=string(b[6,3]*100,"%10.1fc")
  local imAdjust2=" `m_diff2' (`lci_diff2', `uci_diff2')" 
  display "`imAdjust2'"
  putexcel B19= "`imAdjust2'"
***************************************************

***Insurance status *****************************
*Find marginal effect for the rest of insurance types 
svy, subpop( insample): logistic PostPR i.insurance
margins, dydx(*) post
matrix define b=r(table)
  local m_diff1=string(b[1,2]*100,"%10.1fc")
 local lci_diff1=string(b[5,2]*100,"%10.1fc")
  local uci_diff1=string(b[6,2]*100,"%10.1fc")
  local imAdjust1=" `m_diff1' (`lci_diff1', `uci_diff1')" 
  display "`imAdjust1'"
  putexcel B22= "`imAdjust1'"
   
 local m_diff2=string(b[1,3]*100,"%10.1fc")
 local lci_diff2=string(b[5,3]*100,"%10.1fc")
  local uci_diff2=string(b[6,3]*100,"%10.1fc")
  local imAdjust2=" `m_diff2' (`lci_diff2', `uci_diff2')" 
  display "`imAdjust2'"
  putexcel B23= "`imAdjust2'"
  
 local m_diff3=string(b[1,4]*100,"%10.1fc")
 local lci_diff3=string(b[5,4]*100,"%10.1fc")
  local uci_diff3=string(b[6,4]*100,"%10.1fc")
  local imAdjust3=" `m_diff3' (`lci_diff3', `uci_diff3')" 
  display "`imAdjust3'"
  putexcel B24= "`imAdjust3'"

***************************************************

***Types of delivery *****************************
*Find marginal effect for cesarean delivery
svy, subpop( insample): logistic PostPR i. cesarean
margins, dydx(*) post
 matrix define b=r(table)
  local m_diff1=string(b[1,2]*100,"%10.1fc")
 local lci_diff1=string(b[5,2]*100,"%10.1fc")
  local uci_diff1=string(b[6,2]*100,"%10.1fc")
  local imAdjust1=" `m_diff1' (`lci_diff1', `uci_diff1')" 
  display "`imAdjust1'"
  putexcel B26= "`imAdjust1'"
***************************************************

***preterm birth *****************************
*Find marginal effect for preterm birth 
svy, subpop( insample): logistic PostPR i.preterm
margins, dydx(*) post
 matrix define b=r(table)
  local m_diff1=string(b[1,2]*100,"%10.1fc")
 local lci_diff1=string(b[5,2]*100,"%10.1fc")
  local uci_diff1=string(b[6,2]*100,"%10.1fc")
  local imAdjust1=" `m_diff1' (`lci_diff1', `uci_diff1')" 
  display "`imAdjust1'"
  putexcel B29= "`imAdjust1'"
***************************************************

***Depression during pregnancy *****************************
*Find marginal effect for pregnancy depression
svy, subpop( insample): logistic PostPR i.pregDepression
margins, dydx(*) post
 matrix define b=r(table)
 matrix list b
 local m_diff1=string(b[1,2]*100,"%10.1fc")
 local lci_diff1=string(b[5,2]*100,"%10.1fc")
  local uci_diff1=string(b[6,2]*100,"%10.1fc")
  local imAdjust1=" `m_diff1' (`lci_diff1', `uci_diff1')" 
  display "`imAdjust1'"
  putexcel B32= "`imAdjust1'"
***************************************************

******Adjusted Logistic Regression Model*******************
***Postpartum Any Use *****************************
*Find marginal effect for all variables 
svy, subpop( insample): logistic PostPR i.pregDepression i.ageGroup i.raceEthn i.education i.insurance i.cesarean i.preterm
margins, dydx(*) post

 matrix define b=r(table)
 matrix list b
**Store prenatal depression****
 local m_diff1=string(b[1,2]*100,"%10.1fc")
 local lci_diff1=string(b[5,2]*100,"%10.1fc")
  local uci_diff1=string(b[6,2]*100,"%10.1fc")
  local imAdjust1=" `m_diff1' (`lci_diff1', `uci_diff1')" 
  display "`imAdjust1'"
  putexcel C32= "`imAdjust1'"
  ***Store age Group2 
 local m_diff2=string(b[1,4]*100,"%10.1fc")
 local lci_diff2=string(b[5,4]*100,"%10.1fc")
  local uci_diff2=string(b[6,4]*100,"%10.1fc")
local imAdjust2=" `m_diff2' (`lci_diff2', `uci_diff2')" 
  display "`imAdjust2'"
    putexcel C7="`imAdjust2'" 
  ***Store age Group 3
 local m_diff3=string(b[1,5]*100,"%10.1fc")
 local lci_diff3=string(b[5,5]*100,"%10.1fc")
 local uci_diff3=string(b[6,5]*100,"%10.1fc")
local imAdjust3=" `m_diff3' (`lci_diff3', `uci_diff3')" 
 display "`imAdjust3'"
 putexcel C8="`imAdjust3'"
 ***Store age Group 4
  local m_diff4=string(b[1,6]*100,"%10.1fc")
 local lci_diff4=string(b[5,6]*100,"%10.1fc")
 local uci_diff4=string(b[6,6]*100,"%10.1fc")
local imAdjust4=" `m_diff4' (`lci_diff4', `uci_diff4')" 
 display "`imAdjust4'"
 putexcel C9= "`imAdjust4'"
 ***Store raceEthn Group 2
 local m_diff5=string(b[1,8]*100,"%10.1fc")
 local lci_diff5=string(b[5,8]*100,"%10.1fc")
 local uci_diff5=string(b[6,8]*100,"%10.1fc")
local imAdjust5=" `m_diff5' (`lci_diff5', `uci_diff5')" 
 display "`imAdjust5'"
 putexcel C12= "`imAdjust5'"
 
  ***Store raceEthn Group 3
 local m_diff6=string(b[1,9]*100,"%10.1fc")
 local lci_diff6=string(b[5,9]*100,"%10.1fc")
 local uci_diff6=string(b[6,9]*100,"%10.1fc")
local imAdjust6=" `m_diff6' (`lci_diff6', `uci_diff6')" 
 display "`imAdjust6'"
 putexcel C13= "`imAdjust6'"
 
 ****Store raceEthn Group 4
  local m_diff7=string(b[1,10]*100,"%10.1fc")
 local lci_diff7=string(b[5,10]*100,"%10.1fc")
 local uci_diff7=string(b[6,10]*100,"%10.1fc")
local imAdjust7=" `m_diff7' (`lci_diff7', `uci_diff7')" 
 display "`imAdjust7'"
 putexcel C14= "`imAdjust7'"
 
  ****Store raceEthn Group 5
  local m_diff8=string(b[1,11]*100,"%10.1fc")
 local lci_diff8=string(b[5,11]*100,"%10.1fc")
 local uci_diff8=string(b[6,11]*100,"%10.1fc")
local imAdjust8=" `m_diff8' (`lci_diff8', `uci_diff8')" 
 display "`imAdjust8'"
 putexcel C15= "`imAdjust8'"

    ****Store educational level Group 2
 local m_diff9=string(b[1,13]*100,"%10.1fc")
 local lci_diff9=string(b[5,13]*100,"%10.1fc")
 local uci_diff9=string(b[6,13]*100,"%10.1fc")
local imAdjust9=" `m_diff9' (`lci_diff9', `uci_diff9')" 
 display "`imAdjust9'"
 putexcel C18= "`imAdjust9'"
 
****Store educational level Group 3
 local m_diff10=string(b[1,14]*100,"%10.1fc")
 local lci_diff10=string(b[5,14]*100,"%10.1fc")
 local uci_diff10=string(b[6,14]*100,"%10.1fc")
local imAdjust10=" `m_diff10' (`lci_diff10', `uci_diff10')" 
 display "`imAdjust10'"
 putexcel C19= "`imAdjust10'"
 
 ****Store insurance level Group 2
 local m_diff11=string(b[1,16]*100,"%10.1fc")
 local lci_diff11=string(b[5,16]*100,"%10.1fc")
 local uci_diff11=string(b[6,16]*100,"%10.1fc")
local imAdjust11=" `m_diff11' (`lci_diff11', `uci_diff11')" 
 display "`imAdjust11'"
 putexcel C22= "`imAdjust11'"
 ****Store insurance level Group 3
 local m_diff11a=string(b[1,17]*100,"%10.1fc")
 local lci_diff11a=string(b[5,17]*100,"%10.1fc")
 local uci_diff11a=string(b[6,17]*100,"%10.1fc")
local imAdjust11a=" `m_diff11a' (`lci_diff11a', `uci_diff11a')" 
 display "`imAdjust11a'"
 putexcel C23= "`imAdjust11a'"
 
  ****Store insurance level Group 4
  local m_diff11b=string(b[1,18]*100,"%10.1fc")
 local lci_diff11b=string(b[5,18]*100,"%10.1fc")
 local uci_diff11b=string(b[6,18]*100,"%10.1fc")
local imAdjust11b=" `m_diff11b' (`lci_diff11b', `uci_diff11b')" 
 display "`imAdjust11b'"
 putexcel C24= "`imAdjust11b'"
  ****Store cesarean
 local m_diff12=string(b[1,20]*100,"%10.1fc")
 local lci_diff12=string(b[5,20]*100,"%10.1fc")
 local uci_diff12=string(b[6,20]*100,"%10.1fc")
local imAdjust12=" `m_diff12' (`lci_diff12', `uci_diff12')" 
 display "`imAdjust12'"
 putexcel C26= "`imAdjust12'"
 
 ****Store preterm
  local m_diff13=string(b[1,22]*100,"%10.1fc")
 local lci_diff13=string(b[5,22]*100,"%10.1fc")
 local uci_diff13=string(b[6,22]*100,"%10.1fc")
local imAdjust13=" `m_diff13' (`lci_diff13', `uci_diff13')" 
 display "`imAdjust13'"
 putexcel C29= "`imAdjust13'"

***************************************************


*****Postpartum Treat One Month********

***AgeGroup********************************
****Run Regression model
svy, subpop( insample): logistic postPartumTreat1Month i.ageGroup
margins, dydx(*) post
 matrix define b=r(table)
 local m_diff1=string(b[1,2]*100,"%10.1fc")
 local lci_diff1=string(b[5,2]*100,"%10.1fc")
  local uci_diff1=string(b[6,2]*100,"%10.1fc")
  local imAdjust1=" `m_diff1' (`lci_diff1', `uci_diff1')" 
  display "`imAdjust1'"
  putexcel F7= "`imAdjust1'"
  
 local m_diff2=string(b[1,3]*100,"%10.1fc")
 local lci_diff2=string(b[5,3]*100,"%10.1fc")
  local uci_diff2=string(b[6,3]*100,"%10.1fc")
  local imAdjust2=" `m_diff2' (`lci_diff2', `uci_diff2')" 
  display "`imAdjust2'"
  putexcel F8= "`imAdjust2'"
  
 local m_diff3=string(b[1,4]*100,"%10.1fc")
 local lci_diff3=string(b[5,4]*100,"%10.1fc")
  local uci_diff3=string(b[6,4]*100,"%10.1fc")
  local imAdjust3=" `m_diff3' (`lci_diff3', `uci_diff3')" 
  display "`imAdjust3'"
  putexcel F9= "`imAdjust3'"

**********************************************

***Race and Ethnicity*************************
****Run Regression model
 *Find marginal effect for the rest of race and ethnicity groups 
svy, subpop( insample): logistic  postPartumTreat1Month i.raceEthn
margins, dydx(*) post
 matrix define b=r(table)
 local m_diff1=string(b[1,2]*100,"%10.1fc")
 local lci_diff1=string(b[5,2]*100,"%10.1fc")
  local uci_diff1=string(b[6,2]*100,"%10.1fc")
  local imAdjust1=" `m_diff1' (`lci_diff1', `uci_diff1')" 
  display "`imAdjust1'"
  putexcel F12= "`imAdjust1'"
  
 local m_diff2=string(b[1,3]*100,"%10.1fc")
 local lci_diff2=string(b[5,3]*100,"%10.1fc")
  local uci_diff2=string(b[6,3]*100,"%10.1fc")
  local imAdjust2=" `m_diff2' (`lci_diff2', `uci_diff2')" 
  display "`imAdjust2'"
  putexcel F13= "`imAdjust2'"
  
 local m_diff3=string(b[1,4]*100,"%10.1fc")
 local lci_diff3=string(b[5,4]*100,"%10.1fc")
  local uci_diff3=string(b[6,4]*100,"%10.1fc")
  local imAdjust3=" `m_diff3' (`lci_diff3', `uci_diff3')" 
  display "`imAdjust3'"
  putexcel F14= "`imAdjust3'"
  
   local m_diff4=string(b[1,5]*100,"%10.1fc")
 local lci_diff4=string(b[5,5]*100,"%10.1fc")
  local uci_diff4=string(b[6,5]*100,"%10.1fc")
  local imAdjust4=" `m_diff4' (`lci_diff4', `uci_diff4')" 
  display "`imAdjust4'"
  putexcel F15= "`imAdjust4'"
************************************************

***Educational Level *****************************
svy, subpop( insample): logistic postPartumTreat1Month i.education
margins, dydx(*) post
 matrix define b=r(table)
  local m_diff1=string(b[1,2]*100,"%10.1fc")
 local lci_diff1=string(b[5,2]*100,"%10.1fc")
  local uci_diff1=string(b[6,2]*100,"%10.1fc")
  local imAdjust1=" `m_diff1' (`lci_diff1', `uci_diff1')" 
  display "`imAdjust1'"
  putexcel F18= "`imAdjust1'"
  
 local m_diff2=string(b[1,3]*100,"%10.1fc")
 local lci_diff2=string(b[5,3]*100,"%10.1fc")
  local uci_diff2=string(b[6,3]*100,"%10.1fc")
  local imAdjust2=" `m_diff2' (`lci_diff2', `uci_diff2')" 
  display "`imAdjust2'"
  putexcel F19= "`imAdjust2'"
***************************************************

***Insurance status *****************************
*Find marginal effect for the rest of insurance types 
svy, subpop( insample): logistic postPartumTreat1Month i.insurance
margins, dydx(*) post
 matrix define b=r(table)
  local m_diff1=string(b[1,2]*100,"%10.1fc")
 local lci_diff1=string(b[5,2]*100,"%10.1fc")
  local uci_diff1=string(b[6,2]*100,"%10.1fc")
  local imAdjust1=" `m_diff1' (`lci_diff1', `uci_diff1')" 
  display "`imAdjust1'"
  putexcel F22= "`imAdjust1'"
  
   local m_diff2=string(b[1,3]*100,"%10.1fc")
 local lci_diff2=string(b[5,3]*100,"%10.1fc")
  local uci_diff2=string(b[6,3]*100,"%10.1fc")
  local imAdjust2=" `m_diff2' (`lci_diff2', `uci_diff2')" 
  display "`imAdjust2'"
  putexcel F23= "`imAdjust2'"
  
 local m_diff3=string(b[1,4]*100,"%10.1fc")
 local lci_diff3=string(b[5,4]*100,"%10.1fc")
  local uci_diff3=string(b[6,4]*100,"%10.1fc")
  local imAdjust3=" `m_diff3' (`lci_diff3', `uci_diff3')" 
  display "`imAdjust3'"
  putexcel F24= "`imAdjust3'"
  
  
  
***************************************************

***Types of delivery *****************************
svy, subpop( insample): logistic postPartumTreat1Month i.cesarean
margins, dydx(*) post
 matrix define b=r(table)
 matrix list b
  local m_diff1=string(b[1,2]*100,"%10.1fc")
 local lci_diff1=string(b[5,2]*100,"%10.1fc")
  local uci_diff1=string(b[6,2]*100,"%10.1fc")
  local imAdjust1=" `m_diff1' (`lci_diff1', `uci_diff1')" 
  display "`imAdjust1'"
  putexcel F26= "`imAdjust1'"
***************************************************

***preterm birth *****************************
svy, subpop( insample): logistic postPartumTreat1Month i.preterm
margins, dydx(*) post
 matrix define b=r(table)
 matrix list b
 **Store preterm birth
  local m_diff1=string(b[1,2]*100,"%10.1fc")
 local lci_diff1=string(b[5,2]*100,"%10.1fc")
  local uci_diff1=string(b[6,2]*100,"%10.1fc")
  local imAdjust1=" `m_diff1' (`lci_diff1', `uci_diff1')" 
  display "`imAdjust1'"
  putexcel F29= "`imAdjust1'"
 
***************************************************

***Depression during pregnancy auto save*****************************
svy, subpop( insample): logistic postPartumTreat1Month i.pregDepression

***Finding marginal effects 
margins, at(pregDepression=(0 1)) atmeans vsquish
***Finding percentage point difference 
margins, dydx(*) post

margins, i.pregDepression 
 matrix define b=r(table)
  local m_diff1=string(b[1,2]*100,"%10.1fc")
 local lci_diff1=string(b[5,2]*100,"%10.1fc")
  local uci_diff1=string(b[6,2]*100,"%10.1fc")
  local imAdjust1=" `m_diff1' (`lci_diff1', `uci_diff1')" 
  display "`imAdjust1'"
  putexcel F32= "`imAdjust1'"

***************************************************
svy, subpop( insample): logistic postPartumTreat1Month i.pregDepression i.ageGroup i.raceEthn i.education i.insurance i.cesarean i.preterm
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
 
  ****Store insurance level Group 3
 local m_diff22=string(b[1,17]*100,"%10.1fc")
 local lci_diff22=string(b[5,17]*100,"%10.1fc")
  local uci_diff22=string(b[6,17]*100,"%10.1fc")
  local imAdjust22=" `m_diff22' (`lci_diff22', `uci_diff22')" 
  display "`imAdjust22'"
  putexcel G23= "`imAdjust22'"
  
    ****Store insurance level Group 4
 local m_diff33=string(b[1,18]*100,"%10.1fc")
 local lci_diff33=string(b[5,18]*100,"%10.1fc")
  local uci_diff33=string(b[6,18]*100,"%10.1fc")
  local imAdjust33=" `m_diff33' (`lci_diff33', `uci_diff33')" 
  display "`imAdjust33'"
  putexcel G24= "`imAdjust33'"
 
  ****Store cesarean
 local m_diff12=string(b[1,20]*100,"%10.1fc")
 local lci_diff12=string(b[5,20]*100,"%10.1fc")
 local uci_diff12=string(b[6,20]*100,"%10.1fc")
local imAdjust12=" `m_diff12' (`lci_diff12', `uci_diff12')" 
 display "`imAdjust12'"
 putexcel G26= "`imAdjust12'"
 
 ****Store preterm
  local m_diff13=string(b[1,22]*100,"%10.1fc")
 local lci_diff13=string(b[5,22]*100,"%10.1fc")
 local uci_diff13=string(b[6,22]*100,"%10.1fc")
local imAdjust13=" `m_diff13' (`lci_diff13', `uci_diff13')" 
 display "`imAdjust13'"
 putexcel G29= "`imAdjust13'"
 *********
 
 

 
