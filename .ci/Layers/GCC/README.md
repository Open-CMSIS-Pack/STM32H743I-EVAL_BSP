Board: STMicroelectronics [STM32H743I-EVAL](https://www.st.com/en/evaluation-tools/stm32h743i-eval.html)
------------------------------------------

Device: **STM32H743XIH6**
System Core Clock: **400 MHz**

This setup is configured using **STM32CubeMX**, an interactive tool provided by STMicroelectronics for device configuration.
Refer to ["Configure STM32 Devices with CubeMX"](https://github.com/Open-CMSIS-Pack/cmsis-toolbox/blob/main/docs/CubeMX.md) for additional information.

### System Configuration

| System resource   | Setting
|:------------------|:--------------------------------------
| Heap              | 1 kB (configured in the STM32CubeMX)
| Stack (MSP)       | 1 kB (configured in the STM32CubeMX)

### STDIO mapping

**STDIO** is routed to Virtual COM port on the ST-Link (using **USART1** peripheral)

### CMSIS-Driver mapping

| CMSIS-Driver      | Peripheral
|:------------------|:--------------------------------------
| Driver_ETH_MAC0   | ETH
| Driver_ETH_PHY0   | LAN8742A (external)
| Driver_GPIO0      | GPIO0
| Driver_MCI1       | SDMMC1
| Driver_USBD0      | USB_OTG_FS
| Driver_USBH1      | USB_OTG_HS

### CMSIS-Driver Virtual I/O mapping

| CMSIS-Driver VIO  | Physical resource
|:------------------|:--------------------------------------
| vioBUTTON0        | Button USER (PC13)
| vioLED0           | LED3 RED    (PA4)
| vioLED1           | LED1 GREEN  (PF10)

## Board configuration
**Board setup**
  - Insure that the **JP10** is in the **PSU** position and connect 5V power supply to the **CN10** connector
  - Check that the Boot selection switch **SW1** is in the **0** / default position
  - Connect a **USB micro-B cable** between the **STLK** connector and your **Personal Computer**
