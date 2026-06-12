/* autoexec for t002_corr_spearman
   The upstream script begins with PROC IMPORT of an XLSX from a SAS
   Studio path. This autoexec substitutes a small inline sample in the
   shape that DATA work.cleaned_data produces, so the analysis below
   runs anywhere. log_n is derived exactly as in the source. */
options obs=100;

/* Sample compaction dataset in the shape the analysis steps consume after
   DATA work.cleaned_data. Substitutes the original XLSX (PROC IMPORT from a
   SAS Studio path) with a small inline sample so the analysis runs anywhere. */
data work.cleaned_data;
    length Energy_Scenario $12;
    input Filled_Box_ID depth energy_val n_val Energy_Scenario $;
    if n_val > 0 then log_n = log10(n_val);
    datalines;
1 0.5 600 0.42 Standard
1 1.0 600 0.45 Standard
1 1.5 600 0.49 Standard
2 0.5 1200 0.58 Modified
2 1.0 1200 0.61 Modified
2 1.5 1200 0.66 Modified
3 0.5 2700 0.74 Reduced
3 1.0 2700 0.79 Reduced
3 1.5 2700 0.83 Reduced
4 0.5 600 0.40 Standard
4 1.0 600 0.44 Standard
5 0.5 1200 0.57 Modified
5 1.0 1200 0.62 Modified
6 0.5 2700 0.73 Reduced
6 1.0 2700 0.80 Reduced
7 0.5 600 0.41 Standard
8 0.5 1200 0.59 Modified
9 0.5 2700 0.76 Reduced
;
run;
