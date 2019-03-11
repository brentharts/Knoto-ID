#!/bin/bash
set -eo pipefail
sourcepath="$1"
../src//knotted_core --arrow-polynomial --names-db=internal --projections-list="${sourcepath}"/input/input_projections.txt --closure-method=open --output=knotted_core_134.txt --output-search=knotted_core_134_search.txt "${sourcepath}"/input/input4.xyz || exit $? 
diff knotted_core_134.txt "${sourcepath}"/output/knotted_core_134.txt || exit $?
diff knotted_core_134_search.txt "${sourcepath}"/output/knotted_core_134_search.txt || exit $?
