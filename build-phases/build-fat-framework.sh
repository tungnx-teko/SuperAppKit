#!/bin/sh

UNIVERSAL_OUTPUTFOLDER=${BUILD_DIR}/${CONFIGURATION}-universal
WORKSPACE="SuperAppKit.xcworkspace"
OUTPUT_FOLDER="${PROJECT_DIR}/Outputs/"
CONFIGURATION_BUILD_DIR="./Build"

SDK_TARGET_NAME="SuperAppKit"

mkdir -p "${UNIVERSAL_OUTPUTFOLDER}"
mkdir -p "${OUTPUT_FOLDER}"

# Build Device and Simulator versions
xcodebuild -workspace "${WORKSPACE}" -scheme "${SDK_TARGET_NAME}" -configuration Release -sdk iphoneos BUILD_DIR="${CONFIGURATION_BUILD_DIR}" ONLY_ACTIVE_ARCH=NO BUILD_ROOT="${BUILD_ROOT}" OBJROOT="${OBJROOT}/DependentBuilds" BUILD_LIBRARY_FOR_DISTRIBUTION=YES
xcodebuild -workspace "${WORKSPACE}" -scheme "${SDK_TARGET_NAME}" -configuration Release -sdk iphonesimulator ARCHS=x86_64 ONLY_ACTIVE_ARCH=NO BUILD_DIR="${CONFIGURATION_BUILD_DIR}" BUILD_ROOT="${BUILD_ROOT}" OBJROOT="${OBJROOT}/DependentBuilds" BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Make fat framework and copy to output folder
scriptdir="$(dirname "$0")"
"${scriptdir}/make-fat-framework.sh" "${UNIVERSAL_OUTPUTFOLDER}" "${SDK_TARGET_NAME}" "${OUTPUT_FOLDER}"

# Open the project's directory in Finder
open "${OUTPUT_FOLDER}"
