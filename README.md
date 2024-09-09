# Drive-ml

A kedro pipeline that aspires to help make running ml models on self-driving car
simulators a little faster (and easier of course)!
## Overview

This is a new Kedro project with Kedro-Viz setup, which was generated using `kedro 0.19.8`.

This repo will preprocess any CARLA simulation data and practice code from the []() coursera website.

Pick up from [Carla Core Concepts](https://carla.readthedocs.io/en/latest/core_concepts/)

Finally, I plan on putting a lot of this on mkdocs for others to learn from, but the installation and system setup will remain here until this is done. 

## Rules and guidelines

In order to get the best out of the template:

* Don't remove any lines from the `.gitignore` file we provide
* Make sure your results can be reproduced by following a [data engineering convention](https://docs.kedro.org/en/stable/faq/faq.html#what-is-data-engineering-convention)
* Don't commit data to your repository
* Don't commit any credentials or your local configuration to your repository. Keep all your credentials and local configuration in `conf/local/`

## System Setup
 This took a little while to get right with AMD gpu and cpu setup with the Carla simulator, rocm (pytorch gpu support) and other items to get this repo up and running. This really only applies if you have an AMD GPU with Ubuntu 24.04, so feel free to skip to another section if you're rocking an Nvidia GPU (but make sure to setup the proper pytorch gpu to run the kedro driveml pipeline)

 1. ___ROCM Installation:___
    Follow the install the amdgpu-dkms and rocm packages per the [installation instructions](https://rocm.docs.amd.com/projects/install-on-linux/en/latest/install/native-install/ubuntu.html) 

    ***IMPORTANT: At the time of writing this (09/09/2024) when you install the above with Ubuntu 24.04 this will break your desktop! TAKE A PICTURE OF THE COMMAND BELOW ON REBOOT hit `ctrl + alt + F2 (or F3), login to the terminal and type in the following commands:***

    sudo apt-get install libssl-dev libffi-dev

    ```sh
    # Remove the full amdgpu-dkms that breaks ubuntu desktop
    sudo apt remove amdgpu-dkms; 
    
    sudo apt install amdgpu-dkms-firmware amdgpu-dkms-headers libdrm-amdgpu-dev libdrm-amdgpu-dev amdgpu-lib autoconf automake initramfs-tools shim-
    signed;
    
    # update the kernel
    sudo update-initramfs -u

    # reboot
    sudo reboot now
    ```

    > ***NOTE***: The first (and had the most issue with) is installing rocm without amdgpu-dkms. If I installed amdgpu-dkms on Ubuntu 24.04 it would break the desktop due to an alignment issue with a mesa driver, but if I tried to install **only** the rocm package, it would sneak in some amdgpu drivers from a different version than the ones installed. Long story short do the following
2. ***Carla Simulator Install:***
   - Install some additional system packages: `sudo apt install libboost-python-dev aria2c -y`
   - Install all the system packages from [the carla 0.9.15 docs](https://carla.readthedocs.io/en/latest/build_linux/) (follow the Ubuntu 24.04)
   - install aria2 and other items *make sure to install *everything* in the software requirements
   - Now when it comes to building Carla, I would just use apt to install 
3.  ___Other System Packages___:  
    A finishing touch, if you use pygame (for example in later sections ` client_bounding_boxes.py` you might get an error) 
    
    Put the non-empty results in your `find / -name libstdc++.so.6 2>/dev/null` ~/.zshrc or ~/.bashrc depending on which one you use

    `export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6`
    > Note:

    `export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6' >> ~/.bashrc` (or ~/.zshrc if you use zsh) in order to use and get pygame working


## How to install dependencies

Using [micromamba]() I have an alias in my ~/.zshrc script as follows `alias mamba='micromamba '` (you don't have to do this, but you'll need to do a find and replace `mamba` with `micromamba` in the install files to get it to know where mamba/micromamba live)

Finally, to install, run:

```
zsh -i install.sh
```

If you use bash, you might need to change the `install.sh` and `uninstall.sh` first line to #!/bin/bash since some items referenced live in your rc file (~/.zshrc or ~/.bashrc)

## How to run your Kedro pipeline

You can run your Kedro project with:

```
kedro run
```

## How to test your Kedro project

Have a look at the files `src/tests/test_run.py` and `src/tests/pipelines/data_science/test_pipeline.py` for instructions on how to write your tests. Run the tests as follows:

```
pytest
```

To configure the coverage threshold, look at the `.coveragerc` file.

## Project dependencies

To see and update the dependency requirements for your project use `requirements.txt`. Install the project requirements with `pip install -r requirements.txt`.

[Further information about project dependencies](https://docs.kedro.org/en/stable/kedro_project_setup/dependencies.html#project-specific-dependencies)

## How to work with Kedro and notebooks

> Note: Using `kedro jupyter` or `kedro ipython` to run your notebook provides these variables in scope: `catalog`, `context`, `pipelines` and `session`.
>
> Jupyter, JupyterLab, and IPython are already included in the project requirements by default, so once you have run `pip install -r requirements.txt` you will not need to take any extra steps before you use them.

### Jupyter
To use Jupyter notebooks in your Kedro project, you need to install Jupyter:

```
pip install jupyter
```

After installing Jupyter, you can start a local notebook server:

```
kedro jupyter notebook
```

### JupyterLab
To use JupyterLab, you need to install it:

```
pip install jupyterlab
```

You can also start JupyterLab:

```
kedro jupyter lab
```

### IPython
And if you want to run an IPython session:

```
kedro ipython
```

### How to ignore notebook output cells in `git`
To automatically strip out all output cell contents before committing to `git`, you can use tools like [`nbstripout`](https://github.com/kynan/nbstripout). For example, you can add a hook in `.git/config` with `nbstripout --install`. This will run `nbstripout` before anything is committed to `git`.

> *Note:* Your output cells will be retained locally.

[Further information about using notebooks for experiments within Kedro projects](https://docs.kedro.org/en/develop/notebooks_and_ipython/kedro_and_notebooks.html).
## Package your Kedro project

[Further information about building project documentation and packaging your project](https://docs.kedro.org/en/stable/tutorial/package_a_project.html).
