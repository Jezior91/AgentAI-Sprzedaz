@echo off
chcp 65001 >nul 2>&1
setlocal EnableDelayedExpansion

:: ============================================================
::   GENERATOR AGENTA AI — powered by Tasklet
::   Wersja 1.0 | Autor: Tom
:: ============================================================

color 0A
cls
echo.
echo  ╔══════════════════════════════════════════════════════════╗
echo  ║          🤖  GENERATOR AGENTA AI  🤖                     ║
echo  ║         Twój osobisty asystent biznesowy                 ║
echo  ╚══════════════════════════════════════════════════════════╝
echo.
echo  Ten kreator stworzy spersonalizowanego agenta AI
echo  skrojonego dokładnie pod Twoją firmę i branżę.
echo.
echo  Przygotuj się na kilka pytań — zajmie to ~2 minuty.
echo.
pause
cls

:: ============================================================
:: KROK 1 — DANE FIRMY
:: ============================================================
color 0B
cls
echo.
echo  ═══════════════════════════════════════════════════════════
echo   KROK 1/4  ^|  DANE FIRMY
echo  ═══════════════════════════════════════════════════════════
echo.
set /p FIRMA_NAZWA="  📌 Nazwa firmy: "
if "!FIRMA_NAZWA!"=="" set FIRMA_NAZWA=MojaFirma

echo.
set /p FIRMA_BRANZA="  🏭 Branża / sektor (np. IT, budowlana, handel): "
if "!FIRMA_BRANZA!"=="" set FIRMA_BRANZA=Ogólna

echo.
set /p FIRMA_LOKALIZACJA="  📍 Miasto / region działania: "
if "!FIRMA_LOKALIZACJA!"=="" set FIRMA_LOKALIZACJA=Polska

echo.
set /p KONTAKT_IMIE="  👤 Imię i nazwisko właściciela / kontaktu: "
if "!KONTAKT_IMIE!"=="" set KONTAKT_IMIE=Właściciel

echo.
set /p KONTAKT_EMAIL="  ✉️  Adres e-mail: "
if "!KONTAKT_EMAIL!"=="" set KONTAKT_EMAIL=kontakt@firma.pl

:: ============================================================
:: KROK 2 — OFERTA FIRMY
:: ============================================================
cls
echo.
echo  ═══════════════════════════════════════════════════════════
echo   KROK 2/4  ^|  CO OFERUJESZ
echo  ═══════════════════════════════════════════════════════════
echo.
echo  Opisz co Twoja firma oferuje klientom.
echo  (usługi, produkty, zakres prac — im więcej, tym lepszy agent)
echo.
set /p OFERTA_GLOWNA="  🛠️  Główna usługa/produkt: "
if "!OFERTA_GLOWNA!"=="" set OFERTA_GLOWNA=Usługi ogólne

echo.
set /p OFERTA_DODATKOWA="  ➕ Usługi dodatkowe (opcjonalne): "

echo.
set /p CENNIK_INFO="  💰 Informacja o cenach (np. od 500 PLN, wycena indywidualna): "
if "!CENNIK_INFO!"=="" set CENNIK_INFO=Wycena indywidualna

echo.
set /p CZAS_REALIZACJI="  ⏱️  Typowy czas realizacji zlecenia: "
if "!CZAS_REALIZACJI!"=="" set CZAS_REALIZACJI=Uzgadniany indywidualnie

:: ============================================================
:: KROK 3 — KLIENCI I KONTEKST
:: ============================================================
cls
echo.
echo  ═══════════════════════════════════════════════════════════
echo   KROK 3/4  ^|  TWOI KLIENCI I KONTEKST
echo  ═══════════════════════════════════════════════════════════
echo.
set /p KLIENT_TYP="  👥 Kto jest Twoim typowym klientem? (B2B/B2C/oba): "
if "!KLIENT_TYP!"=="" set KLIENT_TYP=B2B i B2C

echo.
set /p KLIENT_OPIS="  🎯 Opisz idealnego klienta (branża, wielkość, potrzeby): "
if "!KLIENT_OPIS!"=="" set KLIENT_OPIS=Małe i średnie firmy

echo.
set /p WYROZNIK="  ⭐ Co wyróżnia Twoją firmę od konkurencji?: "
if "!WYROZNIK!"=="" set WYROZNIK=Jakość i terminowość

echo.
set /p STYL_KOMUNIKACJI="  💬 Preferowany styl komunikacji (formalny/nieformalny/mieszany): "
if "!STYL_KOMUNIKACJI!"=="" set STYL_KOMUNIKACJI=Profesjonalny i przyjazny

:: ============================================================
:: KROK 4 — KONTEKST DODATKOWY
:: ============================================================
cls
echo.
echo  ═══════════════════════════════════════════════════════════
echo   KROK 4/4  ^|  DODATKOWY KONTEKST (opcjonalne)
echo  ═══════════════════════════════════════════════════════════
echo.
echo  Ten krok jest opcjonalny — im więcej podasz, tym lepszy agent.
echo.
set /p KONTEKST_PROBLEMY="  ❓ Największy problem w sprzedaży/obsłudze klienta: "

echo.
set /p KONTEKST_CELE="  🏆 Cel na najbliższe 6 miesięcy: "

echo.
set /p KONTEKST_NARZEDZIA="  🔧 Używane narzędzia (Gmail, Asana, CRM itp.): "
if "!KONTEKST_NARZEDZIA!"=="" set KONTEKST_NARZEDZIA=Email, telefon

echo.
set /p JEZYK_AGENTA="  🌍 Język agenta (PL/EN/oba): "
if "!JEZYK_AGENTA!"=="" set JEZYK_AGENTA=PL

:: ============================================================
:: GENEROWANIE AGENTA
:: ============================================================
cls
color 0E
echo.
echo  ⚙️  Generuję Twojego agenta AI...
echo.

:: Ustalamy datę i godzinę
for /f "tokens=1-5 delims=/: " %%a in ('echo %date% %time%') do (
    set DATAGEN=%%a-%%b-%%c
)

:: Nazwa pliku agenta (bez spacji)
set "AGENT_FILENAME=!FIRMA_NAZWA: =_!"
set "AGENT_FILENAME=!AGENT_FILENAME:/=_!"
set "AGENT_FILENAME=!AGENT_FILENAME:\=_!"
set "OUTPUT_DIR=%~dp0Agent_!AGENT_FILENAME!"

:: Tworzymy folder wyjściowy
mkdir "!OUTPUT_DIR!" >nul 2>&1

:: ---- Generujemy SKILL.md ----
(
echo ---
echo name: !AGENT_FILENAME!
echo description: Agent AI dla firmy !FIRMA_NAZWA! ^(branża: !FIRMA_BRANZA!^) — obsługuje oferty, klientów, zapytania i sprzedaż. Specjalizacja: !OFERTA_GLOWNA!.
echo ---
echo.
echo # 🤖 Agent AI — !FIRMA_NAZWA!
echo.
echo Jesteś inteligentnym asystentem biznesowym firmy **!FIRMA_NAZWA!**.
echo Działasz jak doświadczony handlowiec i doradca, który zna firmę od środka.
echo.
echo ---
echo.
echo ## 🏢 PROFIL FIRMY
echo.
echo ^| Parametr ^| Wartość ^|
echo ^|---^|---^|
echo ^| **Nazwa firmy** ^| !FIRMA_NAZWA! ^|
echo ^| **Branża** ^| !FIRMA_BRANZA! ^|
echo ^| **Lokalizacja** ^| !FIRMA_LOKALIZACJA! ^|
echo ^| **Kontakt** ^| !KONTAKT_IMIE! \(!KONTAKT_EMAIL!\) ^|
echo ^| **Typ klientów** ^| !KLIENT_TYP! ^|
echo ^| **Język** ^| !JEZYK_AGENTA! ^|
echo.
echo ---
echo.
echo ## 🛠️ OFERTA
echo.
echo ### Główna usługa / produkt
echo !OFERTA_GLOWNA!
echo.
echo ### Usługi dodatkowe
echo !OFERTA_DODATKOWA!
echo.
echo ### Cennik
echo !CENNIK_INFO!
echo.
echo ### Czas realizacji
echo !CZAS_REALIZACJI!
echo.
echo ---
echo.
echo ## 🎯 IDEALNY KLIENT
echo.
echo !KLIENT_OPIS!
echo.
echo ---
echo.
echo ## ⭐ WYRÓŻNIKI FIRMY
echo.
echo !WYROZNIK!
echo.
echo ---
echo.
echo ## 💬 STYL KOMUNIKACJI
echo.
echo !STYL_KOMUNIKACJI!
echo.
echo Dostosowuj ton do rozmówcy. Zawsze bądź:
echo - Profesjonalny i konkretny
echo - Pomocny i zorientowany na rozwiązanie
echo - Naturalny, nie robotyczny
echo.
echo ---
echo.
echo ## 📋 KOMENDY KTÓRE ROZUMIESZ
echo.
echo ### 📄 OFERTY
echo - `"zrób ofertę dla [klient]"` — przygotuj spersonalizowaną ofertę
echo - `"popraw ofertę"` — ulepsz poprzednią wersję
echo - `"wyślij ofertę"` — prześlij przez email
echo.
echo ### 👤 KLIENCI
echo - `"dodaj klienta [dane]"` — zapisz nowego klienta
echo - `"co wiem o kliencie X"` — pełny profil
echo - `"pokaż wszystkich klientów"` — lista
echo.
echo ### 📅 ZADANIA
echo - `"dodaj zadanie [opis]"` — nowe zadanie
echo - `"co mam dziś do zrobienia"` — dzienny plan
echo.
echo ### 🧠 NAUKA
echo - `"zapamiętaj że..."` — zapisz nową wiedzę
echo - `"popraw to tak..."` — feedback i korekta stylu
echo.
echo ---
echo.
echo ## 🔧 UŻYWANE NARZĘDZIA
echo.
echo !KONTEKST_NARZEDZIA!
echo.
echo ---
echo.
echo ## 🏆 CELE BIZNESOWE
echo.
echo !KONTEKST_CELE!
echo.
echo ---
echo.
echo ## ❗ ZNANE WYZWANIA
echo.
echo !KONTEKST_PROBLEMY!
echo.
echo ---
echo.
echo ## ⚡ ZASADY DZIAŁANIA
echo.
echo 1. Zawsze działasz w interesie firmy **!FIRMA_NAZWA!**
echo 2. Znasz ofertę na pamięć i prezentujesz ją pewnie
echo 3. Każdą ofertę dopasowujesz do potrzeb konkretnego klienta
echo 4. Uczysz się z każdej korekty i feedbacku
echo 5. Jeśli czegoś nie wiesz — mówisz to wprost i szukasz odpowiedzi
echo 6. Komunikujesz się w stylu: !STYL_KOMUNIKACJI!
echo.
echo ---
echo.
echo *Wygenerowano automatycznie przez Generator Agenta AI*
echo *Data: !DATAGEN! ^| Firma: !FIRMA_NAZWA!*
) > "!OUTPUT_DIR!\SKILL.md"

:: ---- Generujemy README ----
(
echo # 🤖 Agent AI — !FIRMA_NAZWA!
echo.
echo Twój spersonalizowany agent AI jest gotowy!
echo.
echo ## Jak uruchomić agenta?
echo.
echo ### Opcja 1 — Tasklet ^(zalecane^)
echo 1. Wejdź na https://tasklet.ai
echo 2. Załóż konto lub zaloguj się
echo 3. Wgraj plik `SKILL.md` do folderu workspace/home/!AGENT_FILENAME!/
echo 4. Agent pojawi się automatycznie jako nowa umiejętność
echo.
echo ### Opcja 2 — Lokalnie
echo Plik `SKILL.md` możesz otworzyć w dowolnym edytorze
echo i użyć jako instrukcję systemową dla ChatGPT, Claude lub innego modelu.
echo.
echo ## Zawartość paczki
echo - `SKILL.md` — definicja agenta AI
echo - `README.md` — ten plik z instrukcją
echo.
echo ## Dane firmy
echo - Firma: !FIRMA_NAZWA!
echo - Branża: !FIRMA_BRANZA!
echo - Oferta: !OFERTA_GLOWNA!
echo - Wygenerowano: !DATAGEN!
echo.
echo ---
echo Wygenerowano przez Generator Agenta AI
) > "!OUTPUT_DIR!\README.md"

:: ---- Generujemy plik konfiguracyjny JSON ----
(
echo {
echo   "agent": {
echo     "nazwa_firmy": "!FIRMA_NAZWA!",
echo     "branza": "!FIRMA_BRANZA!",
echo     "lokalizacja": "!FIRMA_LOKALIZACJA!",
echo     "kontakt_imie": "!KONTAKT_IMIE!",
echo     "kontakt_email": "!KONTAKT_EMAIL!",
echo     "oferta_glowna": "!OFERTA_GLOWNA!",
echo     "oferta_dodatkowa": "!OFERTA_DODATKOWA!",
echo     "cennik": "!CENNIK_INFO!",
echo     "czas_realizacji": "!CZAS_REALIZACJI!",
echo     "typ_klientow": "!KLIENT_TYP!",
echo     "opis_klienta": "!KLIENT_OPIS!",
echo     "wyroznik": "!WYROZNIK!",
echo     "styl_komunikacji": "!STYL_KOMUNIKACJI!",
echo     "narzedzia": "!KONTEKST_NARZEDZIA!",
echo     "jezyk": "!JEZYK_AGENTA!",
echo     "wygenerowano": "!DATAGEN!"
echo   }
echo }
) > "!OUTPUT_DIR!\agent_config.json"

:: ============================================================
:: SUKCES
:: ============================================================
color 0A
cls
echo.
echo  ╔══════════════════════════════════════════════════════════╗
echo  ║         ✅  AGENT WYGENEROWANY POMYŚLNIE!  ✅            ║
echo  ╚══════════════════════════════════════════════════════════╝
echo.
echo  📁 Pliki zostały zapisane w folderze:
echo     !OUTPUT_DIR!
echo.
echo  📄 Zawartość paczki:
echo     ✓ SKILL.md       — definicja agenta AI
echo     ✓ README.md      — instrukcja instalacji
echo     ✓ agent_config.json — dane konfiguracyjne
echo.
echo  🚀 Jak aktywować agenta?
echo.
echo  1. Wejdź na: https://tasklet.ai
echo  2. Wgraj SKILL.md do swojego workspace
echo  3. Agent jest gotowy do działania!
echo.
echo  💡 Możesz też użyć SKILL.md jako system prompt
echo     w ChatGPT, Claude lub innym modelu AI.
echo.
echo  ════════════════════════════════════════════════════════
echo.

:: Otwieramy folder z wynikami
start "" "!OUTPUT_DIR!"

echo  Naciśnij dowolny klawisz aby zakończyć...
pause >nul

endlocal
exit /b 0
