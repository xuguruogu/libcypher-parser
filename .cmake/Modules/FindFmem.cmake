# - Find fmem
# Find the native fmem headers and libraries.
#
# fmem_INCLUDE_DIRS	- where to find fmem.h, etc.
# fmem_LIBRARIES	- List of libraries when using fmem.
# fmem_FOUND	- True if fmem has been found.

find_path(fmem_INCLUDE_DIRS fmem.h)
find_library(fmem_LIBRARIES NAMES libfmem.a)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(fmem DEFAULT_MSG fmem_LIBRARIES fmem_INCLUDE_DIRS)

mark_as_advanced(fmem_INCLUDE_DIRS fmem_LIBRARIES)

if(fmem_FOUND)
    add_library(fmem::fmem UNKNOWN IMPORTED)

    set_target_properties(fmem::fmem
            PROPERTIES
            IMPORTED_LOCATION ${fmem_LIBRARIES}
            INTERFACE_INCLUDE_DIRECTORIES ${fmem_INCLUDE_DIRS})
endif(fmem_FOUND)
