# PowerShell Script: ANTHROPIC_API_KEY aus WSL2 extrahieren
# Ausfuehren mit: powershell .\extract-anthropic-key.ps1

Write-Host "Extracting ANTHROPIC_API_KEY from WSL2 ~/.bashrc..." -ForegroundColor Cyan

$key = wsl bash -c 'source ~/.bashrc 2>/dev/null && echo $ANTHROPIC_API_KEY'

if ($key) {
    Write-Host "`nANTHROPIC_API_KEY gefunden:" -ForegroundColor Green
    Write-Host $key -ForegroundColor Yellow
    Write-Host "`nKopiere diesen Key in Zeabur Dashboard -> Variables" -ForegroundColor Cyan

    # Optional: In Zwischenablage kopieren
    $key | Set-Clipboard
    Write-Host "`n✓ Key wurde in die Zwischenablage kopiert!" -ForegroundColor Green
} else {
    Write-Host "`n✗ ANTHROPIC_API_KEY nicht gefunden in ~/.bashrc" -ForegroundColor Red
    Write-Host "Versuche manuelle Suche..." -ForegroundColor Yellow

    wsl bash -c 'cat ~/.bashrc | grep -i anthropic'
}

Write-Host "`nDruecke Enter zum Beenden..."
Read-Host
