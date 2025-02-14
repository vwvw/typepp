#!/bin/bash
cd "${HOME}"/typepp || exit
docker run --mount source=.,target=/home/typeppUSER/typepp,type=bind,consistency=cached --mount source=/tmp/.X11-unix,target=/tmp/.X11-unix,type=bind,consistency=cached --shm-size=64g --privileged --name "chromium_typepp_profiling_eval_container" --env ENVIRONMENT_FOLDER=/home/typeppUSER --user typeppUSER -it chromium_typepp_profiling_eval /home/typeppUSER/typepp/Type++/chromium/eval/eval.sh typepp_checking_profiling
mkdir ./results/chromium_typepp_stats
docker cp chromium_typepp_profiling_eval_container:/tmp/chromium/total_result.txt ./results/chromium_total_result_typepp.txt
