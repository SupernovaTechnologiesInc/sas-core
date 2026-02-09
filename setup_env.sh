#!/bin/bash

# SUPERNOVA SAS: Development Environment Setup
# Reference Implementation for Midnight Testnet

set -e  # Exit immediately if a command exits with a non-zero status.

echo "=================================================="
echo "   SUPERNOVA: SECURE ATTRIBUTION SYSTEM (SAS)     "
echo "   Setting up Reference Environment...            "
echo "=================================================="

# --------------------------------------------------------
# 1. SETUP PYTHON SENTINEL (Layer 1)
# --------------------------------------------------------
echo ""
echo "[1/3] Configuring Sentinel TEE Simulator..."

if [ -d "sentinel" ]; then
    cd sentinel
    
    # Create Virtual Environment if it doesn't exist
    if [ ! -d "venv" ]; then
        echo "   -> Creating Python virtual environment..."
        python3 -m venv venv
    fi
    
    # Activate and Install
    source venv/bin/activate
    
    if [ -f "requirements.txt" ]; then
        echo "   -> Installing dependencies..."
        pip install -r requirements.txt > /dev/null
    else
        echo "   [!] Warning: sentinel/requirements.txt not found."
    fi
    
    # Return to root
    cd ..
    echo "   -> Sentinel setup complete."
else
    echo "   [!] Error: 'sentinel' directory not found."
fi

# --------------------------------------------------------
# 2. BUILD RUST BRIDGE (Layer 3)
# --------------------------------------------------------
echo ""
echo "[2/3] Building C2PA Bridge..."

if command -v cargo &> /dev/null; then
    if [ -d "bridge" ]; then
        cd bridge
        echo "   -> Compiling Rust binaries (Release Mode)..."
        cargo build --release --quiet
        cd ..
        echo "   -> Bridge build complete."
    else
        echo "   [!] Error: 'bridge' directory not found."
    fi
else
    echo "   [!] Warning: Rust (cargo) is not installed. Skipping Bridge build."
fi

# --------------------------------------------------------
# 3. FINAL CONFIGURATION
# --------------------------------------------------------
echo ""
echo "[3/3] Finalizing Configuration..."

# Create default config if missing (Simulates standard open source behavior)
if [ ! -f "sentinel/config.json" ]; then
    echo "   -> Creating default configuration..."
    echo '{ "keystroke_weight": 1.0, "velocity_threshold": 50 }' > sentinel/config.json
fi

echo ""
echo "=================================================="
echo "   SETUP COMPLETE."
echo "   Run 'source sentinel/venv/bin/activate' to begin."
echo "=================================================="
