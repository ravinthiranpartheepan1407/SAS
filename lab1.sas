/* Data Import */
data cars;
	set sashelp.cars;
/* 	export_path = '/home/u63603566/Lab_1.xlsx' */
run;

/* Data Export */
proc export data=cars
	outfile = '/home/u63603566/Lab_1.xlsx'
	dbms=xlsx replace;
run;