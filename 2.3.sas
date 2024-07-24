PROC IMPORT 
	DATAFILE= "/home/u63635623/2_3/bayley0.csv"
	DBMS=CSV
	OUT=bayley;
RUN;

/* Null hypothesis: The median PDI score for children born with congenital heart disease  */
/* who undergo reparative heart surgery during the first three months of life is equal to 100 */
/* Alternative hypothesis: The median PDI score for children born with congenital heart disease  */
/* who undergo reparative heart surgery during the first three months of life is not equal to 100 */

proc univariate data=bayley normal;
var pdi;
histogram pdi;
qqplot pdi;
run;

proc univariate data=bayley mu0=100;
var pdi;
run;


/* With a p value of <.0001 and an alpha of 0.05, we reject the null hypothesis. */


PROC IMPORT 
	DATAFILE= "/home/u63635623/2_3/lowbwt0 (1).csv"
	DBMS=CSV
	OUT=lowbw;
RUN;

/* Null hypothesis: There is no difference in the population median systolic blood pressure */
/* (SBP) between male and female infants  */

/* Alternative hypothesis: Not null hypothesis (H0) */

proc univariate data=lowbw normal;
var sbp;
histogram sbp;
qqplot sbp;
run;

proc npar1way data=lowbw wilcoxon;
class sex;
var sbp;
run;

/* With a p value of 0.8648 and alpha of 0.05, we fail to reject the null hypothesis */


proc import
        datafile = "/home/u63635623/WEEK 5_2.2/fev.xlsx"
        dbms = xlsx
        out = fev;
run;

/* Null hypothesis: There is no difference in the population median */
/* forced expiratory volume in one second (FEV) for */
/* patients with coronary artery disease among the three centers. */

/* Alternative hypothesis: There is difference in atleast of the centers in the population
 median forced expiratory volume in one second (FEV) for */
/* patients with coronary artery disease among the three centers. */

proc npar1way data=fev wilcoxon;
class center;
var fev;
run;

proc npar1way data=fev wilcoxon dscf;
class center;
var fev;
run;

/* With a p value of 0.0498 and alpha of 0.05, we reject the null hypothesis. */