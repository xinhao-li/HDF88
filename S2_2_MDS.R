# -------------------------------------------------- #
# -------------------------------------------------- #
#    Must do quality control before run this code    #
# -------------------------------------------------- #
# ----------------------------------?--------------- #

#-------Load libraries used in this vignette-------#
library(REddyProc)
library(dplyr)
#-------Load data with 1 header and 1 unit row from (tab-delimited) text file-------#
fileName <- "E:\\Paper\\HDF88\\data/S2_r.txt"
EddyData <- if (length(fileName)) fLoadTXTIntoDataframe(fileName) else Data
#-------Replace long runs of equal NEE values by NA-------#
#EddyData <- filterLongRuns(EddyData, "NEE")
#-------Add time stamp in POSIX time format-------#
EddyDataWithPosix <- fConvertTimeToPosix(EddyData, 'YDH',Year = 'Year',Day = 'DoY', Hour = 'Hour') 
#-------Initalize R5 reference class sEddyProc for post-processing of eddy data with the variables needed for post-processing later-------#
EProc <- sEddyProc$new('Flux data', EddyDataWithPosix, c('co2','g','H','h2o','LE','lwin','lwout','pa','parin','parout','ppt','rh','rn','swc1','swc2','swc3','swc4','Rg','swout','Tair','Tsoil1','Tsoil2','Tsoil3','Tsoil4','Tsoil5','Tsoil6','Tsoil7','Tsoil8','Ustar','vpd','ws','wd'))
#EProc$sPlotFingerprintY('NEE', Year = 2012)    #-------(Can pass)-------#
#EProc$sEstimateUstarScenarios(nSample = 100L, probs = c(0.05, 0.5, 0.95))
#EProc$sGetEstimatedUstarThresholdDistribution()   #-------To see the U star range (can pass)-------#
#EProc$sGetUstarScenarios()
#EProc$sMDSGapFillUStarScens('NEE')
#EProc$sMDSGapFillUStarScens('H')
#-------For each of the different u* threshold estimates a separate set of out?ut columns of filled NEE and its uncertainty is generated, distinguished by the suffixes given with uStarSuffixes. ??_f" denotes the filled value and ??_fsd" the estimated standard deviation of its uncertainty.-------#
#grep("NEE_.*_f$",names(EProc$sExportResults()), value = TRUE)
#grep("NEE_.*_fsd$",names(EProc$sExportResults()), value = TRUE)
#----??????????EProc$sPlotFingerprintY('NEE_U50_f', Year = 2019)????????????????#
#-------The third post-processing step is partitioning the net flux (NEE) into its gro?s components GPP and Reco. The partitioning needs to distinguish carefully between night-time and day-time. Therefore it needs a specification of geographical coordinates and time zone to allow computing sunrise and sunset. Further, the missing values in t?e used meteorological data need to be filled.-------#
EProc$sSetLocationInfo(LatDeg = 49.5346, LongDeg = -124.9004, TimeZoneHour = -7)  
EProc$sMDSGapFill('Tair', FillAll = TRUE) 
EProc$sMDSGapFill('co2', FillAll = TRUE)
EProc$sMDSGapFill('g', FillAll = TRUE)
EProc$sMDSGapFill('H', FillAll = TRUE)     
EProc$sMDSGapFill('LE', FillAll = TRUE)
EProc$sMDSGapFill('h2o', FillAll = TRUE)
EProc$sMDSGapFill('lwin', FillAll = TRUE)
EProc$sMDSGapFill('lwout', FillAll = TRUE)
EProc$sMDSGapFill('pa', FillAll = TRUE)
EProc$sMDSGapFill('paout', FillAll = TRUE)
EProc$sMDSGapFill('parin', FillAll = TRUE)
EProc$sMDSGapFill('ppt', FillAll = TRUE)
EProc$sMDSGapFill('rh', FillAll = TRUE)
EProc$sMDSGapFill('rn', FillAll = TRUE)
EProc$sMDSGapFill('swc1', FillAll = TRUE)
EProc$sMDSGapFill('swc2', FillAll = TRUE)
EProc$sMDSGapFill('swc3', FillAll = TRUE)
EProc$sMDSGapFill('swc4', FillAll = TRUE)
EProc$sMDSGapFill('Rg', FillAll = TRUE)
EProc$sMDSGapFill('swout', FillAll = TRUE)
EProc$sMDSGapFill('Tsoil1', FillAll = TRUE)
EProc$sMDSGapFill('Tsoil2', FillAll = TRUE)
EProc$sMDSGapFill('Tsoil3', FillAll = TRUE)
EProc$sMDSGapFill('Tsoil4', FillAll = TRUE)
EProc$sMDSGapFill('Tsoil5', FillAll = TRUE)
EProc$sMDSGapFill('Tsoil6', FillAll = TRUE)
EProc$sMDSGapFill('Tsoil7', FillAll = TRUE)
EProc$sMDSGapFill('Tsoil8', FillAll = TRUE)
EProc$sMDSGapFill('Ustar', FillAll = TRUE)
EProc$sMDSGapFill('vpd', FillAll = TRUE)
EProc$sMDSGapFill('ws', FillAll = TRUE)
EProc$sMDSGapFill('wd', FillAll = TRUE)

#-----EProc$sMRFluxPartition(FluxVar='NEE_U95_f',?FFluxVar='NEE_U95_fqc',TempVar='Tair',QFTempVar='Tair_fqc',suffix='U95',parsE0Regression=list(TempRange=2,optimAlgorithm="LM"))
#EProc$sMRFluxPartitionUStarScens(Suffix=uStarSuffixes,parsE0Regression=list(TempRange=3, optimAlgorithm="LM"))   
#grep("GPP.*_f$|Reco",names(EProc$sExportResults()), value = TRUE)       #-------The results are stored in columns Reco and GPP_f modified by the respective u* threshold suffix.-------#
######---------EProc$sPlotFingerprintY('GPP_U50_f', Year = 2019)----------######
#FilledEddyData <- EProc$sExportResults()
#uStarSuffixes <- colnames(EProc$sGetUstarScenarios())[-1]
#-------suffix <- uStarSuffixes[2]-------#
#GPPAggCO2 <- sapply( uStarSuffixes, function(suffix) {
#  GPPHalfHour <- FilledEddyData[[paste0("GPP_",suffix,"_f")]]
#  mean(GPPHalfHour, na.rm = TRUE)
#})
#molarMass <- 12.011
#GPPAgg <- GPPAggCO2 * 1e-6 * molarMass * 3600*24*365.25
#print(GPPAgg)    #-------(max(GPPAgg) - min(GPPAgg)) / median(GPPAgg) is the uncertainty range in GPP due to uncertainty of the U* threshold-------?
FilledEddyData <- EProc$sExportResults()
CombinedData <- cbind(EddyData, FilledEddyData)
write.csv(CombinedData,file="C:\\Users\\xinhaoli\\Desktop/S2_gapfilled_data_2.csv")

