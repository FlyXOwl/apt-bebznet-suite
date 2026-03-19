# apt-bebznet-suite

Un installateur complet de **stack réseau basé sur Docker** pour **serveurs Debian (≥12)**.

Une seule commande pour déployer **Pi-hole, Nginx, WireGuard, Uptime Kuma, Portainer, CrowdSec, Samba et FileBrowser** avec une configuration CLI interactive.

---

# Fonctionnalités

- **Configuration CLI Interactive** - Configuration simple basée sur des menus avec `gum`
- **Basé sur Docker** - Tous les services s'exécutent dans des conteneurs
- **Modulaire** - Sélectionnez uniquement les services dont vous avez besoin
- **Installation en une commande** - Simplement `apt install bebznet-suite`
- **Pré-configuré** - paramètres par défaut sensibles pour tout
- **Sécurisé** - paquets signés GPG
- **Debian 12+** - Fonctionne sur toutes les versions modernes de Debian

---

# Services Inclus

| Service | Objectif | Port |
|---------|----------|------|
| **Pi-hole** | DNS et blocage des publicités | 53, 80, 443 |
| **Unbound** | Résolveur DNS | 5053 |
| **Nginx** | Proxy inverse | 80, 443 |
| **WireGuard Easy** | Gestion VPN | 51820, 51821 |
| **Uptime Kuma** | Surveillance de l'uptime | 3001 |
| **Portainer** | Interface Web Docker | 9000 |
| **CrowdSec** | Détection des menaces | 6060 |
| **Samba** | Partage de fichiers | 137, 138, 139, 445 |
| **FileBrowser** | Gestionnaire de fichiers Web | 8080 |

---

# Wiki

Pour comprendre et voir comment utiliser bebznet-suite, referez vous au [WIKI](https://github.com/FlyXOwl/apt-bebznet-suite/wiki)
