cmake_minimum_required(VERSION 2.6)

project(camLight)
find_package( OpenCV REQUIRED  )

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall")
set(RESULT_DIR results)
file(GLOB SRC . main.cpp)
file(GLOB HDR . )

add_executable(${PROJECT_NAME} ${SRC} ${HDR})
target_link_libraries(${PROJECT_NAME} ${OpenCV_LIBS})

file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${RESULT_DIR})
