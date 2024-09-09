#!/bin/zsh
mamba env remove -y --name drivml || conda env remove --name driveml
yes | jupyter kernelspec uninstall driveml