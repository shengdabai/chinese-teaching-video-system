#!/usr/bin/env node

import { mkdir } from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { chromium } from "playwright";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const repoRoot = path.resolve(__dirname, "..");
const mediaDir = path.join(repoRoot, "docs", "media");
const framesDir = path.join(mediaDir, "gif-frames");
const appUrl = `file://${path.join(repoRoot, "console", "index.html")}`;

async function ensureDirs() {
  await mkdir(mediaDir, { recursive: true });
  await mkdir(framesDir, { recursive: true });
}

async function wait(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function capture() {
  await ensureDirs();

  const browser = await chromium.launch({
    channel: "chrome",
    headless: true
  });

  const context = await browser.newContext({
    viewport: { width: 1440, height: 1200 },
    colorScheme: "dark",
    deviceScaleFactor: 1
  });

  const page = await context.newPage();
  await page.goto(appUrl, { waitUntil: "load" });
  await page.waitForTimeout(1200);

  await page.click("#seed-demo-data");
  await page.waitForTimeout(900);

  await page.screenshot({
    path: path.join(mediaDir, "console-home.png"),
    fullPage: false
  });

  const frames = [
    { tab: "topic-intake", file: "frame-01-topic.png" },
    { tab: "script-engine", file: "frame-02-script.png" },
    { tab: "prompt-builder", file: "frame-03-prompts.png" },
    { tab: "clip-inbox", file: "frame-04-assets.png" },
    { tab: "auto-editor", file: "frame-05-editor.png" },
    { tab: "publish-dashboard", file: "frame-06-publish.png" }
  ];

  for (const frame of frames) {
    await page.click(`[data-tab="${frame.tab}"]`);
    await page.waitForTimeout(600);
    await page.screenshot({
      path: path.join(framesDir, frame.file),
      fullPage: false
    });
  }

  await wait(200);
  await browser.close();
}

capture().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
