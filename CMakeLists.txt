cmake_minimum_required(VERSION 3.20)
project(blackhole CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# default to an optimized build, since raytracers are ~10-50x slower without it
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

find_package(OpenMP REQUIRED)
find_package(glm REQUIRED)
find_package(OpenEXR CONFIG REQUIRED)
find_package(fmt REQUIRED)

add_executable(blackhole
  src/main.cpp
)

target_compile_options(blackhole PRIVATE -Wall -Wextra -march=native)
target_link_libraries(blackhole PRIVATE
  OpenMP::OpenMP_CXX
  glm::glm
  OpenEXR::OpenEXR
  fmt::fmt
)
target_include_directories(blackhole PRIVATE src)
