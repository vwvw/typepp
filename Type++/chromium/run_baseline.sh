#!/bin/bash
cd "${HOME}"/typepp || exit
docker run --mount source=.,target=/home/typeppUSER/typepp,type=bind,consistency=cached --mount source=/tmp/.X11-unix,target=/tmp/.X11-unix,type=bind,consistency=cached --shm-size=64g --privileged --name "chromium_baseline_eval_container" --env ENVIRONMENT_FOLDER=/home/typeppUSER --user typeppUSER -it chromium_baseline_eval /home/typeppUSER/typepp/Type++/chromium/eval/eval.sh ref
docker cp chromium_baseline_eval_container:/home/typeppUSER/typepp/Type++/chromium/eval/ref.json ./results/
