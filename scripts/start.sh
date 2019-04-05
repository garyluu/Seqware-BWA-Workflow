#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -x

gosu root chmod a+wrx /tmp
WORK_DIR=$HOME
cd $HOME

# make all the imports read-able
gosu root chmod a+r /var/lib/cwl/*
gosu root chmod a+wrx $HOME
gosu seqware bash -c "$*"
#allow cwltool to pick up the results created by seqware
gosu root chmod -R a+wrx $WORK_DIR

