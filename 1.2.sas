proc import
	datafile = "/home/u63635623/WEEK 2/lowbwt0.csv"
	out = data1
	dbms= csv
	replace;
run;

/* Univariate  is procedure that produces moments, basic statistical measures, quantiles, tests for locations, and extreme obs. Mean is 47.08000, Median is 47.00000 and Mode is 48.00000. 
It is interesting to note that the highest Systolic BP observed was 87 while, the lowest is 19.*/

PROC UNIVARIATE DATA=data1;
VAR sbp sex;
RUN;

/* Means function gives mean of the dataset, while adding median gives the median which is 47.00 for this dataset.  */
proc means data=data1 n nmiss median mean maxdec=2;
class sex;
var sbp;
run;


/* Frequency function is used to identify the trends in the dataset. To check how man times a values repeats. The results show that there are 56 females and 44 males in this dataset. */
proc freq data=data1;
table sex;
run;

/* Through Format function, we can alter the names of the variables. Here we assisgned Females to 0 and males to 1. */
proc format;
value sex 0 ="Female" 1 ="Male";
run;
proc means data=data1;
class sex;
var sbp;
format sex sex.;
run;
proc freq data=data1;
table sex;
format sex sex.;
run;
