#!/bin/false

build_nvidia_main() {
    build_nvidia_install_comfyui
}

build_nvidia_install_comfyui() {
    micromamba run -n comfyui ${PIP_INSTALL} \
        nvidia-ml-py3
    
    micromamba install -n comfyui -c xformers -y \
        xformers \
        pytorch=${PYTORCH_VERSION} \
        pytorch-cuda="$(cut -d '.' -f 1,2 <<< "${CUDA_VERSION}")"

    # build_common_install_comfyui
    /opt/ai-dock/bin/update-comfyui.sh
}

build_nvidia_main "$@"