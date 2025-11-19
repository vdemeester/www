# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a static HTML website - Vincent Demeester's personal website. It uses plain HTML and CSS with no build process or dependencies.

## Architecture

- **No build process**: This is a pure static site with HTML and CSS files served directly
- **Styling**: Uses Tufte CSS, a minimalist CSS framework inspired by Edward Tufte's design principles
  - Custom version with `@font-face` declarations removed to use system fonts only (Palatino fallback stack)
  - Located in `tufte.css`

## File Structure

- `index.html` - Main landing page with personal introduction and content links
- `tufte.css` - Tufte CSS stylesheet (modified to remove external font dependencies)
- Future pages should follow the same simple HTML structure

## Development

Since this is a static site:
- No installation or build commands needed
- Simply open `index.html` in a browser to preview
- Any HTTP server can serve the files (e.g., `python -m http.server`)

## Design Principles

- Keep it simple and minimal
- Use semantic HTML
- Tufte CSS provides responsive typography and layout
- No JavaScript dependencies
- Persistent URIs (don't break links)
