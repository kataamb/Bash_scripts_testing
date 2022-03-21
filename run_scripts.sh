#!/bin/bash

bash ./build_debug.sh



cd ./func_tests/scripts; bash ./func_tests.sh 


cd ../../

bash ./collect_coverage.sh


bash ./build_release.sh




bash clean.sh

