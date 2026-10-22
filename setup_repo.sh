
set -e

echo "🚀 Initializing HackForge Repository..."
git init
git branch -M main

# ==========================================
# COMMIT 1: Project Setup, Ignore & README
# ==========================================
cat << 'EOF' > .gitignore
__pycache__/
*.py[cod]
*$py.class
.env
.venv
venv/
ENV/
.DS_Store
cache.json
EOF

cat << 'EOF' > .env.example
# TinyFish API Configuration
TINYFISH_API_KEY=your_tinyfish_api_key_here
TINYFISH_BASE_URL=https://api.tinyfish.ai/v1
PORT=8000
EOF

cat << 'EOF' > requirements.txt
fastapi==0.115.0
uvicorn==0.30.6
httpx==0.27.2
pydantic==2.9.2
python-dotenv==1.0.1
EOF

cat << 'EOF' > README.md
# ⚒️ HackForge
> **"Great Ideas, Stronger Teams, Forge Your Future"** — AI-driven hackathon teammate discovery with live web portfolio verification and project scoping via **TinyFish**.

## 🎯 The Problem
Hackathon participants need more than a directory of people who say they can code:
1. **The Discovery Gap:** Builders struggle to find peers joining the same event.
2. **Missing Skill Coverage:** A squad of 4 backend coders lacks UI/UX, hardware, research, or pitching skills.
3. **Misaligned Expectations:** Differences in commitment and availability break teams mid-sprint.

## 💡 Our Solution: Complementarity > Similarity
Standard recommender systems pair identical profiles. **HackForge** maximizes coverage of missing roles across Dev, Design, Hardware, Research, and Pitching:
- **Live Web Project Scoping (TinyFish API):** Searches live technical documentation and fetches dependencies to infer required team roles.
- **Automated Role-Gap Detection:** Compares project stack requirements against current team skills.
- **Explainable Match Reasoning:** Scores candidates using:
  `Fit = Skill Complementarity (40%) + Shared Interests (25%) + Availability (20%) + Goal Alignment (15%)`

## 🐟 TinyFish Integration Spotlight
HackForge integrates **TinyFish Search API** and **TinyFish Fetch API** in `backend/tinyfish_client.py`:
1. **Search (`/v1/search`):** Queries live developer docs, SDKs, and APIs for the user's project idea.
2. **Fetch (`/v1/fetch`):** Pulls clean, structured markdown content from the top URLs to identify technical complexity and missing roles.
3. **7-Day Response Caching:** Reduces API costs to **< ₹3.20 per free user** (~85% Pro Gross Margin).
4. **Resilient Fallback:** Automatically falls back to deterministic stack analysis if the API key is unconfigured or rate-limited during demo evaluation.

## 💰 Revenue Model & Unit Economics
- **Builder Tier (₹0/mo):** Core matching + 3 TinyFish scans/month.
- **HackForge Pro (₹199/mo):** Unlimited live briefs & priority matching (~85% gross margin).
- **Organizer B2B Pass (₹4,999/event):** White-label portal & verified cohort analytics.

## 🛠️ Quick Start (Run Locally)
```bash
git clone <your-repo-url>
cd hackforge
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
cp .env.example .env      # Add your TINYFISH_API_KEY (optional fallback built-in)
uvicorn backend.main:app --reload --port 8000
