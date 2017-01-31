# AML disease status prediction
  
#### Class "Machine Learning for Biomedicine"
**Midterm project posed by Prof. Peng Qiu**

###Data

- 359 subjects total
- 179 subjects in training set (class labels aml/normal)
- 180 subjects in testing set (NA class labels)
- 8 blood samples per subject
- Tube 1 is isotype control 
- tube 8 unstained
- five protein markers per tube
- forward scatter (FSC) and side scatter (SSC), SS is a rough indicator of cellular granularity, membrane complexity, number of organelles, etc. and FS is roughly proportional to cell size.  

![targeted protein per tube and channel](./markercombi.png =400x)

- measurement by flow cytometry
- channel 3 identical in each blood sample (CD45)
- class labels provided for 179 subjects (training data -> file 1 - 1432)
- class labels NA for remaining 180 subjects (testing data -> 1433 - 2872)

`$ tail -n 1445 AMLTraining.csv | head -n 10`  
`$ tail +2 AMLTraining.csv | cut -d ',' -f 4 | sort | uniq -c`

1440 NA -> 180 subjects in testing set  
184 aml -> 23 subjects in training set  
1248 normal -> 156 in training set 


**Data Source**

Spidlen J, Shooshtari P, Kollmann TR, Brinkman RR (2011). “Flow cytometry data standards”, BMC Res Notes, 4:50.

https://www.synapse.org/#!Synapse:syn2887788/wiki/72180

###Biology
- identify a subpopulation of lymphoma cells with impaired B-cell antigen receptor signaling, whose abundance was negatively correlated with survival
- previously done by manual gating 
- CD45 in combination with SCC useful to distinguish cell populations (lymphocytes, granolucytes, monocytes, etc.)


 
![Manual gating outcome. Image taken from doi:10.1093/bioinformatics/btt770](./gating.png =300x)  
**Figure: Manual gating results** 

###Considerations 
Although data set provides possibility for normalization agross fluorofore type and tube (using CD45 sample) literature suggests to not do so globally; ML algorithms should take care of that!?


###Literature
doi:10.1038/nmeth.2365  
doi: 10.1093/bioinformatics/btt770  
doi:10.1371/journal.pone.0037038