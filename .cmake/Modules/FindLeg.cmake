# - FindLeg leg
# Find the native leg program.
#
# leg_PROGRAMS - List of programs when using leg.
# leg_FOUND	- True if leg has been found.

find_program(leg_PROGRAMS NAMES leg)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(leg DEFAULT_MSG leg_PROGRAMS)

mark_as_advanced(leg_PROGRAMS)

