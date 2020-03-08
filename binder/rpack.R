    cranlist <- c(
                  "data.table",
                  "devtools",
                  "IRkernel",
                  "sqldf",
                  "tidyverse",
                  "foreign",
                  "survival",
                  "survivalAnalysis",
                  "muhaz",
                  "ggfortify",
                  "ranger",
                  "coin",
                  "survminer",
                  "GGally",
                  "plotly"
    )

    # later tidyverse and plotly

    #mirid <- match("tr", getCRANmirrors()[,8])
    #chooseCRANmirror(graphics=FALSE, ind=mirid)

    ## cran packages
    for (package in cranlist)
    { 
        if (!require(package, character.only = T, quietly = T))
        {
            install.packages(package)
        }
    }

    # initiate IRkernel
    IRkernel::installspec(user = FALSE)

