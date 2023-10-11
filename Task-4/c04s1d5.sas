proc print data=ia.empdata noobs;
   var JobCode EmpID Salary;
   sum Salary;
   format Salary dollar11.2
run;
proc format;
   value $codefmt 'FLTAT'='Flight Attendant'
                  'PILOT'='Pilot';
run;
proc print data=ia.empdata;
   format JobCode $codefmt.;
   format Salary dollar11.2
run;

proc format;
   value money low-<25000 ='Less than 25,000'
               25000-50000='25,000 to 50,000'
               50000<-high='More than 50,000';
run;
proc print data=ia.empdata;
   format Salary money.;
run;
