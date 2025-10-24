#!/bin/bash

# ============================================================================
# Prebuild Script
# ============================================================================
# Purpose: Runs Expo prebuild and restores Fastlane configuration files
#
# Background:
#   This script combines two operations:
#   1. Runs 'npx expo prebuild --clean' to generate native projects
#   2. Restores Fastlane files from native/ backup directory
#
# Usage:
#   ./.github/scripts/prebuild.sh
#
# Note: This ensures Fastlane files are available immediately after prebuild
# ============================================================================

set -e  # Exit on any error

echo "============================================"
echo "Starting prebuild process..."
echo "============================================"

# ============================================================================
# Step 1: Run Expo Prebuild
# ============================================================================
echo ""
echo "Running expo prebuild..."
npx expo prebuild --clean

# ============================================================================
# Step 2: Restore Fastlane Files
# ============================================================================
echo ""
echo "Restoring Fastlane files..."

# Function to copy files if source exists
copy_if_exists() {
    local src="$1"
    local dest="$2"
    if [ -d "$src" ] || [ -f "$src" ]; then
        echo "Copying $src to $dest"
        cp -r "$src" "$dest"
    else
        echo "Warning: Source not found: $src"
    fi
}

# Restore Android Fastlane files
if [ -d "native/android" ]; then
    echo ""
    echo "Restoring Android Fastlane files..."
    copy_if_exists "native/android/fastlane" "android/"
    copy_if_exists "native/android/Gemfile" "android/"
    copy_if_exists "native/android/Gemfile.lock" "android/"
    copy_if_exists "native/android/debug-gemfile.sh" "android/"
    copy_if_exists "native/android/gradle.properties" "android/"
else
    echo "Warning: native/android directory not found"
fi

# Restore iOS Fastlane files
if [ -d "native/ios" ]; then
    echo ""
    echo "Restoring iOS Fastlane files..."
    copy_if_exists "native/ios/fastlane" "ios/"
    copy_if_exists "native/ios/Gemfile" "ios/"
    copy_if_exists "native/ios/Gemfile.lock" "ios/"
else
    echo "Warning: native/ios directory not found"
fi

echo ""
echo "============================================"
echo "Prebuild completed successfully with Fastlane files restored!"
echo "============================================"
