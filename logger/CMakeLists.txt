project(logger)

add_library(${PROJECT_NAME}
  logger.c
  logger.h
)
target_include_directories(${PROJECT_NAME}
  PUBLIC
    .
)

