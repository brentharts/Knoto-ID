#!/bin/bash
set -eo pipefail
sourcepath="$1"
../src//polynomial_invariant --input-format=pd --nb-moves-III=100000 --output=polynomial_invariant_330.txt "${sourcepath}"/input/input_diagram_open_sphere_0.txt || exit $? 
diff polynomial_invariant_330.txt "${sourcepath}"/output/polynomial_invariant_330.txt || exit $?
