# Base image
FROM ubuntu:focal

# Maintainer info
MAINTAINER Jordan Tymburski <hello@jordantymburski.com>

# Time zone for tzdata install
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Build libraries and tools
RUN apt-get update
RUN apt-get install -y \
    build-essential \
    libsdl2-dev \
    libsdl2-image-dev \
    libsdl2-mixer-dev \
    libsdl2-ttf-dev \
    mingw-w64 \
    wget

# General Environmental Config
ARG CACHE_DIR=/tmp
ARG MINGW_I686=i686-w64-mingw32
ARG MINGW_X64=x86_64-w64-mingw32

ENV MINGW_I686_DIR /usr/${MINGW_I686}
ENV MINGW_X64_DIR /usr/${MINGW_X64}

# MinGW windows SDL2 package for static compilation
ARG SDL2=SDL2
ARG SDL2_DIR=${CACHE_DIR}/${SDL2}
ARG SDL2_URL=https://www.libsdl.org/release/SDL2-devel-2.0.12-mingw.tar.gz

RUN wget --output-document=${SDL2_DIR}.tar.gz ${SDL2_URL} && \
    tar -zxf ${SDL2_DIR}.tar.gz --directory=${CACHE_DIR} --one-top-level=${SDL2} --strip-components 1 && \
    make --directory=${SDL2_DIR} install-package arch=${MINGW_I686} prefix=${MINGW_I686_DIR} && \
    make --directory=${SDL2_DIR} install-package arch=${MINGW_X64} prefix=${MINGW_X64_DIR} && \
    rm -rf ${SDL2_DIR} ${SDL2_DIR}.tar.gz

# MinGW windows SDL2_image package for static compilation
ARG SDL2_IMAGE=SDL2_image
ARG SDL2_IMAGE_DIR=${CACHE_DIR}/${SDL2_IMAGE}
ARG SDL2_IMAGE_URL=https://www.libsdl.org/projects/SDL_image/release/SDL2_image-devel-2.0.5-mingw.tar.gz

RUN wget --output-document=${SDL2_IMAGE_DIR}.tar.gz ${SDL2_IMAGE_URL} && \
    tar -zxf ${SDL2_IMAGE_DIR}.tar.gz --directory=${CACHE_DIR} --one-top-level=${SDL2_IMAGE} --strip-components 1 && \
    make --directory=${SDL2_IMAGE_DIR} install-package arch=${MINGW_I686} prefix=${MINGW_I686_DIR} && \
    make --directory=${SDL2_IMAGE_DIR} install-package arch=${MINGW_X64} prefix=${MINGW_X64_DIR} && \
    rm -rf ${SDL2_IMAGE_DIR} ${SDL2_IMAGE_DIR}.tar.gz

# MinGW windows SDL2_mixer package for static compilation
ARG SDL2_MIXER=SDL2_mixer
ARG SDL2_MIXER_DIR=${CACHE_DIR}/${SDL2_MIXER}
ARG SDL2_MIXER_URL=https://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-devel-2.0.4-mingw.tar.gz

RUN wget --output-document=${SDL2_MIXER_DIR}.tar.gz ${SDL2_MIXER_URL} && \
    tar -zxf ${SDL2_MIXER_DIR}.tar.gz --directory=${CACHE_DIR} --one-top-level=${SDL2_MIXER} --strip-components 1 && \
    make --directory=${SDL2_MIXER_DIR} install-package arch=${MINGW_I686} prefix=${MINGW_I686_DIR} && \
    make --directory=${SDL2_MIXER_DIR} install-package arch=${MINGW_X64} prefix=${MINGW_X64_DIR} && \
    rm -rf ${SDL2_MIXER_DIR} ${SDL2_MIXER_DIR}.tar.gz

# MinGW windows SDL2_ttf package for static compilation
ARG SDL2_TTF=SDL2_ttf
ARG SDL2_TTF_DIR=${CACHE_DIR}/${SDL2_TTF}
ARG SDL2_TTF_URL=https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-devel-2.0.15-mingw.tar.gz

RUN wget --output-document=${SDL2_TTF_DIR}.tar.gz ${SDL2_TTF_URL} && \
    tar -zxf ${SDL2_TTF_DIR}.tar.gz --directory=${CACHE_DIR} --one-top-level=${SDL2_TTF} --strip-components 1 && \
    make --directory=${SDL2_TTF_DIR} install-package arch=${MINGW_I686} prefix=${MINGW_I686_DIR} && \
    make --directory=${SDL2_TTF_DIR} install-package arch=${MINGW_X64} prefix=${MINGW_X64_DIR} && \
    rm -rf ${SDL2_TTF_DIR} ${SDL2_TTF_DIR}.tar.gz
