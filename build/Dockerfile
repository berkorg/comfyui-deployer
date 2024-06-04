# For build automation - Allows building from any ai-dock base image
# Use a *cuda*base* image as default because pytorch brings the libs
ARG IMAGE_BASE="ghcr.io/berkorg/comfyui-deployer:cuda-11.8.0-runtime-22.04-719fb2c"
FROM ${IMAGE_BASE}

ARG PYTHON_VERSION="3.10"
ENV PYTHON_VERSION=${PYTHON_VERSION}

ARG PYTORCH_VERSION="2.2.1"
ENV PYTORCH_VERSION="${PYTORCH_VERSION}"

ARG COMFYUI_SHA
ENV COMFYUI_SHA=${COMFYUI_SHA}

ENV IMAGE_SLUG="comfyui"
ENV OPT_SYNC=ComfyUI:serverless

# Copy early so we can use scripts in the build - Changes to these files will invalidate the cache and cause a rebuild.
COPY ./COPY_ROOT/ /

# Use build scripts to ensure we can build all targets from one Dockerfile in a single layer.
# Don't put anything heavy in here - We can use multi-stage building above if necessary.

ARG IMAGE_BASE
RUN /opt/ai-dock/bin/build/layer0/init.sh

# Must be set after layer0
ENV MAMBA_DEFAULT_ENV=comfyui
ENV MAMBA_DEFAULT_RUN="micromamba run -n $MAMBA_DEFAULT_ENV"

# Copy overrides and models into later layers for fast rebuilds
COPY ./COPY_ROOT_EXTRA/ /
RUN /opt/ai-dock/bin/build/layer1/init.sh

# Keep init.sh as-is and place additional logic in /opt/ai-dock/bin/preflight.sh
CMD ["init.sh"]
