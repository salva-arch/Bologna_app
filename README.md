# Bologna a Quattro

Familien-Reisefuehrer als statische Web-App. Single-File (`index.html`), kein Build-Schritt.

## Deployment (CI/CD)

Pipeline: `.github/workflows/deploy.yml`

- **Pull Request** -> Job `test` (JS-Syntax-Check, Stil-Check). Kein Deploy.
- **Push/Merge auf `main`** -> `test`, danach automatisches Deploy auf GitHub Pages.

### Einmalige Einrichtung

1. Dateien dieses Pakets ins Repo legen und pushen:
   ```bash
   git clone git@github.com:salva-arch/Bologna_app.git
   cd Bologna_app
   # Paket-Inhalt hierher kopieren (index.html, .github/, supabase/, README.md)
   git add -A
   git commit -m "feat: v2.3.0 Web-Build mit CI/CD"
   git push origin main
   ```
2. Auf GitHub: **Settings -> Pages -> Source: GitHub Actions** waehlen.
3. Nach dem ersten gruenen Lauf ist die App live unter:
   `https://salva-arch.github.io/Bologna_app/`

### Geteilter Speicher (Supabase, optional aber empfohlen)

Ohne Konfiguration nutzt der Web-Build `localStorage`: alles funktioniert,
Haken/Notizen/Fotos gelten aber nur pro Geraet.

Fuer geteilten Speicher wie im Artefakt:

1. Supabase-Projekt anlegen (kostenloser Tier reicht).
2. `supabase/schema.sql` im SQL-Editor ausfuehren.
3. In `index.html` oben im `CONFIG`-Block `SUPABASE_URL` und
   `SUPABASE_ANON_KEY` eintragen, committen, pushen. Fertig.

**Hinweis:** Die Policies sind bewusst offen (jeder mit dem Link darf
schreiben), identisch zum geteilten Artefakt-Speicher. Keine sensiblen
Daten ablegen.

### Release-Prozess (Continuous Delivery)

Feature-Branch -> Pull Request (CI laeuft) -> Review -> Merge = Release.
Versionsnummer im Footer von `index.html` pflegen (`Version x.y.z`).
