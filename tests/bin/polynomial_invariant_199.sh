#!/bin/bash
set -eo pipefail
sourcepath="$1"
../src//polynomial_invariant --arrow-polynomial --names-db="${sourcepath}"/input/input_knotoid_names.txt --projection=-0.629614,0.357833,-0.689595 --input-format=xyz --closure-method=open --nb-moves-III=100000 --output=polynomial_invariant_199.txt "${sourcepath}"/input/input4.xyz || exit $? 
diff polynomial_invariant_199.txt "${sourcepath}"/output/polynomial_invariant_199.txt || exit $?
