option(FORCE_LOCAL_VCPKG "Force usage of local vcpkg even if the VCPKG_ROOT environment variable exist" OFF)

function(setup_vcpkg)
  if((NOT FORCE_LOCAL_VCPKG) AND (DEFINED ENV{VCPKG_ROOT}) AND (NOT DEFINED CMAKE_TOOLCHAIN_FILE))
    set(CMAKE_TOOLCHAIN_FILE $ENV{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake
      CACHE STRING "Global vcpkg toolchain file")
  elseif(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake)
    set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake
      CACHE STRING "Local vcpkg toolchain file")
  else()
    message(FATAL_ERROR "vcpkg is missing!! Provide a VCPKG_ROOT environment variable, specify the toolchain \
file on the command line or init and build the vcpkg subrepository")
  endif()
endfunction()
