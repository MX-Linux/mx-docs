#!/bin/bash

##push local po files to transifex
##this is destructive on transifex, so problaby only useful when initializing a new resource
##or possibly migrating one resource to another
#there is a confirmation step
#and the resource must exist


RESOURCE="$(basename $(dirname $(pwd)))-desktop"
APPNAME="$(basename $(dirname $(pwd)))-desktop"

# prepare transifex 
if [ ! -s  .tx/config ]; then
   mkdir -p .tx
   cat <<EOF > .tx/config
[main]
host = https://www.transifex.com

[antix-development.$APPNAME]
file_filter = po/${APPNAME}_<lang>.po
source_file = ${APPNAME}.pot
source_lang = en
type = po
EOF
fi    

tx push -r antix-development.${RESOURCE} --translations --force

