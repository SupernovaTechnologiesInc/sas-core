#!/bin/bash

# ==========================================================
# SAS PROTOCOL - REFERENCE ARCHITECTURE SETUP
# Validates local environment for TEE, Compact, and Bridge layers.
# ==========================================================

# Text Formatting
GREEN='\033[0;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}>>> SAS PROTOCOL: Initializing Development Environment...${NC}"

# 1. Check Python (Layer 1: Sentinel)
echo -n "Checking Python 3 environment... "
if command -v python3 &> /dev/null; then
    echo -e "${GREEN}DETECTED${NC}"
else
    echo -e "${YELLOW}MISSING${NC} (Required for Sentinel TEE Simulator)"
    exit 1
fi

# 2. Check Rust (Layer 3: Bridge)
echo -n "Checking Rust/Cargo toolchain... "
if command -v cargo &> /dev/null; then
    echo -e "${GREEN}DETECTED${NC}"
else
    echo -e "${YELLOW}WARNING${NC} (Rust is required to build the C2PA Bridge)"
fi

# 3. Check Docker (Layer 2: Midnight Compact)
echo -n "Checking Docker (for Compact Compiler)... "
if command -v docker &> /dev/null; then
    echo -e "${GREEN}DETECTED${NC}"
else
    echo -e "${YELLOW}WARNING${NC} (Docker is required to compile Zero-Knowledge circuits)"
fi

# 4. Permission Setup
echo -e "\nSetting execution permissions for Sentinel..."
chmod +x sentinel/sentinel.py
echo -e "${GREEN}Done.${NC}"

# Final Integration Notice
echo -e "\n${BLUE}========================================================${NC}"
echo -e "${GREEN}>>> SETUP COMPLETE.${NC}"
echo -e "Ready to build: Sentinel, Contracts, and Bridge."
echo ""
echo -e "${YELLOW}IMPORTANT NOTICE:${NC}"
echo "This repository contains the Reference Architecture (Sanitized)."
echo "To activate the patented biometric verification logic, you must"
echo "place your licensed 'weights.json' and 'scoring_plugin.py'"
echo "into the /sentinel directory as detailed in the Engineering Manual."
echo -e "${BLUE}========================================================${NC}"
