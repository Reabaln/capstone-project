#!/usr/bin/env sh

code=0
testfile=$1
files=$testfile


casperjs test $PWD/source/e2e-js-test/homepage_test.js
casperjs test $PWD/source/e2e-js-test/login_test.js
casperjs test $PWD/source/e2e-js-test/catalogue_test.js
casperjs test $PWD/source/e2e-js-test/cart_test.js
casperjs test $PWD/source/e2e-js-test/checkout_test.js

exit $code
