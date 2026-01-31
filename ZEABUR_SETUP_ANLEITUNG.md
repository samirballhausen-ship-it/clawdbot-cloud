# Zeabur Setup - Schritt-für-Schritt Anleitung

Da der Bot keinen Browser-Zugriff hat, musst du die folgenden Schritte **manuell im Zeabur Dashboard** durchführen.

## Status

✅ **Erledigt:**
- GitHub Repository erstellt: https://github.com/samirballhausen-ship-it/clawdbot-cloud
- Alle Config-Dateien erstellt und gepusht
- Environment Variables vorbereitet

🔄 **Nächste Schritte (MANUELL):**

---

## Phase 5: Zeabur Project Setup

### 5.1 Zeabur Account & Project

1. Öffne: https://zeabur.com
2. Login mit GitHub Account
3. Klicke auf "New Project"
4. Name: `clawdbot-production`
5. Region: **Europe** (Frankfurt oder Amsterdam)
6. Klicke "Create Project"

### 5.2 GitHub Repository verbinden

1. Im Project Dashboard: "Deploy New Service"
2. Wähle "GitHub"
3. Falls nicht verbunden: "Connect GitHub"
4. Autorisiere Zeabur GitHub App
5. Suche Repository: `samirballhausen-ship-it/clawdbot-cloud`
6. Wähle aus und klicke "Deploy"

### 5.3 Service Basis-Konfiguration

1. Service Name: `clawdbot-gateway`
2. Branch: `master`
3. Build Method: Auto-detect (zbpack wird erkannt)
4. Port: Automatisch von Zeabur gesetzt

---

## Phase 6: Persistent Storage

Gehe zu Service → **Volumes** Tab:

### Volume 1: Workspace
- Name: `clawdbot-workspace`
- Mount Path: `/data/workspace`
- Size: **5 GB**

### Volume 2: Config
- Name: `clawdbot-config`
- Mount Path: `/data/.clawdbot`
- Size: **1 GB**

⚠️ **Wichtig:** Volumes löschen existierende Daten beim ersten Mount!

---

## Phase 8: Environment Variables

Gehe zu Service → **Variables** Tab:

### Methode 1: Raw Editor (empfohlen)

Klicke auf "Raw" und kopiere folgendes ein:

```
ANTHROPIC_API_KEY=<siehe extract-anthropic-key.ps1>
TELEGRAM_BOT_TOKEN=<siehe ZEABUR_ENV_VARS.txt lokal>
GATEWAY_TOKEN=<siehe ZEABUR_ENV_VARS.txt lokal>
REMOTE_TOKEN=<siehe ZEABUR_ENV_VARS.txt lokal>
NANO_BANANA_PRO_API_KEY=<siehe ZEABUR_ENV_VARS.txt lokal>
OPENAI_API_KEY=<siehe ZEABUR_ENV_VARS.txt lokal>
BRAVE_API_KEY=<siehe ZEABUR_ENV_VARS.txt lokal>
NODE_ENV=production
CLAWDBOT_WORKSPACE=/data/workspace
CLAWDBOT_CONFIG=/data/.clawdbot
GOG_KEYRING_PASSWORD=<siehe ZEABUR_ENV_VARS.txt lokal>
```

**WICHTIG:** Alle echten API Keys findest du in der lokalen Datei:
- **`ZEABUR_ENV_VARS.txt`** (nicht in Git!)
- Führe `extract-anthropic-key.ps1` aus für ANTHROPIC_API_KEY

### Methode 2: Einzeln eintragen

Klicke "Add Variable" für jede Variable einzeln.

---

## Phase 7: Workspace-Daten Upload

**Option A: Basis-Setup (nur Core-Files - bereits via Git)**
- Alle Core-Files (AGENTS.md, SOUL.md, etc.) sind bereits im Repository
- Zeabur deployed sie automatisch nach `/data/workspace`

**Option B: Volle Migration (Skills, Projects, Memory)**

Nach dem ersten Deployment:

1. Installiere Zeabur CLI:
```bash
npm install -g @zeabur/cli
zeabur login
```

2. Kopiere Workspace-Daten:
```bash
# In WSL2 ausführen
cd /home/samir/clawd
tar czf ~/clawd-workspace.tar.gz .

# In Windows
wsl cp /home/samir/clawd-workspace.tar.gz /mnt/c/temp/
```

3. Upload via Zeabur CLI oder Web Interface

**Oder manuell später:** Skills und Projekte können nach dem Deployment nachinstalliert werden.

---

## Phase 9: Deployment starten

1. Nach allen Konfigurationen: **"Deploy"** klicken
2. Build-Logs beobachten (sollte ~1-2 Minuten dauern)
3. Status: **Running** warten

**Gateway URL notieren:**
- Format: `https://clawdbot-gateway-<project-id>.zeabur.app`

---

## Phase 10: Telegram Webhook

### Automatisch (wenn Bot läuft):
Bot konfiguriert Webhook selbst beim Start.

### Manuell (falls nötig):

```bash
curl -X POST "https://api.telegram.org/bot<TELEGRAM_BOT_TOKEN>/setWebhook" \
  -d "url=https://clawdbot-gateway-<DEINE-PROJECT-ID>.zeabur.app/telegram/webhook"
```

Verify:
```bash
curl "https://api.telegram.org/bot<TELEGRAM_BOT_TOKEN>/getWebhookInfo"
```

---

## Phase 11: Tests

1. **Telegram Test:**
   - Sende Nachricht an `@SamirClaudeRemote_bot`
   - Bot sollte antworten

2. **Logs prüfen:**
   - Zeabur Dashboard → Service → Logs
   - Nach Errors suchen

3. **Gateway Test:**
   - Öffne: `https://<gateway-url>/?token=<GATEWAY_TOKEN>`
   - WebChat sollte funktionieren

---

## Nach erfolgreichen Tests

Wenn alles funktioniert, kannst du Phase 12-13 durchführen:

### Phase 12: Lokales WSL2 deaktivieren

```bash
wsl systemctl --user stop clawdbot-gateway.service
wsl systemctl --user disable clawdbot-gateway.service
```

Backup erstellen:
```bash
wsl tar -czf ~/clawdbot-backup-$(date +%Y%m%d).tar.gz /home/samir/clawd/
wsl tar -czf ~/clawdbot-config-backup-$(date +%Y%m%d).tar.gz /home/samir/.clawdbot/
```

Auto-Start Script deaktivieren:
- Datei umbenennen: `C:\Users\samir\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\start-wsl-clawdbot.vbs.disabled`

---

## Troubleshooting

**Build Failed:**
- Logs prüfen in Zeabur Dashboard
- Oft: npm install failed → Check package.json

**Gateway antwortet nicht:**
- Environment Variables prüfen
- Logs für Startup-Errors checken

**Telegram nicht verbunden:**
- Webhook URL prüfen
- Bot Token verifizieren

**Volumes leer:**
- Erster Mount löscht Daten
- Workspace-Upload via CLI nötig

---

## Rollback bei Problemen

```bash
wsl systemctl --user start clawdbot-gateway.service
```

Telegram Webhook zurück auf lokal:
```bash
curl -X POST "https://api.telegram.org/bot<TELEGRAM_BOT_TOKEN>/setWebhook" \
  -d "url=http://127.0.0.1:18789/telegram/webhook"
```

---

## Status-Tracking

- [ ] ✅ Zeabur Project erstellt
- [ ] ✅ GitHub Repository verbunden
- [ ] ✅ Volumes konfiguriert
- [ ] ✅ Environment Variables gesetzt
- [ ] ✅ Deployment erfolgreich
- [ ] ✅ Telegram Bot antwortet
- [ ] ✅ Lokales System gestoppt

**Viel Erfolg! 🚀**
