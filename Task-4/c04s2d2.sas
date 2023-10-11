options number pageno=1;
proc print data=work.empdata;
   by JobCode;
   pageby JobCode;
   sum Salary;
run;