libname data '/home/u63603566/Lab-2';

/* Step 1: Import the emplist data from a .dat file */
data data.emplist;
  infile '/home/u63603566/Lab-2/emplist.dat' delimiter=',';
  input EmployeeID EmployeeName $ Salary Department $;
run;

/* Step 2: Import the airport data from a .dat file */
data data.airport;
  infile '/home/u63603566/Lab-2/airports.dat' delimiter=',';
  input AirportCode $ AirportName $ City $ Country $;
run;

/* Step 3: Export emplist data to CSV */
proc export data=data.emplist
  outfile='/home/u63603566/Lab-2/emplist.csv' 
  dbms=csv replace;
run;

/* Step 4: Export airport data to CSV */
proc export data=data.airport
  outfile='/home/u63603566/Lab-2/airports.csv'
  dbms=csv replace;
run;

/* Step 5: Explore and view the emplist data */
proc print data=data.emplist;
  title 'Employee Data';
run;

/* Step 6: Explore and view the airport data */
proc print data=data.airport;
  title 'Airport Data';
run;

/* Step 7: Perform basic analysis on airport data */
proc freq data=data.airport;
  tables City Country;
  title 'Frequency of Cities and Countries in Airport Data';
run;

/* Step 8: Perform basic analysis on Employee data */
proc freq data=data.emplist;
  tables EmployeeName Department;
  title 'Frequency of Employee Name and Department in Employee Data';
run;

/* Step 8: Close the library reference */
libname data clear;
