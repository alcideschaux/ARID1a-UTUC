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
library(gmodels)

# DEFINING USEFUL FUNCTIONS FOR DATA ANALYSIS
# Defining the function "descriptive" for estimating mean, sd, median, and iqr
        # The function requires x in dfrm$var format
        # x must be numerical or integer
descriptive <- function(x, na.rm = TRUE){ 
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
        # This function requieres the CrossTable package
        # The function requires x in dfrm$var format
        # x must be factor
table.prop <- function(x, ...){ 
        data <- CrossTable(x, digits = 0, format = c("SPSS"),
                           prop.chisq = FALSE, prop.t = FALSE,
                           missing.include = TRUE,
                           ...)
}
# Defining the function "compare.wilcox" which shows the median and IQR of
        # x by y and provides the P value from the Mann-Whitney test
        # x corresponds to the numerical/integer variable
        # y corresponds to the factor (grouping) variable
        # The function requires x and y in dfrm$var format
compare.mw <- function(x, y){
        a <- tapply(x, INDEX = y, FUN = median, na.rm = TRUE)
        b <- tapply(x, INDEX = y, FUN = IQR, na.rm = TRUE)
        c <- wilcox.test(x ~ y)
        d <- round(rbind(Median = a, IQR = b), digits = 1)
        print(d)
        cat("\nMann-Whitney's P value =", c$p.value)
}
# Defining the function "compare.fisher" which shows the table of contingency of
        # x by y and provides de P value from the Fisher's exact test
        # x and y must be factor variables
compare.fisher <- function(x, y){
        cat("**Table of Frequencies**\n")
                a <- table(Row = x, Column = y)
                print(a)
        cat("\n**Row Percentages**\n")
                b <- round(100*(prop.table(a, 1)))
                print(b)
        cat("\n**Column Percentages**\n")
                c <- round(100*(prop.table(a, 2)))
                print(c)
        
                d <- fisher.test(x, y)
                cat("\nFisher's P value =", d$p.value)
}
# Defining the function "logistic" which provides the OR, 95% CI and P values of a
        # logistic regression model
        # x must be a formula type
        # The function requires the specification of the data.frame
logistic <- function(x, data){
        model <- glm(x, data = data, family = binomial)
        a <- exp(cbind("Odds Ratio" = coef(model), confint(model)))
        b <- summary(model)$coeff[,4]
        c <- cbind(a, "P value" = b)
        print(c)
}

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
