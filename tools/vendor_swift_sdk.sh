#!/bin/sh
# Copies the Swift SDK submodule into the two places the podspec and Package.swift compile from,
# exactly like upstream's release workflow does before publishing to pub.dev. Run after moving the submodule.
set -e
cd "$(dirname "$0")/.."
git submodule update --init ios/Classes/confidence-sdk
rm -rf ios/Classes/Confidence ios/confidence_flutter_sdk/Sources/confidence_flutter_sdk/Confidence
cp -r ios/Classes/confidence-sdk/Sources/Confidence ios/Classes/Confidence
cp -r ios/Classes/confidence-sdk/Sources/Confidence ios/confidence_flutter_sdk/Sources/confidence_flutter_sdk/Confidence
find ios/Classes/Confidence ios/confidence_flutter_sdk/Sources/confidence_flutter_sdk/Confidence -name .DS_Store -delete
echo "Vendored Swift SDK $(git -C ios/Classes/confidence-sdk describe --tags)"
