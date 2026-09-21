# Enterprise Multi-Site Network Infrastructure & Security Engineering Lab

[![Network](https://img.shields.io/badge/Architecture-Enterprise%20Dual--Site-blue.svg)](#lab-architecture)
[![Routing](https://img.shields.io/badge/Routing-OSPFv2%20Area%200-green.svg)](#phase-2--dynamic-routing-ospfv2)
[![Security](https://img.shields.io/badge/Security-FortiGate%20NGFW%20%7C%20ACLs-red.svg)](#phase-3--network-security--firewall-policies)
[![VPN](https://img.shields.io/badge/VPN-Route--Based%20IPsec%20IKEv2-purple.svg)](#phase-4--site-to-site-ipsec-vpn)
[![Real-Time](https://img.shields.io/badge/NOC%20Simulator-Live%20Real--Time%20WebSocket-brightgreen.svg)](#-real-time-live-noc-laboratory)
[![Documentation](https://img.shields.io/badge/Runbook-Tier--2%2F3%20NOC%20Ready-orange.svg)](#phase-6--enterprise-noc-troubleshooting-runbook)

An interview-ready, production-grade enterprise network engineering project modeling a multi-site campus and data center environment. Built with Cisco IOS Catalyst switches and ISR routers, coupled with a FortiGate Next-Generation Firewall (NGFW) running FortiOS 7.2.

---

## ⚡ Real-Time Live NOC Laboratory

This repository includes a full **real-time event-driven NOC simulator** powered by FastAPI, WebSockets, HTML5 canvas, and live Cisco IOS/FortiOS CLI emulation:

```bash
# Launch the live real-time laboratory
python run_live_lab.py
```
Open **[http://127.0.0.1:8080](http://127.0.0.1:8080)** in any browser to:
1. **Watch Live Packet Animation**: Green packets pulse across the direct WAN link in real time.
2. **Inject Real-Time Failures**: Click `💥 Primary WAN Link (Gi0/1)` or `⚡ WAN MTU (1500 vs 1400)`.
3. **Witness Sub-Second Rerouting**: Watch packets instantly shift to the FortiGate IPsec tunnel, latency jump from 4.2ms to 92ms, and OSPF syslog alerts stream across the console.
4. **Interactive Device Terminal**: Select any device (`Site-A-R1`, `Site-B-R1`, `FortiGate`, `Site-A-SW1`) and type any command (`show ip route`, `show ip ospf neighbor`, `ping`, `traceroute`, `show access-lists`, `show crypto ikev2 sa`).

---

## 🗺️ Topology Diagram

![Enterprise Network Topology](diagrams/topology_diagram.svg)

### High-Resolution Logical Topology
```text
                            ┌────────────────────────┐
                            │    FortiGate NGFW      │
                            │  Firewall / IPsec VPN  │
                            └────┬──────────────┬────┘
                    port2 (WAN A)│              │port3 (WAN B)
                   198.51.100.2/30              │203.0.113.2/30
                                 │              │
                   IPsec Tunnel  │              │ IPsec Tunnel
                 ┌───────────────┘              └───────────────┐
                 │                                              │
          198.51.100.1/30                                203.0.113.1/30
         Gi0/0 (WAN)                                    Gi0/0 (WAN)
       ┌───────────┐                                  ┌───────────┐
       │  Site A   │            Direct WAN Link       │  Site B   │
       │  Router   ├──────────────────────────────────┤  Router   │
       └─────┬─────┘         Gi0/1: 172.16.12.1/30    └─────┬─────┘
             │               Gi0/1: 172.16.12.2/30          │
          Gi0/2 (Trunk)                                  Gi0/2 (Trunk)
             │ 802.1Q (VLAN 10, 20, 30)                     │ 802.1Q (VLAN 10, 20, 30)
       ┌─────┴─────┐                                  ┌─────┴─────┐
       │ Switch A  │                                  │ Switch B  │
       └──┬──┬──┬──┘                                  └──┬──┬──┬──┘
          │  │  │                                        │  │  │
    ┌─────┘  │  └─────┐                            ┌─────┘  │  └─────┐
    │        │        │                            │        │        │
 VLAN 10  VLAN 20  VLAN 30                      VLAN 10  VLAN 20  VLAN 30
 Users   Servers   Mgmt                         Users   Servers   Mgmt
```

---

## 📑 Project Navigation & Documentation Index

| Phase / Guide | Documentation Link | Key Technologies Covered |
| :--- | :--- | :--- |
| **IP Plan & Specs** | [docs/01_architecture_and_ip_plan.md](docs/01_architecture_and_ip_plan.md) | RFC 1918 Subnetting, Interface Matrix, Design Rationale |
| **Phase 1: Core Switching** | [docs/02_phase1_core_network.md](docs/02_phase1_core_network.md) | 802.1Q Trunks, ROAS, Native VLAN 99, Cisco DHCP, STP Hardening |
| **Phase 2: Dynamic Routing** | [docs/03_phase2_ospf_routing.md](docs/03_phase2_ospf_routing.md) | OSPFv2 Area 0, Metric Tuning (Cost 10 vs 100), Passive Subinterfaces |
| **Phase 3: Network Security** | [docs/04_phase3_network_security.md](docs/04_phase3_network_security.md) | Extended ACLs, Ingress Microsegmentation, FortiGate Policies, PAT |
| **Phase 4: IPsec VPN** | [docs/05_phase4_ipsec_vpn.md](docs/05_phase4_ipsec_vpn.md) | Route-based VTI, IKEv2 (AES-256, DH 14), MSS Clamping, DPD |
| **Phase 5: Failure Drills** | [docs/06_phase5_failure_drills.md](docs/06_phase5_failure_drills.md) | Fiber cut failover, Trunk Native VLAN mismatch, OSPF MTU stuck in ExStart |
| **Phase 6: NOC Runbook** | [docs/07_phase6_troubleshooting_runbook.md](docs/07_phase6_troubleshooting_runbook.md) | Issue → Symptoms → Commands → Root Cause → Fix → Verification |
| **Interview Cheat Sheet** | [docs/08_interview_cheat_sheet.md](docs/08_interview_cheat_sheet.md) | STAR Method Pitch, Top 15 Technical Q&A, Hiring Manager Tips |
| **Emulator Setup Guide** | [docs/09_emulator_setup_guide.md](docs/09_emulator_setup_guide.md) | GNS3, EVE-NG, and Cisco CML node mapping & deployment guide |
| **Enterprise Extensions** | [docs/10_advanced_possibilities_enterprise_extensions.md](docs/10_advanced_possibilities_enterprise_extensions.md) | HSRP Gateway, Cisco IP SLA, QoS LLQ, DHCP Snooping/DAI, FortiGate UTM, BGP |
| **Python Audit Engine** | [`scripts/audit_enterprise_configs.py`](scripts/audit_enterprise_configs.py) | Automated 52-point CIS/NIST security and configuration auditor |
| **Backup & Drift Engine** | [`scripts/backup_and_drift_detector.py`](scripts/backup_and_drift_detector.py) | Python automation for config snapshots, hashing, and drift detection |
| **Interactive Simulator** | [`tools/interactive_topology_viewer.html`](tools/interactive_topology_viewer.html) | Browser-based interactive topology & CLI command simulator |

---

## ⚙️ Device Configuration Library

All production-grade, copy-paste ready configurations are located in [`configs/`](configs/):

- **Site A Access Switch**: [`configs/cisco/Switch_A_Catalyst.ios.txt`](configs/cisco/Switch_A_Catalyst.ios.txt)
- **Site B Access Switch**: [`configs/cisco/Switch_B_Catalyst.ios.txt`](configs/cisco/Switch_B_Catalyst.ios.txt)
- **Site A Core Router**: [`configs/cisco/Router_A_ISR.ios.txt`](configs/cisco/Router_A_ISR.ios.txt)
- **Site B Core Router**: [`configs/cisco/Router_B_ISR.ios.txt`](configs/cisco/Router_B_ISR.ios.txt)
- **FortiGate NGFW**: [`configs/fortigate/FortiGate_NGFW.conf.txt`](configs/fortigate/FortiGate_NGFW.conf.txt)

---

## 📊 IP Addressing & Allocation Summary

| Segment | Site A Subnet | Site B Subnet | Description | Default Gateway |
| :--- | :--- | :--- | :--- | :--- |
| **VLAN 10 (Users)** | `10.10.10.0/24` | `10.20.10.0/24` | Corporate User Workstations (DHCP) | Router Subif `.1` |
| **VLAN 20 (Servers)** | `10.10.20.0/24` | `10.20.20.0/24` | Internal Servers & Infrastructure | Router Subif `.1` |
| **VLAN 30 (Management)**| `10.10.30.0/24` | `10.20.30.0/24` | Switch SVI Management & Bastion | Router Subif `.1` |
| **VLAN 99 (Native)** | *Unrouted* | *Unrouted* | Parked ports / Trunk native protection | N/A |
| **Direct P2P WAN** | `172.16.12.0/30` | `172.16.12.0/30` | Primary routed link (OSPF Cost 10) | Point-to-Point (`.1` <-> `.2`) |
| **Site A WAN Underlay** | `198.51.100.0/30` | — | Site A Router to FortiGate WAN Link | R1: `.1`, FGT port2: `.2` |
| **Site B WAN Underlay** | — | `203.0.113.0/30` | Site B Router to FortiGate WAN Link | R2: `.1`, FGT port3: `.2` |
| **IPsec Tunnel Overlay** | `10.255.255.0/30` | `10.255.255.4/30` | Route-Based VTI (OSPF Cost 100) | VTI Peers |

---

## 🛠️ Phase-by-Phase Technical Highlights

### Phase 1: Core Network & Switching
- **IEEE 802.1Q Trunking**: Encapsulates tags across single physical links connecting switches to routers.
- **Native VLAN Isolation**: Moved default VLAN 1 untagged traffic to dedicated, unrouted **VLAN 99** to eliminate VLAN hopping attacks.
- **Port Security & PortFast**: Workstation ports transition instantly to forwarding using `spanning-tree portfast`, protected with `bpduguard` and 2-MAC `sticky` limits.
- **Dynamic Addressing**: Built-in Cisco IOS DHCP pools delivering IP addresses, default gateways, and DNS configuration to workstations.

### Phase 2: Dynamic Routing (OSPFv2)
- **Single Area 0 Backbone**: Fully converged link-state database across Site A, Site B, and FortiGate.
- **Deterministic Path Preference**:
  - Direct Point-to-Point WAN link configured with `ip ospf cost 10` (Primary).
  - Encrypted IPsec VTI tunnel configured with `ip ospf cost 100` (Backup).
- **Passive Interfaces**: LAN subinterfaces set to passive to eliminate CPU overhead and prevent rogue route injection.

### Phase 3: Network Security & Firewall Policies
- **Extended Ingress ACLs**: Implements strict microsegmentation at the router subinterface layer:
  - Users are completely denied from reaching Management SVIs (`10.x.30.0/24`).
  - Users can only reach Web (`80`/`443`) and DNS (`53`) ports on the server segment. All other traffic is logged and dropped.
- **FortiGate NGFW Inspection**: Stateful policies inspect inter-site backup traffic and enforce Source NAT (PAT) for external traffic.

### Phase 4: Route-Based Site-to-Site IPsec VPN
- **IKEv2 (Phase 1)**: AES-CBC-256, SHA-256 HMAC, Diffie-Hellman Group 14 (2048-bit), Pre-Shared Key authentication.
- **ESP (Phase 2)**: AES-256 encryption with tunnel mode.
- **TCP MSS Clamping**: Configured `ip tcp adjust-mss 1360` to eliminate packet drops caused by IPsec encapsulation overhead exceeding the 1500-byte MTU.
- **Dead Peer Detection (DPD)**: Configured 10-second DPD keepalives to detect remote peer failure and initiate dynamic route reconvergence.

---

## 🚨 Phase 5: Failure Simulation Drills Summary

| Chaos Scenario | Injected Fault | Expected Behavior | Convergence Time |
| :--- | :--- | :--- | :--- |
| **Drill 1: Fiber Cut** | `shutdown` on `Gi0/1` (Primary WAN) | OSPF withdraws metric 10 route; instantly installs backup `Tunnel0` (metric 100). | `< 1 second` |
| **Drill 2: Native VLAN Mismatch** | Native VLAN changed on switch to 99, router left on 1 | CDP alerts `NATIVE_VLAN_MISMATCH`; STP places port into `PVID-Inconsistent` blocking mode. | Immediate |
| **Drill 3: MTU Mismatch** | WAN MTU set to 1400 on R1, 1500 on R2 | OSPF forms `2-WAY` but gets stuck in `EXSTART/EXCHANGE` due to DBD size rejection. | Permanent until fixed |
| **Drill 4: Access Misconfig** | Workstation port left in default VLAN 1 | Host receives APIPA `169.254.x.x` due to lack of DHCP on native VLAN. | Host timeout |

---

## 📋 Phase 6: NOC Incident Runbook Example

All production incidents follow our standardized 6-step lifecycle:
$$\textbf{Issue} \longrightarrow \textbf{Symptoms} \longrightarrow \textbf{Commands Used} \longrightarrow \textbf{Root Cause} \longrightarrow \textbf{Fix} \longrightarrow \textbf{Verification}$$

**Example Incident: MTU Mismatch Adjacency Failure**:
```text
1. Issue: OSPF adjacency failing between Site A and Site B after router replacement.
2. Symptoms: `show ip ospf neighbor` shows state stuck in `EXSTART/EXCHANGE`.
3. Commands: `show ip ospf interface Gi0/1`, `debug ip ospf adj`.
4. Root Cause: Router A interface MTU is 1400 bytes, while Router B interface MTU is 1500 bytes.
5. Fix: Set `ip mtu 1500` under `interface GigabitEthernet0/1` on Router A.
6. Verification: `show ip ospf neighbor` confirms transition to `FULL` state.
```
