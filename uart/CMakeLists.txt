project(uart)

add_library(${PROJECT_NAME}
  uart.h
  uart.c
)
target_include_directories(${PROJECT_NAME}
  PUBLIC
    .
)

