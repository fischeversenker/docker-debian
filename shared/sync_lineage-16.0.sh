#!/bin/sh
mkdir -p lineage-16.0
cd lineage-16.0
repo init --depth=1 -u https://github.com/LineageOS/android.git -b lineage-16.0
repo sync -f --force-sync --force-broken --no-clone-bundle --no-tags -j2
