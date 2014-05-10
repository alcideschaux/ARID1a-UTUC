### CodeBook for variable labels
**sex**  
*Description:* Patient's sex  
*Type:* Factor  
*Levels:* Male/Female


**age**  
*Description:* Patient's age  
*Type:* Numerical  
*Units:* years  


**location**  
*Desciption:* Tumor anatomical location  
*Type:* Factor  
*Levels:* Pelvis/Ureter/Pelvis-Ureter



**location2**  
*Desciption:* Tumor in Pelvis vs. Ureter. Tumors involving both pelvis and ureter are coded as NAs  
*Type:* Factor  
*Levels:* Pelvis/Ureter 


**pT**  
*Description:* pT stage  
*Type:* Factor  
*Levels:* pTa/pT1/pT2/pT3/pT4  


**pT.2**  
*Description:* pT stage > pT2  
*Type:* Factor  
*Levels:* Yes/No


**pT.a**  
*Description:* pT stage > pTa  
*Type:* Factor  
*Levels:* Yes/No


**grade**  
*Description:* Histologic grade  
*Type:* Factor  
*Levels:* Grade 1/Grade 2/Grade 3


**WHO.grade**  
*Description:* WHO histologic grade  
*Type:* Factor  
*Levels:* High Grade/Low Grade


**lymph.nodes**  
*Description:* Lymph node metastasis    
*Type:* Factor  
*Levels:* Yes/No


**lvi**  
*Description:* Lymphovascular invasion    
*Type:* Factor  
*Levels:* Yes/No


**metastasis**  
*Description:* Distant visceral metastasis    
*Type:* Factor  
*Levels:* Yes/No


**bladder.recur**  
*Description:* Tumor recurrence at urinary bladder   
*Type:* Factor  
*Levels:* Yes/No


**fu.recur**  
*Description:* Time to tumor recurrence at urinary bladder   
*Type:* Numerical  
*Units:* Months


**tumor.prog**  
*Description:* Tumor progression   
*Type:* Factor  
*Levels:* Yes/No


**fu.prog**  
*Description:* Time to tumor progression   
*Type:* Numerical  
*Units:* Months


**outcome**  
*Description:* Patient's outcome   
*Type:* Factor  
*Levels:* NED/AWD/DOC/DOD/LFU  
*Keys:* NED, no evidence of disease; AWD, alive with disease; DOC, died of other causes; DOD, died of disease; LFU, lost at follow-up


**dod**  
*Description:* Cancer-related mortality   
*Type:* Factor  
*Levels:* Yes/No


**fu.outcome**  
*Description:* Follow-up time   
*Type:* Numerical  
*Units:* Months


**tumor.h.med**  
*Description:* Median ARID1a score in tumor cells   
*Type:* Numerical  
*Units:* H-score (0-300)


**tumor.h.min**  
*Description:* Minimum ARID1a score in tumor cells     
*Type:* Numerical  
*Units:* H-score (0-300)


**tumor.h.max**  
*Description:* Maximum ARID1a score in tumor cells   
*Type:* Numerical  
*Units:* H-score (0-300)


**tumor.pos.med**  
*Description:* Median ARID1a positivity in tumor cells  
*Type:* Numerical  
*Units:* Percentage (0-100)


**tumor.pos.min**  
*Description:* Minimum ARID1a positivity in tumor cells  
*Type:* Numerical  
*Units:* Percentage (0-100)


**tumor.pos.max**  
*Description:* Maximum ARID1a positivity in tumor cells  
*Type:* Numerical  
*Units:* Percentage (0-100)


**normal.h.med**  
*Description:* Median ARID1a score in normal cells   
*Type:* Numerical  
*Units:* H-score (0-300)


**normal.h.min**  
*Description:* Minimum ARID1a score in normal cells     
*Type:* Numerical  
*Units:* H-score (0-300)


**normal.h.max**  
*Description:* Maximum ARID1a score in normal cells   
*Type:* Numerical  
*Units:* H-score (0-300)


**normal.pos.med**  
*Description:* Median ARID1a positivity in normal cells  
*Type:* Numerical  
*Units:* % (0-100)


**normal.pos.min**  
*Description:* Minimum ARID1a positivity in normal cells  
*Type:* Numerical  
*Units:* % (0-100)


**normal.pos.max**  
*Description:* Maximum ARID1a positivity in normal cells  
*Type:* Numerical  
*Units:* % (0-100)


**tumor.h.0**  
*Description:* ARID1a score > 0 in tumor cells   
*Type:* Factor  
*Levels:* Low/High  
*Keys:* score = 0, Low; score > 0, High


**tumor.h.p50**  
*Description:* ARID1a score > median in tumor cells   
*Type:* Factor  
*Levels:* Low/High  
*Keys:* score < median, Low; score > median, High


**tumor.h.q3**  
*Description:* ARID1a score > Q3 in tumor cells   
*Type:* Factor  
*Levels:* Low/High  
*Keys:* score < Q3, Low; score > Q3, High


**tumor.pos.0**  
*Description:* ARID1a positivity > 0 in tumor cells   
*Type:* Factor  
*Levels:* Low/High  
*Keys:* % = 0, Low; % > 0, High


**tumor.pos.p50**  
*Description:* ARID1a positivity > median in tumor cells   
*Type:* Factor  
*Levels:* Low/High  
*Keys:* % < median, Low; % > median, High


**tumor.pos.q3**
*Description:* ARID1a positivity > Q3 in tumor cells   
*Type:* Factor  
*Levels:* Low/High  
*Keys:* % < Q3, Low; % > Q3, High
