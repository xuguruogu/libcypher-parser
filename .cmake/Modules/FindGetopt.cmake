# - Find getopt
# Find the native getopt headers and libraries.
#
# getopt_INCLUDE_DIRS	- where to find getopt.h, etc.
# getopt_LIBRARIES	- List of libraries when using getopt.
# getopt_FOUND	- True if getopt has been found.

find_path(getopt_INCLUDE_DIRS getopt.h)
find_library(getopt_LIBRARIES NAMES libwingetopt.a)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(getopt DEFAULT_MSG getopt_LIBRARIES getopt_INCLUDE_DIRS)

mark_as_advanced(getopt_INCLUDE_DIRS getopt_LIBRARIES)

if(getopt_FOUND)
    add_library(getopt::getopt UNKNOWN IMPORTED)

    set_target_properties(getopt::getopt
            PROPERTIES
            IMPORTED_LOCATION ${getopt_LIBRARIES}
            INTERFACE_INCLUDE_DIRECTORIES ${getopt_INCLUDE_DIRS})
endif(getopt_FOUND)

