# ARID1a Expression in Upper Tract Urothelial Carcinoma
# DATA ANALYSIS
# REMEMBER FIRST to set the working directory
setwd()

# Opening the dataset
arid1a.full <- read.csv(file = "arid1a.utuc.csv")

# Loading the libraries required for the analysis
library(gmodels)
library(survival)

# Loading the functions for standard.analysis
source(file = "standard.analysis.R")

# Selecting variables relevant to the analysis
arid1a.data<- arid1a.full[c("sex", "age", "location", "location2", "pT",
                      "pT.2", "pT.a", "WHO.grade", "lymph.nodes", "lvi",
                      "metastasis", "bladder.recur", "fu.recur",
                      "tumor.prog", "fu.prog", "outcome", "dod",
                      "fu.outcome", "tumor.h.med", "tumor.pos.med",
                      "normal.h.med", "normal.pos.med", "tumor.h.0",
                      "tumor.h.p50", "tumor.h.q3", "tumor.pos.0",
                      "tumor.pos.p50", "tumor.pos.q3")]

# TABLE 1: Clinicopathologic Features and Outcome of 99 Patients with
        # Upper Tract Urothelial Carcinoma
descriptive(arid1a.data$age)
table.prop(arid1a.data$sex)
table.prop(arid1a.data$location)
table.prop(arid1a.data$pT)
table.prop(arid1a.data$WHO.grade)
table.prop(arid1a.data$lvi)
table.prop(arid1a.data$lymph.nodes)
table.prop(arid1a.data$metastasis)
table.prop(arid1a.data$bladder.recur)
table.prop(arid1a.data$tumor.prog)
table.prop(arid1a.data$outcome)

# TABLE 2: Association of Tumor Progression and Cancer-Specific Mortality with
        # Clinicopathologic Features and Immunohistochemical Expression of
        # ARID1a in Patients with Upper Tract Urothelial Carcinoma
# TUMOR PROGRESSION
table(arid1a.data$tumor.prog)
compare.mw(arid1a.data$age, arid1a.data$tumor.prog)
compare.fisher(arid1a.data$sex, arid1a.data$tumor.prog)
compare.fisher(arid1a.data$location, arid1a.data$tumor.prog)
compare.fisher(arid1a.data$pT, arid1a.data$tumor.prog)
compare.fisher(arid1a.data$WHO.grade, arid1a.data$tumor.prog)
compare.fisher(arid1a.data$lymph.nodes, arid1a.data$tumor.prog)
compare.fisher(arid1a.data$lvi, arid1a.data$tumor.prog)
compare.mw(arid1a.data$tumor.h.med, arid1a.data$tumor.prog)
compare.mw(arid1a.data$tumor.pos.med, arid1a.data$tumor.prog)
# CANCER MORTALITY
table(arid1a.data$dod)
compare.mw(arid1a.data$age, arid1a.data$dod)
compare.fisher(arid1a.data$sex, arid1a.data$dod)
compare.fisher(arid1a.data$location, arid1a.data$dod)
compare.fisher(arid1a.data$pT, arid1a.data$dod)
compare.fisher(arid1a.data$WHO.grade, arid1a.data$dod)
compare.fisher(arid1a.data$lymph.nodes, arid1a.data$dod)
compare.fisher(arid1a.data$lvi, arid1a.data$dod)
compare.mw(arid1a.data$tumor.h.med, arid1a.data$dod)
compare.mw(arid1a.data$tumor.pos.med, arid1a.data$dod)

# TABLE 3: Odds Ratios for Tumor Progression and Cancer-Specific Mortality
        # Considering Clinicopathologic Features and Immunohistochemical
        # Expression of ARID1a
# TUMOR PROGRESSION
## Clinicopathologic features
logistic(tumor.prog ~ age, data = arid1a.data)
logistic(tumor.prog ~ sex, data = arid1a.data)
logistic(tumor.prog ~ location2, data = arid1a.data)
logistic(tumor.prog ~ pT.2, data = arid1a.data)
logistic(tumor.prog ~ WHO.grade, data = arid1a.data)
logistic(tumor.prog ~ lymph.nodes, data = arid1a.data)
logistic(tumor.prog ~ lvi, data = arid1a.data)
## ARID1a Unadjusted
logistic(tumor.prog ~ tumor.h.0, data = arid1a.data)
logistic(tumor.prog ~ tumor.h.p50, data = arid1a.data)
logistic(tumor.prog ~ tumor.h.q3, data = arid1a.data)
logistic(tumor.prog ~ tumor.pos.0, data = arid1a.data)
logistic(tumor.prog ~ tumor.pos.p50, data = arid1a.data)
logistic(tumor.prog ~ tumor.pos.q3, data = arid1a.data)
## ARID1a adjusted by clinicopathologic features
logistic(tumor.prog ~ tumor.h.0 + age + sex + location2 + WHO.grade
         + lymph.nodes + lvi, data = arid1a.data)
logistic(tumor.prog ~ tumor.h.p50 + age + sex + location2 + WHO.grade
         + lymph.nodes + lvi, data = arid1a.data)
logistic(tumor.prog ~ tumor.h.q3 + age + sex + location2 + WHO.grade
         + lymph.nodes + lvi, data = arid1a.data)
logistic(tumor.prog ~ tumor.pos.0 + age + sex + location2 + WHO.grade
         + lymph.nodes + lvi, data = arid1a.data)
logistic(tumor.prog ~ tumor.pos.p50 + age + sex + location2 + WHO.grade
         + lymph.nodes + lvi, data = arid1a.data)
logistic(tumor.prog ~ tumor.pos.q3 + age + sex + location2 + WHO.grade
         + lymph.nodes + lvi, data = arid1a.data)
# CANCER MORTALITY
## Clinicopathologic features
logistic(dod ~ age, data = arid1a.data)
logistic(dod ~ sex, data = arid1a.data)
logistic(dod ~ location2, data = arid1a.data)
logistic(dod ~ pT.2, data = arid1a.data)
logistic(dod ~ WHO.grade, data = arid1a.data)
logistic(dod ~ lymph.nodes, data = arid1a.data)
logistic(dod ~ lvi, data = arid1a.data)
## ARID1a Unadjusted
logistic(dod ~ tumor.h.0, data = arid1a.data)
logistic(dod ~ tumor.h.p50, data = arid1a.data)
logistic(dod ~ tumor.h.q3, data = arid1a.data)
logistic(dod ~ tumor.pos.0, data = arid1a.data)
logistic(dod ~ tumor.pos.p50, data = arid1a.data)
logistic(dod ~ tumor.pos.q3, data = arid1a.data)
## ARID1a adjusted by clinicopathologic features
logistic(dod ~ tumor.h.0 + age + sex + location2 + WHO.grade
         + lymph.nodes + lvi, data = arid1a.data)
logistic(dod ~ tumor.h.p50 + age + sex + location2 + WHO.grade
         + lymph.nodes + lvi, data = arid1a.data)
logistic(dod ~ tumor.h.q3 + age + sex + location2 + WHO.grade
         + lymph.nodes + lvi, data = arid1a.data)
logistic(dod ~ tumor.pos.0 + age + sex + location2 + WHO.grade
         + lymph.nodes + lvi, data = arid1a.data)
logistic(dod ~ tumor.pos.p50 + age + sex + location2 + WHO.grade
         + lymph.nodes + lvi, data = arid1a.data)
logistic(dod ~ tumor.pos.q3 + age + sex + location2 + WHO.grade
         + lymph.nodes + lvi, data = arid1a.data)

# TABLE 4: Hazard Ratios for Tumor Progression and Cancer-Specific Mortality
        # Considering Clinicopathologic Features and Immunohistochemical
        # Expression of ARID1a
# TUMOR PROGRESSION
progression.surv <- with( # Defining the survival object for tumor progression
        Surv(fu.prog, as.numeric(tumor.prog)), data = arid1a.data)
## Clinicopathologic features
hazard(progression.surv ~ age, data = arid1a.data)
hazard(progression.surv ~ sex, data = arid1a.data)
hazard(progression.surv ~ location2, data = arid1a.data)
hazard(progression.surv ~ pT.2, data = arid1a.data)
hazard(progression.surv ~ WHO.grade, data = arid1a.data)
hazard(progression.surv ~ lymph.nodes, data = arid1a.data)
hazard(progression.surv ~ lvi, data = arid1a.data)
## ARID1a Unadjusted
hazard(progression.surv ~ tumor.h.0, data = arid1a.data)
hazard(progression.surv ~ tumor.h.p50, data = arid1a.data)
hazard(progression.surv ~ tumor.h.q3, data = arid1a.data)
hazard(progression.surv ~ tumor.pos.0, data = arid1a.data)
hazard(progression.surv ~ tumor.pos.p50, data = arid1a.data)
hazard(progression.surv ~ tumor.pos.q3, data = arid1a.data)
## ARID1a adjusted by clinicopathologic features
hazard(progression.surv ~ tumor.h.0 + age + sex + location2 + WHO.grade
         + lymph.nodes + lvi, data = arid1a.data)
hazard(progression.surv ~ tumor.h.p50 + age + sex + location2 + WHO.grade
         + lymph.nodes + lvi, data = arid1a.data)
hazard(progression.surv ~ tumor.h.q3 + age + sex + location2 + WHO.grade
         + lymph.nodes + lvi, data = arid1a.data)
hazard(progression.surv ~ tumor.pos.0 + age + sex + location2 + WHO.grade
         + lymph.nodes + lvi, data = arid1a.data)
hazard(progression.surv ~ tumor.pos.p50 + age + sex + location2 + WHO.grade
         + lymph.nodes + lvi, data = arid1a.data)
hazard(progression.surv ~ tumor.pos.q3 + age + sex + location2 + WHO.grade
         + lymph.nodes + lvi, data = arid1a.data)
# CANCER-MORTALITY
dod.surv <- with( # Defining the survival object for cancer mortality
        Surv(fu.outcome, as.numeric(dod)), data = arid1a.data)
## Clinicopathologic features
hazard(dod.surv ~ age, data = arid1a.data)
hazard(dod.surv ~ sex, data = arid1a.data)
hazard(dod.surv ~ location2, data = arid1a.data)
hazard(dod.surv ~ pT.2, data = arid1a.data)
hazard(dod.surv ~ WHO.grade, data = arid1a.data)
hazard(dod.surv ~ lymph.nodes, data = arid1a.data)
hazard(dod.surv ~ lvi, data = arid1a.data)
## ARID1a Unadjusted
hazard(dod.surv ~ tumor.h.0, data = arid1a.data)
hazard(dod.surv ~ tumor.h.p50, data = arid1a.data)
hazard(dod.surv ~ tumor.h.q3, data = arid1a.data)
hazard(dod.surv ~ tumor.pos.0, data = arid1a.data)
hazard(dod.surv ~ tumor.pos.p50, data = arid1a.data)
hazard(dod.surv ~ tumor.pos.q3, data = arid1a.data)
## ARID1a adjusted by clinicopathologic features
hazard(dod.surv ~ tumor.h.0 + age + sex + location2 + WHO.grade
       + lymph.nodes + lvi, data = arid1a.data)
hazard(dod.surv ~ tumor.h.p50 + age + sex + location2 + WHO.grade
       + lymph.nodes + lvi, data = arid1a.data)
hazard(dod.surv ~ tumor.h.q3 + age + sex + location2 + WHO.grade
       + lymph.nodes + lvi, data = arid1a.data)
hazard(dod.surv ~ tumor.pos.0 + age + sex + location2 + WHO.grade
       + lymph.nodes + lvi, data = arid1a.data)
hazard(dod.surv ~ tumor.pos.p50 + age + sex + location2 + WHO.grade
       + lymph.nodes + lvi, data = arid1a.data)
hazard(dod.surv ~ tumor.pos.q3 + age + sex + location2 + WHO.grade
       + lymph.nodes + lvi, data = arid1a.data)