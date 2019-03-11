#!/bin/bash
set -eo pipefail
sourcepath="$1"
../src//polynomial_invariant --planar --arrow-polynomial --names-db="${sourcepath}"/input/input_knotoid_names.txt --projections-list="${sourcepath}"/input/input_projections.txt --input-format=xyz --closure-method=open --nb-moves-III=100000 --output=polynomial_invariant_136.txt "${sourcepath}"/input/input1.xyz || exit $? 
diff polynomial_invariant_136.txt "${sourcepath}"/output/polynomial_invariant_136.txt || exit $?
