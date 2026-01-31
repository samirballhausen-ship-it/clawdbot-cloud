# 🎯 Deine To-Do Liste - Zeabur Setup (5 Minuten)

Ich brauche dich nur für die **Browser-Aktionen im Zeabur Dashboard**. Danach übernehme ich komplett!

---

## ✅ Schritt 1: Zeabur Account + GitHub verbinden (2 Min)

1. **Öffne:** https://zeabur.com
2. **Klick auf:** "Sign in with GitHub"
3. **Autorisiere** Zeabur (falls noch nicht verbunden)
4. **Fertig!** Dashboard öffnet sich

---

## ✅ Schritt 2: Neues Project erstellen (1 Min)

1. **Klick auf:** "Create New Project" (oder "+ New Project")
2. **Name eingeben:** `clawdbot-production`
3. **Region wählen:** **Europe** (Frankfurt oder Amsterdam)
4. **Klick auf:** "Create"

---

## ✅ Schritt 3: GitHub Repository verbinden (1 Min)

1. **Im Project Dashboard klick:** "Deploy New Service"
2. **Wähle:** "GitHub"
3. **Falls Popup erscheint:** GitHub App autorisieren
4. **Suche:** `clawdbot-cloud` (Repository sollte erscheinen)
5. **Klick auf:** Das Repository
6. **Klick auf:** "Deploy" (oder "Import")

**WICHTIG:** Zeabur startet jetzt automatisch den Build - das ist OK!
Der Build wird **fehlschlagen** weil Environment Variables fehlen - das ist normal!

---

## ✅ Schritt 4: Service-Name setzen (30 Sek)

Falls Zeabur nach einem Namen fragt:
1. **Service Name:** `clawdbot-gateway`
2. **Branch:** `master` (oder `main` - wird auto-erkannt)
3. **Klick:** "Continue" oder "Deploy"

---

## ✅ Schritt 5: Warte auf Build-Fehlschlag (Optional)

Der erste Build wird fehlschlagen - **das ist OK und erwartet!**

Du kannst direkt weitermachen oder warten bis Build failed.

---

## ✅ Schritt 6: Screenshot vom Dashboard machen

**WICHTIG:** Ich brauche einen Screenshot, damit ich die Zeabur UI sehe!

1. **Öffne:** Dein Zeabur Project Dashboard
2. **Stelle sicher man sieht:**
   - Das Project "clawdbot-production"
   - Den Service "clawdbot-gateway"
   - Die Tabs (Variables, Volumes, Logs, etc.)
3. **Mach Screenshot:** Windows + Shift + S
4. **Speichere als:** `C:\temp\zeabur-dashboard.png`

---

## ✅ Schritt 7: Claude Chrome Extension öffnen

**JETZT KOMMT DER WICHTIGSTE TEIL:**

1. **Öffne Claude Code** (dieses Fenster hier)
2. **Sage mir:**
   ```
   Screenshot ist hier: C:\temp\zeabur-dashboard.png
   Zeabur Dashboard ist offen im Browser
   ```

3. **Ich übernehme ab hier!** Ich werde:
   - Den Browser via Claude-in-Chrome steuern
   - Environment Variables setzen
   - Volumes konfigurieren
   - Deployment triggern
   - Telegram Webhook setzen
   - Alles testen
   - Lokales System deaktivieren

---

## 🎯 Zusammenfassung - Was du machst:

| Schritt | Aktion | Zeit |
|---------|--------|------|
| 1 | Zeabur Login mit GitHub | 30 Sek |
| 2 | Project "clawdbot-production" erstellen | 30 Sek |
| 3 | GitHub Repo verbinden | 1 Min |
| 4 | Service-Name setzen | 30 Sek |
| 5 | Screenshot vom Dashboard | 30 Sek |
| 6 | Claude bescheid geben | 10 Sek |

**Total:** ~3-4 Minuten

---

## 🤖 Was ich danach autonom mache:

- Browser-Steuerung via Claude-in-Chrome
- Environment Variables aus `ZEABUR_ENV_VARS.txt` setzen
- Volumes erstellen und konfigurieren
- Re-Deploy triggern
- Logs überwachen
- Telegram Webhook konfigurieren
- Tests durchführen
- Lokales WSL2 System stoppen
- Backup erstellen
- Finale Bestätigung

**Zeit:** ~10-15 Minuten (komplett autonom)

---

## 📸 Screenshot-Tipp

Der Screenshot sollte ungefähr so aussehen:
```
┌─────────────────────────────────────┐
│ Zeabur Dashboard                    │
├─────────────────────────────────────┤
│ Project: clawdbot-production        │
│                                     │
│ ┌──────────────────────────────┐   │
│ │ clawdbot-gateway             │   │
│ │ [Variables] [Volumes] [Logs] │   │
│ └──────────────────────────────┘   │
└─────────────────────────────────────┘
```

---

## ✅ Bereit?

Sobald du die Schritte 1-6 erledigt hast:

**Sag mir einfach:**
> "Zeabur ist ready, Screenshot: C:\temp\zeabur-dashboard.png"

**Oder wenn der Tab bereits offen ist:**
> "Zeabur Tab ist offen, mach weiter!"

Dann übernehme ich komplett! 🚀
