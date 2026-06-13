# chinese-teaching-video-system

Open-source pipeline for AI Chinese-teaching shorts: browser console, prompt templates & FFmpeg automation. Built in public.

## Business Context

- **Category:** AI workflow infrastructure
- **Audience:** AI builders, creators, independent developers, and small teams that want repeatable local AI workflows.
- **Repository status:** Public repository. Keep examples, docs, and issues free of credentials, private data, and machine-specific paths.
- **Topics:** ai-video, chinese-learning, content-automation, education, ffmpeg, prompt-engineering, web-console, youtube-shorts, automation, chinese-teaching, content-creation, shorts

## What This Project Is For

- Open-source pipeline for AI Chinese-teaching shorts: browser console, prompt templates & FFmpeg automation. Built in public.
- Package repeatable AI workflows into reusable local assets.
- Reduce one-off prompt work by keeping skills, guardrails, and handoff files versioned.

## Where It Fits

This repository is part of a broader AI local-workbench operating model: reusable skills, local automation, auditable configuration, and repeatable delivery workflows.

## Technical Overview

- **Primary language:** JavaScript
- **Detected stack:** JavaScript, Node.js / JavaScript tooling
- **Default branch:** `main`
- **Visibility:** `PUBLIC`
- **License:** MIT License

## Repository Map

- `CLAUDE.md`
- `LICENSE`
- `PROJECT_SPEC.md`
- `README.md`
- `README_CN.md`
- `SECURITY.md`
- `assets`
- `config`
- `docs`
- `scripts`

## Quick Start

Use the commands that match the current project state:

```bash
npm install
npm run capture:media
```

| Command | Purpose |
|---|---|
| `npm run capture:media` | node scripts/capture_console_media.mjs |

## Operating Notes

- Keep real credentials out of the repository. Use local environment files, GitHub repository secrets, or the deployment platform secret manager.
- If a `.env.example` file exists, treat it as documentation only; never commit filled-in `.env` files.
- Before publishing screenshots, demos, or client examples, remove private names, internal paths, account IDs, and API endpoints.
- The `Repository Hygiene` workflow is intended as a lightweight guardrail, not a replacement for product-specific tests.

## Delivery Checklist

- [ ] README describes the user, business outcome, and operating boundary.
- [ ] Setup or preview commands are current.
- [ ] No real secrets, private user data, or machine-local state are tracked.
- [ ] Screenshots, demos, or sample outputs are safe to share publicly when the repository is public.
- [ ] Product-specific tests or smoke checks are documented before production use.

## Roadmap

- Tighten the fastest path from clone to useful demo.
- Add project-specific screenshots, sample outputs, or a short walkthrough where useful.
- Promote repeated manual steps into scripts, tests, or documented workflows.
- Keep security, privacy, and licensing boundaries explicit as the project evolves.

## Maintainer Notes

Maintained by [Tony Sheng](https://github.com/shengdabai). This README is written as a business-facing handoff: it should help a future collaborator, client, or reviewer understand why the repository exists, how to inspect it, and what must be true before it is reused or shipped.
