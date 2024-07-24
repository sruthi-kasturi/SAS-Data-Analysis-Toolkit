libname test " /home/u63635623/WEEK 1";

proc import
	datafile = "/home/u63635623/SAS_Example1/example1.csv"
	out = test.data1
	dbms= csv
	replace;
run;

proc print data=test.data1;
run;

proc export
	data=test.data1
	dbms=csv
	outfile= "/home/u63635623/SAS_Example1/example1_export.csv"
	replace;
run;

/* xls */

proc import
	datafile = "/home/u63635623/SAS_Example1/example1.xls"
	out = test.data2
	dbms= xls
	replace;
run;

proc print data=test.data2;
run;

proc export
	data=test.data2
	dbms=xls
	outfile= "/home/u63635623/SAS_Example1/example1_export.xls"
	replace;
run;


/* xlsx */

proc import
	datafile = "/home/u63635623/SAS_Example1/example1.xlsx"
	out = test.data3
	dbms= xlsx
	replace;
run;

proc print data=test.data3;
run;

proc export
	data=test.data3
	dbms=xlsx
	outfile= "/home/u63635623/SAS_Example1/example1_export.xlsx"
	replace;
run;


/* wo_header.txt */

data test.wo_header;
	infile '/home/u63635623/SAS_Example1/example1_wo_header.txt' delimiter = ',';
	input ID name $ gender $ age;
run;

proc print data = test.wo_header;
run;


/* wt header text */
data test.wt_header;
	infile '/home/u63635623/SAS_Example1/example1_wt_header.txt' delimiter = ',' firstobs = 2;
	input ID name $ gender $ age;
run;

proc print data = test.wt_header;
run;



/* proc import */
/* 	datafile = "/home/u63635623/SAS_Example1/example1_wt_header.txt" */
/* 	out = test.data5 */
/* 	dbms= txt */
/* 	replace; */
/* run; */
/*  */
/* proc print data=test.data5; */
/* run; */
/*  */
/* proc export */
/* 	data=test.data5 */
/* 	dbms=txt */
/* 	outfile= "/home/u63635623/SAS_Example1/example1_wt_header.txt" */
/* 	replace; */
/* run; */
