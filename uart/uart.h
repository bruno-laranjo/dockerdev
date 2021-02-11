#include <stddef.h>

typedef int uart_t;

void uart_Init(uart_t* self);
void uart_Read(uart_t* self, void* out, size_t size);

