![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg).

2023 Tutor Felipe Rifo, student Lucas Irribarra, Advanced Center for Electrical and Electronic Engeneering ([AC3E](http://ac3e.usm.cl/)), Universidad Tecnica Federico Santa Maria ([USM](https://usm.cl/)), Valparaiso, Chile.

# Micro Robot FSM

## Finite State Machine (FSM)

At its core, the chip employs a Finite State Machine (FSM) that receives inputs from sensors located on the robot's front and sides, The FSM's states are tuned to facilitate forward motion, left and right rotations, and obstacle avoidance, allowing robot navigation in confined spaces.

## H-Bridge Motor Control

The output of the chip are meant to be used with an H-bridge motor driver circuit, enabling bidirectional motor control. This feature grants the robot the ability to move forward and execute precise turns.

## 8-Bit PWM Generator

 The control of motor speed is achieved through the 8-bit Pulse Width Modulation (PWM) generator. This PWM signal can be setted via eight input pins. Additionally, the PWM output pin provides a means for real-time monitoring, control, or testing of motor speed, facilitating precise adjustments during robot operation.

## User Configuration and Integration

The Micro Robot Control Chip is designed for ease of integration into robotic systems, this chip is compatible with various microcontroller platforms, making it adaptable to a wide range of robotic applications.

# What is Tiny Tapeout?

TinyTapeout is an educational project that aims to make it easier and cheaper than ever to get your digital designs manufactured on a real chip!

Go to https://tinytapeout.com for instructions!

## How to change the Wokwi project

Edit the [info.yaml](info.yaml) and change the wokwi_id to match your project.

## How to enable the GitHub actions to build the ASIC files

Please see the instructions for:

- [Enabling GitHub Actions](https://tinytapeout.com/faq/#when-i-commit-my-change-the-gds-action-isnt-running)
- [Enabling GitHub Pages](https://tinytapeout.com/faq/#my-github-action-is-failing-on-the-pages-part)

## How does it work?

When you edit the info.yaml to choose a different ID, the [GitHub Action](.github/workflows/gds.yaml) will fetch the digital netlist of your design from Wokwi.

After that, the action uses the open source ASIC tool called [OpenLane](https://www.zerotoasiccourse.com/terminology/openlane/) to build the files needed to fabricate an ASIC.

## Resources

- [FAQ](https://tinytapeout.com/faq/)
- [Digital design lessons](https://tinytapeout.com/digital_design/)
- [Learn how semiconductors work](https://tinytapeout.com/siliwiz/)
- [Join the community](https://discord.gg/rPK2nSjxy8)

## What next?

- Share your GDS on Twitter, tag it [#tinytapeout](https://twitter.com/hashtag/tinytapeout?src=hashtag_click) and [link me](https://twitter.com/matthewvenn)!
