/* COMPARATIVE DISTRIBUTIONS via PDFs (from "Box plots.sas", step B) */
proc univariate data=work.cleaned_data noprint;
    class Energy_Scenario;
    var n_val;
    histogram n_val / normal(mu=est sigma=est) kernel;
    inset mean std / position=ne;
    title "Probability Density of n for each Energy Input";
run;
