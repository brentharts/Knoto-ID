#!/bin/bash
set -eo pipefail
sourcepath="$1"
../src//polynomial_invariant --planar --names-db="${sourcepath}"/input/input_knotoid_names.txt --projections-list="${sourcepath}"/input/input_projections.txt --input-format=xyz --closure-method=open --nb-moves-III=100000 --output=polynomial_invariant_172.txt "${sourcepath}"/input/input3.xyz || exit $? 
diff polynomial_invariant_172.txt "${sourcepath}"/output/polynomial_invariant_172.txt || exit $?
