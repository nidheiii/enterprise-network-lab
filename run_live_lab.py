#!/usr/bin/env python3
"""
Launcher script for the Enterprise Lab Real-Time NOC Simulator
Starts the Uvicorn ASGI server hosting the FastAPI + WebSocket backend.
"""

import sys
import webbrowser
from pathlib import Path
import uvicorn

def main():
    port = 8080
    host = "127.0.0.1"
    url = f"http://{host}:{port}"
    
    print("\n" + "="*70)
    print("  🚀 STARTING REAL-TIME ENTERPRISE LAB NOC SIMULATOR")
    print("="*70)
    print(f"  ➜ Dashboard URL: {url}")
    print(f"  ➜ WebSocket URL: ws://{host}:{port}/ws")
    print(f"  ➜ Devices Active: Site-A-R1, Site-B-R1, FortiGate, Site-A-SW1")
    print("="*70)
    print("  Press CTRL+C in this terminal to stop the server.\n")

    # Launch server
    uvicorn.run("app.main:app", host=host, port=port, log_level="info")

if __name__ == "__main__":
    main()
