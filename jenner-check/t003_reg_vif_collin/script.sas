/* REGRESSION MODELING (from "Box plots.sas", step 4) */
proc reg data=work.cleaned_data;
    model n_val = energy_val depth / vif collin;
    title "Table 3: Predicting n from Energy and Depth";
run;
quit;
