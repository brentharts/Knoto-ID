file(WRITE "${DEST}/KnotoidNames.cpp" "#include <KnotoidNames.hh>\n")
file(READ "${SOURCE}/knot_names.txt" knot_names)
string(REPLACE "\n" "\\n" knot_names2 ${knot_names})
file(APPEND "${DEST}/KnotoidNames.cpp" "std::stringstream knot_names(\"")
file(APPEND "${DEST}/KnotoidNames.cpp" ${knot_names2})
file(APPEND "${DEST}/KnotoidNames.cpp" "\");\n")

file(READ "${SOURCE}/knotoid_names_sphere.txt" knotoid_names_sphere)
string(REPLACE "\n" "\\n" knotoid_names_sphere2 ${knotoid_names_sphere})
file(APPEND "${DEST}/KnotoidNames.cpp" "std::stringstream knotoid_names_sphere(\"")
file(APPEND "${DEST}/KnotoidNames.cpp" ${knotoid_names_sphere2})
file(APPEND "${DEST}/KnotoidNames.cpp" "\");\n")

file(READ "${SOURCE}/knotoid_names_planar.txt" knotoid_names_planar)
string(REPLACE "\n" "\\n" knotoid_names_planar2 ${knotoid_names_planar})
file(APPEND "${DEST}/KnotoidNames.cpp" "std::stringstream knotoid_names_planar(\"")
file(APPEND "${DEST}/KnotoidNames.cpp" ${knotoid_names_planar2})
file(APPEND "${DEST}/KnotoidNames.cpp" "\");\n")

file(READ "${SOURCE}/knotoid_names_sphere_arrow.txt" knotoid_names_sphere_arrow)
string(REPLACE "\n" "\\n" knotoid_names_sphere_arrow2 ${knotoid_names_sphere_arrow})
file(APPEND "${DEST}/KnotoidNames.cpp" "std::stringstream knotoid_names_sphere_arrow(\"")
file(APPEND "${DEST}/KnotoidNames.cpp" ${knotoid_names_sphere_arrow2})
file(APPEND "${DEST}/KnotoidNames.cpp" "\");\n")

file(READ "${SOURCE}/knotoid_names_planar_arrow.txt" knotoid_names_planar_arrow)
string(REPLACE "\n" "\\n" knotoid_names_planar_arrow2 ${knotoid_names_planar_arrow})
file(APPEND "${DEST}/KnotoidNames.cpp" "std::stringstream knotoid_names_planar_arrow(\"")
file(APPEND "${DEST}/KnotoidNames.cpp" ${knotoid_names_planar_arrow2})
file(APPEND "${DEST}/KnotoidNames.cpp" "\");\n")

