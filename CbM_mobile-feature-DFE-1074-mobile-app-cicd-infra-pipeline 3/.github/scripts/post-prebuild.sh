#!/bin/bash

# ============================================================================
# Post-Prebuild Script
# ============================================================================
# Purpose: Restores Fastlane configuration files after Expo prebuild
#
# Background:
#   When Expo prebuild generates native Android/iOS projects, it creates
#   clean native directories without Fastlane configuration. This script
#   restores the necessary Fastlane files from the native/ backup directory
#   so that deployment automation can work.
#
# Usage:
#   ./.github/scripts/post-prebuild.sh
#
# Note: This script should be run after 'npx expo prebuild' or when
#       the workflow detects existing native projects
# ============================================================================

set -e  # Exit on any error

echo "============================================"
echo "Post-prebuild: Restoring Fastlane files..."
echo "============================================"

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

# ============================================================================
# Restore Android Fastlane Configuration
# ============================================================================
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

# ============================================================================
# Restore iOS Fastlane Configuration
# ============================================================================
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
echo "Post-prebuild: Fastlane files restored successfully!"
echo "============================================"
