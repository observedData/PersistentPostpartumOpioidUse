library(consort)
library(DiagrammeR)
 txt1<-"Total number of responses of OCBS from the six states (n=1,807, 100%)";
 txt1_side<-"Excluded individuals who did not respond to questions about pregnancy depression (n=30, 1.66%)"
 txt2<-"Total number of remaining responses (n=1,777, 98.34%)"
 txt2_side<-"Excluded individuals with missing values for all prescribed pain reliever variables,\n
 those who did not report their duration of opioid use,\n
  and those who reported no for at least one prescribed pain reliever use\n
 but have missing values for the other prescribed pain reliever variables(n=39, 2.16%)"
 txt3<-"Final Study Population (n=1,738, 96.18%)"
 txt3_side<-"Excluded individuals with missing observations on any predictor variables used in the model (n=58, 3.21%)"
 txt4<-"Number of individuals included for the model (n=1,680, 92.97%)"
 g<-add_box(txt=txt1)
 g<-add_side_box(g, txt = txt1_side)
 g<-add_box(g,txt=txt2)
 g<-add_side_box(g, txt = txt2_side)
 g<-add_box(g,txt=txt3)
 g<-add_side_box(g, txt = txt3_side)
 g<-add_box(g,txt=txt4)
 plot(g, grViz = TRUE)
 


 
