# Designing Optimal Allocations for Cancer Screening using Queuing Network Models

## Data Scientist: Evan Goldberg
## First Author: Justin Dean
## Senior authors: Franziska Michor

# Description

This project looks at SEER data and applies queuing network model theory to assess the benefits of hypothetical early screening methods.

All the code used for this project can be found in Code/.

Data can be accessed by completing the following steps after getting access to the SEER database using the SEERstat software and getting special access to the chemotherapy dataset.

First perform a case listing with the following dataset: "Incidence - SEER 18 Regs Custom Data (with additional treatment fields). Nov 2018 Sub (1975-2016 varying) - Linked to County Attributes - Total U.S., 1969-2017 Counties (Database ID = 30305)".

The following selections were made to subset the data in the selection tab
-Age recode with <1 year olds not equal to unknown
-Age at diagnosis not equal to unknown
-Site and Morphology Site = Pancreas (or whatever desired cancer type)

The following variables were selected for the dataset in the table tab
-Patient ID
-Age Recode <1 year olds
-Sex
-Race and origin recode (NHW, NHB, NHAIAN, NHAPI, Hispanic)
-Year of Diagnosis
-Year of birth
-Age at diagnosis
-Month of diagnosis
-Chemotherapy recode (yes, no/unknown)
-Radiation Sequence with surgery
-Type of follow-up expected
-Reason no cancer-directed surgery
-COD to site recode
-SEER cause-specific death classification
-SEER other cause of death classification
-Survival months
-Survival months flag
-Vital status recode (study cutoff used)
-Sequence number
-First malignant primary indicator
