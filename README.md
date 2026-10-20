# Parameterized Decoder in Verilog

## Overview

This project implements a parameterized \(a\)-to-\(2^a\) decoder using Verilog HDL. It demonstrates two different RTL implementation approaches and verifies their functionality using a self-checking testbench.

## Features

- Parameterized decoder supporting configurable input width.
- Enable input to control decoder operation.
- Two RTL implementations for comparison.
- Self-checking testbench with automatic expected-output verification.
- Waveform analysis using GTKWave.
- Simulation using Icarus Verilog.

## Design Implementations

### 1. Loop and Case Decoder (`Decoder_l`)

Implements the decoder using a procedural `for` loop and `case` statement.

**Concepts demonstrated:**
- Procedural loops
- `case` statements
- Combinational logic using `always @(*)`
- Parameterized RTL design

### 2. Shift-Based Decoder (`Decoder_s`)

Implements the decoder using a shift operation to activate the output bit corresponding to the input value.

**Concepts demonstrated:**
- Bitwise shift operations
- Compact combinational RTL
- Parameterized output generation

## Design Specifications

| Parameter | Description |
|---|---|
| `a` | Number of input bits |
| `in` | Input address |
| `en` | Active-high enable |
| `op` | One-hot decoded output |

For the default parameter `a = 3`:

- Number of inputs: 3
- Number of outputs: 8
- Input combinations: 8
- Output width: 8 bits

When `en = 0`, all outputs are zero. When `en = 1`, exactly one output bit is high, corresponding to the binary input value.

## Example

For `a = 3`:

| Enable | Input | Output |
|---:|---|---|
| 0 | `000` | `00000000` |
| 1 | `000` | `00000001` |
| 1 | `001` | `00000010` |
| 1 | `010` | `00000100` |
| 1 | `011` | `00001000` |
| 1 | `100` | `00010000` |
| 1 | `101` | `00100000` |
| 1 | `110` | `01000000` |
| 1 | `111` | `10000000` |

## Project Structure

```text
Decoder/
├── Decoder.v       # Decoder RTL implementations
├── Decoder_tb.v    # Self-checking testbench
├── README.md       # Project documentation
└── decoder.vcd     # Simulation waveform (optional)
```

## Verification

The testbench instantiates both decoder implementations and checks their outputs against the expected values.

### Test cases

- Decoder disabled for every input combination.
- Decoder enabled for every input combination.
- Expected-output comparison for each implementation.
- Output comparison between `Decoder_l` and `Decoder_s`.
- Error counting and final test summary.

The testbench uses case inequality (`!==`) to detect mismatches, including unknown (`X`) and high-impedance (`Z`) values.

## Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- Git and GitHub

## Running the Simulation

Compile the RTL and testbench:

```bash
iverilog -g2012 -o output Decoder.v Decoder_tb.v
```

Run the simulation:

```bash
vvp output
```

Open the waveform:

```bash
gtkwave decoder.vcd
```

A successful run should display:

```text
ALL TESTS PASSED!
```

## Learning Outcomes

- Understanding decoder architecture.
- Writing parameterized Verilog modules.
- Using loops and `case` statements in RTL.
- Implementing combinational logic with shift operators.
- Building self-checking testbenches.
- Comparing alternative RTL implementations.
- Debugging simulations using GTKWave.

## Future Improvements

- Test larger decoder configurations, such as 4-to-16.
- Add tests for unknown input values.
- Introduce intentional RTL bugs to evaluate testbench effectiveness.
- Explore synthesis results and compare hardware implementations.

---

**Project focus:** RTL design, parameterization, simulation, and design verification.
