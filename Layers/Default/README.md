Board: STMicroelectronics [STM32H743I-EVAL](https://www.st.com/en/evaluation-tools/stm32h743i-eval.html)
------------------------------------------

Device: **STM32H743XIH6**
System Core Clock: **400 MHz**

This setup is configured using **STM32CubeMX**, an interactive tool provided by STMicroelectronics for device configuration.
Refer to ["Configure STM32 Devices with CubeMX"](https://github.com/Open-CMSIS-Pack/cmsis-toolbox/blob/main/docs/CubeMX.md) for additional information.

### System Configuration

| System resource       | Setting
|:----------------------|:----------------------------------------------
| Heap                  | 1 kB (configured in the STM32CubeMX)
| Stack (MSP)           | 1 kB (configured in the STM32CubeMX)

### STDIO mapping

**STDIO** is routed to Virtual COM port on the ST-Link (using **USART1** peripheral)

### CMSIS-Driver mapping

| CMSIS-Driver          | Peripheral
|:----------------------|:----------------------------------------------
| Driver_ETH_MAC0       | ETH
| Driver_ETH_PHY0       | LAN8742A (external)
| Driver_GPIO0          | GPIO
| Driver_MCI1           | SDMMC1
| Driver_USBD0          | USB_OTG_FS
| Driver_USBH1          | USB_OTG_HS

### CMSIS-Driver Virtual I/O mapping

| CMSIS-Driver VIO      | Physical resource
|:----------------------|:----------------------------------------------
| vioBUTTON0            | Tamper & Key Button (PC13)
| vioLED0               | LD3 Red             (PA4)
| vioLED1               | LD1 Green           (PF10)
