#!/bin/zsh
# rip out any old installs
zsh -i uninstall.sh || echo "Could not uninstall any old drive enviornments"
# use mamba because it's great (fall back to conda)
mamba env create -f driveml.yml -y || conda env create -f driveml.yml -y

mamba activate driveml && \
  # install uv and the rest of the packages
  python -m pip install uv && \
  # install the proper versions of setup needed for carla python-api
  uv pip install --user setuptools &&

  uv pip install setuptools wheel distro auditwheel && \ 
  
  # torch wth the rocm repo (rocm6.1)
  uv pip install torch torchvision --index-url https://download.pytorch.org/whl/rocm6.1 && \
  
  # install packages (long and complicated list between carla api and kedro
  uv pip install -r requirements.txt && \
  
  # reinstall the exact version compiled with the API (API mismatch between apt and self-compiled will
  # throw errors)
  uv pip install --force-reinstall ../carla/PythonAPI/carla/dist/carla-0.9.15-cp310-cp310-linux_x86_64.whl
  # install jupyter kernel
  python -m ipykernel install --user --name driveml --display-name "Python (driveml)" 
  
echo  "To use the environment, simply call: source activate driveml"