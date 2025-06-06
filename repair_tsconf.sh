#!/bin/bash

#
# 指定されたtsconf.xml の中のファイルパス（FILL_THE_FULL_FILE_PATH）を実際のフルパスに置換するシェルスクリプト
# shell script to replace FILL_THE_FULL_FILE_PATH with the actual full path in the specifed tsconf.xml
#
# USAGE: bash repair_tsconf.sh <tsconf.xml>
#

TSCONF=$1
TGTDIR=`dirname $TSCONF`
ABSPATH=`(cd $TGTDIR && pwd)`
sed -i '' "s|FILL_THE_FULL_FILE_PATH|file://$ABSPATH|g" $TSCONF

