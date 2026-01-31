# Clawdbot Cloud - Zeabur Deployment

24/7 AI Assistant basierend auf [Clawdbot](https://github.com/clawdbot/clawdbot) - deployed auf Zeabur Cloud Platform.

## Über dieses Projekt

Dieses Repository enthält die Cloud-Konfiguration für Clawdbot, einen autonomen AI-Assistenten powered by Claude (Anthropic).

**Deployed Service:** [Zeabur Cloud](https://zeabur.com)

## Features

- 🤖 **24/7 Verfügbarkeit** - Läuft dauerhaft in der Cloud
- 💬 **Telegram Integration** - Via `@SamirClaudeRemote_bot`
- 🧠 **Persistent Memory** - LanceDB Vector Database
- 🔧 **Skills & Plugins** - Erweiterbar via Skills
- 📊 **Auto-Deploy** - GitHub Push → Zeabur Auto-Deployment

## Workspace-Dateien

Dieses Repository enthält die Core-Konfiguration:

- `AGENTS.md` - Workspace Onboarding & Memory-Richtlinien
- `SOUL.md` - Persönlichkeit & Verhalten
- `TOOLS.md` - Lokale Tools & API-Konfiguration
- `IDENTITY.md` - Bot-Identität
- `USER.md` - User-Informationen (Samir)
- `HEARTBEAT.md` - Periodische Tasks

## Deployment

Auto-Deploy via GitHub:
```bash
git push origin main
```

Zeabur baut automatisch ein neues Image und deployed es.

## Environment Variables

Erforderliche Environment Variables (in Zeabur Dashboard):
- `ANTHROPIC_API_KEY` - Claude API Key
- `TELEGRAM_BOT_TOKEN` - Telegram Bot Token
- `GATEWAY_TOKEN` - Gateway Auth Token
- Weitere siehe `.env.example`

## Lokale Entwicklung

```bash
npm install
npm start
```

## Support

- **Clawdbot Docs:** https://docs.clawd.bot
- **Zeabur Docs:** https://zeabur.com/docs

---

**Status:** 🚀 In Production
