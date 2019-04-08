#### Original dataset ####

Of the files included in the UCI HAR dataset.zip, we use the following files for this assignment:

- `activity_labels.txt` 
- `features.txt`
- `subject_test.txt` (`_test` files are in the 'test' folder in the original .zip file)
- `X_test.txt`
- `y_test.txt`
- `subject_train.txt` (`_train` files are in the 'train' folder in the original .zip file)
- `X_train.txt`
- `y_train.txt`

###Solution file###
The solution data set `HAR_tidy_dataset.txt` contains the following variables:

- `subject` - a numeric identifier for the user or subject being observed
- `actnum` - activity code identifier that matches up to an activity description such as 1 = Walking, 4 = Sitting, 5 = Standing etc.
- `actdesc` - description of activity being performed by the subject
- `features` - selected variables containing the mean() or std() of observed activity
- `measurement` - measured values

The solution data set `HAR_summary.txt` contains the following variables:

- `subject` - a numeric identifier for the user or subject being observed
- `actdesc` - description of activity being performed by the subject
- `features` - selected variables containing the mean() or std() of observed activity
- `avg_measurement` - average of measured values across time


####Cleaning the Data####
1. Reading 'activity_labels' and 'features' files into R.
2. Reading training and test data into R and combining them using 'rbind' and then using 'cbind' to combine everything into one dataset.
3. Using 'select', we only create a new data frame 'HARsub' that contains 'mean' and 'standard deviation'.
4. Data is now 'merged' with activity labels so that we can map activity numbers with activity descriptions.
5. Rearrange the data for better readibility.
6.To create a *tidy* data set, the `gather()` function is used to pivot the data from a wide format to a long format. New columns 'features' and 'measurement' are created in the new data frame `harsubnew`.
7. Using chaining, the next step is to create a data table `harSummary` with the averages of the measured data, grouped by subject, activity and measured variable. We use the `summarise()`, `group_by()`, `ungroup()` and `arrange()` functions.
8. Finally, the two datasets are written to a text file using the `write.table()`