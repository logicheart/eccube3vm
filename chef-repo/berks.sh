#!/bin/bash
BASEDIR=$(cd $(dirname $0);pwd)

rm -rf $BASEDIR/Berksfile.lock $BASEDIR/cookbooks/ 2>/dev/null
cd $BASEDIR
LANG=en_US.UTF-8 berks vendor cookbooks/
