#!/bin/bash
chmod 777 -R ${HOME}/typepp/Type++/chromium/eval
${HOME}/typepp/Type++/chromium/build_baseline.sh
${HOME}/typepp/Type++/chromium/build_cfi.sh
${HOME}/typepp/Type++/chromium/build_typepp.sh
${HOME}/typepp/Type++/chromium/build_cfi_stats.sh
${HOME}/typepp/Type++/chromium/build_typepp_stats.sh

chmod 777 -R ${HOME}/typepp/Type++/chromium/eval
mkdir -p results

${HOME}/typepp/Type++/chromium/run_baseline.sh
${HOME}/typepp/Type++/chromium/run_cfi.sh
${HOME}/typepp/Type++/chromium/run_typepp.sh
${HOME}/typepp/Type++/chromium/run_cfi_stats.sh
${HOME}/typepp/Type++/chromium/run_typepp_stats.sh

export RESULT_FOLDER=./results
${HOME}/typepp/Type++/chromium/gettable.py
