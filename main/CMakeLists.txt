project(main)
add_executable(${PROJECT_NAME}
  main.c
)
target_link_libraries(${PROJECT_NAME}
  PRIVATE
    sensor
)

add_custom_target(run_${PROJECT_NAME}
    COMMAND ./main
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/bin
    DEPENDS ${PROJECT_NAME})