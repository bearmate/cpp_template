cmake_minimum_required(VERSION 3.17)

include(cmake/CompilerWarnings.cmake)
include(cmake/Doxygen.cmake)
include(cmake/PreventInSourceBuilds.cmake)
include(cmake/Sanitizers.cmake)
include(cmake/StaticAnalyzers.cmake)

# ---- Prevent Building In-Source ----
prevent_in_source_builds()

# ---- Project ----
project(my_project CXX)

# ---- Global Project Options ----
# TODO: can these be bound to specific targets instead?
provide_doxygen()
provide_static_analyzers()
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# ---- Pseudo Warnings Library ----
# Link to this to setup project warnings
add_library(project_warnings INTERFACE)
set_project_warnings(project_warnings)

# ---- Pseudo Options Library ----
# Link to this to setup project options
add_library(project_options INTERFACE)
target_compile_features(project_options INTERFACE cxx_std_17)
provide_sanitizers(project_options)

# ---- Testing ----
option(ENABLE_TESTING "Enable Test Builds" ON)

if(ENABLE_TESTING)
  enable_testing()
  message("Building Tests")
  add_subdirectory(test)
endif()

# ---- Compile Source Code ----
add_subdirectory(src)
