# Overview

The STM32H743I-EVAL and STM32H753I-EVAL Evaluation boards (STM32H7x3I-EVAL) are high-end development platforms for the Arm® Cortex®-M7-based STM32H743XI and STM32H753XI microcontrollers, respectively. The STM32H7x3I-EVAL Evaluation boards provide access to all the STM32 peripherals for user applications, and include an embedded ST-LINK debugger/programmer.

The full range of the STM32H7x3I-EVAL hardware features helps develop applications and evaluate all peripherals: USB OTG_HS and FS, Ethernet, FD-CAN, USART, Audio DAC and ADC, digital microphone, SRAM, SDRAM, NOR Flash memory, Twin Quad-SPI Flash memory, microSD™ 3.0 card, 5.7” 640×480 TFT color LCD with touchscreen, and cryptographic hardware accelerator (available only on STM32H753XI devices).

The expansion connectors provide an easy way to add specialized features, while ETM trace is supported through external probes.

# Getting started

- [User manual](https://www.st.com/resource/en/user_manual/um2198-evaluation-boards-with-stm32h743xi-and-stm32h753xi-mcus-stmicroelectronics.pdf)

## ST-LINK driver installation and firmware upgrade

1. Download the latest [ST-LINK driver](https://www.st.com/en/development-tools/stsw-link009.html).
2. Extract the archive and run `dpinst_amd64.exe`. Follow the displayed instructions.
3. Download the latest [ST-LINK firmware upgrade](https://www.st.com/en/development-tools/stsw-link007.html).
4. Extract the archive and run the STLinkUpgrade.exe program.
5. Connect the board to your PC using a USB cable and wait until the USB enumeration is completed.
6. In the **ST-Link Upgrade** program, press the **Device Connect** button.
7. When the ST-LINK driver is correctly installed, the current ST-LINK version is displayed.
8. Press the **Yes >>>>** button to start the firmware upgrade process.

# Technical reference

- [STM32H743XI microcontroller](https://www.st.com/en/microcontrollers-microprocessors/stm32h743xi.html)
- [STM32H743I board](https://www.st.com/en/evaluation-tools/stm32h743i-eval.html)
- [User manual](https://www.st.com/resource/en/user_manual/um2198-evaluation-boards-with-stm32h743xi-and-stm32h753xi-mcus-stmicroelectronics.pdf)
- [Data brief](https://www.st.com/resource/en/data_brief/stm32h743i-eval.pdf)
- [Schematic](https://www.st.com/resource/en/schematic_pack/mb1246-b0x_schematic.pdf)
