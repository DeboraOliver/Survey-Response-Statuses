# Survey Response
 
## Overview

Engaging health-related workers in a survey can be challenging. Despite timezone, someone of them work in 6-hours shifts whereas other might follow comercial hours due to their duties. This code had as a goal visualize and identify frequency of responses and the best time/hour to send surveys. 
It would allows the REDCap’s team to better manage the Reminder Schedule.
## 1. Requirements

To run this project you need the following libraries:


```{r libraries, message=FALSE, warning=FALSE}
library(redcapAPI)
library(tidyr)
library(ggplot2)
library(dplyr)
```

### i) redcapAPI

In this project, we use data collected using redcap to further use redcap API to establish a connection between the two softwares. Despite recapConnection(), this package also has other very useful tools, such as exportRecords() which allows to import to RStudio our patient's data.

```{r rcon, message=FALSE, warning=FALSE, paged.print=FALSE}
source("token.txt")

rcon <- redcapConnection(url=url, token=token)

rm(token)
```

Both token and url must be provided by your institution.


## 2. Expected result

