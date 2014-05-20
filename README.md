# ARID1a in Upper Tract Urothelial Carcinomas

## Description
This study evaluates the immunohistochemical expression of ARID1a in 99 cases of upper tract urothelial carcinomas (UTUC) using tissue microarrays (TMA). It also evaluates the role of ARID1a immunohistochemistry as a prognosticator of outcome in upper tract urothelial carcinomas. The following files are part of this repository: 
* The [arid1a.utuc.csv](http:example.com) file corresponds to the full dataset of the 99 cases.
* The [CodeBook.md](http:example.com) describes the variable lables, providing information on type and levels.
* The [arid1a.utuc.R](http:example.com) file contains the R code used for the analysis.
* The [Arid1aUtccResults.md](htttp://example.com) file contains the results of the analysis.

## Methodology
### Patient Cohort and TMA Construction
The dataset includes 99 patients with nonmetastatic UTUC who underwent radical nephroureterectomy (RN) with curative intent between 1997 and 2011. Forty-six patients underwent laparoscopic RN, 53 underwent open RN while 96 underwent concomitant retroperitoneal lymphadenectomy. All sections were retrieved and reviewed by a urologic pathologist for confirmation of the original diagnosis, stage of each case according to the WHO 2004 classification, and selection of representative paraffin block for TMA construction .Two TMAs were constructed with spotted triplicate tumor samples and paired benign urothelium from each UTUC.  


Clinicopathologic data were obtained from medical records and included patient demographics and follow-up data. Tumor progression was defined as the development of recurrence at RN site, lymph node metastasis and/or visceral metastasis. Metachronous or synchronous lower tract recurrence (e.g. bladder) was not considered as tumor progression and it was excluded from time-to-event analyses. Patients were followed-up from initial diagnosis to the appearance of the event of interest or the end of the study. Patients who did not show the event of interest by the end of the study were censored for time-to-event analyses. Primary endpoint of the study was cancer-specific death. Secondary endpoint was tumor progression, as defined above.

### ARID1a Immunohistochemistry
Immunohistichemistry for ARID1A expression was performed on 5-micrometer TMA sections using a polyclonal rabbit anti-ARID1A antibody (HPA005456, Sigma-Aldrich, St Louis, MO). Antigen retrieval was performed by submerging the tissue sections in citrate buffer (pH 6.0) and then in a steamer for 10 minutes. The sections were then incubated with the rabbit antibody at a dilution of 1:200 at 4°C overnight. A positive reaction was detected by the EnVision+System (Dako, Carpinteria, CA). Only nuclear staining was scored and tumor stromal cells served as positive internal controls.  
### Scoring System
An H-score was assigned in each TMA spot as the sum of the products of the intensity (0 for negative, 1 for weakly positive, 2 for moderately positive, and 3 for strongly positive) multiplied by the extent of immunohistochemical expression (0% to 100%), obtaining a value ranging from 0 to 300. The average H-score for each case was obtained and used for statistical analysis. Alternatively, the percentage of positive tumor cells was also recorded, considering as "positive staining" any staining intensity.  
### Statistical Analysis
The expression levels between patients with and without tumor progression and between patients who died and who did not died of disseminated cancer were compared using the Mann-Whitney U test. The associations of pathologic features (pT stage, histologic grade, lymph node metastasis, and lymphovascular invasion) with tumor progression and with cancer-specific survival were evaluated using the Fisher’s exact test.  
For regression models each biomarker was categorized in low or high expression based on 6 different approaches: 
* H-scores = 0 vs. H-score > 0
* H-scores < median vs. H-score > median
* H-score < upper quartile vs. H-score > upper quartile
* % positive cells = 0 vs. % positive cells > 0
* % positive cells < median vs. % positive cells > median
* % positive cells < upper quartile vs. % positive cells > upper quartile


For cancer-specific mortality (primary endpoint), total follow-up time was used, even if progression had appeared before. For tumor progression (secondary endpoint), time to first progression event was used, even if the patient was followed-up for a longer period of time. Data were analyzed using R version 3.1.0 (R Foundation for Statistical Computing, Vienna, Austria)