# SAS Protocol Architecture Reference

## 1. System Overview
The Secure Attribution System (SAS) functions as a "Zero-Knowledge Bridge" between off-chain biometric activity and on-chain C2PA identity assertions.

The architecture is designed to solve the **"Transparency Paradox"**:
> *How do we prove a user is human without revealing their biometric data or the anti-bot scoring logic to attackers?*

## 2. Component Diagram

```mermaid
graph TD
    A[Client / Adobe C2PA] -->|Raw Biometrics + Session ID| B[Sentinel Node (TEE)]
    B -->|Sanitized ZK Input| C[Midnight ZK Circuit]
    C -->|Proof of Liveness| D[sas_core.compact]
    D -->|Verified Attribute| E[C2PA Manifest]
