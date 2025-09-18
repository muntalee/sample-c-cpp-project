cmake_minimum_required(VERSION 3.16)
project(game VERSION 1.0)

set(OUT ${CMAKE_PROJECT_NAME})
file(GLOB SOURCES ${CMAKE_SOURCE_DIR}/src/*.cpp)
include_directories(${CMAKE_SOURCE_DIR}/include)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
option(BUILD_SHARED_LIBS "Build shared libraries" ON)

add_executable(${OUT} ${SOURCES})
