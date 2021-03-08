#!/bin/bash
# Cicak bin Kadal
# Tue 13 Oct 2020 10:37:14 AM WIB

FILES="my*.txt my*.sh"
SHA="SHA256SUM"

# Remove SHA256SUM and SHA256SUM.asc
echo "rm -f $SHA $SHA.asc"
rm -f $SHA $SHA.asc

# Print SHA256 all my*.txt and my*.sh to SHA256SUM
echo "sha256sum $FILES > $SHA"
sha256sum $FILES > $SHA

# Check SHA256
echo "sha256sum -c $SHA"
sha256sum -c $SHA

# Create an output for SHA256 to SHA256.sum with armored (binary-to-textual) 
# and detached sign it
echo "gpg -o $SHA.asc -a -sb $SHA"
gpg -o $SHA.asc -a -sb $SHA

# Verify the SHA256SUM.asc with the signed data in SHA256SUM
echo "gpg --verify $SHA.asc $SHA"
gpg --verify $SHA.asc $SHA

# Exit as the program succeed
exit 0

# Mon Sep 28 21:05:04 WIB 2020
# Tue 29 Sep 2020 11:02:39 AM WIB

