cmake_minimum_required(VERSION 3.16)
project(SPKC VERSION 1.0.0)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_FLAGS "-pedantic -ansi -Wall -Wextra -O3")
set(CMAKE_C_FLAGS "-pedantic -ansi -Wall -Wextra -O3")

add_executable(spkc main.c)
set_property(TARGET spkc PROPERTY C_STANDARD 99)

include_directories(/usr/include)
include_directories(/usr/lib)
include_directories(/usr/local/lib)
include_directories(/usr/lib/x86_64-linux-gnu)

target_link_libraries(spkc stdc++)
target_link_libraries(spkc curl)
target_link_libraries(spkc spk_shared)

install(TARGETS spkc DESTINATION /usr/bin COMPONENT binaries)