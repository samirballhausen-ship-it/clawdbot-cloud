# Deployment-Anleitung

## Zeabur Environment Variables

Kopiere diese Values in das Zeabur Dashboard unter **Service → Variables**:

```bash
# Anthropic API
ANTHROPIC_API_KEY=<aus lokalem System>

# Telegram Bot
TELEGRAM_BOT_TOKEN=<aus lokaler config>

# Gateway Auth
GATEWAY_TOKEN=<aus lokaler config>
REMOTE_TOKEN=<aus lokaler config>

# Skills API Keys
NANO_BANANA_PRO_API_KEY=<aus lokaler config>
OPENAI_API_KEY=<aus lokaler config>
BRAVE_API_KEY=<aus lokaler config>

# System
NODE_ENV=production
CLAWDBOT_WORKSPACE=/data/workspace
CLAWDBOT_CONFIG=/data/.clawdbot
GOG_KEYRING_PASSWORD=clawdbot2026
```

## Zeabur Volumes

Erstelle folgende Volumes im Dashboard:

1. **clawdbot-workspace**
   - Mount Path: `/data/workspace`
   - Size: 5 GB

2. **clawdbot-config**
   - Mount Path: `/data/.clawdbot`
   - Size: 1 GB

3. **clawdbot-memory**
   - Mount Path: `/data/.clawdbot/memory`
   - Size: 2 GB

## Deployment Steps

1. Push zu GitHub: `git push origin main`
2. Zeabur deployed automatisch
3. Check Logs: Zeabur Dashboard → Service → Logs
4. Verify Gateway URL: `https://<service>.zeabur.app`

## Post-Deployment

1. Telegram Webhook konfigurieren (automatisch oder manuell)
2. Test-Nachricht an Bot senden
3. Logs prüfen

## Rollback

Bei Problemen lokales System neu starten:
```bash
wsl systemctl --user start clawdbot-gateway.service
```
