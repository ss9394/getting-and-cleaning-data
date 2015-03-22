
1. X_test was enetered into "test"
2. X_train was enetered into "train"
3. activity_labels was entered into "label"
    -  labels say about the 6 activites that the subjects do
4. features was entered into "features"
    -  features say about all the variables of each activity that the subjects do

5.subject_train - was entered into "trainsub" - says each vector row is performed by which subject(1-30)

6.subject_test - was entered into "testsub" - says each vector row is performed by which subject(1-30)

7. y_train - was entered into "trainlabel" - says each vector row is performing which activity(1-6)
8. y_test - was entered into "testlabel" - says each vector row is performing which activity(1-6)

9. changing the coloumn name to ACT(activies) of the activies set( trainslabel and testlabel) and adding the activities col to respective datasets by using cbind
10. changing the coloumn name to SUB(subject) of the subject set( trainsub and testsub) and adding the subject col to respective datasets by using cbind

11. merging both data sets into 1 data set (mactsub),  using merge
12. Giving readable names of the variables of the dataset(563 coloumns) from the "features" set.

13. By using grep function, "mean" and "std" were compared to each coloumn name, wherever match was found the coloumn were extracted into a new data frame(ext) 

14. Just for readability , Arranged the dataset in increasing order of Subject then activites

15. An empty data frame was created
16. Now, for calculating the average of each activity for each subject , 
  - 2 nested for loop is used. 
  - outer being the SUBJECT number and inner being the Activity number
  - in each inner loop a single row is created containing the mean of the single activity "j" of the  "i"th subject.
  - and is appended to the new data frame created.
 
17. The usual coloumn names are given to the new data frame 

18.rearranging the Dataset - Subject and activities coloumn to the left for better readability

19. Finally using write.table the final data frame is written.



