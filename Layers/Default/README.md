# Board: STMicroelectronics [STM32H743I-EVAL](https://www.st.com/en/evaluation-tools/stm32h743i-eval.html)

## Default Board Layer

Device: **STM32H743XIH6**

System Core Clock: **400 MHz**

This setup is configured using **STM32CubeMX**, an interactive tool provided by STMicroelectronics for device configuration.
Refer to ["Configure STM32 Devices with CubeMX"](https://github.com/Open-CMSIS-Pack/cmsis-toolbox/blob/main/docs/CubeMX.md) for additional information.

### System Configuration

| System resource       | Setting
|:----------------------|:--------------------------------------
| Heap                  | 64 kB (configured in the STM32CubeMX)
| Stack (MSP)           |  1 kB (configured in the STM32CubeMX)

### STDIO mapping

**STDIO** is routed to Virtual COM port on the ST-LINK (using **USART1** peripheral)

### CMSIS-Driver mapping

| CMSIS-Driver          | Peripheral            | Board connector/component                     | Connection
|:----------------------|:----------------------|:----------------------------------------------|:------------------------------
| Driver_ETH_MAC0       | ETH                   | Ethernet RJ45 connector (CN1)                 | CMSIS_ETH
| Driver_ETH_PHY0       | LAN8742A (external)   | Ethernet RJ45 connector (CN1)                 | CMSIS_ETH
| Driver_MCI1           | SDMMC1                | MicroSD card slot (CN13)                      | CMSIS_MCI
| Driver_USART1         | USART1                | ST-LINK connector (CN23)                      | STDIN, STDOUT, STDERR
| Driver_USBD0          | USB_OTG_FS            | USB OTG1 FS connector (CN18)                  | CMSIS_USB_Device
| Driver_USBH1          | USB_OTG_HS            | USB OTG2 HS connector (CN14)                  | CMSIS_USB_Host
| CMSIS-Driver VIO      | GPIO                  | LEDs (LD3, LD1) and Tamper button (B3)        | CMSIS_VIO

### CMSIS-Driver Virtual I/O mapping

| CMSIS-Driver VIO      | Board component
|:----------------------|:--------------------------------------
| vioBUTTON0            | Tamper button (B3)
| vioLED0               | LED red       (LD3)
| vioLED1               | LED green     (LD1)
