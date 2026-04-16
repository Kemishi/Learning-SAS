/* 1. DATA INGESTION & CLEANING */
proc import datafile="/home/u64462905/Khosi/Excel Box Plot Data and Charting.xlsx"
    out=work.raw_data dbms=xlsx replace;
    getnames=yes;
run;

/* Fix for sparse Box ID (Forward Fill logic) */
data work.cleaned_data;
    set work.raw_data;
    retain Filled_Box_ID;
    if 'Box ID'n ne . then Filled_Box_ID = 'Box ID'n;
    /* Map long names to shorter variables */
    depth = 'Measured Depth (D)'n;
    energy_val = Energy;
    n_val = 'n 'n; /* Check for the trailing space in your column name */
    if n_val > 0 then log_n = log10(n_val);
run;

/* 2. DESCRIPTIVE STATISTICS */
proc means data=work.cleaned_data n mean std cv min max skewness kurtosis;
    var energy_val depth n_val;
    title "Table 1: Descriptive Statistics for New Parameters";
run;

/* 3. CORRELATION ANALYSIS */
proc corr data=work.cleaned_data spearman;
    var n_val;
    with energy_val depth;
    title "Table 2: Spearman Correlation for Parameter n";
run;

/* 4. REGRESSION MODELING */
proc reg data=work.cleaned_data;
    model n_val = energy_val depth / vif collin;
    title "Table 3: Predicting n from Energy and Depth";
run;
quit;

/* 5. VISUALIZATION */
proc sgplot data=work.cleaned_data;
    scatter x=energy_val y=n_val / markerattrs=(size=4 color=blue);
    reg x=energy_val y=n_val / lineattrs=(color=red thickness=2);
    title "Figure 1: Impact of Energy on Parameter n";
run;



/* A. BOX PLOTS FOR SCENARIO COMPARISON */
proc sgplot data=work.cleaned_data;
    vbox n_val / category='Energy Scenario'n fillattrs=(color=ligr) datalabel;
    yaxis label="Empirical Coefficient (n)";
    xaxis label="Compaction Energy Scenario";
    title "Distribution of n-Coefficient across Energy Scenarios";
run;

/* B. COMPARATIVE DISTRIBUTIONS (Methodology: PDFs) */
proc univariate data=work.cleaned_data noprint;
    class 'Energy Scenario'n;
    var n_val;
    histogram n_val / normal(mu=est sigma=est) kernel;
    inset mean std / position=ne;
    title "Probability Density of n for each Energy Input";
run;
