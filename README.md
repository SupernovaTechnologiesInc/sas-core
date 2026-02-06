# SAS Protocol (Secure Attribution System)

**Reference Implementation | USPTO Patent Pending #19/419,464**

The SAS Protocol is a privacy-preserving standard for verifying human identity in C2PA content credentials. It utilizes the Midnight Network's Zero-Knowledge (ZK) capabilities to bridge off-chain biometric signatures (generated in a TEE) to on-chain provenance assertions.

## Repository Structure

This repository contains the core architectural components for the SAS Reference Bridge:

* **`/contracts`**: Midnight Compact smart contracts for on-chain identity verification and certificate issuance.
* **`/circuits`**: ZK-SNARK circuits for validating biometric liveness proofs without revealing raw user data.
* **`/tee-worker`**: Rust-based logic for the Trusted Execution Environment (TEE) that handles secure biometric ingestion.
* **`/docs`**: Architectural specifications and sequence diagrams.

## License

This architecture is released under **Apache 2.0**.
*Note: Specific scoring algorithms and weighting matrices referenced in the codebase are subject to patent protection.*
