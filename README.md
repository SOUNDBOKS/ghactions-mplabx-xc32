# Build with MPLABX and XC32 Github Actions

This action will build a MPLAB X project.

It runs Ubuntu 18.04 and installs the following:

- MPLAB 5.40
- XC32 v2.50
- Harmony v2.02b
- Ruby (latest) + bundler

## Inputs

### `project`

**Required** The path to the projec to build (relative to the repository). For example: 'firmware.X'.

### `configuration`

The configuration of the project to build. Defaults to `default`.

### `harmonyAppsFolder`

Harmony apps folder if you want to build inside apps for references

### `ceedling`

If you have Ceedling at the root level and you want to run tests

## Outputs

GH Outputs: None.
The finished built files are moved to /github/workspace/output, so they can be used in later steps in the same run.

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
          harmonyAppsFolder: some-firmware/firmware
          ceedling: true
```

## Thanks to
https://github.com/velocitek/ghactions-mplabx/blob/master/README.md
