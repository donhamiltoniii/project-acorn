#!/bin/bash

echo "GitHub Container Registry Setup"
echo "=============================="

read -p "GitHub Username: " GITHUB_USERNAME
read -p "GitHub Email: " GITHUB_EMAIL
read -s -p "GitHub Token (PAT): " GITHUB_TOKEN
read -p "Namespace name: " NAMESPACE
echo # New line after hidden input

# Validate inputs
if [[ -z "$GITHUB_USERNAME" || -z "$GITHUB_TOKEN" || -z "$GITHUB_EMAIL" ]]; then
    echo "Error: All fields are required"
    exit 1
fi

# Create namespace first
kubectl create namespace $NAMESPACE --dry-run=client -o yaml | kubectl apply -f -

# Create pull secret for GitHub Container Registry
kubectl create secret docker-registry ghcr-secret \
  --docker-server=ghcr.io \
  --docker-username="$GITHUB_USERNAME" \
  --docker-password="$GITHUB_TOKEN" \
  --docker-email="$GITHUB_EMAIL" \
  -n $NAMESPACE

echo "✅ Secrets created successfully!"
