#!/bin/bash

# Use this layer to add nodes and models

# Packages are installed after nodes so we can fix them...
PYTHON_PACKAGES=(
    "opencv-python==4.7.0.72"
    "numpy==1.26.4"
    "rembg[gpu]==2.0.57"
    "pillow==9.5.0"
    "torch==2.3.0"
)

NODES=(
    "https://github.com/ltdrdata/ComfyUI-Manager"
    ## LAMA OBJECT REMOVAL
    # "https://github.com/sipherxyz/comfyui-art-venture"
    ## REMBG (Image background remover)
    "https://github.com/Jcd1230/rembg-comfyui-node"
    ## IP Adapter Plus Custom Node
    # "https://github.com/cubiq/ComfyUI_IPAdapter_plus"
    ## BASE64 Image loader
    "https://github.com/Acly/comfyui-tooling-nodes"
    ## MIXLAB
    # "https://github.com/shadowcz007/comfyui-mixlab-nodes"
    ## WAS NODE ???
    # "https://github.com/WASasquatch/was-node-suite-comfyui"
    ## CONTROLNET ++
    # "https://github.com/Fannovel16/comfyui_controlnet_aux"
    ## IMPACT PACK ++
    # "https://github.com/ltdrdata/ComfyUI-Impact-Pack"
    ## Advanced Controlnet ++
    # "https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet"
    ## Easy Comfy Nodes for fetching from URL
    # "https://github.com/wmatson/easy-comfy-nodes"
    ## Comfy Essentials
    # "https://github.com/cubiq/ComfyUI_essentials"
)

CHECKPOINT_MODELS=(
    # JUGGERNAUT SDXL (Needs to get refreshed on every single deploy because of its being S3 presigned url) CIVIT AI URL: https://civitai.com/api/download/models/471120
    "https://civitai-delivery-worker-prod.5ac0637cfd0766c97916cefa3764fbdf.r2.cloudflarestorage.com/model/764940/juggernautX.lIDA.safetensors?X-Amz-Expires=86400&response-content-disposition=attachment%3B%20filename%3D%22Juggernaut_X_RunDiffusion_Hyper.safetensors%22&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=e01358d793ad6966166af8b3064953ad/20240617/us-east-1/s3/aws4_request&X-Amz-Date=20240617T204845Z&X-Amz-SignedHeaders=host&X-Amz-Signature=0472fecae0af1a99754e238f3137769607c33431cc92e83452c820bae716b113 Juggernaut_X_RunDiffusion_Hyper.safetensors"
)

LORA_MODELS=(
    #"https://civitai.com/api/download/models/16576"
)

VAE_MODELS=(
    #"https://huggingface.co/stabilityai/sd-vae-ft-ema-original/resolve/main/vae-ft-ema-560000-ema-pruned.safetensors"
    #"https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors"
    #"https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors"
)

ESRGAN_MODELS=(
    #"https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x4.pth"
    #"https://huggingface.co/FacehugmanIII/4x_foolhardy_Remacri/resolve/main/4x_foolhardy_Remacri.pth"
    #"https://huggingface.co/Akumetsu971/SD_Anime_Futuristic_Armor/resolve/main/4x_NMKD-Siax_200k.pth"
)

CONTROLNET_MODELS=(
    ## DEPTH CONTROLNET
    "https://huggingface.co/stabilityai/control-lora/resolve/main/control-LoRAs-rank256/control-lora-depth-rank256.safetensors control-lora-depth-rank256.safetensors"
)

UPSCALE_MODELS=(
    ## Siam
    "https://civitai.com/api/download/models/156841 4xNMKDSuperscale_4xNMKDSuperscale.pt"
)

CLIP_VISION=(
    ## IP ADAPTER CLIP VISION
    "https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors clip-vision-1.safetensors"
)

IP_ADAPTER=(
    ## IP ADAPTER
    "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus_sdxl_vit-h.safetensors ip-adapter-plus_sdxl_vit-h.safetensors"
)

INPAINT=(
    ## inpainter
    "https://huggingface.co/lllyasviel/fooocus_inpaint"
)

MIDAS_ANNOTATOR=(
    ## Midas depth estimator to get installed into a custom node
    "https://huggingface.co/lllyasviel/ControlNet/resolve/main/annotator/ckpts/dpt_hybrid-midas-501f0c75.pt dpt_hybrid-midas-501f0c75.pt"
)

BIG_LAMA=(
    ## Big Lama for object removal
    "https://huggingface.co/spaces/aryadytm/remove-photo-object/resolve/f00f2d12ada635f5f30f18ed74200ea89dd26631/assets/big-lama.pt big-lama.pt"
)

### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function build_extra_start() {
    build_extra_get_nodes
    build_extra_install_python_packages
    # build_extra_get_models \
    #     "/opt/storage/stable_diffusion/models/ckpt" \
    #     "${CHECKPOINT_MODELS[@]}"
    # build_extra_get_models \
    #     "/opt/storage/stable_diffusion/models/lora" \
    #     "${LORA_MODELS[@]}"
    # build_extra_get_models \
    #     "/opt/storage/stable_diffusion/models/controlnet" \
    #     "${CONTROLNET_MODELS[@]}"
    # build_extra_get_models \
    #     "/opt/storage/stable_diffusion/models/vae" \
    #     "${VAE_MODELS[@]}"
    # build_extra_get_models \
    #     "/opt/storage/stable_diffusion/models/esrgan" \
    #     "${ESRGAN_MODELS[@]}"
    build_extra_get_models \
        "/opt/storage/stable_diffusion/models/upscale_models" \
        "${UPSCALE_MODELS[@]}"
    # build_extra_get_models \
    #     "/opt/storage/stable_diffusion/models/clip_vision" \
    #     "${CLIP_VISION[@]}"
    # build_extra_get_models \
    #     "/opt/storage/stable_diffusion/models/ipadapter" \
    #     "${IP_ADAPTER[@]}"

    # build_extra_get_models \
    #     "/opt/storage/stable_diffusion/models/lama" \
    #     "${BIG_LAMA[@]}"

    # download_extra_custom_node_models \
    #     "/opt/storage/stable_diffusion/models/inpaint" \
    #     "${INPAINT[@]}"

    # build_extra_get_models \
    #     "/opt/ComfyUI/custom_nodes/comfyui_controlnet_aux/ckpts/lllyasviel/Annotators" \
    #     "${MIDAS_ANNOTATOR[@]}"

    cd /opt/ComfyUI && \
    micromamba run -n comfyui -e LD_PRELOAD=libtcmalloc.so python main.py \
        --cpu \
        --listen 127.0.0.1 \
        --port 11404 \
        --disable-auto-launch \
        --quick-test-for-ci
}

function build_extra_get_nodes() {
    for repo in "${NODES[@]}"; do
        dir="${repo##*/}"
        path="/opt/ComfyUI/custom_nodes/${dir}"
        requirements="${path}/requirements.txt"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating node: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                    micromamba -n comfyui run ${PIP_INSTALL} -r "$requirements"
                fi
            fi
        else
            printf "Downloading node: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                micromamba -n comfyui run ${PIP_INSTALL} -r "${requirements}"
            fi
        fi
    done
}

function download_extra_custom_node_models() {
    if [[ -n $2 ]]; then
        dir="$1"
        mkdir -p "$dir"
        shift
        arr=("$@")
        
        printf "Downloading %s extra custom node repositories(s) to %s...\n" "${#arr[@]}" "$dir"
        for repo in "${arr[@]}"; do
            git clone "${repo}" "${dir}" --recursive
        done
    fi
}

function build_extra_install_python_packages() {
    if [ ${#PYTHON_PACKAGES[@]} -gt 0 ]; then
        micromamba -n comfyui run ${PIP_INSTALL} ${PYTHON_PACKAGES[*]}
    fi
}

function build_extra_get_models() {
    if [[ -n $2 ]]; then
        dir="$1"
        mkdir -p "$dir"
        shift
        arr=("$@")
        
        printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
       for item in "${arr[@]}"; do
            # split by ' ', first is link second is custom name
            IFS=' ' read -ra split <<< "${item}"
            link="${split[0]}"
            custom_name="${split[1]}"
            build_extra_download "${link}" "${dir}" "${custom_name}"

        done
    fi
}

# Download from $1 URL to $2 file path
function build_extra_download() {
    url="$1"
    path="$2"
    custom_name="$3"
    wget -qnc --content-disposition --show-progress "${url}" -O "${path}/${custom_name}" 
}

# umask 002

build_extra_start