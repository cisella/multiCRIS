### R code from vignette source 'cris.Rnw'

###################################################
### code chunk number 1: Library
###################################################
library(CRISclassifier)


###################################################
### code chunk number 2: cris.Rnw:112-115
###################################################
demo <- list.files(pattern="txt.gz$", system.file("data",package="CRISclassifier"), full.names=TRUE)
cris_classifier(input.exp.filename = demo, output.name="cris", nresmpl=1)



###################################################
### code chunk number 3: cris.Rnw:124-126
###################################################
cris_multilabel(input.exp.filename = demo, output.name="cris", nresmpl=1)



###################################################
### code chunk number 4: cris.Rnw:154-155 (eval = FALSE)
###################################################
## require(predictCRIS)


###################################################
### code chunk number 5: loadData
###################################################
data(matList)
data(phenoList)


###################################################
### code chunk number 6: cris.Rnw:174-179
###################################################
sapply(matList, class)
sapply(matList, dim)
sapply(phenoList, class)
sapply(phenoList, length)
sapply(phenoList, summary)


###################################################
### code chunk number 7: kTSPclassify
###################################################
### Valid gene expression matrix with all CRIS genes
newMat <- matList$Training
### To make predictions on 1 matrix
newPreds <- predictCRISclassKTSP(newMat)
### Counts classifications
summary(newPreds)
### NPT classification
refClass <- phenoList$Training


###################################################
### code chunk number 8: kTSPmultiClassify
###################################################
### For all matrices
newPredsList <- lapply(matList, predictCRISclassKTSP)
### Count classifications
lapply(newPredsList, summary)


###################################################
### code chunk number 9: sessioInfo
###################################################
toLatex(sessionInfo())


