# USEFUL FUNCTIONS FOR DATA ANALYSIS
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
# Defining the function "table.prop" which provides counts and percentages of
        # a single variable factor
        # The function requires x in dfrm$var format
table.prop <- function(x){
        a <- table(x, useNA = "ifany")
        b <- 100*round(prop.table(a), digits = 3)
        c <- cbind(Count = a, Percentages = b)
        print(c)
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
        a <- exp(cbind("Odds Ratio" = coef(model), confint(model))) # OR & 95% CI
        b <- summary(model)$coeff[,4] # P values
        print(cbind(a, "P value" = b))
}
# Defining the function "hazard" which provides the HR, 95% CI and P values of a
        # proportional hazards Cox regression model
        # x must be a a formula object, with the response on the left of a ~ operator
        # The response must be a survival object as returned by the Surv function
        # The function requires the specification of the data.frame
hazard <- function(x, data){
        require(survival)
        model <- coxph(x, data = data)
        a <- summary(model)$coefficients[,2] # HR
        b <- confint(model) # 95% CI
        c <- summary(model)$coefficients[,5] # P values
        print(cbind("Hazard Ratio" = a, b, "P value" = c))
}