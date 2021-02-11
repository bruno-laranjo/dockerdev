#include "logger.h"
#include "sensor.h"

int Sensor_ReadTemperatureC(uart_t* uart)
{
    int temp = 0;
    uart_Read(uart, &temp, sizeof(temp));
    Log("T Read");
    return temp;
}

