cmake_minimum_required(VERSION 3.16)
project(spk_shared VERSION 1.0.0)

set(CMAKE_C_FLAGS "-pedantic -ansi -Wall -Wextra -O3 -std=c99")
set(CMAKE_EXE_LINKER_FLAGS "-Wl,-Bdynamic")

file(GLOB HEADERS "../include/lldos/*.h")
file(GLOB SOURCES "*.c")
add_library(spk_shared SHARED ${SOURCES} ${HEADERS})

set_target_properties(spk_shared PROPERTIES LINKER_LANGUAGE C)

include_directories(../include)
include_directories(/usr/include)
include_directories(/usr/lib)
include_directories(/usr/local/lib)
include_directories(/usr/lib/x86_64-linux-gnu)

target_link_libraries(spk_shared stdc++)
target_link_libraries(spk_shared yaml)

# Set install rules
install(TARGETS spk_shared DESTINATION /usr/lib)
install(FILES ${HEADERS} DESTINATION /usr/include/lldos)
