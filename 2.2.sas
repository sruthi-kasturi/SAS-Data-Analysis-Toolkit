proc import
        datafile = "/home/u63635623/WEEK 5_2.2/fev.xlsx"
        dbms = xlsx
        out = fev;
run;

/* mean, standard deviation, median, q1, q3 */

proc univariate 
    data = fev;
    class center;
    var fev;
run;

/* Normality */
proc univariate data=fev normal;
class center;
var fev;
histogram fev;
run;

/* Based on the graphs, they follow the normal distribution */

/* Homogeneous assumptions */
proc anova data=fev;
class center;
model fev=center;
means center/hovtest;
run;


/* Null Hypothesis: There is no difference between forced expiratory volume in 1 second 
between the 3 centers: Johns Hopkins; Rancho Los Amigos; St. Louis  */

/* Alternative hypothesis : There is difference between the forced expiratory volume 
in 1 second between at least one of the 3 centers: Johns Hopkins; Rancho Los Amigos; St. Louis  */

/* We use anova test in this case  */

proc anova data=fev;
class center;
model fev=center;
means center/hovtest;
run;

/* With a p value of <0.0520 and an alpha of 0.05, We do not reject the null hypothesis. */





/* *********************************** */
proc import
        datafile = "/home/u63635623/WEEK 5_2.2/bh.xlsx"
        dbms = xlsx
        out = eg2;
run;

/* mean, standard deviation, median, q1, q3 */

proc univariate 
    data = eg2;
    class trt;
    var day;
run;

/* Normality */
proc univariate data=eg2 normal;
class trt;
var day;
histogram day;
run;

/* Based on the graphs, they follow the normal distribution */

/* Homogeneous assumptions */

proc anova data=eg2;
class trt;
model day=trt;
means trt/hovtest;
run;


/* Null Hypothesis: There is no difference between the blister healing period 
of Treatment A, Treatment B, Placebo  */

/* Alternative hypothesis : There is difference between the blister healing period of
at least one of the treatment: Treatment A, Treatment B, Placebo   */

/* We use anova in this case  */

proc anova data=eg2;
class trt;
model day=trt;
means trt/hovtest;
run;

/* With a p value of 0.006 and an alpha of 0.05, We reject the null hypothesis. */
