ExternalProject_Add(libdecor
    GIT_REPOSITORY https://gitlab.gnome.org/jadahl/libdecoration.git
    GIT_TAG master
    PREFIX "${CMAKE_CURRENT_BINARY_DIR}/extern/libdecor"
    CONFIGURE_COMMAND meson --prefix "${CMAKE_CURRENT_BINARY_DIR}/install" --libdir "lib" ../libdecor
    BUILD_COMMAND ninja
    INSTALL_COMMAND ninja install
)

target_include_directories(glfw PRIVATE "${CMAKE_CURRENT_BINARY_DIR}/install/include/libdecor-0.1")
target_link_libraries(glfw PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/install/lib/libdecor-0.1${CMAKE_SHARED_LIBRARY_SUFFIX})

add_dependencies(glfw libdecor)
