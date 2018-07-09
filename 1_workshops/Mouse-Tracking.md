## EADM Summer School in Salzburg: Mouse-Tracking 

### Goal
Design, build, pre-register, run, and analyze a mouse-tracking experiment in small groups (of 4 to 5 people).  

### Types of experiments considered
To facilitate the creation of the experiments during the workshop and to make them suitable for an investigation via mouse-tracking, they should meet the following criteria:
* In the experiment, participants complete a number of trials that involve decisions of the same structure
* In each trial, participants have to decide between two options by clicking on the corresponding button (two-alternative forced choice task, 2AFC)
* Between trials, the stimulus to be decided upon varies (usually) and / or the two response categories
* The stimulus (and/or the response options - in case they vary) should be simple (e.g., a single word, a picture)

### Preparations
* Read book chapters [Kieslich et al., 2018](../3_literature/Kieslich2018.pdf)
* Outline two example experiments in your group (meeting the requirements outlined above) and describe them in a paragraph
* Upload your ideas in one file name 'GroupX.doc' (where X is your group number) onto OSF [Project Ideas](https://osf.io/qzvfy/)  

### Software

* To create mouse-tracking experiments, please first install OpenSesame. It is available from http://osdoc.cogsci.nl/3.2/download/. To install the mousetrap plugin for OpenSesame, follow the instructions at https://github.com/pascalkieslich/mousetrap-os#installation. Please make sure to install the latest version of OpenSesame (3.2.4) and the development version of the mousetrap-os plugin.

* To analyze mouse-tracking data using the mousetrap R package, first install R (https://www.r-project.org/) and RStudio (https://www.rstudio.com/products/rstudio/download/). Afterwards, please run the following command in R to install the required packages:<br>`install.packages(c("readbulk","mousetrap"))`


### Monday (Pascal)
* 13:00-14:30 General introduction to mouse-tracking
  * Paradigm and assumptions
  * Implementation and analysis
  * Previous applications
* 14:30-15:00 Introduction to task
  * Type of experiments considered (2AFC, stimuli, etc.)
  * Your tasks during the workshop
* 15:00-17:00 Develop experimental design conceptually
* 17:00-18:00 Present experimental design in plenum 

### Tuesday (Pascal)
* 09:00-11:00 OpenSesame & mousetrap-os introduction
* 11:00-12:00 Build experiment
* 13:00-15:00 Build experiment
* 15:00-16:00 Register experiment at OSF (Michael)
* 18:00-19:00 Participate in experiments (Lab computers)

### Wednesday (Pascal & Dirk)
* 09:00-10:00 General R introduction (Dirk)
* 10:00-12:00 Mousetrap R package introduction (1h) + practical (1h) (Pascal)
  * Data import
  * Preprocessing
  * Inspecting data
  * Trial-level indices
  * Temporal analyses
* 13:00-14:30 Visualizations (30min) + practical (1h) (Pascal)
  * Aggregate trajectories
  * Riverbed
  * Heatmaps
* 14:30-16:00 Trajectory types (30min) + practical (1h) (Dirk)
  * Clustering
  * Prototypes
