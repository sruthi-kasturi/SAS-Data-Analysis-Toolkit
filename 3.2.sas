/* Question 1 */

proc import
        datafile = "/home/u63635623/Last Week/ga.xlsx"
        dbms = xlsx
        out = ga;
run;

/* Null Hypothesis: The population correlation coefficient (ρ) is 0. 
There is no correlation between ghrelin level and adiponectin level in women with polycystic ovarian syndrome. */
/* Alternative Hypothesis: Not null */

proc corr data=ga plots=matrix(histogram);
var Ghrelin Adipnectin;
run;

/* With a p value of <0.0001 and alpha of 0.5, we reject the null hypothesis. So, there is a correlation 
between  ghrelin level and adiponectin level in women with polycystic ovarian syndrome. 
Also, from the scatter plot, we can understand that there is positive correlation. */


/* Question 2 */
proc import
        datafile = "/home/u63635623/Last Week/lwd.xlsx"
        dbms = xlsx
        out = lwd;
run;

/* Null Hypothesis: The population correlation coefficient (ρ) is 0 and there is no correlation  */
/* between headcirc and child’s gestational age (gestage). */
/* Alternative Hypothesis: Not null hypothesis. */

/* Null Hypothesis: The population correlation coefficient (ρ) is 0 and there is no correlation  */
/* between headcirc and Birth weigth in gram (birthwt). */
/* Alternative Hypothesis: Not null hypothesis. */

/* Null Hypothesis: The population correlation coefficient (ρ) is 0 and there is no correlation  */
/* between child’s gestational age (gestage) and Birth weigth in gram (birthwt). */
/* Alternative Hypothesis: Not null hypothesis. */


proc corr data=lwd plots=matrix(histogram);
var headcirc gestage birthwt;
run;

/* With a p value of <0.0001 and alpha of 0.5, we reject the null hypothesis. So, there is a correlation  */
/* between headcirc and child’s gestational age (gestage). Also, from the scatter plot, we can understand that there is positive correlation. */


/* With a p value of <0.0001 and alpha of 0.5, we reject the null hypothesis. So, there is a correlation  */
/* between headcirc and Birth weigth in gram (birthwt). Also, from the scatter plot, we can understand that there is positive correlation. */

/* With a p value of <0.0001 and alpha of 0.5, we reject the null hypothesis. So, there is a correlation  */
/* between child’s gestational age (gestage) and Birth weigth in gram (birthwt). Also, from the scatter plot, we can understand that there is positive correlation. */

