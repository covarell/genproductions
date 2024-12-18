#!/bin/bash

export VO_CMS_SW_DIR=/cvmfs/cms.cern.ch
source $VO_CMS_SW_DIR/cmsset_default.sh
export SCRAM_ARCH=el8_amd64_gcc10

cd /afs/cern.ch/user/c/covarell/work/zzpol_slc8/genproductions/bin/MadGraph5_aMCatNLO/ZZTo4L_test/ZZTo4L_test_gridpack/src 
eval `scram runtime -sh`
cd /tmp/
cp /afs/cern.ch/user/c/covarell/work/zzpol_slc8/genproductions/bin/MadGraph5_aMCatNLO/ZZTo4L_test/ZZTo4L_test_gridpack/src/zzpol${1}_cfg.py zzpol${1}_${2}_cfg.py
cat << EOF >> zzpol${1}_${2}_cfg.py

from IOMC.RandomEngine.RandomServiceHelper import RandomNumberServiceHelper
randSvc = RandomNumberServiceHelper(process.RandomNumberGeneratorService)
randSvc.populate()
EOF

cmsRun zzpol${1}_${2}_cfg.py
cp out.yoda /afs/cern.ch/user/c/covarell/work/zzpol_slc8/genproductions/bin/MadGraph5_aMCatNLO/out${1}_${2}.yoda

