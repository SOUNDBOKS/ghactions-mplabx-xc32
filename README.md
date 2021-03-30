# Build with MPLABX and XC32 Github Actions

This action will build a MPLAB X project.

It runs on Linux Ubuntu 18.04 and uses:

- MPLAB 5.40
- XC32 v2.50
- Harmony v2.02b

## Inputs

### `project`

**Required** The path to the projec to build (relative to the repository). For example: 'firmware.X'.

### `configuration`

The configuration of the project to build. Defaults to `default`.

## Outputs

None.

## Example usage

Add the following `.github/workflows/build.yml` file to your project:

```yaml
name: Build
on: [push]

jobs:
  build:
    name: Build project
    runs-on: ubuntu-latest
    steps:
      - name: Download source
        uses: actions/checkout@v1

      - name: Build library
        uses: SOUNDBOKS/ghactions-mplabx-xc32@master
        with:
          project: firmware.X
          configuration: default
```

## Thanks to
https://github.com/velocitek/ghactions-mplabx/blob/master/README.md
