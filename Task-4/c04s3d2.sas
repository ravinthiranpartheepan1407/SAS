proc sort data=ia.empdata out=work.empdata;
   by JobCode;
run;
proc print data=work.empdata;
   by JobCode;
   id JobCode;
   sum Salary;
run;