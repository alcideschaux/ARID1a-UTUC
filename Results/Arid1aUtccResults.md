# ARID1a Expression in Upper Tract Urothelial Carcinoma
Last update: ``Mon May 19 21:18:31 2014``


```r
opts_chunk$set(echo = FALSE, warning = FALSE, message = FALSE)
```


* Loading the libraries and functions required for the analysis

```r
library(survival)
source(file = "../standard.analysis.R")
```

* Opening the dataset, selecting variables relevant to the analysis, and dropping unused levels

```r
arid1a.full <- read.csv(file = "../arid1a.utuc.csv")
arid1a.data <- arid1a.full[c("sex", "age", "location", "location2", "pT", "pT.2", 
    "pT.a", "WHO.grade", "lymph.nodes", "lvi", "metastasis", "bladder.recur", 
    "fu.recur", "tumor.prog", "fu.prog", "outcome", "dod", "fu.outcome", "tumor.h.med", 
    "tumor.pos.med", "normal.h.med", "normal.pos.med", "tumor.h.0", "tumor.h.p50", 
    "tumor.h.q3", "tumor.pos.0", "tumor.pos.p50", "tumor.pos.q3")]
arid1a.data <- droplevels(arid1a.data)
```

***
## 1) Clinicopathologic Features and Outcome
* Patient's age

```
##        Values
## Mean     70.0
## SD        8.9
## Median   71.0
## IQR      11.5
```

* Patient's sex

```
##        Count Percentages
## Female    39        39.4
## Male      60        60.6
```

* Tumor location

```
##               Count Percentages
## Pelvis           45        45.5
## Pelvis-Ureter     4         4.0
## Ureter           50        50.5
```

* pT stage

```
##     Count Percentages
## pT1    18        18.2
## pT2     8         8.1
## pT3    48        48.5
## pT4     6         6.1
## pTa    19        19.2
```

* WHO histologic grade

```
##            Count Percentages
## High Grade    84        84.8
## Low Grade     15        15.2
```

* Lymphovascular invasion

```
##     Count Percentages
## No     59        59.6
## Yes    40        40.4
```

* Lymph node metastasis

```
##      Count Percentages
## No      84        84.8
## Yes     12        12.1
## <NA>     3         3.0
```

* Distant metastasis

```
##      Count Percentages
## No      90        90.9
## Yes      4         4.0
## <NA>     5         5.1
```

* Bladder recurrence

```
##      Count Percentages
## No      65        65.7
## Yes     32        32.3
## <NA>     2         2.0
```

* tumor progression

```
##     Count Percentages
## No     61        61.6
## Yes    38        38.4
```

* Patient's outcome

```
##     Count Percentages
## AWD     5         5.1
## DOC     3         3.0
## DOD    30        30.3
## LFU    23        23.2
## NED    38        38.4
```

***

## 2) Association of Clinicopathologic Features and ARID1a Expression with Tumor Progression
* Cases with tumor progression

```
## 
##  No Yes 
##  61  38
```

* Patient's age

```
##        No Yes
## Median 71  72
## IQR    15  12
## 
## Mann-Whitney's P value = 0.1467
```

* Patient's sex

```
## **Table of Frequencies**
##         Column
## Row      No Yes
##   Female 26  13
##   Male   35  25
## 
## **Row Percentages**
##         Column
## Row      No Yes
##   Female 67  33
##   Male   58  42
## 
## **Column Percentages**
##         Column
## Row      No Yes
##   Female 43  34
##   Male   57  66
## 
## Fisher's P value = 0.5262
```

* Tumor location

```
## **Table of Frequencies**
##                Column
## Row             No Yes
##   Pelvis        30  15
##   Pelvis-Ureter  2   2
##   Ureter        29  21
## 
## **Row Percentages**
##                Column
## Row             No Yes
##   Pelvis        67  33
##   Pelvis-Ureter 50  50
##   Ureter        58  42
## 
## **Column Percentages**
##                Column
## Row             No Yes
##   Pelvis        49  39
##   Pelvis-Ureter  3   5
##   Ureter        48  55
## 
## Fisher's P value = 0.5787
```

* pT stage

```
## **Table of Frequencies**
##      Column
## Row   No Yes
##   pT1 17   1
##   pT2  6   2
##   pT3 19  29
##   pT4  1   5
##   pTa 18   1
## 
## **Row Percentages**
##      Column
## Row   No Yes
##   pT1 94   6
##   pT2 75  25
##   pT3 40  60
##   pT4 17  83
##   pTa 95   5
## 
## **Column Percentages**
##      Column
## Row   No Yes
##   pT1 28   3
##   pT2 10   5
##   pT3 31  76
##   pT4  2  13
##   pTa 30   3
## 
## Fisher's P value = 1.278e-07
```

* WHO histologic grade

```
## **Table of Frequencies**
##             Column
## Row          No Yes
##   High Grade 48  36
##   Low Grade  13   2
## 
## **Row Percentages**
##             Column
## Row          No Yes
##   High Grade 57  43
##   Low Grade  87  13
## 
## **Column Percentages**
##             Column
## Row          No Yes
##   High Grade 79  95
##   Low Grade  21   5
## 
## Fisher's P value = 0.04221
```

* Lymph node metastasis

```
## **Table of Frequencies**
##      Column
## Row   No Yes
##   No  55  29
##   Yes  3   9
## 
## **Row Percentages**
##      Column
## Row   No Yes
##   No  65  35
##   Yes 25  75
## 
## **Column Percentages**
##      Column
## Row   No Yes
##   No  95  76
##   Yes  5  24
## 
## Fisher's P value = 0.01085
```

* Lymmphovascular invasion

```
## **Table of Frequencies**
##      Column
## Row   No Yes
##   No  48  11
##   Yes 13  27
## 
## **Row Percentages**
##      Column
## Row   No Yes
##   No  81  19
##   Yes 32  68
## 
## **Column Percentages**
##      Column
## Row   No Yes
##   No  79  29
##   Yes 21  71
## 
## Fisher's P value = 1.918e-06
```

* Tumor median H-score

```
##           No   Yes
## Median 160.0 170.0
## IQR    207.5 214.4
## 
## Mann-Whitney's P value = 0.6049
```

* Tumor median % positive cells

```
##          No  Yes
## Median 90.0 75.0
## IQR    41.9 48.8
## 
## Mann-Whitney's P value = 0.9046
```

***

## 3) Association of Clinicopathologic Features and ARID1a Expression with Cancer-Related mortality
* Cases with cancer-related mortality

```
## 
##  No Yes 
##  69  30
```

* Patient's age

```
##        No  Yes
## Median 71 71.5
## IQR    14 10.5
## 
## Mann-Whitney's P value = 0.4832
```

* Patient's sex

```
## **Table of Frequencies**
##         Column
## Row      No Yes
##   Female 29  10
##   Male   40  20
## 
## **Row Percentages**
##         Column
## Row      No Yes
##   Female 74  26
##   Male   67  33
## 
## **Column Percentages**
##         Column
## Row      No Yes
##   Female 42  33
##   Male   58  67
## 
## Fisher's P value = 0.5044
```

* Tumor location

```
## **Table of Frequencies**
##                Column
## Row             No Yes
##   Pelvis        32  13
##   Pelvis-Ureter  3   1
##   Ureter        34  16
## 
## **Row Percentages**
##                Column
## Row             No Yes
##   Pelvis        71  29
##   Pelvis-Ureter 75  25
##   Ureter        68  32
## 
## **Column Percentages**
##                Column
## Row             No Yes
##   Pelvis        46  43
##   Pelvis-Ureter  4   3
##   Ureter        49  53
## 
## Fisher's P value = 0.9269
```

* pT stage

```
## **Table of Frequencies**
##      Column
## Row   No Yes
##   pT1 18   0
##   pT2  6   2
##   pT3 25  23
##   pT4  1   5
##   pTa 19   0
## 
## **Row Percentages**
##      Column
## Row    No Yes
##   pT1 100   0
##   pT2  75  25
##   pT3  52  48
##   pT4  17  83
##   pTa 100   0
## 
## **Column Percentages**
##      Column
## Row   No Yes
##   pT1 26   0
##   pT2  9   7
##   pT3 36  77
##   pT4  1  17
##   pTa 28   0
## 
## Fisher's P value = 1.284e-07
```

* WHO histologic grade

```
## **Table of Frequencies**
##             Column
## Row          No Yes
##   High Grade 55  29
##   Low Grade  14   1
## 
## **Row Percentages**
##             Column
## Row          No Yes
##   High Grade 65  35
##   Low Grade  93   7
## 
## **Column Percentages**
##             Column
## Row          No Yes
##   High Grade 80  97
##   Low Grade  20   3
## 
## Fisher's P value = 0.03395
```

* Lymph node metastasis

```
## **Table of Frequencies**
##      Column
## Row   No Yes
##   No  61  23
##   Yes  5   7
## 
## **Row Percentages**
##      Column
## Row   No Yes
##   No  73  27
##   Yes 42  58
## 
## **Column Percentages**
##      Column
## Row   No Yes
##   No  92  77
##   Yes  8  23
## 
## Fisher's P value = 0.04492
```

* Lymphovascular invasion

```
## **Table of Frequencies**
##      Column
## Row   No Yes
##   No  51   8
##   Yes 18  22
## 
## **Row Percentages**
##      Column
## Row   No Yes
##   No  86  14
##   Yes 45  55
## 
## **Column Percentages**
##      Column
## Row   No Yes
##   No  74  27
##   Yes 26  73
## 
## Fisher's P value = 1.606e-05
```

* Tumor median H-score

```
##           No Yes
## Median 177.5 130
## IQR    205.0 215
## 
## Mann-Whitney's P value = 0.8966
```

* Tumor median % positive cells

```
##        No Yes
## Median 90  75
## IQR    35  55
## 
## Mann-Whitney's P value = 0.3724
```

***

## 4) Odds Ratios for Tumor Progression
### 4.1) Clinicopathologic features
* Patient's age

```
##             Odds Ratio     2.5 % 97.5 % P value
## (Intercept)    0.02869 0.0007659 0.8003 0.04342
## age            1.04470 0.9967841 1.0987 0.07600
```

* Patient's sex

```
##             Odds Ratio  2.5 % 97.5 % P value
## (Intercept)      0.500 0.2490 0.9551 0.04129
## sexMale          1.429 0.6216 3.3694 0.40563
```

* Tumor location (Pelvis vs. ureter, tumors in pelvis-ureter excluded)

```
##                 Odds Ratio  2.5 % 97.5 % P value
## (Intercept)          0.500 0.2619 0.9142 0.02838
## location2Ureter      1.448 0.6302 3.3824 0.38543
```

* High pT stage (>pT2)

```
##             Odds Ratio   2.5 %  97.5 %   P value
## (Intercept)    0.09756 0.02931  0.2415 8.877e-06
## pT.2Yes       17.42500 5.96830 64.5689 1.550e-06
```

* WHO histologic grade

```
##                    Odds Ratio   2.5 % 97.5 % P value
## (Intercept)            0.7500 0.48385 1.1522 0.19196
## WHO.gradeLow Grade     0.2051 0.03083 0.8036 0.04519
```

* Metastatic lymph nodes

```
##                Odds Ratio  2.5 %  97.5 %  P value
## (Intercept)        0.5273 0.3321  0.8197 0.005287
## lymph.nodesYes     5.6897 1.5620 27.1552 0.013665
```

* Lymphovascular invasion

```
##             Odds Ratio 2.5 %  97.5 %   P value
## (Intercept)     0.2292 0.113  0.4245 1.046e-05
## lviYes          9.0629 3.683 23.9370 3.491e-06
```

### 4.2) ARID1a Expression, Unadjusted
* H-score = 0 vs. H-score > 0

```
##              Odds Ratio  2.5 % 97.5 % P value
## (Intercept)       0.625 0.4062 0.9484 0.02916
## tumor.h.0Low      0.960 0.1876 4.1610 0.95724
```

* H-score < median vs. H-score > median

```
##                Odds Ratio  2.5 % 97.5 % P value
## (Intercept)        0.6857 0.4033  1.146  0.1546
## tumor.h.p50Low     0.7853 0.3371  1.794  0.5690
```

* H-score < upper quartile vs. H-score > upper quartile 

```
##               Odds Ratio  2.5 % 97.5 % P value
## (Intercept)       0.8095 0.4217  1.532  0.5172
## tumor.h.q3Low     0.6485 0.2815  1.489  0.3061
```

* % positive cells = 0 vs. % positive cells > 0

```
##                Odds Ratio  2.5 % 97.5 % P value
## (Intercept)         0.625 0.4062 0.9484 0.02916
## tumor.pos.0Low      0.960 0.1876 4.1610 0.95724
```

* % positive cells < median vs. % positive cells > median

```
##                  Odds Ratio  2.5 % 97.5 % P value
## (Intercept)          0.5128 0.2935 0.8684 0.01517
## tumor.pos.p50Low     1.5955 0.6997 3.6594 0.26636
```

* % positive cells < upper quartile vs. % positive cells > upper quartile

```
##                 Odds Ratio  2.5 % 97.5 % P value
## (Intercept)         0.9375 0.4589  1.905  0.8575
## tumor.pos.q3Low     0.5452 0.2278  1.298  0.1694
```

### 4.3) ARID1a, Adjusted by Clinicopathologic Features
* H-score = 0 vs. H-score > 0

```
##                    Odds Ratio     2.5 % 97.5 %   P value
## (Intercept)          0.007639 3.856e-05  0.874 0.0538022
## tumor.h.0Low         1.439069 1.942e-01  9.914 0.7111554
## age                  1.050128 9.855e-01  1.125 0.1424902
## sexMale              1.335766 4.369e-01  4.124 0.6092737
## location2Ureter      0.897654 3.113e-01  2.519 0.8379501
## WHO.gradeLow Grade   0.266703 3.549e-02  1.280 0.1317755
## lymph.nodesYes       1.454770 2.988e-01  8.545 0.6533197
## lviYes               8.285272 2.749e+00 27.652 0.0002914
```

* H-score < median vs. H-score > median

```
##                    Odds Ratio     2.5 % 97.5 %  P value
## (Intercept)          0.007886 0.0000346  1.024 0.062108
## tumor.h.p50Low       1.134845 0.3736342  3.538 0.823595
## age                  1.049200 0.9845620  1.124 0.149983
## sexMale              1.322892 0.4257580  4.167 0.626762
## location2Ureter      0.923910 0.3189102  2.615 0.881561
## WHO.gradeLow Grade   0.260470 0.0348126  1.248 0.123974
## lymph.nodesYes       1.497655 0.3018714  9.016 0.633235
## lviYes               8.284122 2.7517179 27.620 0.000288
```

* H-score < upper quartile vs. H-score > upper quartile 

```
##                    Odds Ratio     2.5 % 97.5 %   P value
## (Intercept)          0.009403 4.773e-05  1.107 0.0654939
## tumor.h.q3Low        1.011825 3.569e-01  2.979 0.9825029
## age                  1.047633 9.841e-01  1.121 0.1553587
## sexMale              1.278045 4.276e-01  3.844 0.6579713
## location2Ureter      0.910790 3.165e-01  2.556 0.8593729
## WHO.gradeLow Grade   0.261580 3.452e-02  1.260 0.1276803
## lymph.nodesYes       1.456800 2.984e-01  8.582 0.6526140
## lviYes               8.332791 2.734e+00 28.303 0.0003301
```

* % positive cells = 0 vs. % positive cells > 0

```
##                    Odds Ratio     2.5 % 97.5 %   P value
## (Intercept)          0.007639 3.856e-05  0.874 0.0538022
## tumor.pos.0Low       1.439069 1.942e-01  9.914 0.7111554
## age                  1.050128 9.855e-01  1.125 0.1424902
## sexMale              1.335766 4.369e-01  4.124 0.6092737
## location2Ureter      0.897654 3.113e-01  2.519 0.8379501
## WHO.gradeLow Grade   0.266703 3.549e-02  1.280 0.1317755
## lymph.nodesYes       1.454770 2.988e-01  8.545 0.6533197
## lviYes               8.285272 2.749e+00 27.652 0.0002914
```

* % positive cells < median vs. % positive cells > median

```
##                    Odds Ratio     2.5 % 97.5 %   P value
## (Intercept)          0.006136 0.0000305  0.694 0.0439484
## tumor.pos.p50Low     1.781043 0.6213340  5.280 0.2852497
## age                  1.049040 0.9847783  1.123 0.1482021
## sexMale              1.420001 0.4639522  4.441 0.5381077
## location2Ureter      0.971755 0.3337001  2.779 0.9572828
## WHO.gradeLow Grade   0.264178 0.0356210  1.247 0.1252252
## lymph.nodesYes       1.592987 0.3183800  9.666 0.5839700
## lviYes               8.104273 2.6671676 27.326 0.0003737
```

* % positive cells < upper quartile vs. % positive cells > upper quartile

```
##                    Odds Ratio     2.5 % 97.5 %   P value
## (Intercept)           0.01331 7.641e-05  1.435 0.0815116
## tumor.pos.q3Low       0.65127 2.159e-01  1.954 0.4407403
## age                   1.04790 9.846e-01  1.121 0.1516121
## sexMale               1.18970 3.917e-01  3.606 0.7564883
## location2Ureter       0.89182 3.087e-01  2.506 0.8285784
## WHO.gradeLow Grade    0.25224 3.319e-02  1.231 0.1194989
## lymph.nodesYes        1.47173 3.008e-01  8.727 0.6447172
## lviYes                8.06320 2.674e+00 26.881 0.0003472
```

***

## 5) Odds Ratios for Cancer-Specific Mortality
### 5.1) Clinicopathologic features
* Patient's age

```
##             Odds Ratio    2.5 % 97.5 % P value
## (Intercept)    0.07205 0.001749  2.236  0.1457
## age            1.02587 0.977133  1.080  0.3138
```

* Patient's sex

```
##             Odds Ratio  2.5 % 97.5 %  P value
## (Intercept)     0.3448 0.1597 0.6838 0.003692
## sexMale         1.4500 0.6002 3.6591 0.416895
```

* Tumor location (Pelvis vs. ureter, tumors in pelvis-ureter excluded)

```
##                 Odds Ratio  2.5 % 97.5 %  P value
## (Intercept)         0.4063 0.2058 0.7559 0.006166
## location2Ureter     1.1584 0.4825 2.8158 0.742409
```

* High pT stage (>pT2)

```
##             Odds Ratio    2.5 %   97.5 %   P value
## (Intercept)    0.04651 0.007585   0.1507 2.216e-05
## pT.2Yes       23.15385 6.254961 150.9528 4.789e-05
```

* WHO histologic grade

```
##                    Odds Ratio    2.5 % 97.5 %  P value
## (Intercept)            0.5273 0.332109 0.8197 0.005287
## WHO.gradeLow Grade     0.1355 0.007295 0.7263 0.059368
```

* Metastatic lymph nodes

```
##                Odds Ratio  2.5 % 97.5 %   P value
## (Intercept)         0.377 0.2288   0.60 6.713e-05
## lymph.nodesYes      3.713 1.0803  13.69 3.872e-02
```

* Lymphovascular invasion

```
##             Odds Ratio   2.5 %  97.5 %   P value
## (Intercept)     0.1569 0.06881  0.3118 1.109e-06
## lviYes          7.7917 3.05544 21.6583 3.434e-05
```

### 5.2) ARID1a Expression, Unadjusted
* H-score = 0 vs. H-score > 0

```
##              Odds Ratio  2.5 % 97.5 %   P value
## (Intercept)      0.4219 0.2648 0.6537 0.0001693
## tumor.h.0Low     1.4222 0.2762 6.2186 0.6454327
```

* H-score < median vs. H-score > median

```
##                Odds Ratio  2.5 % 97.5 %  P value
## (Intercept)        0.4048 0.2244 0.6979 0.001653
## tumor.h.p50Low     1.1895 0.4935 2.8354 0.695457
```

* H-score < upper quartile vs. H-score > upper quartile 

```
##               Odds Ratio  2.5 % 97.5 % P value
## (Intercept)       0.4615 0.2246 0.8947 0.02673
## tumor.h.q3Low     0.9070 0.3785 2.2155 0.82743
```

* % positive cells = 0 vs. % positive cells > 0

```
##                Odds Ratio  2.5 % 97.5 %   P value
## (Intercept)        0.4219 0.2648 0.6537 0.0001693
## tumor.pos.0Low     1.4222 0.2762 6.2186 0.6454327
```

* % positive cells < median vs. % positive cells > median

```
##                  Odds Ratio  2.5 % 97.5 %  P value
## (Intercept)          0.3111 0.1646 0.5517 0.000136
## tumor.pos.p50Low     2.1429 0.8989 5.1894 0.086607
```

* % positive cells < upper quartile vs. % positive cells > upper quartile

```
##                 Odds Ratio  2.5 % 97.5 % P value
## (Intercept)         0.4091 0.1786 0.8602 0.02389
## tumor.pos.q3Low     1.0922 0.4379 2.8628 0.85265
```

### 5.3) ARID1a, Adjusted by Clinicopathologic Features
* H-score = 0 vs. H-score > 0

```
##                    Odds Ratio     2.5 %  97.5 %   P value
## (Intercept)           0.04164 0.0002545  4.6585 0.1987993
## tumor.h.0Low          2.01861 0.2942030 13.1335 0.4567157
## age                   1.02455 0.9608368  1.0956 0.4633663
## sexMale               1.10019 0.3557178  3.4207 0.8671130
## location2Ureter       0.70071 0.2394248  1.9739 0.5043414
## WHO.gradeLow Grade    0.15814 0.0080692  0.9741 0.0969118
## lymph.nodesYes        0.92555 0.2049263  4.3033 0.9193362
## lviYes                7.20248 2.3357684 24.4680 0.0008835
```

* H-score < median vs. H-score > median

```
##                    Odds Ratio     2.5 %  97.5 %   P value
## (Intercept)            0.0221 0.0001037  2.8733 0.1389174
## tumor.h.p50Low         2.1426 0.7041677  6.9912 0.1877762
## age                    1.0279 0.9636216  1.1002 0.4102861
## sexMale                1.2562 0.3954689  4.0825 0.6982157
## location2Ureter        0.7778 0.2640863  2.2291 0.6406349
## WHO.gradeLow Grade     0.1475 0.0075230  0.9031 0.0847643
## lymph.nodesYes         1.0533 0.2257992  5.1659 0.9472811
## lviYes                 7.3175 2.3472456 25.3428 0.0009275
```

* H-score < upper quartile vs. H-score > upper quartile 

```
##                    Odds Ratio     2.5 %  97.5 %   P value
## (Intercept)           0.03823 0.0002355  4.2801 0.1866181
## tumor.h.q3Low         1.60155 0.5583690  4.9122 0.3914633
## age                   1.02182 0.9591761  1.0913 0.5066836
## sexMale               1.05311 0.3459167  3.2084 0.9265854
## location2Ureter       0.74304 0.2546467  2.1015 0.5772414
## WHO.gradeLow Grade    0.16160 0.0082580  0.9867 0.1002438
## lymph.nodesYes        0.89758 0.1951268  4.2440 0.8887560
## lviYes                7.93632 2.5218052 27.9582 0.0006526
```

* % positive cells = 0 vs. % positive cells > 0

```
##                    Odds Ratio     2.5 %  97.5 %   P value
## (Intercept)           0.04164 0.0002545  4.6585 0.1987993
## tumor.pos.0Low        2.01861 0.2942030 13.1335 0.4567157
## age                   1.02455 0.9608368  1.0956 0.4633663
## sexMale               1.10019 0.3557178  3.4207 0.8671130
## location2Ureter       0.70071 0.2394248  1.9739 0.5043414
## WHO.gradeLow Grade    0.15814 0.0080692  0.9741 0.0969118
## lymph.nodesYes        0.92555 0.2049263  4.3033 0.9193362
## lviYes                7.20248 2.3357684 24.4680 0.0008835
```

* % positive cells < median vs. % positive cells > median

```
##                    Odds Ratio     2.5 %  97.5 %  P value
## (Intercept)           0.03379 0.0001915  3.8782 0.174906
## tumor.pos.p50Low      2.85288 0.9847531  8.8080 0.057909
## age                   1.01934 0.9551437  1.0903 0.565438
## sexMale               1.26108 0.3991629  4.0879 0.692242
## location2Ureter       0.81181 0.2717190  2.3732 0.702925
## WHO.gradeLow Grade    0.14877 0.0074525  0.9306 0.089777
## lymph.nodesYes        1.04821 0.2203688  5.2073 0.952720
## lviYes                7.05031 2.2413392 24.5799 0.001245
```

* % positive cells < upper quartile vs. % positive cells > upper quartile

```
##                    Odds Ratio    2.5 %  97.5 %   P value
## (Intercept)           0.03986 0.000266  4.2015 0.1861614
## tumor.pos.q3Low       1.91224 0.628173  6.3381 0.2671882
## age                   1.01836 0.955750  1.0872 0.5751161
## sexMale               1.09411 0.357447  3.3618 0.8735536
## location2Ureter       0.74928 0.255730  2.1290 0.5894885
## WHO.gradeLow Grade    0.15574 0.007922  0.9649 0.0949885
## lymph.nodesYes        0.92353 0.201696  4.3619 0.9178776
## lviYes                7.99500 2.537990 28.2632 0.0006379
```

***

## 6) Hazard Ratios for Tumor Progression


### 6.1) Clinicopathologic features
* Patient's age

```
##      Hazard Ratio Lower 95% CI Upper 95% CI P value
## [1,]        1.035       0.9972        1.075 0.06999
```

* Patient's sex

```
##      Hazard Ratio Lower 95% CI Upper 95% CI P value
## [1,]        1.343       0.6867        2.627  0.3888
```

* Tumor location (Pelvis vs. ureter, tumors in pelvis-ureter excluded)

```
##      Hazard Ratio Lower 95% CI Upper 95% CI P value
## [1,]        1.254       0.6454        2.435  0.5044
```

* High pT stage (>pT2)

```
##      Hazard Ratio Lower 95% CI Upper 95% CI   P value
## [1,]        11.39        4.019        32.26 4.698e-06
```

* WHO histologic grade

```
##      Hazard Ratio Lower 95% CI Upper 95% CI P value
## [1,]       0.2224      0.05339       0.9262  0.0389
```

* Metastatic lymph nodes

```
##      Hazard Ratio Lower 95% CI Upper 95% CI   P value
## [1,]        4.517        2.123        9.614 9.118e-05
```

* Lymphovascular invasion

```
##      Hazard Ratio Lower 95% CI Upper 95% CI   P value
## [1,]        5.996        2.958        12.15 6.727e-07
```

### 6.2) ARID1a Unadjusted
* H-score = 0 vs. H-score > 0

```
##      Hazard Ratio Lower 95% CI Upper 95% CI P value
## [1,]       0.9056       0.2784        2.945  0.8691
```

* H-score < median vs. H-score > median

```
##      Hazard Ratio Lower 95% CI Upper 95% CI P value
## [1,]       0.7166       0.3699        1.388  0.3234
```

* H-score < upper quartile vs. H-score > upper quartile

```
##      Hazard Ratio Lower 95% CI Upper 95% CI P value
## [1,]       0.6981       0.3681        1.324   0.271
```

* % positive cells = 0 vs. % positive cells > 0

```
##      Hazard Ratio Lower 95% CI Upper 95% CI P value
## [1,]       0.9056       0.2784        2.945  0.8691
```

* % positive cells < median vs. % positive cells > median

```
##      Hazard Ratio Lower 95% CI Upper 95% CI P value
## [1,]        1.299       0.6863        2.457  0.4218
```

* % positive cells < upper quartile vs. % positive cells > upper quartile

```
##      Hazard Ratio Lower 95% CI Upper 95% CI P value
## [1,]       0.5839       0.3042        1.121   0.106
```

### 6.3) ARID1a, Adjusted by Clinicopathologic Features
* H-score = 0 vs. H-score > 0

```
##                    Hazard Ratio Lower 95% CI Upper 95% CI   P value
## tumor.h.0Low             1.2015      0.32486        4.444 0.7832681
## age                      1.0285      0.98409        1.075 0.2120304
## sexMale                  0.9256      0.42965        1.994 0.8434167
## location2Ureter          0.7148      0.35683        1.432 0.3436116
## WHO.gradeLow Grade       0.2685      0.06233        1.156 0.0775655
## lymph.nodesYes           1.9265      0.81618        4.547 0.1345425
## lviYes                   5.3084      2.28796       12.316 0.0001013
```

* H-score < median vs. H-score > median

```
##                    Hazard Ratio Lower 95% CI Upper 95% CI   P value
## tumor.h.p50Low           0.8757      0.42983        1.784 0.7146662
## age                      1.0254      0.98258        1.070 0.2489355
## sexMale                  0.8699      0.40391        1.873 0.7217467
## location2Ureter          0.7132      0.35674        1.426 0.3389409
## WHO.gradeLow Grade       0.2609      0.06071        1.121 0.0708727
## lymph.nodesYes           1.9338      0.82182        4.550 0.1309137
## lviYes                   5.3456      2.29723       12.439 0.0001002
```

* H-score < upper quartile vs. H-score > upper quartile

```
##                    Hazard Ratio Lower 95% CI Upper 95% CI   P value
## tumor.h.q3Low            1.1050      0.56061        2.178 7.730e-01
## age                      1.0271      0.98471        1.071 2.134e-01
## sexMale                  0.9140      0.43401        1.925 8.128e-01
## location2Ureter          0.7217      0.36110        1.443 3.560e-01
## WHO.gradeLow Grade       0.2678      0.06229        1.152 7.669e-02
## lymph.nodesYes           1.9524      0.83210        4.581 1.242e-01
## lviYes                   5.3753      2.31381       12.488 9.208e-05
```

* % positive cells = 0 vs. % positive cells > 0

```
##                    Hazard Ratio Lower 95% CI Upper 95% CI   P value
## tumor.pos.0Low           1.2015      0.32486        4.444 0.7832681
## age                      1.0285      0.98409        1.075 0.2120304
## sexMale                  0.9256      0.42965        1.994 0.8434167
## location2Ureter          0.7148      0.35683        1.432 0.3436116
## WHO.gradeLow Grade       0.2685      0.06233        1.156 0.0775655
## lymph.nodesYes           1.9265      0.81618        4.547 0.1345425
## lviYes                   5.3084      2.28796       12.316 0.0001013
```

* % positive cells < median vs. % positive cells > median

```
##                    Hazard Ratio Lower 95% CI Upper 95% CI   P value
## tumor.pos.p50Low         1.3643      0.69482        2.679 0.3668708
## age                      1.0268      0.98491        1.071 0.2129818
## sexMale                  0.9718      0.45924        2.056 0.9404151
## location2Ureter          0.7306      0.36438        1.465 0.3766453
## WHO.gradeLow Grade       0.2721      0.06346        1.167 0.0797038
## lymph.nodesYes           2.0057      0.85221        4.721 0.1109921
## lviYes                   5.1563      2.24173       11.860 0.0001137
```

* % positive cells < upper quartile vs. % positive cells > upper quartile

```
##                    Hazard Ratio Lower 95% CI Upper 95% CI  P value
## tumor.pos.q3Low          0.6918      0.34043        1.406 0.308396
## age                      1.0266      0.98477        1.070 0.215890
## sexMale                  0.8640      0.40947        1.823 0.701152
## location2Ureter          0.7392      0.36999        1.477 0.391980
## WHO.gradeLow Grade       0.2634      0.06168        1.125 0.071634
## lymph.nodesYes           2.1642      0.89316        5.244 0.087314
## lviYes                   5.0005      2.13858       11.692 0.000204
```

***

## 7) Hazard Ratios for Cancer-Specific Mortality


### 7.1) Clinicopathologic features
* Patient's age

```
##      Hazard Ratio Lower 95% CI Upper 95% CI P value
## [1,]        1.035        0.992        1.079  0.1125
```

* Patient's sex

```
##      Hazard Ratio Lower 95% CI Upper 95% CI P value
## [1,]        1.332        0.622        2.854  0.4603
```

* Tumor location (Pelvis vs. ureter, tumors in pelvis-ureter excluded)

```
##      Hazard Ratio Lower 95% CI Upper 95% CI P value
## [1,]        1.214       0.5824         2.53   0.605
```

* High pT stage (>pT2)

```
##      Hazard Ratio Lower 95% CI Upper 95% CI   P value
## [1,]        17.63        4.185         74.3 9.198e-05
```

* WHO histologic grade

```
##      Hazard Ratio Lower 95% CI Upper 95% CI P value
## [1,]       0.1283      0.01743       0.9449 0.04384
```

* Metastatic lymph nodes

```
##      Hazard Ratio Lower 95% CI Upper 95% CI P value
## [1,]         2.76         1.18        6.452 0.01914
```

* Lymphovascular invasion

```
##      Hazard Ratio Lower 95% CI Upper 95% CI   P value
## [1,]        5.637        2.503        12.69 2.977e-05
```

### 7.2) ARID1a Unadjusted
* H-score = 0 vs. H-score > 0

```
##      Hazard Ratio Lower 95% CI Upper 95% CI P value
## [1,]        1.177       0.3568        3.884  0.7888
```

* H-score < median vs. H-score > median

```
##      Hazard Ratio Lower 95% CI Upper 95% CI P value
## [1,]       0.8791       0.4244        1.821  0.7287
```

* H-score < upper quartile vs. H-score > upper quartile

```
##      Hazard Ratio Lower 95% CI Upper 95% CI P value
## [1,]       0.7786       0.3745        1.619  0.5026
```

* % positive cells = 0 vs. % positive cells > 0

```
##      Hazard Ratio Lower 95% CI Upper 95% CI P value
## [1,]        1.177       0.3568        3.884  0.7888
```

* % positive cells < median vs. % positive cells > median

```
##      Hazard Ratio Lower 95% CI Upper 95% CI P value
## [1,]        1.454       0.7076        2.987  0.3084
```

* % positive cells < upper quartile vs. % positive cells > upper quartile

```
##      Hazard Ratio Lower 95% CI Upper 95% CI P value
## [1,]        0.851       0.3892        1.861   0.686
```

### 7.3) ARID1a, Adjusted by Clinicopathologic Features
* H-score = 0 vs. H-score > 0

```
##                    Hazard Ratio Lower 95% CI Upper 95% CI   P value
## tumor.h.0Low             1.9287      0.54382        6.840 0.3091992
## age                      1.0397      0.98729        1.095 0.1401229
## sexMale                  0.9341      0.40465        2.156 0.8730789
## location2Ureter          0.8456      0.39361        1.817 0.6673501
## WHO.gradeLow Grade       0.1818      0.02416        1.369 0.0978741
## lymph.nodesYes           0.8948      0.32964        2.429 0.8273925
## lviYes                   5.2952      2.06982       13.547 0.0005055
```

* H-score < median vs. H-score > median

```
##                    Hazard Ratio Lower 95% CI Upper 95% CI   P value
## tumor.h.p50Low           1.2990       0.5820        2.899 0.5230258
## age                      1.0370       0.9853        1.091 0.1640878
## sexMale                  0.9861       0.4098        2.373 0.9751609
## location2Ureter          0.9097       0.4226        1.958 0.8088639
## WHO.gradeLow Grade       0.1757       0.0234        1.320 0.0910324
## lymph.nodesYes           0.9408       0.3496        2.532 0.9038682
## lviYes                   5.0601       2.0194       12.679 0.0005411
```

* H-score < upper quartile vs. H-score > upper quartile

```
##                    Hazard Ratio Lower 95% CI Upper 95% CI   P value
## tumor.h.q3Low            1.0998      0.49752        2.431 0.8141748
## age                      1.0337      0.98313        1.087 0.1951305
## sexMale                  0.9075      0.39034        2.110 0.8216500
## location2Ureter          0.8831      0.41001        1.902 0.7508958
## WHO.gradeLow Grade       0.1762      0.02344        1.324 0.0916208
## lymph.nodesYes           0.9019      0.33267        2.445 0.8392319
## lviYes                   5.1775      2.05462       13.047 0.0004884
```

* % positive cells = 0 vs. % positive cells > 0

```
##                    Hazard Ratio Lower 95% CI Upper 95% CI   P value
## tumor.pos.0Low           1.9287      0.54382        6.840 0.3091992
## age                      1.0397      0.98729        1.095 0.1401229
## sexMale                  0.9341      0.40465        2.156 0.8730789
## location2Ureter          0.8456      0.39361        1.817 0.6673501
## WHO.gradeLow Grade       0.1818      0.02416        1.369 0.0978741
## lymph.nodesYes           0.8948      0.32964        2.429 0.8273925
## lviYes                   5.2952      2.06982       13.547 0.0005055
```

* % positive cells < median vs. % positive cells > median

```
##                    Hazard Ratio Lower 95% CI Upper 95% CI   P value
## tumor.pos.p50Low         1.6672      0.75770        3.668 0.2039476
## age                      1.0330      0.98280        1.086 0.2014588
## sexMale                  1.0771      0.45659        2.541 0.8652576
## location2Ureter          0.9522      0.44351        2.044 0.9000090
## WHO.gradeLow Grade       0.1765      0.02336        1.333 0.0927526
## lymph.nodesYes           0.9799      0.36458        2.634 0.9678988
## lviYes                   4.8058      1.94141       11.896 0.0006876
```

* % positive cells < upper quartile vs. % positive cells > upper quartile

```
##                    Hazard Ratio Lower 95% CI Upper 95% CI   P value
## tumor.pos.q3Low          1.1021      0.46562        2.609 0.8249088
## age                      1.0331      0.98215        1.087 0.2070246
## sexMale                  0.9035      0.39013        2.092 0.8127146
## location2Ureter          0.8760      0.40968        1.873 0.7326664
## WHO.gradeLow Grade       0.1739      0.02319        1.305 0.0888985
## lymph.nodesYes           0.8961      0.32734        2.453 0.8308582
## lviYes                   5.1804      2.05060       13.087 0.0005038
```

***
