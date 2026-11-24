cmake_minimum_required(VERSION 3.20)
project(cinematic-raytracer CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

find_package(OpenMP REQUIRED)
find_package(glm REQUIRED)
find_package(OpenEXR CONFIG REQUIRED)
find_package(fmt REQUIRED)
find_package(ZLIB REQUIRED)

add_executable(cinematic-raytracer
  src/main.cpp
  src/third_party_impl.cpp
)

target_compile_options(cinematic-raytracer PRIVATE -Wall -Wextra -march=native)
target_link_libraries(cinematic-raytracer PRIVATE
  OpenMP::OpenMP_CXX
  glm::glm
  OpenEXR::OpenEXR
  fmt::fmt
  ZLIB::ZLIB
)
target_include_directories(cinematic-raytracer PRIVATE src)
target_include_directories(cinematic-raytracer SYSTEM PRIVATE third_party)
