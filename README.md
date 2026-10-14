# Lazy3D

Jednoduchý 3D modelár pre 3D tlač a laser – po slovensky, bez predplatného, beží priamo v počítači bez internetu.
Pre **Mac** aj **Windows**.

- 2D náčrt → 3D: vytiahnutie, rotácia, zaoblenie a skosenie hrán, škrupina, závity (skrutka aj matica)
- šípky na ťahanie rozmerov priamo v 3D, vytiahnutie steny jedným ťahom
- text v náčrte (aj písma z počítača), export STL / 3MF / STEP a náčrtu do DXF / SVG pre laser
- obrys podložky tlačiarne, svetlý aj tmavý režim

## Stiahnutie

| | |
|---|---|
| **Mac** | **[⬇ Stiahnuť Lazy3D pre Mac](https://github.com/Dionissro/lazy3d-releases/releases/latest/download/Lazy3D.dmg)** – Apple čip (M1 a novšie) aj Intel, macOS 13 Ventura a novší |
| **Windows** | **[⬇ Stiahnuť Lazy3D pre Windows](https://github.com/Dionissro/lazy3d-releases/releases/latest/download/Lazy3D-Setup.exe)** – Windows 10 a 11, 64-bit |

Odkazy vedú vždy na najnovšiu verziu. Zoznam verzií a zmien: [Releases](https://github.com/Dionissro/lazy3d-releases/releases).
Nové verzie si Lazy3D nájde samo a ponúkne aktualizáciu.

## Mac

### Najjednoduchšie – jedným príkazom (bez upozornenia)

Otvor **Terminál** (⌘ medzerník → napíš Terminál), vlož tento riadok a stlač Enter:

```bash
curl -fsSL https://raw.githubusercontent.com/Dionissro/lazy3d-releases/main/install.sh | bash
```

Stiahne najnovšiu verziu, dá ju do priečinka Aplikácie a otvorí ju. macOS sa na nič nepýta,
lebo súbor nesťahuje prehliadač. Tým istým príkazom sa dá Lazy3D kedykoľvek preinštalovať.
Čo príkaz robí, si môžeš pozrieť v súbore [install.sh](install.sh).

### Cez stiahnutý súbor

1. Stiahni [Lazy3D.dmg](https://github.com/Dionissro/lazy3d-releases/releases/latest/download/Lazy3D.dmg),
   otvor ho a potiahni Lazy3D do priečinka **Aplikácie**.
2. Pri prvom otvorení ho macOS zastaví, lebo aplikácia nie je z App Store.
   Klikni **Hotovo**, otvor **Nastavenia systému → Súkromie a bezpečnosť**, zroluj dole
   a pri Lazy3D klikni **Aj tak otvoriť**. (macOS 13–14: pravý klik na Lazy3D → Otvoriť.)

## Windows

### Cez stiahnutý súbor

1. Stiahni [Lazy3D-Setup.exe](https://github.com/Dionissro/lazy3d-releases/releases/latest/download/Lazy3D-Setup.exe) a spusti ho.
2. Ak sa objaví modré okno **„Systém Windows ochránil váš počítač“**, klikni **Ďalšie informácie → Spustiť aj tak**
   (aplikácia zatiaľ nemá platený podpisový certifikát).
3. Klikni **Inštalovať**. Heslo správcu netreba – Lazy3D sa nainštaluje len pre teba.

Lazy3D potom nájdeš v ponuke **Štart** a na ploche, projekty `.lazy3d` sa otvárajú dvojklikom.
Odinštalovanie: **Nastavenia → Aplikácie → Lazy3D → Odinštalovať** (tvoje projekty zostanú).

### Jedným príkazom (bez upozornenia)

Otvor **PowerShell** (Štart → napíš PowerShell), vlož tento riadok a stlač Enter:

```powershell
irm https://raw.githubusercontent.com/Dionissro/lazy3d-releases/main/install.ps1 | iex
```

Stiahne najnovšiu verziu, nainštaluje ju a otvorí. Upozornenie SmartScreen sa neukáže, lebo súbor nesťahuje
prehliadač. Čo príkaz robí, si môžeš pozrieť v súbore [install.ps1](install.ps1).

## Licencie a zdrojový kód

Lazy3D © 2026 Tobias Lorencovič. Aplikácia obsahuje súčasti tretích strán – zoznam a plné znenie licencií
je priamo v aplikácii v menu **Pomoc → Licencie a zdrojový kód** (alebo Nastavenia → O aplikácii):

| Súčasť | Licencia |
|---|---|
| Open CASCADE Technology (CAD jadro, cez replicad-opencascadejs) | LGPL 2.1 |
| replicad, three.js, opentype.js, fflate, Electron | MIT |
| Clipper (clipper-lib) | Boost Software License 1.0 |
| QR Code Generator (qrcode-generator, Kazuhiko Arase) – „QR Code“ je ochranná známka DENSO WAVE | MIT |
| Písma Roboto, Big Shoulders Stencil Text | SIL Open Font License 1.1 |
| Chromium a Node.js (súčasť Electronu) | zoznam licencií je v aplikácii |

**Zdrojový kód CAD jadra (LGPL 2.1).** Open CASCADE Technology je v Lazy3D samostatný súbor
(`replicad_single.wasm`) a dá sa nahradiť vlastnou upravenou verziou. Zdrojový kód:

- zostavenie replicad-opencascadejs 1.1.0: https://github.com/sgenoud/replicad/tree/v1.1.0/packages/replicad-opencascadejs
- nástroj opencascade.js (verzia ebd263f1): https://github.com/taucad/opencascade.js
- Open CASCADE Technology: https://github.com/Open-Cascade-SAS/OCCT

Na požiadanie na info@dionis.sk poskytneme kompletný zdrojový kód tejto knižnice v presne použitej verzii,
najmenej 3 roky od vydania danej verzie Lazy3D.
