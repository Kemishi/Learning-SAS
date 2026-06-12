/* VISUALIZATION: scatter + regression fit (from "Box plots.sas", step 5) */
proc sgplot data=work.cleaned_data;
    scatter x=energy_val y=n_val / markerattrs=(size=4 color=blue);
    reg x=energy_val y=n_val / lineattrs=(color=red thickness=2);
    title "Figure 1: Impact of Energy on Parameter n";
run;
