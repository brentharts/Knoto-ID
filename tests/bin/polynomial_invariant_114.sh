#!/bin/bash
set -eo pipefail
sourcepath="$1"
../src//polynomial_invariant --projection=0.0495168,0.956945,-0.286015 --input-format=xyz --closure-method=open --nb-moves-III=100000 --output=polynomial_invariant_114.txt "${sourcepath}"/input/input1.xyz || exit $? 
diff polynomial_invariant_114.txt "${sourcepath}"/output/polynomial_invariant_114.txt || exit $?
