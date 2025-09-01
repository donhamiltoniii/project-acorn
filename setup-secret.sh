#!/bin/bash

# Create namespace first
kubectl create namespace project-acorn --dry-run=client -o yaml | kubectl apply -f -

# Create pull secret for GitHub Container Registry
kubectl create secret docker-registry ghcr-secret \
  --docker-server=ghcr.io \
  --docker-username=YOUR_GITHUB_USERNAME \
  --docker-password=YOUR_GITHUB_TOKEN \
  --docker-email=YOUR_EMAIL \
  -n project-acorn