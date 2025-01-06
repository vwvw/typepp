#!/bin/bash
docker build . --target cpu_reference -t cpu_reference
docker build . --target cpu_typepp -t cpu_typepp

# these builds allow the collection of cast statistics
docker build . --target cpu_typepp_stats -t cpu_typepp_stats

mkdir -p results
# run the experiment
docker run --env NUMBER_OF_ITERATION=$NUMBER_OF_REPLICATION --name cpu_reference_container -t cpu_reference
# collect the results
docker container cp  cpu_reference_container:/home/typeppUSER/results results_baseline
cat results_baseline/runtime_performance.csv >> ./results/runtime_performance.csv

# run the experiment
docker run --env NUMBER_OF_ITERATION=$NUMBER_OF_REPLICATION --name cpu_typepp_container -t cpu_typepp 
# collect the results
docker container cp  cpu_typepp_container:/home/typeppUSER/results results_typepp
cat results_typepp/runtime_performance.csv >> ./results/runtime_performance.csv

# run the experiment
docker run --env NUMBER_OF_ITERATION=1 --name cpu_typepp_stats_container -t cpu_typepp_stats 
# collect the results
docker container cp  cpu_typepp_stats_container:/home/typeppUSER/results results_typepp_stats
cp results_typepp_stats/total_result* results

export RESULT_FOLDER=./results
./Type++/script/getmemoryoverhead.py &&  ./Type++/script/getperformanceresult.py
