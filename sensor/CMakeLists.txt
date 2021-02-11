project(sensor)
add_library(${PROJECT_NAME}
  sensor.c
  sensor.h
)
target_include_directories(${PROJECT_NAME}
  PUBLIC
    .
)
target_link_libraries(${PROJECT_NAME}
  PUBLIC
    uart
  PRIVATE
    logger
)

