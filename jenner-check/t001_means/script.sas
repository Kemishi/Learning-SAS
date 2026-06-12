/* DESCRIPTIVE STATISTICS (from "Box plots.sas", step 2) */
proc means data=work.cleaned_data n mean std cv min max skewness kurtosis;
    var energy_val depth n_val;
    title "Table 1: Descriptive Statistics for New Parameters";
run;
