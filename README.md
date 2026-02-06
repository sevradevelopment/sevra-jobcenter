# sevra-jobcenter

A **plug & play Job Center** for FiveM that works **out of the box** with **ESX**, **QBCore**, and has a safe **standalone fallback**.  
No setup, no edits, no adapters needed — just ensure and go.

---

## ✨ Features

- ✅ Works with **ESX Legacy**
- ✅ Works with **QBCore**
- ✅ Automatic framework detection
- ✅ ox_lib context menu
- ✅ ox_target interaction
- ✅ NPC Job Center
- ✅ Configurable jobs
- ✅ Cooldown protection
- ✅ Blip included
- ✅ Clean & lightweight
- ✅ Open source / free

---.

## 📦 Requirements

- **ox_lib**
- **ox_target**
- **oxmysql** (required by most servers anyway)
- ESX **or** QBCore (for job setting)

> ⚠️ If no supported framework is found, the script will not crash and will notify the player instead.

---

## 📁 Installation

1. Download or clone this repository
2. Place `sevra-jobcenter` into your `resources` folder
3. Ensure required dependencies
4. Add to your `server.cfg`

### server.cfg
```cfg
ensure oxmysql

# ESX or QBCore
ensure [core]        # ESX (es_extended inside)
# ensure qb-core     # QBCore

ensure ox_lib
ensure ox_target
ensure sevra-jobcenter
