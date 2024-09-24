# Variables
IMAGE_NAME = flask-change
DOCKERFILE = Dockerfile

# Installer les dépendances
install:
	pip install --upgrade pip && \
	pip install -r requirements.txt

# Linter pour Dockerfile et app.py
lint:
	docker run --rm -i hadolint/hadolint < $(DOCKERFILE)
	pylint --disable=R,C,W1203,W0702 app.py

# Tests
test:
	python -m pytest -vv --cov=app test_app.py

# Construire l'image Docker
build:
	docker build -t $(IMAGE_NAME):latest .

# Exécuter le conteneur Docker
run:
	docker run -p 8080:8080 $(IMAGE_NAME)

# Invoker l'application
invoke:
	curl http://127.0.0.1:8080/change/1/34

# Déployer avec Kubernetes
run-kube:
	kubectl apply -f kube-hello-change.yaml

# Cible par défaut pour tout exécuter
all: install lint test
