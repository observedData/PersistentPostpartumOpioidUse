*code used to generate dataset for additional analysis*
*Interaction effect of cesarean and prenatal depression*


import sas finaldataset.sas7bdat
*Set Weight 
svyset _n [pweight= WTANAL], strata(sud_nest) fpc(totcnt)
***create an interaction term for prenatal depression and cesarean delivery ***
 gen intCesarean= cesarean*pregDepression 

***output table ***

putexcel set InteractionCesarean.xlsx, modify 

**
svy, subpop(insample): logistic postPartumTreat1Month i.pregDepression i.ageGroup i.raceEthn i.education i.insurance i.cesarean i.preterm i.intCesarean
margins, dydx(*) post
 matrix define b=r(table)
 matrix list b
 
 **Store prenatal depression****
 local m_diff1=string(b[1,2]*100,"%10.1fc")
 local lci_diff1=string(b[5,2]*100,"%10.1fc")
  local uci_diff1=string(b[6,2]*100,"%10.1fc")
  local imAdjust1=" `m_diff1' (`lci_diff1', `uci_diff1')" 
  display "`imAdjust1'"
  putexcel B29= "`imAdjust1'"
  ***Store age Group2
 local m_diff2=string(b[1,4]*100,"%10.1fc")
 local lci_diff2=string(b[5,4]*100,"%10.1fc")
  local uci_diff2=string(b[6,4]*100,"%10.1fc")
local imAdjust2=" `m_diff2' (`lci_diff2', `uci_diff2')" 
  display "`imAdjust2'"
   putexcel B4="`imAdjust2'" 

 ***store age group 3
  local m_diff2=string(b[1,5]*100,"%10.1fc")
 local lci_diff2=string(b[5,5]*100,"%10.1fc")
  local uci_diff2=string(b[6,5]*100,"%10.1fc")
local imAdjust2=" `m_diff2' (`lci_diff2', `uci_diff2')" 
  display "`imAdjust2'"
   putexcel B5="`imAdjust2'" 
 
 ** store age group 4
 local m_diff4=string(b[1,6]*100,"%10.1fc")
 local lci_diff4=string(b[5,6]*100,"%10.1fc")
 local uci_diff4=string(b[6,6]*100,"%10.1fc")
local imAdjust4=" `m_diff4' (`lci_diff4', `uci_diff4')" 
 display "`imAdjust4'"
 putexcel B6= "`imAdjust4'"
	
  ***Store raceEthn Group 2
  local m_diff4=string(b[1,8]*100,"%10.1fc")
 local lci_diff4=string(b[5,8]*100,"%10.1fc")
 local uci_diff4=string(b[6,8]*100,"%10.1fc")
local imAdjust4=" `m_diff4' (`lci_diff4', `uci_diff4')" 
 display "`imAdjust4'"
 putexcel B9= "`imAdjust4'"
 ***Store raceEthn Group 3
 local m_diff5=string(b[1,9]*100,"%10.1fc")
 local lci_diff5=string(b[5,9]*100,"%10.1fc")
 local uci_diff5=string(b[6,9]*100,"%10.1fc")
local imAdjust5=" `m_diff5' (`lci_diff5', `uci_diff5')" 
 display "`imAdjust5'"
 putexcel B10= "`imAdjust5'"
 
  ***Store raceEthn Group 4
 local m_diff6=string(b[1,10]*100,"%10.1fc")
 local lci_diff6=string(b[5,10]*100,"%10.1fc")
 local uci_diff6=string(b[6,10]*100,"%10.1fc")
local imAdjust6=" `m_diff6' (`lci_diff6', `uci_diff6')" 
 display "`imAdjust6'"
 putexcel B11= "`imAdjust6'"
 
 ****Store raceEthn Group 5
  local m_diff7=string(b[1,11]*100,"%10.1fc")
 local lci_diff7=string(b[5,11]*100,"%10.1fc")
 local uci_diff7=string(b[6,11]*100,"%10.1fc")
local imAdjust7=" `m_diff7' (`lci_diff7', `uci_diff7')" 
 display "`imAdjust7'"
 putexcel B12= "`imAdjust7'"
 
  ****Store educational level Group 2
  local m_diff8=string(b[1,13]*100,"%10.1fc")
 local lci_diff8=string(b[5,13]*100,"%10.1fc")
 local uci_diff8=string(b[6,13]*100,"%10.1fc")
local imAdjust8=" `m_diff8' (`lci_diff8', `uci_diff8')" 
 display "`imAdjust8'"
 putexcel B15= "`imAdjust8'"

    ****Store educational level Group 3
 local m_diff9=string(b[1,14]*100,"%10.1fc")
 local lci_diff9=string(b[5,14]*100,"%10.1fc")
 local uci_diff9=string(b[6,14]*100,"%10.1fc")
local imAdjust9=" `m_diff9' (`lci_diff9', `uci_diff9')" 
 display "`imAdjust9'"
 putexcel B16= "`imAdjust9'"
 
 ****Store insurance level Group 2
 local m_diff11=string(b[1,16]*100,"%10.1fc")
 local lci_diff11=string(b[5,16]*100,"%10.1fc")
 local uci_diff11=string(b[6,16]*100,"%10.1fc")
local imAdjust11=" `m_diff11' (`lci_diff11', `uci_diff11')" 
 display "`imAdjust11'"
 putexcel B19= "`imAdjust11'"
 ****Store insurance level Group 3
 local m_diff11a=string(b[1,17]*100,"%10.1fc")
 local lci_diff11a=string(b[5,17]*100,"%10.1fc")
 local uci_diff11a=string(b[6,17]*100,"%10.1fc")
local imAdjust11a=" `m_diff11a' (`lci_diff11a', `uci_diff11a')" 
 display "`imAdjust11a'"
 putexcel B20= "`imAdjust11a'"
 
  ****Store insurance level Group 4
  local m_diff11b=string(b[1,18]*100,"%10.1fc")
 local lci_diff11b=string(b[5,18]*100,"%10.1fc")
 local uci_diff11b=string(b[6,18]*100,"%10.1fc")
local imAdjust11b=" `m_diff11b' (`lci_diff11b', `uci_diff11b')" 
 display "`imAdjust11b'"
 putexcel B21= "`imAdjust11b'"
  ****Store cesarean
 local m_diff12=string(b[1,20]*100,"%10.1fc")
 local lci_diff12=string(b[5,20]*100,"%10.1fc")
 local uci_diff12=string(b[6,20]*100,"%10.1fc")
local imAdjust12=" `m_diff12' (`lci_diff12', `uci_diff12')" 
 display "`imAdjust12'"
 putexcel B23= "`imAdjust12'"
 
 ****Store preterm
  local m_diff13=string(b[1,22]*100,"%10.1fc")
 local lci_diff13=string(b[5,22]*100,"%10.1fc")
 local uci_diff13=string(b[6,22]*100,"%10.1fc")
local imAdjust13=" `m_diff13' (`lci_diff13', `uci_diff13')" 
 display "`imAdjust13'"
 putexcel B26= "`imAdjust13'"
 
  ****Store interaction term for cesarean delivery and prenatal depression****
 local m_diff14=string(b[1,24]*100,"%10.1fc")
 local lci_diff14=string(b[5,24]*100,"%10.1fc")
 local uci_diff14=string(b[6,24]*100,"%10.1fc")
local imAdjust14=" `m_diff14' (`lci_diff14', `uci_diff14')" 
 display "`imAdjust14'"
 putexcel B32= "`imAdjust14'"
 
