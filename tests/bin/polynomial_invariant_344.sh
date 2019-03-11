#!/bin/bash
set -eo pipefail
sourcepath="$1"
../src//polynomial_invariant --names-db=internal --input-format=pd --nb-moves-III=100000 --output=polynomial_invariant_344.txt "${sourcepath}"/input/input_diagram_open_sphere_2.txt || exit $? 
diff polynomial_invariant_344.txt "${sourcepath}"/output/polynomial_invariant_344.txt || exit $?
