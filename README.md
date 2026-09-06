# Temperature–Survey Data Integration

This repository contains a workflow for integrating **gridded historical temperature data with georeferenced Demographic and Health Survey (DHS) data** for climate, health, and development research.

The workflow extracts temperature observations from gridded climate data, spatially matches temperature grid points to DHS survey clusters, merges the resulting climate exposure measures with individual-level DHS records, and constructs temperature exposure indicators for econometric analysis.

## Data Sources

### Temperature Data

Historical gridded temperature data are obtained from the NOAA Physical Sciences Laboratory (PSL), using the GHCN-CAMS gridded temperature dataset.

The temperature data contain observations over a regular geographic grid and can be downloaded from the NOAA PSL website.

### DHS Data

The survey component uses Demographic and Health Survey (DHS) data, including:

- DHS GPS cluster coordinates
- DHS Individual Recode (IR) files

The GPS data provide the geographic coordinates of survey clusters, while the IR files contain individual-level demographic, socioeconomic, and health information.

> DHS datasets are not included in this repository and must be obtained separately through the DHS Program.

## Workflow

### 1. Download gridded temperature data

Download the required historical temperature files from the NOAA GHCN-CAMS dataset.

The appropriate time period should be selected based on the DHS survey year and the exposure period required for the analysis.

### 2. Extract temperature data in R

Use the R scripts in this repository to extract and process the relevant temperature observations from the gridded climate files.

This step prepares the climate data for spatial matching with DHS survey locations.

### 3. Match temperature grids to DHS clusters

The processed temperature data are merged with DHS GPS cluster coordinates using Python.

A **nearest-neighbour spatial matching approach** is used to identify the temperature grid point closest to each DHS survey cluster.

Conceptually, the procedure matches:

`Temperature grid point → nearest DHS GPS cluster`

This creates a cluster-level temperature history that can subsequently be linked to individual DHS observations.

### 4. Merge climate exposure with DHS survey data

The spatially matched temperature data are joined to the corresponding DHS Individual Recode (IR) files using the DHS cluster identifiers.

Where multiple DHS surveys or countries are being analysed, the harmonised survey-temperature datasets can subsequently be appended to construct a pooled analytical dataset.

The resulting data combine:

- individual and household characteristics from DHS
- geographic information from DHS GPS files
- historical temperature exposure from gridded climate data

### 5. Construct temperature exposure measures

The merged temperature histories can then be used to construct climate-exposure variables for empirical analysis.

Examples used in this project include:

#### Degree-day measures

Cumulative temperature exposure over the **12 months preceding the relevant survey/reference date**, constructed using degree-day measures.

#### Extreme heat exposure

Number of days during the preceding year on which temperature exceeded **30°C**.

These measures allow temperature exposure to be linked with individual-level demographic and health outcomes in subsequent econometric analyses.


## Tools

- **R** — extraction and processing of gridded temperature data
- **Python** — spatial matching and data integration
- **DHS GPS data** — survey cluster locations
- **DHS IR data** — individual-level demographic and health information
- **NOAA GHCN-CAMS** — historical gridded temperature data

