import time
import json
import hashlib
import os

# SENTINEL: Reference TEE Simulator (Layer 1)
# Verifies Human Contribution Score (HCS) via secure session logging.
# -----------------------------------------------------------
# Reference Implementation for Midnight Testnet.

class SentinelSession:
    def __init__(self):
        self.session_log = []
        self.config = self._load_config()
        print(f">>> TEE INITIALIZED: Session Monitor Active.")

    def _load_config(self):
        """
        Loads the scoring configuration.
        Checks for local 'config.json', otherwise applies standard defaults.
        """
        try:
            with open("config.json", "r") as f:
                return json.load(f)
        except FileNotFoundError:
            # Standard default configuration for reference implementation
            return {"keystroke_weight": 1.0, "velocity_threshold": 50}

    def log_telemetry(self, event_type, raw_data):
        """
        Ingests behavioral data.
        Data is hashed immediately to preserve user privacy.
        """
        entry = {
            "ts": time.time(),
            "type": event_type,
            "data_hash": hashlib.sha256(str(raw_data).encode()).hexdigest(),
            # Calculate local entropy for the reference score
            "entropy_score": len(str(raw_data)) 
        }
        self.session_log.append(entry)

    def seal_and_sign(self):
        """
        Generates the 'Witness' payload for the ZK Circuit.
        """
        # 1. Calculate the HCS (Human Contribution Score)
        score = self._compute_hcs()

        # 2. Create the Signed Payload
        payload = {
            "session_id": hashlib.sha256(json.dumps(self.session_log).encode()).hexdigest(),
            "hcs_score": score,
            "timestamp": int(time.time()),
            "status": "SIGNED_BY_TEE"
        }

        # 3. Output for ZK Circuit ingestion
        with open("witness_output.json", "w") as f:
            json.dump(payload, f, indent=2)
        
        return payload

    def _compute_hcs(self):
        """
        Computes the session score based on accumulated telemetry.
        Reference Heuristic: Summation of entropy events weighted by configuration.
        """
        base_score = sum(e['entropy_score'] for e in self.session_log)
        return base_score * self.config.get('keystroke_weight', 1.0)

# --- Execution Entry Point ---
if __name__ == "__main__":
    # Simulate a User Session
    sentinel = SentinelSession()
    
    print("... Capturing Session Telemetry ...")
    sentinel.log_telemetry("keystroke_dynamics", "user_typing_pattern_sample")
    sentinel.log_telemetry("mouse_velocity", [12, 45, 88, 12])
    
    result = sentinel.seal_and_sign()
    print(f">>> SESSION SEALED. Proof Generated: {result['session_id']}")
    print(f">>> HCS SCORE: {result['hcs_score']}")
