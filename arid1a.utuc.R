# ARID1a Expression in Upper Tract Urothelial Carcinoma
# DATA ANALYSIS
# Opening the dataset
arid1a.full <- read.csv(file = file.choose())
# Selecting variables relevant to the analysis
arid1a.data<- arid1a.full[c("sex", "age", "location", "location2", "pT",
                      "pT.2", "pT.a", "WHO.grade", "lymph.nodes", "lvi",
                      "metastasis", "bladder.recur", "fu.recur",
                      "tumor.prog", "fu.prog", "outcome", "dod",
                      "fu.outcome", "tumor.h.med", "tumor.pos.med",
                      "normal.h.med", "normal.pos.med", "tumor.h.0",
                      "tumor.h.p50", "tumor.h.q3", "tumor.pos.0",
                      "tumor.pos.p50", "tumor.pos.q3")]
# Loading the libraries required for the analysis
library(psych)
library(gmodels)
