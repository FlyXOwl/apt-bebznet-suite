.PHONY: build clean install test remove reinstall help

build:
	@echo "Compilation du package .deb pour bebznet-suite en cours..."
	dpkg-buildpackage -us -uc -b
	@echo "Build compilé avec succès. Le package .deb est situé dans le répertoire parent."
	@ls -lh ../bebznet-suite*.deb

clean:
	@echo "Nettoyage des fichiers de build pour bebznet-suite..."
	rm -rf debian/bebznet-suite
	rm -f ../bebznet-suite*.deb ../bebznet-suite*.changes ../bebznet-suite*.buildinfo
	dh_clean

install: build
	@echo "Installation de bebznet-suite..."
	dpkg -i ../bebznet-suite*.deb
	apt-get install -f -y
	@echo "Installation terminée"
	@echo "Executez sudo bebznet-config pour modifier la configuration"

remove:
	@echo "Suppression de bebznet-suite..."
	apt-get remove -y bebznet-suite 2>/dev/null || true
	@echo "bebznet-suite supprimé"

reinstall: remove clean install

test: install
	@echo "Test de l'installation de bebznet-suite..."
	@which bebznet-config || (echo "bebznet-config introuvable"; exit 1)
	@echo "bebznet-config trouvé"

help:
	@echo "Outil de configuration pour bebznet-suite"
	@echo ""
	@echo "Commandes disponibles:"
	@echo "  make build      - Compiler le package .deb"
	@echo "  make clean      - Nettoyer les fichiers de build"
	@echo "  make install    - Compiler et installer localement"
	@echo "  make remove     - Supprimer le package installé"
	@echo "  make reinstall  - Nettoyer, recompiler, et installer"
	@echo "  make test       - Exécuter les tests"
	@echo "  make help       - Afficher ce message d'aide"
	@echo ""
	@echo "Exemple d'utilisation:"
	@echo "  make clean"
	@echo "  make build"
	@echo "  make install"
	@echo "  sudo bebznet-config"