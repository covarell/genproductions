cp -p ${rootfolder}/${folderName}/*.dat  ./

if [ -e ${rootfolder}/${folderName}/obj-gfortran/proclib ]; then
  mkdir ./obj-gfortran/
  cp -pr ${rootfolder}/${folderName}/obj-gfortran/proclib  ./obj-gfortran/
  cp -pr ${rootfolder}/${folderName}/obj-gfortran/*.so  ./obj-gfortran/
fi   
if [ -e ${rootfolder}/${folderName}/obj-gnu/proclib ]; then
  mkdir ./obj-gnu/
  cp -pr ${rootfolder}/${folderName}/obj-gnu/proclib  ./obj-gnu/
  cp -pr ${rootfolder}/${folderName}/obj-gnu/*.so  ./obj-gnu/
fi   

cd -

pwd
ls
echo $iJob | ${rootfolder}/pwhg_main &> log_${tag}.log
cp -p log_${tag}.log ${rootfolder}/${folderName}/.

