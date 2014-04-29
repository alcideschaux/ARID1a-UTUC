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

# DEFINING USEFUL FUNCTIONS FOR DATA ANALYSIS
# Defining the function "descriptive" for estimating mean, sd, median, and iqr
descriptive <- function(x, na.rm = TRUE){ # The function requires x in format dfrm$var
        a <- mean(x) 
        b <- sd(x)
        c <- quantile(x, .5)
        d <- IQR(x)
        e <- round(rbind(a, b, c, d), digits = 1)
        final <- matrix(data = e, dimnames = list(c("Mean", "SD", "Median", "IQR"),
                                                  c("Values")))
        print(final)
}
# Defining the function "table.prop" which formats the output of CrossTable
table.prop <- function(x, ...){ # This function requieres the CrossTable package
        data <- CrossTable(x, digits = 0, format = c("SPSS"),
                           prop.chisq = FALSE, prop.t = FALSE, ...)
}