# Starter folder

## Overview

This is the readme file for Paper 3 written by Jin Di Lu, Justin Abando, and Marcin Jaczynski

## File Structure

The repo is structured as:

- `input/data` contains the raw data source used to produce everything. 

While we do not have the formal permission to share GSS data, this raw data is essential to the functionality and reproducibility of the rest of the document. 

Hence, for the sake of legal reproducibility, another readme file is written with precise steps as to how to obtain the raw data source from the GSS NORC website. It is saved as "readme_rawdata" in /inputs/ and accessible as an html file. 

Another copy of the readme to produce the raw data will be provided here, in addition to being in the input/data folder.

- `outputs/data` contains the cleaned dataset that was constructed from the raw dataset.

- `outputs/paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper.

- `scripts` contains the R scripts used to simulate, download and clean data.

## Raw Data Acquision readme
(Preface: this process requires access to an internet browser, a file compression software such as 7zip, and Microsoft Excel.)

In order to acquire the GSS data through legal means, follow these precise steps in order to obtain the dataset we worked with.

1. Access the GSS Data Explorer website at: https://gssdataexplorer.norc.org/home

2. Register for an account at the GSS Data Explorer website by clicking on register.

3. Afterwards, input the necessary information needed to successfully register.

4. Accept the required confirmation email and then access to the data explorer will be granted to you.

5. After accepting the confirmation email, return to the GSS Data Explorer website and log in with your credentials

6. After logging in, access the Data Explorer search function and add variables Year, id, ballot, happy, satfin, hapmar, income16, health, life, finalter to the extract

7. After adding all of these variables to extract, click on the plus sign with extract and click on the tab "Create Extract"

8. This will take you to a page where you will name and describe the extract. To ensure that this extracted dataset will work with our code for reproducibility reason, please name this dataset "GSS_csv_final"

9. On the second step to "Build Extract", click on the highlighted text "add all variables" and all variables will be added to the extract. After this step, click next

10. On the third step "Choose output options", there are several methods the user can take. For our sanity (as the R Script had difficulty formatting correctly and we did not want to use GSSR to make this project 100% reproducible from scratch), we decided to output this dataset as an excel workbook with data + metadata before exporting the dataset as a .csv file. 

In order to do so, first click on the highlighted text "select certain years" and check off only the year 2021. Next, click on excel workbook (data + metadata) and leave metadata fields as label. 

11. After all this, click on create extract.

12. When this is done, the excel file will begin to process. Once it is done processing, click on the checkbox beside gss_csv_final.

13. After clicking on the checkbox, click on the actions button and download the excel dataset. This will trigger a download that will save this dataset in a compressed folder.

14. After the download has completed, open the compressed folder with any compression software you'd like. Open the gss_csv_final.tar.gz, then gss_csv_final.tar, then Final, then batch_0tar.gz, then batch_0.tar, then batch_0, then result, then copy files GSS.dat, GSS.xlsx, and post_processing_output into a new folder.

15. Open GSS.xlsx and delete sheets variables and codes.

16. After deleting both, export the xlsx file as a csv file, and save it in our input/data folder as gss_csv_final.csv

17. Voila, the data is now usable by the rest of the programs and will produce the same results that we have made. 