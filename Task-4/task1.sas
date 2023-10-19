libname pass_lib '/home/u63603566/Lab - 4';

/* Example 1: Show the total sum of FClass, BClass, EClass passengers */
data total_passengers;
   set pass_lib.passngrs;
   TotalPassengers = FClass + BClass + EClass;
run;
proc print data=total_passengers;
run;

/* Example 2: Print passenger data where destination is 'SEA' */
proc print data=pass_lib.passngrs;
where Dest = 'SEA';
run;

/* Example 3: Print passenger data where destination is 'SEA' and suppress observation column */
proc print data=pass_lib.passngrs noobs;
where Dest = 'SEA';
run;
