#!/bin/bash

cd /opt
curl -o ${SALOME_FILE_TAR} ${SALOME_URL}

# check file
if md5sum -c ${SALOME_FILE_MD5}; then
  rm -f ${SALOME_FILE_MD5}
else
  echo "checksum md5 fails"
  exit -1;
fi
if sha512sum -c ${SALOME_FILE_SHA512SUM}; then
  rm -f ${SALOME_FILE_SHA512SUM}
else 
  echo "checksum sha512sum fails"
  exit -1;
fi

# install salome
tar xfz ${SALOME_FILE_TAR}
./${SALOME_FILE_RUN}                                      \
  -t ${HOME}/salome_meca                                  \
  -a ${HOME}/salome_meca/appli_V${SALOME_VERSION}_public  \
  -s /tmp                                                 \
  -D                                                      \
  -l English
rm ${SALOME_FILE_TAR}

