#!/bin/bash
set -eo pipefail
sourcepath="$1"
../src//polynomial_invariant --planar --names-db=internal --input-format=gauss --nb-moves-III=100000 --output=polynomial_invariant_407.txt "${sourcepath}"/input/input_diagram_gauss_open_plane_2.txt || exit $? 
diff polynomial_invariant_407.txt "${sourcepath}"/output/polynomial_invariant_407.txt || exit $?
