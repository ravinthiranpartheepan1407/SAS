libname data '/home/u63603566/Lab-3';

/* Step 1: Import the emplist data */
data data.emplist;
  infile '/home/u63603566/Lab-3/emplist.dat' truncover;
  input FirstName $ LastName $ JobCode $ HireDate $ Salary;
run;

/* Step 2: Import the airports data */
data data.airports;
  infile '/home/u63603566/Lab-3/airports.dat' truncover;
  input AirportName $ Country $;
run;

/* Step 3: Import the sales_north_america data */
data sales_north_america;
  infile '/home/u63603566/Lab-3/allsales.sas7bdat';
  input Month $ Region $ Sales$;
run;

/* Step 4: Import the sales_europe data */
data sales_europe;
  infile '/home/u63603566/Lab-3/allsales.sas7bdat';
  input Month $ Region $ Sales $;
run;

/* Step 5: Import the allSales data */
data all_sales;
  infile '/home/u63603566/Lab-3/allsales.sas7bdat';
  input Month $ Region $ Sales $;
run;


/* Plot JobCode, EmpID, and Salary for all employees */
ods listing close; /* Close the default output */
ods graphics / width=800px height=600px imagefmt=png;

/* Your plot code */
proc sgplot data=data.emplist;
    scatter x=JobCode y=Salary / markerattrs=(symbol=circlefilled);
    xaxis label="JobCode";
    yaxis label="Salary";
    title "Employee Data - JobCode vs Salary";
run;

/* Plot employee details for employees with JobCode "Pilot" */
proc sgplot data=data.emplist;
    where JobCode = "Pilot";
    scatter x=JobCode y=Salary / markerattrs=(symbol=circlefilled);
    xaxis label="JobCode";
    yaxis label="Salary";
    title "Pilot Employee Data - EmpID vs Salary";
run;

/* Plot all sales data */
proc sgplot data=data.allsales;
    vbar Month / response=Sales group=Region datalabel;
    xaxis label="Month";
    yaxis label="Sales";
    title "All Sales Data by Region";
run;

/* Plot sales data for Europe */
proc sgplot data=data.allsales;
    where Region = "Europe";
    vbar Month / response=Sales group=Region datalabel;
    xaxis label="Month";
    yaxis label="Sales";
    title "Sales Data for Europe by Month";
run;

/* Plot sales data for North America */
proc sgplot data=data.allsales;
    where Region = "North America";
    vbar Month / response=Sales group=Region datalabel;
    xaxis label="Month";
    yaxis label="Sales";
    title "Sales Data for North America by Month";
run;

/* Compare total sales between Europe and North America */
proc sgplot data=data.allsales;
    vbar Region / response=Sales group=Region datalabel;
    xaxis label="Region";
    yaxis label="Total Sales";
    title "Total Sales Comparison between Europe and North America";
run;

data crew_data;
    set data.emplist;

    new_HireDate = input(HireDate, mmddyy10.);

    if new_HireDate > '01JAN1986'd then
        HireDate = new_HireDate;
    else
        HireDate = .; 

    if JobCode = "Crew" and not missing(HireDate) and HireDate >= '01JAN1986'd;
run;

/* Sort the crew data by HireDate */
proc sort data=crew_data;
    by HireDate;
run;

/* Display crew data sorted by location */
proc print data=crew_data;
    var FirstName LastName JobCode HireDate Salary;
    title "Crew Members Hired after 1986 Sorted by Location";
run;