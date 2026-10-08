# PC Fix Log
One numbered section per issue. Results: ✅ worked, ❌ didn't, ⏳ pending.

## Issue 1: Windows 11 Pro won't activate with G2A keys
Status: 🔍 **waiting on refund** (2026-10-08)

### Findings (2026-10-08)
- New PC build, Windows 11 **Pro** installed. Two keys bought on G2A minutes before testing.
- Settings → Activation → Change product key: both keys → "product key has already been used on another device".
- `slmgr /ipk <key>` → "installed successfully" (install only). `slmgr /ato` → **0xC004C008**: "The activation server determined that the specified product key could not be used." = key already used up on other machines.
- Edition matches (Pro key, Pro install), so not an edition problem.

| Date | Fix | Result |
|---|---|---|
| 2026-10-08 | Change product key in Settings (both keys) | ❌ already used on another device |
| 2026-10-08 | `slmgr /ipk` + `slmgr /ato` | ❌ 0xC004C008 |
| 2026-10-08 | Phone activation (`slui 4`) | ⏳ started, low odds for resold keys |
| 2026-10-08 | Refund request sent to G2A seller with error screenshot | ⏳ |

Notes: unactivated Windows still works fully (watermark + no personalization only). If buying another G2A key: high-volume seller (98%+), "Retail" listing, Pro edition, activate immediately.
