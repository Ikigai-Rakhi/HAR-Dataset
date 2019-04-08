
1. Reading 'activity_labels' and 'features' files into R.
2. Reading training and test data into R and combining them using 'rbind' and then using 'cbind' to combine everything into one dataset.
3. Using 'select', we only create a new data frame 'HARsub' that contains 'mean' and 'standard deviation'.
4. Data is now 'merged' with activity labels so that we can map activity numbers with activity descriptions.
5. Rearrange the data for better readibility.
6.To create a *tidy* data set, the `gather()` function is used to pivot the data from a wide format to a long format. New columns 'features' and 'measurement' are created in the new data frame `harsubnew`.
7. Using chaining, the next step is to create a data table `harSummary` with the averages of the measured data, grouped by subject, activity and measured variable. We use the `summarise()`, `group_by()`, `ungroup()` and `arrange()` functions.
8. Finally, the two datasets are written to a text file using the `write.table()`