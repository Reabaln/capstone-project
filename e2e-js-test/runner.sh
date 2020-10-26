#!/usr/bin/env sh

code=0
testfile=$1
files=$testfile
echo $PWD

for entry in "$PWD"/*
do
  echo "$entry"
done


for entry in "$PWD/source"/*
do
  echo "$entry"
done


if [ -z $testfile ]
then
  files=$(ls $PWD/source/e2e-js-test/*_test.js)
fi

for test in $files
do
  node4 casperjs test $test
  ret=$?
  if [ ! $ret == "0" ]; then code=1; fi
done

exit $code
