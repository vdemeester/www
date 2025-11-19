# Makefile for deploying the static website

# Default deployment target - can be overridden with: make deploy DEPLOY_TARGET=user@host:/path
DEPLOY_TARGET ?= kerkouane.vpn:/var/www/vincent.demeester.fr

# Rsync options:
# -a: archive mode (recursive, preserves permissions, timestamps, etc.)
# -v: verbose
# -z: compress during transfer
# -e ssh: use ssh as the remote shell
# --delete: delete files in destination that don't exist in source
# --exclude: exclude patterns
RSYNC_OPTS = -avz -e ssh --delete \
	--exclude='.git' \
	--exclude='.gitignore' \
	--exclude='.claude' \
	--exclude='CLAUDE.md' \
	--exclude='AGENTS.md' \
	--exclude='Makefile'

.PHONY: deploy
deploy:
	@echo "Deploying to $(DEPLOY_TARGET)..."
	rsync $(RSYNC_OPTS) ./ $(DEPLOY_TARGET)
	@echo "Deployment complete!"

.PHONY: deploy-dry-run
deploy-dry-run:
	@echo "Dry run deployment to $(DEPLOY_TARGET)..."
	rsync $(RSYNC_OPTS) --dry-run ./ $(DEPLOY_TARGET)

.PHONY: help
help:
	@echo "Available targets:"
	@echo "  deploy          - Deploy the website to the target server"
	@echo "  deploy-dry-run  - Show what would be deployed without actually deploying"
	@echo "  help           - Show this help message"
	@echo ""
	@echo "Variables:"
	@echo "  DEPLOY_TARGET  - Deployment destination (default: $(DEPLOY_TARGET))"
	@echo ""
	@echo "Examples:"
	@echo "  make deploy"
	@echo "  make deploy DEPLOY_TARGET=user@example.com:/var/www/site"
	@echo "  make deploy-dry-run"
