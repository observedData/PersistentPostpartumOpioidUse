# PersistentPostpartumOpioidUse
Companion code for the paper "[The association between prenatal depression and persistent postpartum pharmaceutical opioid use in six US states](http://dx.doi.org/10.1002/pmf2.70105)". 

The `Merging_DescriptiveStatistics.sas` file is the code for data cleaning and merging of the data from the 2019 PRAMS core questionnaire, Opioid Supplement, and Opioid Call Back Survey (OCBS). 

The `MainAnalysis.do` file consists of the code for descriptive statistics and the primary analysis. The primary analysis includes both unadjusted and adjusted logistic regression models, which produce the results presented in Table 3. The descriptive statistics results were plotted in R with the code as shown in `Histogram_weighted_total.R`. We have also made the consort in R. Please see `consort.R`.

The `Interaction-effect.do` file produces the results for the interaction effect of cesarean delivery and prenatal depression on persistent postpartum opioid use.

The `sensitivity opioid naive.do` file consists of the sensitivity analysis code for individuals who had not used opioids during pregnancy. Please note that these individuals might not be fully opioid naive since we do not have any information on whether they had used opioids before pregnancy. 

The `eight weeks analysis .do` file produces the results for the other sensitivity analysis, which examines the association between prenatal depression and postpartum opioid use for eight weeks or more. 


## Citation
Zheng, L., Miller, E.S. and Steenland, M.W. (2025), The association between prenatal depression and persistent postpartum pharmaceutical opioid use in six US states. Pregnancy, 1: e70105. https://doi.org/10.1002/pmf2.70105

If using LaTeX, you can use the following bibTex citation:
```
@article{https://doi.org/10.1002/pmf2.70105,
author = {Zheng, Linqing and Miller, Emily S. and Steenland, Maria W.},
title = {The association between prenatal depression and persistent postpartum pharmaceutical opioid use in six US states},
journal = {Pregnancy},
volume = {1},
number = {5},
pages = {e70105},
keywords = {persistent postpartum opioid use, PRAMS, prenatal depression},
doi = {https://doi.org/10.1002/pmf2.70105},
url = {https://obgyn.onlinelibrary.wiley.com/doi/abs/10.1002/pmf2.70105},
eprint = {https://obgyn.onlinelibrary.wiley.com/doi/pdf/10.1002/pmf2.70105},
year = {2025}
}
```

## Contact
Corresponding Author: Linqing Zheng (email: lzheng1@une.edu)
