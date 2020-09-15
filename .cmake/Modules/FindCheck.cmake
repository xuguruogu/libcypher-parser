# - Find check
# Find the native check headers and libraries.
#
# check_INCLUDE_DIRS	- where to find check.h, etc.
# check_LIBRARIES	- List of libraries when using check.
# check_FOUND	- True if check has been found.

find_path(check_INCLUDE_DIRS check.h)
find_library(check_LIBRARIES NAMES libcheck.a)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(check DEFAULT_MSG check_LIBRARIES check_INCLUDE_DIRS)

list(APPEND check_LIBRARIES)

mark_as_advanced(check_INCLUDE_DIRS check_LIBRARIES)

if(check_FOUND)
    add_library(check::check UNKNOWN IMPORTED)

    set_target_properties(check::check
            PROPERTIES
            IMPORTED_LOCATION ${check_LIBRARIES}
            INTERFACE_INCLUDE_DIRECTORIES ${check_INCLUDE_DIRS})
endif(check_FOUND)
