#include <stdlib.h>
#include <time.h>
#include "uart.h"

void uart_Init(uart_t* self)
{
  srand(time(NULL));
  *self = rand();
}

void uart_Read(uart_t* self, void* out, size_t size)
{
  unsigned char* buffer = (unsigned char*)out;
  for (size_t i = 0; i < size; ++i)
  {
    buffer[i] = rand();
  }
}

