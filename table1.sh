#!/bin/bash
mkdir -p results

docker build . --target cpu_typepp_analysis -t cpu_typepp_analysis

docker run --env NUMBER_OF_ITERATION=1 --name cpu_typepp_analysis_container -t cpu_typepp_analysis 
# collect the results
docker cp cpu_typepp_analysis_container:/home/typeppUSER/results/ results_typepp_analysis
cat ./results_typepp_analysis/analysis_result_test.tex
