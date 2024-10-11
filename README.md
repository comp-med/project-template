# Project Template

## Overview

This projects describes the basic directory structure that you could (and
should) adapt for your own analyses.

```bash
00_COHORT_TRAIT_TEMPLATE/
└── 00_SUB_PROJECT
    ├── docs
    ├── graphics
    ├── input
    ├── log
    ├── output
    ├── paper
    ├── README.md
    ├── resources
    ├── results
    ├── scripts
    │   ├── 00_template.qmd
    │   ├── 00_template_submit.sh
    │   ├── functions
    │   └── templates
    ├── slurm_logs
    └── tmp
```

For larger analyses, it can make sense to work with sub-directories to
distinguish between files that are needed for or produced by different scripts.
One way to do this is by naming the directories after the respective script.

```bash
graphics/
├── 00_template
├── 01_collate_data
│   └── some_figure.png
└── 02_exploratory_analysis
    └── some_plots.pdf
```

## Sub-Directories

### Documents

Deposit text documents related to the project here. This can be correspondence
in PDF form or any other documents that are relevant.

### Graphics

This directory should be used to save plots and figures produced for this project.

### Input Data

Use this directory to deposit or link to input data used in the analysis. This
can be external data, spreadsheets and more that is processed during the
analysis.

### Output

Files produced during the analysis can be deposited here. In contrast to
results that are cleaned output, all files produced and further processed (e.g.
into results) can be deposited here.

### Paper

Use this directory to store everything related to the publication that is
supposed to be the result of this anaysis, e.g. tables, drafts etc.

### External Resources

External data used in the project can be deposited or linked to here. For
example, if external annotation data bases or results from other publications
are used in the analyses, they can be deposited here.

### Results

Save cleaned results and data object here.

### Scripts

This is where all code for this project should live. Make sure to adhere to
some structure, e.g. sequential numbering of steps and make sure names of
scripts are descriptive and explain the main part of what you are doing.

Functions that are sourced within the scripts should be deposited in a separete
directory, i.e. `functions` and scripts that are used as template, e.g. similar
analyses or functions from someone else that you adapt for your analysis should
be deposited in the `templates` directory.

### SLURM Logs

Deposit log output produced by SLURM here as to not pollute the rest of the
project with them.

### Temporary Files

Use this directory to store files that are most likely not needed as results,
but might be necessary to produce while developing and testing analyses.
