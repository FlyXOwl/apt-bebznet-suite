# apt-bebznet-suite

Un installateur complet de **stack réseau basé sur Docker** pour **serveurs Debian (≥12)**.

Une seule commande pour déployer **Pi-hole, Nginx, WireGuard, Uptime Kuma, Portainer, CrowdSec, Samba et FileBrowser** avec une configuration CLI interactive.

---

## Fonctionnalités

- **Configuration CLI Interactive** - Configuration simple basée sur des menus avec `gum`
- **Basé sur Docker** - Tous les services s'exécutent dans des conteneurs
- **Modulaire** - Sélectionnez uniquement les services dont vous avez besoin
- **Installation en une commande** - Simplement `apt install bebznet-suite`
- **Pré-configuré** - paramètres par défaut sensibles pour tout
- **Sécurisé** - paquets signés GPG
- **Debian 12+** - Fonctionne sur toutes les versions modernes de Debian

---

## Services Inclus

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

## Installation

### Étape 1 : Ajouter la clé GPG

```bash
curl -fsSL https://raw.githubusercontent.com/FlyXOwl/apt-bebznet-suite/main/pubkey.gpg | sudo gpg --dearmor -o /usr/share/keyrings/bebznet-archive-keyring.gpg
```

### Étape 2 : Ajouter le dépôt

```bash
CODENAME="$(. /etc/os-release && echo "$VERSION_CODENAME")"
echo "deb [signed-by=/usr/share/keyrings/bebznet-archive-keyring.gpg] https://flyxowl.github.io/apt-bebznet-suite $CODENAME main" | sudo tee /etc/apt/sources.list.d/bebznet.list
```

### Étape 3 : Mettre à jour et installer

```bash
sudo apt update
sudo apt install bebznet-suite
```

### Étape 4 : Configurer et déployer

```bash
sudo bebznet-config
```


---

## Utilisation

### Démarrer le menu de configuration

```bash
sudo bebznet-config
```

### Options du menu principal

```
Configurer les services   - Configurer les services individuels
Déployer la stack        - Déployer les conteneurs Docker
Voir la configuration    - Voir les paramètres actuels
Arrêter/Supprimer la stack - Gérer les conteneurs
À propos                 - À propos de bebznet-suite
Quitter                  - Quitter le programme
```

### Configuration initiale

1. Sélectionnez **"Configurer les services"**
2. Choisissez les services à installer (utilisez la barre d'espacement pour sélectionner plusieurs)
3. Remplissez la configuration pour chaque service
4. Sélectionnez **"Déployer la stack"**
5. Attendez que les conteneurs démarrent
6. Accédez aux services via navigateur

---

## Accès aux services

Après le déploiement, les services sont disponibles à l'adresse :

```
Administration Pi-hole:     http://YOUR_IP/admin
Nginx:                      http://YOUR_IP:8080
Portainer:                  http://YOUR_IP:9000
Uptime Kuma:                http://YOUR_IP:3001
FileBrowser:                http://YOUR_IP:8080/fb
WireGuard Easy:             http://YOUR_IP:51821
```

Consultez `/etc/bebznet/*.env` pour les identifiants.

---

## Documentation

### Voir la configuration actuelle

```bash
sudo bebznet-config
# Sélectionnez : Voir la configuration
```

### Mettre à jour la configuration

Exécutez simplement `sudo bebznet-config` à nouveau et sélectionnez les services à reconfigurer.

### Gérer la stack

```bash
sudo bebznet-config
# Sélectionnez : Arrêter/Supprimer le stack
```

Options :
- Arrêter les conteneurs (conserve les données)
- Supprimer les conteneurs (conserve les données)
- Supprimer les conteneurs et supprimer toutes les données

---

## Mise à jour

### Mettre à jour vers la dernière version

```bash
sudo apt update
sudo apt upgrade bebznet-suite
```

### Mettre à jour les services individuels

Les services sont mis à jour lorsque vous récupérez les dernières images de conteneurs :

```bash
cd /opt/bebznet
sudo docker-compose pull
sudo docker-compose up -d
```

---

## Désinstallation

### Supprimer le paquet uniquement (Garder les données)

```bash
sudo apt remove bebznet-suite
```

### Suppression complète (Supprimer toutes les données)

```bash
sudo apt remove bebznet-suite
sudo rm -rf /opt/bebznet
sudo rm -rf /etc/bebznet
sudo rm -rf /usr/share/bebznet
```

### Supprimer le dépôt

```bash
sudo rm /etc/apt/sources.list.d/bebznet.list
sudo rm /usr/share/keyrings/bebznet-archive-keyring.gpg
sudo apt update
```

---

## Dépannage

### Docker non installé

```bash
sudo apt update
sudo apt install docker.io docker-compose
sudo usermod -aG docker $USER
newgrp docker
```

### Les services ne démarrent pas

Consultez les logs Docker :

```bash
cd /opt/bebznet
docker-compose logs -f
```

### Port déjà en utilisation

Modifiez les fichiers `.env` dans `/etc/bebznet/` pour changer les ports, puis redéployez.

---

## Notes de sécurité

- Tous les paquets sont **signés GPG** pour l'authenticité
- Les identifiants sont stockés localement dans `/etc/bebznet/`
- Les services utilisent des paramètres sécurisés par défaut
- **Modifiez les mots de passe par défaut immédiatement**
- Envisagez d'utiliser un pare-feu pour restreindre l'accès

---

## Licence

GPL-3.0 - Voir le fichier [LICENSE](LICENSE)

---

## Auteur

**FlyXOwl**

- GitHub : [@FlyXOwl](https://github.com/FlyXOwl)

---

## Support

- [Documentation](https://github.com/FlyXOwl/apt-bebznet-suite#readme)
- [Suivi des problèmes](https://github.com/FlyXOwl/apt-bebznet-suite/issues)

---
