#!/usr/bin/env sh

code=0
testfile=$1
files=$testfile
echo $PWD
echo ls 
if [ -z $testfile ]
then
  files=$(ls e2e-js-test/*_test.js)
fi

for test in $files
do
  node test/e2e/test_helper.js
  casperjs test $test
  ret=$?
  if [ ! $ret == "0" ]; then code=1; fi
done

exit $code
