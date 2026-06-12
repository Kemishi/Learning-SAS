/* BOX PLOTS FOR SCENARIO COMPARISON (from "Box plots.sas", step A) */
proc sgplot data=work.cleaned_data;
    vbox n_val / category=Energy_Scenario fillattrs=(color=lightgray) datalabel;
    yaxis label="Empirical Coefficient (n)";
    xaxis label="Compaction Energy Scenario";
    title "Distribution of n-Coefficient across Energy Scenarios";
run;
