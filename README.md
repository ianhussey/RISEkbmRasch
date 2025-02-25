# RISEkbmRasch
R package for Rasch Measurement Theory based psychometric analysis. Intended for use with [Quarto](https://quarto.org) for documentation and presentation of analysis process and results. This package uses other packages for the Rasch analyses, such as [eRm](https://cran.r-project.org/web/packages/eRm/), [mirt](https://cran.r-project.org/web/packages/mirt/) and [psychotree](https://cran.r-project.org/web/packages/psychotree/), and aims to simplify the steps in Rasch analysis to provide tables and figures with functions that have few options. The package has been tested on MacOS and Windows with R 4.1 and 4.2.

There is now a [vignette](https://pgmj.github.io/raschrvignette/RaschRvign.html) that is intended to be the next step after you skimmed this README. You can find a sample Rasch analysis there, with output from most of the package functions.

## Installation

First, install the [`devtools`](https://devtools.r-lib.org/) package:
```r
install.packages('devtools')
```

Then install the package and its dependencies: 
```r
devtools::install_github("pgmj/RISEkbmRasch", dependencies = TRUE)
```

And, while not strictly necessary, it is highly recommended to install Quarto (and update your Rstudio and R installation if needed):
- https://quarto.org/docs/get-started/
- https://posit.co/download/rstudio-desktop/

### Upgrading
```r
detach("package:RISEkbmRasch", unload = TRUE) # not needed if you haven't loaded the package in your current session
devtools::install_github("pgmj/RISEkbmRasch")
```

## Usage

Most functions in this package are relatively simple wrappers that create outputs such as tables and figures to make the Rasch analysis process quick and visual. There is a [companion Quarto template file](https://github.com/pgmj/RISEkbmRasch/tree/main/Quarto) that shows suggested ways to use this package.

There are two basic data structure requirements:

- you need to create a dataframe object named `itemlabels` that consists of two variables/columns:
  - the **first one** named `itemnr`, containing variable names exactly as they are named in the dataframe containing data (for example q1, q2, q3, etc)
  - the **second one** named `item`, containing either the questionnaire item or a description of it (or description of a task)
- the data you want to analyze needs to be in a dataframe with participants as rows and items as columns/variables
  - the lowest response category needs to be zero (0). Recode as needed, the Quarto template file contains code for this.
  - during data import, you will need to separate any demographic variables into vectors (preferrably as labeled factors), for analysis of differential item functioning (DIF), and then remove them from the dataframe with item data. **The dataframe with item data can only contain item data for the analysis functions to work** (no ID variable or other demographic variables).

For most Rasch-related functions in the package, there are separate functions for polytomous data (more than two response options for each item) and dichotomous data, except `RItargeting()` which defaults to polytomous data and has the option `dich = TRUE` for dichotomous data. For instance, `RIitemfitPCM()` for the Partial Credit Model and `RIitemfitRM()` for the dichotomous Rasch Model. The Rating Scale Model (RSM) for polytomous data has not been implemented in any of the functions.

More details and examples of use will be added. You can find two Quarto use cases with Rasch analyses in the [project subfolder Quarto](https://github.com/pgmj/RISEkbmRasch/tree/main/Quarto). You will need to copy all the text from the .qmd template file and paste it into a new file, since GitHub does not allow any simple way to just download a file(?). Since Quarto/qmd files are just text files, this is hopefully not too inconvenient.

Examples of output from the Quarto files are [also available](https://github.com/pgmj/RISEkbmRasch/tree/main/Quarto/output). Quarto can output multiple types of documents based on the same script, which is illustrated using the RaschR1.qmd file to output both a HTML scrollable file with side menu, and a revealjs presentation (also using HTML). The HTML files need to be downloaded and opened with a web browser.

### Notes on known issues

There are currently no checks on whether data input in functions are correct. This means that you need to make sure to follow the instructions above, or you may have unexpected outputs or difficult to interpret error messages. Start by using the functions for descriptive analysis and look closely at the output, which usually reveals mistakes in data coding or demographic variables left in the item dataset.

If there is too much missingness in your data, some functions may have issues or take a lot of time to run. In the Quarto template file there is a script for choosing how many responses a participant needs to have to be included in the analysis. You can experiment with this if you run in to trouble. Currently, the `RIloadLoc()` function does not work with any missing data (due to the PCA function), and the workaround for now is to run this command with `na.omit()` around the dataframe (ie. `RIloadLoc(na.omit(df))`. Other reasons for functions taking longer time to run is having a lot of items (30+), and/or if you have a lot of response categories that are disordered (commonly happens with more than 4-5 response categories, especially if they are unlabeled in the questionnaire).

The `RIitemfitPCM2()` function, that makes use of multiple random subsamples to avoid inflated infit/outfit ZSTD values and runs on multiple CPU's, will fail if there is a lot of missing data or very few responses in some categories. Increasing the sample size and/or decreasing the number of parallel CPUs can help. If that fails, revert to the function `RIitemfitPCM()` that only uses one CPU.

### For the curious

For those new to R, it may be useful to know that you can easily access the code in each function by using the base R `View()` function. For example, `View(RItargeting)` shows the code for the `RItargeting()` function that creates a Wright map style figure (after installing and loading the RISEkbmRasch package).

If you are new to R, [Hadley Wickham's book "R for data science"](https://r4ds.hadley.nz/) is a great place to start.

## Author

[Magnus Johansson](https://www.ri.se/en/person/magnus-p-johansson) is a licensed psychologist with a PhD in behavior analysis. He works as a research scientist at [RISE Research Institutes of Sweden](https://ri.se/en), Department of Measurement Science and Technology, and is an affiliated researcher at [Karolinska Institutet](https://medarbetare.ki.se/orgid/52082137).
- Twitter: [@pgmjoh](https://twitter.com/pgmjoh)
- ORCID: [0000-0003-1669-592X](https://orcid.org/0000-0003-1669-592X)
- Mastodon: [@pgmj@scicomm.xyz](https://scicomm.xyz/@pgmj)

## License

This work is licensed under [Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/).
