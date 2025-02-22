# 8x8 Wallace Tree Multiplier

## Overview
This project implements an 8x8 Wallace Tree Multiplier using structural HDL modeling. The Wallace Tree architecture reduces the delay in multiplication by optimizing partial product reduction stages.

![Architecture Using Regular Modules with Optimum Hardware Utilisation](Architecture%20using%20regular%20modules%20with%20optimum%20hardware.png)
-Blue -> 4-2 Compressor (17)
-Yellow -> Full Adder (7)
-Green -> Half Adder (7)

## Features
- Modular design using 4-2 compressors, full adders, and half adders.
- Structural HDL implementation for efficient hardware utilization.
- Power, timing, and hardware utilization reports included.

## Project Contents
- **HDL Code**:
  - Verilog Code: Top-level module.
  - Supporting modules (`CMP`, `FA`, `HA`).
- **Simulation Files**: Testbench and waveform outputs for functional verification.
- **Reports**: Power, timing, and utilization analysis.
- **Elaborated Design**: Visualization of the design architecture.

## Results
- **Power Consumption**: Refer to the Power Report Image.
- **Timing Analysis**: Refer to the Timing Report Image.
- **Hardware Utilization**: Details included in the utilization report.

## Usage
1. Use any Verilog simulator (e.g., ModelSim, Vivado) to simulate the design.
2. Run the provided testbench to verify the multiplier functionality.
3. Analyze the simulation waveforms for verification.
