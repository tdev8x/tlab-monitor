Markdown
# 🦖 TLab Monitor (Homelab Auto-Healing System)

**TLab Monitor** is an advanced, AI-driven infrastructure monitoring and auto-healing system tailored for self-hosted environments and homelabs, built entirely on top of **n8n**.

By integrating Agentic AI capabilities (LLMs) into the SRE loop, the system can digest Prometheus alerts, dynamically auto-discover compute assets (Proxmox/Docker), query a Zero-Token RAG memory for past solutions, or let the AI autonomously reason and execute recovery commands—all while protected by a strict anti-crash-loop circuit breaker.

## 🚀 Core Features
* **Zero-Token RAG Bypass:** Automatically retrieves successful remediation lessons from the past to fix recurring issues (0ms delay, zero AI API costs).
* **Dynamic Multi-Executor:** Eliminates hardcoded IPs. Automatically injects `asset_type` metadata and securely routes commands via Proxmox API (QEMU/LXC) or Docker Engine API.
* **Smart Guardrails (Circuit Breaker):** Prevents catastrophic crash loops. Automatically locks the execution pipeline and escalates if a target fails >1 time within a 10-minute window.
* **Human-in-the-Loop:** Integrates Ntfy Push Notifications with interactive Action Buttons, allowing engineers to manually approve or reject high-risk recovery tasks right from their phones.

## 🏗️ System Architecture
* **Automation Engine:** n8n
* **Database & AI Memory:** PostgreSQL (Audit Trail & RAG Memory)
* **Observability Stack:** Prometheus, Alertmanager, cAdvisor
* **AI Model Gateway:** OpenRouter API (e.g., `ling-3.0-flash`)
* **Compute Targets:** Docker Engine, Proxmox VE (QEMU/LXC)

## 🛠️ Quick Start Deployment
1. **Clone the repository:**
   ```bash
   git clone https://github.com/tdev8x/tlab-monitor.git
   cd tlab-monitor
   
Configure Environment:
Copy the example config and fill in your API keys (OpenRouter, Proxmox, Ntfy).

Bash
cp .env.example .env
Spin up the Core Stack:
This will deploy PostgreSQL, n8n, Docker Proxy, and the Prometheus stack.

Bash
docker compose up -d
Import n8n Workflows:
Navigate to your n8n instance and import the 4 JSON files located in the /n8n-workflows directory. Enable them.

Dive Deeper: Open docs/Technical_Spec_EN.html for detailed architecture diagrams and schema definitions.

🌍 Languages
English Documentation (README.md)

Tài liệu Tiếng Việt (README_VN.md)

📜 License
This project is open-sourced for the Homelab and DevOps community.