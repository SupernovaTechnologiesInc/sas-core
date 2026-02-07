# SAS Protocol (Secure Attribution System)

**Reference Implementation | USPTO Patent Pending #19/419,464**

The SAS Protocol is a privacy-preserving standard for verifying human identity in C2PA content credentials. It utilizes the Midnight Network's Zero-Knowledge (ZK) capabilities to bridge off-chain biometric signatures (generated in a TEE) to on-chain provenance assertions.

## Repository Structure

This repository contains the core architectural components for the SAS Reference Bridge, organized by the layers defined in the Engineering Manual:

* **`/sentinel` (Layer 1):** Python-based TEE Simulator for capturing "Proof of Humanity" telemetry and generating secure biometric witnesses.
* **`/contracts` (Layer 2):** Midnight Compact smart contracts (`sas_core.compact`) for on-chain verification and registry management.
* **`/bridge` (Layer 3):** Rust-based C2PA injection logic for embedding Midnight Proofs into media asset metadata.
* **`/ui` (Layer 4):** React frontend scaffolding for the Lace Wallet verification dashboard.
* **`/circuits`:** ZK-SNARK circuits for validating liveness proofs without revealing raw user data.
* **`/docs`:** Architectural specifications and sequence diagrams.

## License

This architecture is released under **Apache 2.0**.
*Note: Specific scoring algorithms and weighting matrices referenced in the codebase are subject to patent protection.*
