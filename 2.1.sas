/* Practice 1 */

/* Population: Women taking contraceptive medication. */
/* Null Hypothesis: There is no difference between mean Systolic Blood Pressure In Women  */
/* who Start Using Oral Contraceptives and the mean of the general population */

/* Alternative hypothesis : There is difference between mean Systolic Blood Pressure In Women  */
/* who Start Using Oral Contraceptives and the mean of the general population */

/* We use paired T-test in this case  */

proc import
        datafile = "/home/u63635623/WEEK 4/OralContraceptives.xlsx"
        dbms = xlsx
        out = oralcon;
run;

/* PROC TTEST DATA= oralcon; */
/* VAR before after; */
/* RUN; */

proc ttest data= oralcon h0=0 sides=2;
paired after*before;
run;

/* With a p value of 0.0089 and an alpha of 0.05, We reject the null hypothesis. */



/* Practice 2 */


proc import
        datafile = "/home/u63635623/WEEK 4/DATA Pain and Childbirth0.xls"
        dbms = xls
        out = pain;
run;

/*  Null hypothesis: There is no mean difference between average pain rating 
between women who received a general analgesic vs epidural. 

ALternative hypothesis: There is mean difference between average pain rating 
between women who received a general analgesic vs epidural. */

proc means
    data =pain maxdec = 2;
    class analg;
    var pri;
run;

/* The mean pain rating for women who received epidural analgesic (1) is 7.92,  */
/* which is higher than the mean pain rating for women who received other analgesic (0),  */
/* which is 6.36. This suggests that women who received epidural analgesic tend to  */
/* report higher levels of pain on average compared to those who received other analgesic. */

proc means
    data =pain clm maxdec = 2;
    class analg;
    var pri;
run;

/* The 95% confidence interval for the mean pain rating in women who received  */
/* epidural analgesic (1) ranges from 7.33 to 8.52, while the 95% confidence interval  */
/* for women who received other analgesic (0) ranges from 5.91 to 6.81.  */
/* These confidence intervals do not overlap, further supporting the conclusion that  */
/* there is a statistically significant difference in pain ratings between the two groups. */

proc ttest data=pain;
class analg;
var pri;
run;

/* We use independent T-test in this case  */
/* With a p value of 0.0003 and an alpha of 0.05, We reject the null hypothesis. */