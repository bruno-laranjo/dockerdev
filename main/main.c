#include <stdio.h>
#include "sensor.h"

int main(void)
{
    uart_t uart;
    uart_Init(&uart);
    int t = Sensor_ReadTemperatureC(&uart);
    printf("Temperature: %d C\n", t);
    return 0;
}

