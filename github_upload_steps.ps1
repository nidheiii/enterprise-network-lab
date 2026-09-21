# ============================================================
# GitHub Upload Script — Enterprise Multi-Site Network Lab
# Run these commands ONE BY ONE in PowerShell
# ============================================================

# 1. Move into your project directory
cd "d:\Network Engineer\Project_2"

# 2. Tell Git who you are (use your actual GitHub name and email)
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"

# 3. Initialize a new local Git repository
git init

# 4. Stage ALL project files
git add .

# 5. Commit with a professional message
git commit -m "feat: Initial commit — Enterprise Multi-Site Network Lab

- Cisco Catalyst L2 switching: VLANs 10/20/30, 802.1Q trunks, Native VLAN 99, STP hardening, Port Security
- Cisco ISR routing: ROAS subinterfaces, OSPF Area 0 (Cost 10 primary / Cost 100 backup), DHCP, Extended ACLs
- FortiGate NGFW: Route-based IKEv2 IPsec VPN (AES-256 DH14), Stateful policies, PAT/SNAT, OSPF over VTI
- Phase 1-6 engineering guides, NOC troubleshooting runbook, Interview defense Q&A
- 8-scenario Chaos Engineering drill suite
- Real-time NOC dashboard (FastAPI + WebSockets + HTML5 canvas)
- Python 52-point compliance audit engine + backup/drift detector
- GNS3/EVE-NG/CML emulator setup guide
- Advanced extensions: HSRP, QoS LLQ, IP SLA, DHCP Snooping/DAI, FortiGate UTM, eBGP"

# 6. Set your main branch name
git branch -M main

# 7. Add your GitHub repository as the remote
#    REPLACE the URL below with YOUR actual GitHub repo URL
git remote add origin https://github.com/YOUR-USERNAME/enterprise-network-lab.git

# 8. Push everything to GitHub
git push -u origin main
