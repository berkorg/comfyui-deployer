#!/bin/bash

# This file will be sourced in init.sh

# https://raw.githubusercontent.com/ai-dock/comfyui/main/config/provisioning/default.sh

# Packages are installed after nodes so we can fix them...

PYTHON_PACKAGES=(
    #"opencv-python==4.7.0.72"
)

NODES=(
    "https://github.com/ltdrdata/ComfyUI-Manager"
    # TILE UPSCALER
    "https://github.com/ssitu/ComfyUI_UltimateSDUpscale"
    ## LAMA OBJECT REMOVAL
    "https://github.com/sipherxyz/comfyui-art-venture"
    ## REMBG (Image background remover)
    "https://github.com/berkelmas/rembg-comfyui-node"
    ## IP Adapter Plus Custom Node
    "https://github.com/cubiq/ComfyUI_IPAdapter_plus"
    ## TILE UPSCALER
    "https://github.com/ssitu/ComfyUI_UltimateSDUpscale"
    ## BASE64 Image loader
    "https://github.com/Acly/comfyui-tooling-nodes"
    ## MIXLAB
    "https://github.com/shadowcz007/comfyui-mixlab-nodes"
    ## WAS NODE ???
    "https://github.com/WASasquatch/was-node-suite-comfyui"
    ## CONTROLNET
    "https://github.com/Fannovel16/comfyui_controlnet_aux"
    ## IMPACT PACK
    "https://github.com/ltdrdata/ComfyUI-Impact-Pack"
    ## Advanced Controlnet
    "https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet"
    ## Easy Comfy Nodes for fetching from URL
    "https://github.com/wmatson/easy-comfy-nodes"
    ## Comfy Essentials
    "https://github.com/cubiq/ComfyUI_essentials"
)

CHECKPOINT_MODELS=(
    # JUGGERNAUT SDXL (Needs to get refreshed on every single deploy because of its being S3 presigned url) CIVIT AI URL: https://civitai.com/api/download/models/471120
    "https://civitai-delivery-worker-prod.5ac0637cfd0766c97916cefa3764fbdf.r2.cloudflarestorage.com/model/764940/juggernautX.lIDA.safetensors?X-Amz-Expires=86400&response-content-disposition=attachment%3B%20filename%3D%22Juggernaut_X_RunDiffusion_Hyper.safetensors%22&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=e01358d793ad6966166af8b3064953ad/20240616/us-east-1/s3/aws4_request&X-Amz-Date=20240616T222644Z&X-Amz-SignedHeaders=host&X-Amz-Signature=4b67c23696049df95a20aedee8032e971d93f207ceb8ec3a4c1551b334c75a01 Juggernaut_X_RunDiffusion_Hyper.safetensors"
    ## SD 1.5
    "https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.ckpt v1-5-pruned-emaonly.ckpt"
)

LORA_MODELS=(
    #"https://civitai.com/api/download/models/16576"
)

VAE_MODELS=(
    # "https://huggingface.co/stabilityai/sd-vae-ft-ema-original/resolve/main/vae-ft-ema-560000-ema-pruned.safetensors"
    # "https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors"
    # "https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors"
)

ESRGAN_MODELS=(
    # "https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x4.pth"
    # "https://huggingface.co/FacehugmanIII/4x_foolhardy_Remacri/resolve/main/4x_foolhardy_Remacri.pth"
    # "https://huggingface.co/Akumetsu971/SD_Anime_Futuristic_Armor/resolve/main/4x_NMKD-Siax_200k.pth"
)

CONTROLNET_MODELS=(
    ## TILE UPSCALER CONTROLNET
    "https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11f1e_sd15_tile.pth control_v11f1e_sd15_tile.pth"
    ## DEPTH CONTROLNET
    "https://huggingface.co/stabilityai/control-lora/resolve/main/control-LoRAs-rank256/control-lora-depth-rank256.safetensors control-lora-depth-rank256.safetensors"
)

UPSCALE_MODELS=(
    ## 4x Ultrasharp Upscaler
    "https://civitai.com/api/download/models/125843 4xUltrasharp_4xUltrasharpV10.pt"
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

### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function provisioning_start() {
    DISK_GB_AVAILABLE=$(($(df --output=avail -m "${WORKSPACE}" | tail -n1) / 1000))
    DISK_GB_USED=$(($(df --output=used -m "${WORKSPACE}" | tail -n1) / 1000))
    DISK_GB_ALLOCATED=$(($DISK_GB_AVAILABLE + $DISK_GB_USED))
    provisioning_print_header
    provisioning_get_nodes
    provisioning_install_python_packages
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/checkpoints" \
        "${CHECKPOINT_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/lora" \
        "${LORA_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/controlnet" \
        "${CONTROLNET_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/vae" \
        "${VAE_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/esrgan" \
        "${ESRGAN_MODELS[@]}"

    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/upscale_models" \
        "${UPSCALE_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/clip_vision" \
        "${CLIP_VISION[@]}"
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/ipadapter" \
        "${IP_ADAPTER[@]}"

    download_extra_custom_node_models \
        "${WORKSPACE}/ComfyUI/models/inpaint" \
        "${INPAINT[@]}"

    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/custom_nodes/comfyui_controlnet_aux/ckpts/lllyasviel/Annotators" \
        "${IP_ADAPTER[@]}"

    provisioning_print_end
}

## STAY THE SAME
function provisioning_get_nodes() {
    for repo in "${NODES[@]}"; do
        dir="${repo##*/}"
        path="${WORKSPACE}/ComfyUI/custom_nodes/${dir}"
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

## STAY THE SAME
function provisioning_install_python_packages() {
    if [ ${#PYTHON_PACKAGES[@]} -gt 0 ]; then
        micromamba -n comfyui run ${PIP_INSTALL} ${PYTHON_PACKAGES[*]}
    fi
}

## CHANGED
function provisioning_get_models() {
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

function provisioning_print_header() {
    printf "\n##############################################\n#                                            #\n#          Provisioning container            #\n#                                            #\n#         This will take some time           #\n#                                            #\n# Your container will be ready on completion #\n#                                            #\n##############################################\n\n"
    if [[ $DISK_GB_ALLOCATED -lt $DISK_GB_REQUIRED ]]; then
        printf "WARNING: Your allocated disk size (%sGB) is below the recommended %sGB - Some models will not be downloaded\n" "$DISK_GB_ALLOCATED" "$DISK_GB_REQUIRED"
    fi
}

function provisioning_print_end() {
    printf "\nProvisioning complete:  Web UI will start now\n\n"
}

## CHANGED
# Download from $1 URL to $2 file path
function provisioning_download() {
    url="$1"
    path="$2"
    custom_name="$3"
    wget -qnc --content-disposition --show-progress "${url}" -O "${path}/${custom_name}" 
}

provisioning_start