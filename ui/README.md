```markdown
# SAS Protocol - Layer 4: Frontend & Wallet Integration

## Overview
The **SAS Reference UI** provides the user interface for the verification workflow. It handles the connection to the **Lace Wallet**, manages the Midnight transaction submission, and displays the "Humanity Score" status to the end user.

## Technical Stack
* **Framework:** React 18 / TypeScript
* **Wallet Provider:** Lace (Midnight Devnet/Testnet)
* **State Management:** `useMidnight` custom hook

## Core Functions
The UI interacts with the `sas_core.compact` contract via the following circuit calls:
1.  **`connect()`**: Establishes a session with the browser wallet.
2.  **`proveAttribution(assetHash, score)`**: Submits the ZK-Proof to the Midnight Ledger.

> **⚠️ INTEGRATION NOTICE:**
> The React components for the "Verification Dashboard" and the `useMidnight.ts` hook logic are detailed in **Section 5** of the **SAS Reference DApp Engineering Manual**.
>
> Please refer to the manual for the specific `circuitName` parameters and ABI definitions required to sign transactions on the Midnight Testnet.

## Development
```bash
npm install
npm run dev
