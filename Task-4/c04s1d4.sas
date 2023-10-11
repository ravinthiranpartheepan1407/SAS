proc print data=ia.empdata noobs;
   var JobCode EmpID Salary;
   where JobCode='PILOT';
run;