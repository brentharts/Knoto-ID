#!/bin/bash
set -eo pipefail
sourcepath="$1"
../src//polynomial_invariant --names-db="${sourcepath}"/input/input_knot_names.txt --projection=-0.374034,-0.717398,0.58774 --input-format=xyz --closure-method=rays --nb-moves-III=100000 --output=polynomial_invariant_79.txt "${sourcepath}"/input/input8.xyz || exit $? 
diff polynomial_invariant_79.txt "${sourcepath}"/output/polynomial_invariant_79.txt || exit $?
