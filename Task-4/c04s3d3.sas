libname ia '/home/u59395988/prog1'; *PC;
proc print data=ia.crew;
where HireDate > '31Dec1985'd;
run;

