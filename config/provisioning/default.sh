#!/bin/bash

# This file will be sourced in init.sh

# https://raw.githubusercontent.com/ai-dock/comfyui/main/config/provisioning/default.sh

# Packages are installed after nodes so we can fix them...

PYTHON_PACKAGES=(
    #"opencv-python==4.7.0.72"
)

NODES=(
    "https://github.com/ltdrdata/ComfyUI-Manager"
    "https://github.com/thecooltechguy/ComfyUI-Stable-Video-Diffusion"
)

CHECKPOINT_MODELS=(
    # "https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.ckpt"
    #"https://huggingface.co/stabilityai/stable-diffusion-2-1/resolve/main/v2-1_768-ema-pruned.ckpt"
    #"https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors"
    #"https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors"
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
    # "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_canny-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_depth-fp16.safetensors"
    # "https://huggingface.co/kohya-ss/ControlNet-diff-modules/resolve/main/diff_control_sd15_depth_fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_hed-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_mlsd-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_normal-fp16.safetensors"
    # "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_openpose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_scribble-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_seg-fp16.safetensors"
    # "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_canny-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_color-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_depth-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_keypose-fp16.safetensors"
    # "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_openpose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_seg-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_sketch-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_style-fp16.safetensors"
)

## https://github.com/thecooltechguy/ComfyUI-Stable-Video-Diffusion?tab=readme-ov-file#node-types
STABLE_VIDEO_DIFFUSION=(
    "https://cdn-lfs-us-1.huggingface.co/repos/7e/f0/7ef086cede3588849d02a4ce93c0ab4ab9777d9771b33aaaa53ad7cb3eda786e/3e0994626df395a3831de024f11b2d9d241143bb6f16e2efbacced248aa18ce0?response-content-disposition=attachment%3B+filename*%3DUTF-8%27%27svd.safetensors%3B+filename%3D%22svd.safetensors%22%3B&Expires=1718724789&Policy=eyJTdGF0ZW1lbnQiOlt7IkNvbmRpdGlvbiI6eyJEYXRlTGVzc1RoYW4iOnsiQVdTOkVwb2NoVGltZSI6MTcxODcyNDc4OX19LCJSZXNvdXJjZSI6Imh0dHBzOi8vY2RuLWxmcy11cy0xLmh1Z2dpbmdmYWNlLmNvL3JlcG9zLzdlL2YwLzdlZjA4NmNlZGUzNTg4ODQ5ZDAyYTRjZTkzYzBhYjRhYjk3NzdkOTc3MWIzM2FhYWE1M2FkN2NiM2VkYTc4NmUvM2UwOTk0NjI2ZGYzOTVhMzgzMWRlMDI0ZjExYjJkOWQyNDExNDNiYjZmMTZlMmVmYmFjY2VkMjQ4YWExOGNlMD9yZXNwb25zZS1jb250ZW50LWRpc3Bvc2l0aW9uPSoifV19&Signature=LjGKDrMyCKDH4fu5oyr09sKQYXFCSkvRtDv3KtuXTDdloKKUPQJ4KSlTCJfbUCGAR-27WGG6txOMYySEYZ6bfImyEUYn2t3370rpkyJ47mY7TF72zg3GqjQSURYLwgdffpTjANrdV5lwUFVnjaIo2cZRfppKemXSbubLQ8x2RfWXmLEOfFyTnaM0yRONRkGE1MUX2amqsPw8kT8pSuT7Hg1CQ7jGCRJDn2b3qeISDXlhYfQtk9w9-zmS%7E97fNs2bzrgcuKewJT9dOfDVX-o5FZ3thNu3FMGiorTZt5fHjI6Yj-7fcbr4mBBS5xd-DHUU2beSjjhh1jagtZWH6PXu7Q__&Key-Pair-Id=K2FPYV99P2N66Q svd.safetensors"
    "https://cdn-lfs-us-1.huggingface.co/repos/7e/f0/7ef086cede3588849d02a4ce93c0ab4ab9777d9771b33aaaa53ad7cb3eda786e/f454a3bdb92e0bc2aae634146208605f209c5a3d37f5bb87fbec8e5cca44dc18?response-content-disposition=attachment%3B+filename*%3DUTF-8%27%27svd_image_decoder.safetensors%3B+filename%3D%22svd_image_decoder.safetensors%22%3B&Expires=1718724854&Policy=eyJTdGF0ZW1lbnQiOlt7IkNvbmRpdGlvbiI6eyJEYXRlTGVzc1RoYW4iOnsiQVdTOkVwb2NoVGltZSI6MTcxODcyNDg1NH19LCJSZXNvdXJjZSI6Imh0dHBzOi8vY2RuLWxmcy11cy0xLmh1Z2dpbmdmYWNlLmNvL3JlcG9zLzdlL2YwLzdlZjA4NmNlZGUzNTg4ODQ5ZDAyYTRjZTkzYzBhYjRhYjk3NzdkOTc3MWIzM2FhYWE1M2FkN2NiM2VkYTc4NmUvZjQ1NGEzYmRiOTJlMGJjMmFhZTYzNDE0NjIwODYwNWYyMDljNWEzZDM3ZjViYjg3ZmJlYzhlNWNjYTQ0ZGMxOD9yZXNwb25zZS1jb250ZW50LWRpc3Bvc2l0aW9uPSoifV19&Signature=qF3ifu0KBDrZu3Tqs-R5ulMaqMMfgiRcX45NujOxV64ejm5vXZdA2l0O1-BYTnLOWpvCgoMe1cQpS74gSfyW5PXGLHYSEA9J9kjQy7CCaaJWOnrpwecAIIgQBdzWSMPNW%7EXbdLWpflXduzIfBz7OnSw9h3tA8kPMVrTKfLctXh1swSZZL6CUHVvU1yhASzkGLysYQ9GSGy8o9Dj7QyRkqOCRxINc5dPh1297mpGTib5EwKh3kMEeYCWyWkMpk0QabcoDYPibyJ1I14o0fhcEtOApWu9LDtoJMeTjDJiKp3-UAHE5QW7AgtWIk64PolleRaI%7EOK7bAJTRtCVhQEOjHw__&Key-Pair-Id=K2FPYV99P2N66Q svd_image_decoder.safetensors"
    "https://cdn-lfs-us-1.huggingface.co/repos/6e/59/6e594adc90884e0f59c5249f166a20166135ccab3a168d824ca8ef3bc5512e8c/b2652c23d64a1da5f14d55011b9b6dce55f2e72e395719f1cd1f8a079b00a451?response-content-disposition=attachment%3B+filename*%3DUTF-8%27%27svd_xt.safetensors%3B+filename%3D%22svd_xt.safetensors%22%3B&Expires=1718724881&Policy=eyJTdGF0ZW1lbnQiOlt7IkNvbmRpdGlvbiI6eyJEYXRlTGVzc1RoYW4iOnsiQVdTOkVwb2NoVGltZSI6MTcxODcyNDg4MX19LCJSZXNvdXJjZSI6Imh0dHBzOi8vY2RuLWxmcy11cy0xLmh1Z2dpbmdmYWNlLmNvL3JlcG9zLzZlLzU5LzZlNTk0YWRjOTA4ODRlMGY1OWM1MjQ5ZjE2NmEyMDE2NjEzNWNjYWIzYTE2OGQ4MjRjYThlZjNiYzU1MTJlOGMvYjI2NTJjMjNkNjRhMWRhNWYxNGQ1NTAxMWI5YjZkY2U1NWYyZTcyZTM5NTcxOWYxY2QxZjhhMDc5YjAwYTQ1MT9yZXNwb25zZS1jb250ZW50LWRpc3Bvc2l0aW9uPSoifV19&Signature=gj84nwPLWI05Zd0HOgmxSU0D2T59FWLOoigpxaRAY0ILH9J2vVFa3OttMMg%7EnBLtcxpXCAByh9dksZPAqaI0yj7VdS-Klgc8wt6n0cMxXNlCujTivEvthawVNve-LOY1alc3oFjqFNM9wZLhPlrMckcAR%7EbED00y40bacuqKbB9lT8zkxJBHNH30dlFnqSU5GU6G8db%7EVw88rTs1E5jxA-PIxvQGIL-mnkD1av82ydgcBsjpXFsXDDsLDM2Rh2h%7EOS9ag0H7gJMjqbGXnjn-pE9P-LtwTOMeukpUp1CxzvCjWYR9oAylawgrY5bSV51CQ7AEuig%7E-%7EYGxaKthmb%7EDg__&Key-Pair-Id=K2FPYV99P2N66Q svd_xt.safetensors"
    "https://cdn-lfs-us-1.huggingface.co/repos/6e/59/6e594adc90884e0f59c5249f166a20166135ccab3a168d824ca8ef3bc5512e8c/99aa889bf6d1ca28e026755b83ba37e3072ad79b45dd4c94fae14bee7482263b?response-content-disposition=attachment%3B+filename*%3DUTF-8%27%27svd_xt_image_decoder.safetensors%3B+filename%3D%22svd_xt_image_decoder.safetensors%22%3B&Expires=1718724910&Policy=eyJTdGF0ZW1lbnQiOlt7IkNvbmRpdGlvbiI6eyJEYXRlTGVzc1RoYW4iOnsiQVdTOkVwb2NoVGltZSI6MTcxODcyNDkxMH19LCJSZXNvdXJjZSI6Imh0dHBzOi8vY2RuLWxmcy11cy0xLmh1Z2dpbmdmYWNlLmNvL3JlcG9zLzZlLzU5LzZlNTk0YWRjOTA4ODRlMGY1OWM1MjQ5ZjE2NmEyMDE2NjEzNWNjYWIzYTE2OGQ4MjRjYThlZjNiYzU1MTJlOGMvOTlhYTg4OWJmNmQxY2EyOGUwMjY3NTViODNiYTM3ZTMwNzJhZDc5YjQ1ZGQ0Yzk0ZmFlMTRiZWU3NDgyMjYzYj9yZXNwb25zZS1jb250ZW50LWRpc3Bvc2l0aW9uPSoifV19&Signature=vrQ-Zy5Pfqcl7aNUgQe4JirJa5ZH97vMHeZSWcbaWVVzDH1nWne9xWfHOtxpQj9e%7EfyjYyCcr0J-4pK1Ok42Z-vYWRAv5VEIBnnFrhWVf1gqs9KW3XnpKFc0HRi78KqlIQCNveoE4-a5dVkDS4AjWVZXTCrMCPKN-ZweZd4geXYTt9jXZwp7Nikit-evwwV%7EFaB1kPkRZUFhgtSMyfAjEPFFHDUBA4kcjIHad1t4a8canFMnXzXM8jpbkvaPRx%7Ejp8-UW1boQU7iMMZwZteYMyQy3kcNsg1PrvVDkEG5-KpctuV5LRuB%7EdUK0PLeFFykzm9qwg6BWTeWzH0T9bzSyQ__&Key-Pair-Id=K2FPYV99P2N66Q svd_xt_image_decoder.safetensors"
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
        "${WORKSPACE}/storage/stable_diffusion/models/ckpt" \
        "${CHECKPOINT_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/lora" \
        "${LORA_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/controlnet" \
        "${CONTROLNET_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/vae" \
        "${VAE_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/esrgan" \
        "${ESRGAN_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/svd" \
        "${STABLE_VIDEO_DIFFUSION[@]}"
    provisioning_print_end
}

## STAY THE SAME
function provisioning_get_nodes() {
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