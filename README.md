[![Version](https://img.shields.io/github/v/release/Open-CMSIS-Pack/STM32H743I-EVAL_BSP)](https://github.com/Open-CMSIS-Pack/STM32H743I-EVAL_BSP/releases/latest)

# STM32H743I-EVAL_BSP-CI

This is the development repository for the **STMicroelectronics STM32H743I-EVAL Board Support Pack (BSP)** - a CMSIS software pack that is designed to work with all compiler toolchains (Arm Compiler and GCC,). It is released as [CMSIS software pack](https://www.keil.arm.com/packs/stm32h743i-eval_bsp-keil) and therefore accessible by CMSIS-Pack enabled software development tools.

This BSP uses the generator integration of the [CMSIS-Toolbox to Configure STM32 Devices with CubeMX](https://github.com/Open-CMSIS-Pack/cmsis-toolbox/blob/main/docs/CubeMX.md) that is also supported in µVision 5.40 an higher.

> **Note:** This is currently Work in Progress. Final release is expected in Q3'2024.

## Repository top-level structure

Directory                   | Description
:---------------------------|:--------------
[.github/workflows](https://github.com/Open-CMSIS-Pack/STM32H743I-EVAL_BSP/tree/main/.github/workflows)  | [GitHub Actions](#github-actions).
[.ci](https://github.com/Evagan2018/STM32H743I-EVAL_BSP/tree/main/.ci) | Contains the `Examples` and `MW-RefApps` directory skeletons used for building the examples.
[CMSIS/Driver](https://github.com/Open-CMSIS-Pack/STM32H743I-EVAL_BSP/tree/main/CMSIS/Driver)            | Contains a [CMSIS-Driver VIO](https://arm-software.github.io/CMSIS_6/latest/Driver/group__vio__interface__gr.html) that is configured for the board peripherals.
[Documents](https://github.com/Open-CMSIS-Pack/STM32H743I-EVAL_BSP/tree/main/Documents)                  | Information about the board provided by STMicroelectronics.
[Examples/Blinky](https://github.com/Open-CMSIS-Pack/STM32H743I-EVAL_BSP/tree/main/Examples/Blinky)      | Blinky example in *csolution project format* using [CMSIS-Driver VIO](https://arm-software.github.io/CMSIS_6/latest/Driver/group__vio__interface__gr.html) and [CMSIS-Compiler](https://arm-software.github.io/CMSIS-Compiler/main/index.html) for printf I/O retargeting.
[Images](https://github.com/Open-CMSIS-Pack/STM32H743I-EVAL_BSP/tree/main/Images)                        | [Pictures](https://github.com/Open-CMSIS-Pack/STM32H743I-EVAL_BSP/blob/main/Images/stm32h743i-eval_large.png) of the board.
[Layers](https://github.com/Open-CMSIS-Pack/STM32H743I-EVAL_BSP/tree/main/Layers)                        | Board layers for using the board with [CMSIS-Toolbox - Reference Applications](https://github.com/Open-CMSIS-Pack/cmsis-toolbox/blob/main/docs/ReferenceApplications.md).


## .ci structure

File / Directory            | Description
:---------------------------|:--------------
[`vcpkg-configuration.json`](https://github.com/Evagan2018/STM32H743I-EVAL_BSP/tree/main/.ci/MW-RefApps/vcpkg-configuration.json) | Tool configuration setup for `Middleware` and `BSP` examples.
[MW-RefApps/Examples](https://github.com/Evagan2018/STM32H743I-EVAL_BSP/tree/main/.ci/MW-RefApps/Examples) | Top-Level directory where the Middleware examples for  `FileSystem`, `Network`, `USB\Device`, and `USB\Host` will be copied for testing.
[Examples](https://github.com/Evagan2018/STM32H743I-EVAL_BSP/tree/main/.ci/Examples) | Top-Level director where `BSP` examples will be copied for testing.
[MW-RefApps/Examples/Network/Network-CI.csolution.yml](https://github.com/Evagan2018/STM32H743I-EVAL_BSP/blob/main/.ci/MW-RefApps/Examples/Network/Network-CI.csolution.yml) | Solution with `Board-Layer` support for `Network` projects.
[MW-RefApps/Examples/FileSystem/FileSystem-CI.csolution.yml](https://github.com/Evagan2018/STM32H743I-EVAL_BSP/blob/main/.ci/MW-RefApps/Examples/FileSystem/FileSystem-CI.csolution.yml) | Solution with `Board-Layer` support for `FileSystem` projects.
[MW-RefApps/Examples/USB/Device/.ci/MW-RefApps/Examples/USB/Device/USB_Device-CI.csolution.yml](https://github.com/Evagan2018/STM32H743I-EVAL_BSP/blob/main/.ci/MW-RefApps/Examples/USB/Device/USB_Device-CI.csolution.yml) | Solution with `Board-Layer` support for `USB_Device` projects.
[MW-RefApps/Examples/USB/Device/.ci/MW-RefApps/Examples/USB/Device/USB_Host-CI.csolution.yml](https://github.com/Evagan2018/STM32H743I-EVAL_BSP/blob/main/.ci/MW-RefApps/Examples/USB/Host/USB_Host-CI.csolution.yml) | Solution with `Board-Layer` support for `USB_Host` projects.


## Usage

This BSP requires the [Device Family Pack (DFP) for the STM32H7 series](https://github.com/Open-CMSIS-Pack/STM32H7xx_DFP) as well as the [CMSIS-Driver Interface to STM32 HAL](https://github.com/Open-CMSIS-Pack/CMSIS-Driver_STM32)

- [Examples/Blinky](https://github.com/Open-CMSIS-Pack/STM32H743I-EVAL_BSP/tree/main/Examples/Blinky) shows the usage in a [*csolution project*](https://github.com/Open-CMSIS-Pack/STM32H743I-EVAL_BSP/blob/main/Examples/Blinky/Blinky.csolution.yml).
  
- [Board Layers](https://github.com/Open-CMSIS-Pack/STM32H743I-EVAL_BSP/tree/main/Layers) are designed for [Reference Applications](https://github.com/Open-CMSIS-Pack/cmsis-toolbox/blob/main/docs/ReferenceApplications.md) and allow to run various device-agnostic examples on this board.

The device is configured for this board using [STM32CubeMX](https://www.st.com/en/development-tools/stm32cubemx.html). For additional information refer to:

- [CMSIS-Toolbox - Configure STM32 Devices with CubeMX](https://github.com/Open-CMSIS-Pack/cmsis-toolbox/blob/main/docs/CubeMX.md) for usage information of STM32CubeMX with CMSIS projects.

## Using the development repository

This development repository can be used in a local directory and [mapped as software pack](https://github.com/Open-CMSIS-Pack/cmsis-toolbox/blob/main/docs/build-tools.md#install-a-repository) using for example `cpackget` with:

    cpackget add <path>/Keil.STM32H743I-EVAL_BSP.pdsc

## Generate software pack

The software pack is generated using bash shell scripts.

- `./gen_pack.sh` based on [Open-CMSIS-Pack/gen-pack](https://github.com/Open-CMSIS-Pack/gen-pack)
generates the software pack. Run this script locally with:

      STM32H743I-EVAL_BSP $ ./gen_pack.sh

### GitHub Actions

The repository uses GitHub Actions to generate the pack and build examples:

- `.github/workflows/pack.yml` based on [Open-CMSIS-Pack/gen-pack-action](https://github.com/Open-CMSIS-Pack/gen-pack-action) generates pack using the [Generate software pack](#generate-software-pack) scripts.
- `.github/workflows/Test-Examples.yml` builds the `BSP` examples.
- `.github/workflows/Test-RefExamples.yml` builds the `Middleware` examples, which are board and device agnostic, by using the `Board-Layer` for adaptation.

The `Test-Examples.yml` and `Test-RefExamples.yml` actions are executed periodically one a week. They will be also executed after pushing or pulling the repository. These actions performs a build operation by using the `AC6` and the `GCC` compiler.


## License

The BSP is licensed under [![License](https://img.shields.io/github/license/Open-CMSIS-Pack/STM32H743I-EVAL_BSP?label)](https://github.com/Open-CMSIS-Pack/STM32H743I-EVAL_BSP/blob/main/LICENSE).

## Issues

Please feel free to raise an [issue on GitHub](https://github.com/Open-CMSIS-Pack/STM32H743I-EVAL_BSP/issues)
to report misbehavior (i.e. bugs) or start discussions about enhancements. This
is your best way to interact directly with the maintenance team and the community.
We encourage you to append implementation suggestions as this helps to decrease the
workload of the maintenance team.

