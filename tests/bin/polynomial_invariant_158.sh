#!/bin/bash
set -eo pipefail
sourcepath="$1"
../src//polynomial_invariant --planar --arrow-polynomial --names-db=internal --projection=0.249617,-0.021334,0.96811 --input-format=xyz --closure-method=open --nb-moves-III=100000 --output=polynomial_invariant_158.txt "${sourcepath}"/input/input2.xyz || exit $? 
diff polynomial_invariant_158.txt "${sourcepath}"/output/polynomial_invariant_158.txt || exit $?
