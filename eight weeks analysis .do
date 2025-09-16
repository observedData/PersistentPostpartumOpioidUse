*Change working pathway to the dataset folder*
*cd "C:\Users\lzheng33\Dropbox (Brown)\Lucy_thesis\SAS_data"
cd "/Users/linqing/Library/CloudStorage/Dropbox-Personal/Lucy's thesis/SAS_data/"
*The finalrobustdataset.sas7bdat is stored Dropbox (Brown)\Lucy_thesis\SAS_data
import sas finalDataset.sas7bdat
*Set Weight 
svyset _n [pweight= WTANAL], strata(sud_nest) fpc(totcnt)

*label insurance*
label define insurancel 1 "Medicaid" 2 "Private" 3 "None or Other" 4 "Missing or No prenatal care"

label values insurance insurancel

*generate new outcome variable that is 8 weeks postpartum opioid use*
gen eightPostPR = 0
replace eightPostPR = 1 if postLength>7.99 


*run tabulate two way table *
svy, subpop(if insample==1):  tabulate insurance eightPostPR, row percent ci obs stubw(20)

 svy, subpop(if insample==1): tabulate eightPostPR, ci obs percent 

 ***output table ***
cap cd "/Users/linqing/Library/CloudStorage/Dropbox-Personal/Lucy's thesis/Manuscript/Final submission to Pregnancy/Major Revision/Tables and Figures"
  putexcel set eight_week.xlsx, modify 
  
 **no data on insurance category 4 so we have to recode insurance 
 gen insurance4 = .
 replace insurance4 = 1 if insurance ==1
 replace insurance4 = 2 if insurance == 2
 replace insurance4 = 3 if insurance ==3 

*run logistic regression*
svy, subpop( insample): logistic eightPostPR i.pregDepression i.ageGroup i.raceEthn i.education i.insurance4 i.cesarean i.preterm
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
 
 
 