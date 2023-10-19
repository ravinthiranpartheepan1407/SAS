libname data '/home/u63603566/Lab - 4';

/* Show personl data where State='NY' and JobCode in ('FA1' 'FA2' 'FA3') */
proc print data=data.personl;
where State = 'NY' and JobCode in ('FA1', 'FA2', 'FA3');
run;

/* Show personl data where Last Name has first two characters 'BR' */
proc print data=data.personl;
where substr(LName, 1, 2) = 'BR';
run;
