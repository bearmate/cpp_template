find_package(docopt REQUIRED)
find_package(fmt REQUIRED)
find_package(spdlog REQUIRED)

add_executable(intro main.cpp)
target_link_libraries(
  intro
  PRIVATE project_options
          project_warnings
          docopt
          spdlog::spdlog
          fmt::fmt)
