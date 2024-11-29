# genproductions
Generator fragments for MC production - COMETA ZZ polarization study

All the code is in genproductions/bin/MadGraph5_aMCatNLO

# Generating gridpacks

LOg in to lxplus8 but DO NOT generate a CMSSW test release yet.

Use cards (inclusive or in jet bins) in cards/zzpol. It should be OK to run
interactively, since it takes few minutes (inclusive) or several minutes (jet-binned) to complete. Example:
```
./gridpack_generation.sh ZZTo4L_<pol> cards/zzpol
```
Possibilities for the "pol" keyword are: UU, FF, LL, LT, TT, TL.

# Generating events

The first time do the following steps:

- generate a CMSSW_12_4_8 test release

- go to CMSSW_12_4_8/src

- set up Rivet as described in:
https://twiki.cern.ch/twiki/bin/view/CMS/Rivet#Setting_Rivet_in_CMSSW
(of course using CMSSW_12_4_8). Before compiling, check out this file from github:
https://github.com/multibosons/polarisationcomparison/blob/main/Rivet_Analysis_Yoda/COMETA_ZZ_production_analysis_Rivet3.cc
and place in the directory: Rivet/SMP/src

- create a directory named Configuration/GenTest/python and copy ../../Pythia8_fragment_(No)Matching.py, in case of jet-binned (inclusive) running, into this directory

- Now do "scram b"

All the times:

- Edit cmsDriver.sh changing to Pythia8_fragment_(No)Matching.py if needed

- run
```
source cmsDriver.sh <number of events to generate>
```
this will generate a file called zzpol_cfg.py. Edit this with the correct gridpack location and rename it to `zzpol<pol>_cfg.py`

- Edit runEvents.sh with the correct paths and run it as:
```
source runEvents.sh <pol>
```
(either interactively or on condor queues). This will give a file named `out<pol>.yoda` .

- Do:
```
./yodaToPlain.pl out<pol>.yoda
```
to change yoda output to the plain output desired by the COMETA authors.
