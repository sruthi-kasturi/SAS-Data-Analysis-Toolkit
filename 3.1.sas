PROC IMPORT 
	DATAFILE= "/home/u63635623/WEEK 6_3.1/cat.xlsx"
	DBMS=XLSX
	OUT= cat;
RUN;

/* Null hypothesis: There is no association between treatment and withdrawal
Alternative hyopthesis: Not Null hypothesis*/

proc freq data= cat;
weight number;
table treatment*Withdrawal/chisq;
run;

/* With a p is <0.0001 and alpha of 0.5, we reject the null hyothesis. 
So, there is association between treatment and withdrawal*/

PROC IMPORT 
	DATAFILE= "/home/u63635623/WEEK 6_3.1/cat.xlsx"
	DBMS=XLSX
	OUT= Cat2;
	sheet = "HD";
RUN;

/* Null hypothesis: There is no association between retirement status and cardiac arrest. */
/* Alternative hypothesis: Not null  */

proc freq data= Cat2;
weight num;
table cardiacarrest*health/agree;
run;

/* With a p value is 0.1573, we don't reject the null hypothesis.  */
/* So, There is association between retirement status and cardiac arrest. */

