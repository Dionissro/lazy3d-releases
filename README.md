# Lazy3D

Jednoduchý 3D modelár pre 3D tlač a laser – po slovensky, bez predplatného, beží priamo v Macu bez internetu.

- 2D náčrt → 3D: vytiahnutie, rotácia, zaoblenie a skosenie hrán, škrupina, závity (skrutka aj matica)
- šípky na ťahanie rozmerov priamo v 3D, vytiahnutie steny jedným ťahom
- text v náčrte (aj písma z Macu), export STL / 3MF / STEP a náčrtu do DXF / SVG pre laser
- obrys podložky tlačiarne, svetlý aj tmavý režim

## Stiahnutie

**[⬇ Stiahnuť Lazy3D (najnovšia verzia)](https://github.com/Dionissro/lazy3d-releases/releases/latest/download/Lazy3D.dmg)**

Mac s Apple čipom (M1 a novšie) aj s Intelom, macOS 13 Ventura a novší.
Zoznam verzií a zmien: [Releases](https://github.com/Dionissro/lazy3d-releases/releases)

## Inštalácia – najjednoduchšie (bez upozornenia)

Otvor **Terminál** (⌘ medzerník → napíš Terminál), vlož tento riadok a stlač Enter:

```bash
curl -fsSL https://raw.githubusercontent.com/Dionissro/lazy3d-releases/main/install.sh | bash
```

Stiahne najnovšiu verziu, dá ju do priečinka Aplikácie a otvorí ju. macOS sa na nič nepýta,
lebo súbor nesťahuje prehliadač. Tým istým príkazom sa dá Lazy3D kedykoľvek preinštalovať.
Čo príkaz robí, si môžeš pozrieť v súbore [install.sh](install.sh).

## Inštalácia cez stiahnutý súbor

1. Stiahni [Lazy3D.dmg](https://github.com/Dionissro/lazy3d-releases/releases/latest/download/Lazy3D.dmg),
   otvor ho a potiahni Lazy3D do priečinka **Aplikácie**.
2. Pri prvom otvorení ho macOS zastaví, lebo aplikácia nie je z App Store.
   Klikni **Hotovo**, otvor **Nastavenia systému → Súkromie a bezpečnosť**, zroluj dole
   a pri Lazy3D klikni **Aj tak otvoriť**. (macOS 13–14: pravý klik na Lazy3D → Otvoriť.)

Nové verzie si Lazy3D nájde samo a ponúkne aktualizáciu.

## Licencie a zdrojový kód

Lazy3D © 2026 Tobias Lorencovič. Aplikácia obsahuje súčasti tretích strán – zoznam a plné znenie licencií
je priamo v aplikácii v menu **Pomoc → Licencie a zdrojový kód** (alebo Nastavenia → O aplikácii):

| Súčasť | Licencia |
|---|---|
| Open CASCADE Technology (CAD jadro, cez replicad-opencascadejs) | LGPL 2.1 |
| replicad, three.js, opentype.js, fflate, Electron | MIT |
| Clipper (clipper-lib) | Boost Software License 1.0 |
| Písma Roboto, Big Shoulders Stencil Text | SIL Open Font License 1.1 |
| Chromium a Node.js (súčasť Electronu) | zoznam licencií je v aplikácii |

**Zdrojový kód CAD jadra (LGPL 2.1).** Open CASCADE Technology je v Lazy3D samostatný súbor
(`replicad_single.wasm`) a dá sa nahradiť vlastnou upravenou verziou. Zdrojový kód:

- zostavenie replicad-opencascadejs 1.1.0: https://github.com/sgenoud/replicad/tree/v1.1.0/packages/replicad-opencascadejs
- nástroj opencascade.js (verzia ebd263f1): https://github.com/taucad/opencascade.js
- Open CASCADE Technology: https://github.com/Open-Cascade-SAS/OCCT

Na požiadanie na info@dionis.sk poskytneme kompletný zdrojový kód tejto knižnice v presne použitej verzii,
najmenej 3 roky od vydania danej verzie Lazy3D.
