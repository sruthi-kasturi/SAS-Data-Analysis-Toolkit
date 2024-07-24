proc import
        datafile = "/home/u63635623/WEEK 3/est1.csv"
        dbms = csv
        out = lab_3;
        getnames = yes;
run;
/*freq*/
proc freq 
      data = lab_3 order = data;
      table d y1 y2;
run;
/*senstivity and specficity of y1*/
proc freq 
      data = lab_3 order = data;
      table y1*d/senspec;
run;
/*senstivity and specficity of y2*/
proc freq 
      data = lab_3 order = data;
      table y2*d/senspec;
run;
/*Interpretation : 

Exercise Stress Test (y1):

•	Sensitivity (True Positive Rate): 0.7967
The test accurately detects Coronary artery disease in 79.67% of individuals who test positive for it.
•	Specificity (True Negative Rate): 0.7398
The test accurately detects 73.98% of people who do not have Coronary artery disease.

Chest Pain History (y2):

Sensitivity (True Positive Rate): 0.9472
History of chest pain correctly identifies 94.72% of the individuals with a positive result.
Specificity (True Negative Rate): 0.4457
History of chest pain identifies correctly 44.57% of the cases who do not have CAD./*


/* PRACTICE 2 */

	proc import
	DATAFILE = "/home/u63635623/WEEK 3/wiedat2b.csv"
	DBMS = CSV
	OUT = Pancreatic_cancer;
	GETNAMES=YES;
RUN;

/*descriptive statistics*/
proc means 
    data = Pancreatic_cancer maxdec = 2;
    class d;
    var y1 y2;
run;
/*ROC curve*/
proc logistic data = Pancreatic_cancer;
    model d(event="1")= y1 y2/nofit;
    roc 'CA19-9' y1;
    roc 'CA125' y2;
run;

/*The ROC curve with a higher area under the curve (AUC) is considered better. 
CA19-9 demonstrated a significantly higher AUC (0.8614) compared to CA125 (0.7056), 
indicating its superior ability to distinguish between pancreatic cancer-positive and negative cases. 
Therefore, CA19-9 is a more reliable diagnostic marker for pancreatic cancer*/

/*mean confidence interval*/
proc means 
    data = Pancreatic_cancer clm maxdec = 2;
    var y1 y2;
run;
proc means
    data = Pancreatic_cancer clm maxdec = 2;
    class d;
    var y1 y2;
run;


/* CA19-9 levels in individuals without pancreatic cancer (0) exhibit significant variability, with a mean of 594.10 and a 95% confidence interval ranging from 1608.84 to 24.16. 
In contrast, individuals with pancreatic cancer (1) show a considerably higher mean CA19-9 level of 1608.84, with a confidence interval from 24.16 to 594.10, indicating variability within the cancer group. */

/* For CA125 (y2), individuals without pancreatic cancer (0) have a mean CA125 level of 12.18, with a confidence interval from 23.89 to 30.34, showing relatively low levels with some variability. 
Individuals with pancreatic cancer (1) have a mean CA125 level of 944.35, with a confidence interval from 25.97 to 2486.48, indicating a substantial increase with wide variability within the cancer group. */
