/* CORRELATION ANALYSIS (from "Box plots.sas", step 3)
   Spearman rank correlation among the three parameters. */
proc corr data=work.cleaned_data spearman;
    var n_val energy_val depth;
    title "Table 2: Spearman Correlation for Parameter n";
run;
