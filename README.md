# 🦖 TLab Monitor (Homelab Auto-Healing System)

**TLab Monitor** is an advanced, AI-driven infrastructure monitoring and auto-healing system tailored for self-hosted environments and homelabs, built entirely on top of **n8n**.

*Read this in other languages: [English](README.md), [Tiếng Việt](README_VN.md).*

---

## 🚀 Core Features / Các Tính Năng Cốt Lõi
* **Zero-Token RAG Bypass:** Automatically retrieves successful remediation lessons from the past to fix recurring issues (0ms delay, zero AI API costs).
* **Dynamic Multi-Executor:** Eliminates hardcoded IPs. Automatically injects `asset_type` metadata and securely routes commands via Proxmox API (QEMU/LXC) or Docker Engine API.
* **Smart Guardrails (Circuit Breaker):** Prevents catastrophic crash loops. Automatically locks the execution pipeline and escalates if a target fails >1 time within a 10-minute window.
* **Human-in-the-Loop:** Integrates Ntfy Push Notifications with interactive Action Buttons, allowing engineers to manually approve or reject high-risk recovery tasks right from their phones.

## 🏗️ System Architecture / Kiến Trúc Hệ Thống
* **Automation Engine:** n8n
* **Database & AI Memory:** PostgreSQL (Audit Trail & RAG Memory)
* **Observability Stack:** Prometheus, Alertmanager, cAdvisor
* **AI Model Gateway:** OpenRouter API (e.g., `ling-3.0-flash`)
* **Compute Targets:** Docker Engine, Proxmox VE (QEMU/LXC)

---

## 🛠️ Quick Start Deployment / Hướng Dẫn Cài Đặt Nhanh

**Step 1: Clone repository & Configure environment / Tải mã nguồn & Cấu hình môi trường**
```bash
git clone https://github.com/tdev8x/tlab-monitor.git
cd tlab-monitor
cp .env.example .env
nano .env
Step 2: Spin up the Core Stack / Khởi chạy toàn bộ hệ thống

Bash
docker compose up -d
Step 3: Import n8n Workflows / Nhập Workflows vào n8n

Access your n8n instance at http://<SERVER_IP>:5678 and create an Admin account.

Go to Settings > Credentials, add a PostgreSQL connection named PostgreSQL Homelab (Database: tlab_db, password matching your .env).

Import the 4 JSON files in /n8n-workflows and toggle them to Active.

📚 Documentation / Tài Liệu Kỹ Thuật
English Technical Spec (HTML)

Tài liệu Kỹ thuật Tiếng Việt (HTML)

📜 License
This project is open-sourced for the Homelab and DevOps community.