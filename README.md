# Community Housing Survey
**Visualization with Shiny & flexdashboard**

The goal of this application is to visualize data on housing conditions using a survey tool developed for OpenDataKit. In partnership with the [Georgia Initiative for Community Housing (GICH)](http://www.fcs.uga.edu/fhce/gich/) and the [Housing and Demographics Research Center](http://www.fcs.uga.edu/fhce/hdrc) the , the [Community Mapping Lab](http://research.franklin.uga.edu/cmlab) at the University of Georgia worked with multiple communities in Georgia to collect these data. [Click on this link](https://enketo.ona.io/x/#YBkr) to see an example of the survey we used. 

This application provides non-technical users a way to visualize and better understand the results. The working application is available at this URL: https://comapuga.shinyapps.io/sampledata_flexdash

This tool has been developed for R's Shiny platform, using flexdashboard to organize the page into three tabs. Leaflet is used to map the data, and this app also uses other packages including sf, tidyverse, and htmltools for data management.

The main application is found in the sampledata_flexdash.Rmd file. The initial section reads in data and sets parameters for a textbox showing parcel data and a dropdown menu used on two different tabs. The remainder of the code creates the three main tabs used in this application:

1. Number of property issues: Allows users to view and filter properties based on the total number of issues reported.
2. Specific issues & heatmap: Allows users to view the locations of specific issues (such as roof damage). Users can also identify hotspots for issues based on a hexagonal grid.
3. Classification & census: Properties are visualized based on a three tier classification (standard, substandard, and dilapidated). Block level data from the 2010 Census is also used to contextualize property conditions.

The data for this application is in the Data folder, including data on the parcels themselves, census variables, and the hexagonal grid. The data provided here are for *sample purposes* only--they were created synthetically and do not reflect actual conditions at locations shown on the map.

In addition, the sampledata_hexagg R script is used with two data files (hexgrid_sample and Parcels_sample) to count property issues by hex grid cell.

Future development may include adding additional contextual data or other forms of visualizing the distribution of issues across properties. We are also revising the housing survey, which will be added to this repo as an XLSForm once drafted.
