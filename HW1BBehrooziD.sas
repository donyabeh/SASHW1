/*********************************************/
/* STAT 330, Fall 2022						 */
/* Homework #1B								 */
/* Donya Behroozi and Grace Trenholme		 */
/*********************************************/

*1a;

data vaccineTemp; 
	length vaccine $ 30;
	input vaccine $ storage_temp_far;
	datalines;
Pfizer -94		
Moderna -4
AstraZeneca 41
J&J 41
Sanofi 41
Seasonal 39
; 
run;

*1b;

data vaccineTemp; 
	length vaccine $ 30;
	input vaccine $ storage_temp_far;
	stor_temp_cel = (storage_temp_far - 32) * 5/9;
	datalines;
Pfizer -94		
Moderna -4
AstraZeneca 41
J&J 41
Sanofi 41
Seasonal 39
; 
run;

*1c;

proc print data = vaccineTemp; 
*Celsius storage temp for Pfizer is -70 degrees celcius;
run;

*1d; 

data vaccineTemp; 
	length vaccine $ 30;
	input vaccine $ 1-12 storage_temp_far 13-15;
	datalines;
Pfizer      -94		
Moderna     -4
AstraZeneca  41
J&J          41
Sanofi       41
Seasonal     39
; 
run;

*1e: done;

*2a; 

data candy;
	infile '/home/u62368731/sasuser.v94/Homework/candy-data.txt'
firstobs = 2;
	length competitorName $ 30;
	input competitorName $ 1-27 chocolate 35 fruity 48 caramel 61 nutty 74 nougat 87 
	crispwafer 100 hard 113 bar 126 pluribus 139 sugarpercent 152-162 pricepercent 169-178 winpercent 191-199;
run; 

*2b;

proc print data=candy; 
	var competitorName winpercent;
run;

*2c: done;

*2d; 

data candy;
	infile '/home/u62368731/sasuser.v94/Homework/candy-data.txt'
firstobs = 2;
	length competitorName $ 30;
	input competitorName $ 1-27 chocolate 35 fruity 48 caramel 61 nutty 74 nougat 87 
	crispwafer 100 hard 113 bar 126 pluribus 139 sugarpercent 152-162 pricepercent 169-178 winpercent 191-199;
run;

proc means data = candy;
	var chocolate;
run;
*For the mean of the chocolate indicator variable, I got 0.4352941;
*Among all of the candies in the data set, 43.5% of of them have chocolate in the candy;

*3a; 

data MEPS;
	infile '/home/u62368731/sasuser.v94/Homework/H224.DAT';
	input DUPERSID 11-20 AGE20X 182-183 OFTSMK53 635-636;
run;

*3b;

proc print data = MEPS (OBS=20);
run;

*3c;

data MEPS;
	infile '/home/u62368731/sasuser.v94/Homework/H224.DAT';
	input DUPERSID 11-20 AGE20X 182-183 OFTSMK53 635-636;
run;

proc freq data = MEPS;
	tables AGE20X;;
run;
*3ci: In the proc freq output, the frequency of variable AGE20X is the same as the 
unweighted values listed in the codebook for AGE20X;
*3cii: According to the MEPS document, it seems like there are so many 85's in the data set because
the variable AGE20X was top-coded at age 85. I believe top-coding means setting an upper bound on a variable, like an 
end point. This means that any people over 85 that were surveyed would be recorded as age 85.;

*3d;

data MEPS;
	infile '/home/u62368731/sasuser.v94/Homework/H224.DAT';
	input DUPERSID 11-20 AGE20X 182-183 OFTSMK53 635-636;
run;

proc freq data = MEPS;
	tables OFTSMK53;;
run;

*I found that 2,852 people in the MEPS data set are current smokers. The percentage of people in the MEPS data
set that are current smokers is 10.26%.;