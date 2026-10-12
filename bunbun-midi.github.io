<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="color-scheme" content="dark" />
  <title>Split Portal</title>

  <style>
	  .app-links {
    display: grid;
    gap: 12px;
    max-width: 850px;
  }

  .app-link {
    display: block;
    padding: 16px 18px;
    border: 1px solid #237b87;
    border-radius: 14px;
    background: linear-gradient(135deg, #081c2b, #092b29);
    color: #b5e7e5;
    font-family: "SFMono-Regular", Consolas, "Liberation Mono", monospace;
    font-size: 12px;
    line-height: 1.75;
    text-decoration: none;
    overflow-wrap: anywhere;
    box-shadow: 0 4px 16px rgb(0 20 30 / 18%);
    transition:
      border-color 180ms ease,
      box-shadow 180ms ease,
      transform 180ms ease;
  }

  .app-link-title {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 12px;
    margin-bottom: 7px;
    color: #67e8d0;
    font-size: 13px;
    font-weight: 700;
    letter-spacing: 0.04em;
  }

  .app-link-arrow {
    color: #6ecfff;
    font-size: 17px;
  }

  .app-link-description {
    display: block;
  }

  .app-link:hover {
    border-color: #58e1ce;
    box-shadow:
      0 0 0 1px rgb(88 225 206 / 12%),
      0 6px 24px rgb(30 190 180 / 16%);
    transform: translateY(-2px);
  }

  .app-link:focus-visible {
    outline: 2px solid #6ecfff;
    outline-offset: 4px;
  }

  @media (prefers-reduced-motion: reduce) {
    .app-link {
      transition: none;
    }

    .app-link:hover {
      transform: none;
    }
  }
    :root {
      --bg: #13091f;
      --panel: #1c0c2e;
      --panel-2: #260e43;
      --purple: #a855f7;
      --purple-bright: #d8a4ff;
      --purple-deep: #5b167d;
      --line: rgba(216, 164, 255, 0.28);
      --text: #f5eaff;
      --muted: #b89acb;
      --bar-size: 12px;
    }

    * {
      box-sizing: border-box;
    }

    html,
    body {
      width: 100%;
      height: 100%;
      margin: 0;
      overflow: hidden;
      background:
        radial-gradient(circle at 20% 0%, rgba(168, 85, 247, 0.20), transparent 32%),
        radial-gradient(circle at 85% 100%, rgba(113, 32, 184, 0.18), transparent 38%),
        var(--bg);
      color: var(--text);
      font-family: Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
    }

    body.dragging {
      cursor: col-resize;
      user-select: none;
    }

    .app {
      height: 100%;
      display: flex;
      flex-direction: column;
      padding: 8px;
      gap: 7px;
    }

    header {
      min-height: 34px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 12px;
      padding: 0 8px 0 10px;
      border: 1px solid var(--line);
      border-radius: 10px;
      background: linear-gradient(100deg, rgba(38, 14, 67, 0.92), rgba(24, 8, 42, 0.92));
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.24);
    }

    .brand {
      display: flex;
      align-items: center;
      gap: 8px;
      min-width: 0;
    }

    .orb {
      width: 14px;
      height: 14px;
      flex: 0 0 auto;
      border-radius: 50%;
      background: radial-gradient(circle at 35% 28%, #fff, #dd95ff 24%, #8f2ccc 52%, #3a0d5e 75%);
      box-shadow: 0 0 12px rgba(199, 94, 255, 0.9);
    }

    .brand strong {
      font-size: 12px;
      letter-spacing: 0.14em;
      text-transform: uppercase;
      white-space: nowrap;
    }

    .brand span {
      color: var(--muted);
      font-size: 11px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }

    .controls {
      display: flex;
      align-items: center;
      gap: 5px;
      flex: 0 0 auto;
    }

    button {
      appearance: none;
      border: 1px solid var(--line);
      border-radius: 7px;
      padding: 5px 8px;
      background: rgba(168, 85, 247, 0.10);
      color: var(--purple-bright);
      cursor: pointer;
      font: inherit;
      font-size: 11px;
      transition: background 150ms ease, border-color 150ms ease, transform 150ms ease;
    }

    button:hover {
      background: rgba(168, 85, 247, 0.26);
      border-color: rgba(216, 164, 255, 0.65);
    }

    button:active {
      transform: scale(0.96);
    }

    .workspace {
      min-height: 0;
      flex: 1;
      display: grid;
      grid-template-columns: minmax(180px, 1fr) var(--bar-size) minmax(180px, 1fr);
      border: 1px solid var(--line);
      border-radius: 11px;
      overflow: hidden;
      background: #0c0613;
      box-shadow: 0 12px 42px rgba(0, 0, 0, 0.30);
    }

    .frame-panel {
      position: relative;
      min-width: 0;
      min-height: 0;
      background: var(--panel);
    }

    .frame-label {
      position: absolute;
      z-index: 2;
      top: 7px;
      left: 8px;
      max-width: calc(100% - 16px);
      padding: 3px 7px;
      overflow: hidden;
      border: 1px solid rgba(216, 164, 255, 0.24);
      border-radius: 5px;
      background: rgba(19, 9, 31, 0.82);
      color: #dbb2fa;
      font-size: 10px;
      line-height: 1.1;
      letter-spacing: 0.04em;
      text-overflow: ellipsis;
      white-space: nowrap;
      pointer-events: none;
      backdrop-filter: blur(8px);
    }

    iframe {
      display: block;
      width: 100%;
      height: 100%;
      border: 0;
      background: white;
    }

    .divider {
      position: relative;
      z-index: 3;
      cursor: col-resize;
      touch-action: none;
      background:
        linear-gradient(
          90deg,
          rgba(0, 0, 0, 0.2),
          rgba(168, 85, 247, 0.55),
          rgba(0, 0, 0, 0.2)
        );
      transition: background 150ms ease;
    }

    .divider:hover,
    .divider.active {
      background:
        linear-gradient(
          90deg,
          rgba(0, 0, 0, 0.16),
          #d8a4ff,
          rgba(0, 0, 0, 0.16)
        );
    }

    .divider::before {
      content: "";
      position: absolute;
      top: 50%;
      left: 50%;
      width: 4px;
      height: 38px;
      border-radius: 8px;
      transform: translate(-50%, -50%);
      background:
        radial-gradient(circle, #f2d9ff 1.2px, transparent 1.8px) center 4px / 4px 8px repeat-y;
      opacity: 0.95;
      box-shadow: 0 0 10px rgba(216, 164, 255, 0.8);
    }

    .hint {
      display: none;
    }

    @media (max-width: 640px) {
      .app {
        padding: 5px;
        gap: 5px;
      }

      header {
        min-height: 31px;
      }

      .brand span {
        display: none;
      }

      button {
        padding: 4px 6px;
      }

      .workspace {
        grid-template-columns: minmax(120px, 1fr) 10px minmax(120px, 1fr);
      }

      .frame-label {
        font-size: 9px;
      }
    }
  </style>
</head>

<body>
  <main class="app">
    <header>
      <div class="brand">
        <div class="orb" aria-hidden="true"></div>
        <strong>Split Portal</strong>
        <span>Drag the center beam to resize<a href="https://patreon.com/skeyboard">get electron file manager and fish pheeder file manager </a></span>
      </div>

      <div class="controls">
        <button id="equalizeButton" type="button" title="Reset both panels to equal width">
          50 / 50
        </button>
        <button id="swapButton" type="button" title="Swap the two websites">
          Swap
        </button>
      </div>
    </header>

    <section class="workspace" id="workspace" aria-label="Resizable website panels">
      <div class="frame-panel">
        <div class="frame-label" id="leftLabel">Skeyboard.net</div>
        <div class="app-links">
  <a class="app-link" href="http://patreon.com/c/Skeyboard">
    <span class="app-link-title">
      Fishpheeder · Patreon
      <span class="app-link-arrow" aria-hidden="true">↗</span>
    </span>
    <span class="app-link-description">
      Patreon to get Fishpheeder file manager, which has Everything search
      engine-like search abilities and a snappy taskbar and Alt+Tab replacement.
    </span>
  </a>

  <a
    class="app-link"
    href="https://play.google.com/store/apps/details?id=net.skeyboard.filemgr"
  >
    <span class="app-link-title">
      Explorer 95 · Android
      <span class="app-link-arrow" aria-hidden="true">↗</span>
    </span>
    <span class="app-link-description">
      Explorer 95 file manager for DJs with two audio players, mixing,
      pitchshifting and timeshifting; a video editor with crop and trim in/out;
      a raster image editor with .gif, selections, layers, pixel-style
      drag-translation-everywhere, persistent-cursor and
      touch-down-on-pad-to-draw functionality; app listing with date sorting;
      desktop shortcuts; a drag-resizable, persistent icon-location view in
      folders; favorites in all media categories; and a text editor with
      keyboard-style Ctrl+Left / Shift+Home selection buttons and font
      and size selection, including a monospaced font.
    </span>
  </a>

  <a
    class="app-link"
    href="https://play.google.com/store/apps/details?id=net.skeyboard.midigitaru"
  >
    <span class="app-link-title">
      Guitarchord · Android
      <span class="app-link-arrow" aria-hidden="true">↗</span>
    </span>
    <span class="app-link-description">
      Guitarchord omnichord and guitar-style instrument with persistent
      fretted chords, savable chord buttons, single-string strumming,
      a pitchbend wheel and pitch-bend modes, MIDI-out over USB OTG
      interfaces, recording for MIDI export, MIDI MPE pitchbend chord
      changing, 4-stack chord saving on arbitrary frets, and a resizable
      fretboard with 6-, 7-, and 8-string guitar options, tuning, and frets
      below the zeroth fret.
    </span>
  </a>
</div>
      </div>

      <div
        class="divider"
        id="divider"
        role="separator"
        aria-label="Resize website panels"
        aria-orientation="vertical"
        tabindex="0"
      ></div>

      <div class="frame-panel">
        <div class="frame-label" id="rightLabel">solgraff.com</div>
        <iframe
          id="rightFrame"
          title="Solgraff"
          src="https://solgraff.com/"
          referrerpolicy="strict-origin-when-cross-origin"
        ></iframe>
      </div>
    </section>
  </main>

  <script>
    const workspace = document.getElementById("workspace");
    const divider = document.getElementById("divider");
    const equalizeButton = document.getElementById("equalizeButton");
    const swapButton = document.getElementById("swapButton");

    const leftFrame = document.getElementById("leftFrame");
    const rightFrame = document.getElementById("rightFrame");
    const leftLabel = document.getElementById("leftLabel");
    const rightLabel = document.getElementById("rightLabel");

    const dividerWidth = 12;
    const minPanelWidth = 180;
    let isDragging = false;

    function setSplit(leftPixels) {
      const totalWidth = workspace.clientWidth - dividerWidth;
      const min = Math.min(minPanelWidth, totalWidth / 2);
      const max = totalWidth - min;
      const clamped = Math.max(min, Math.min(leftPixels, max));

      workspace.style.gridTemplateColumns =
        `${clamped}px ${dividerWidth}px minmax(0, 1fr)`;
    }

    function resetSplit() {
      workspace.style.gridTemplateColumns =
        `minmax(${minPanelWidth}px, 1fr) ${dividerWidth}px minmax(${minPanelWidth}px, 1fr)`;
    }

    function dragTo(clientX) {
      const bounds = workspace.getBoundingClientRect();
      setSplit(clientX - bounds.left);
    }

    divider.addEventListener("pointerdown", (event) => {
      isDragging = true;
      divider.classList.add("active");
      document.body.classList.add("dragging");
      divider.setPointerCapture(event.pointerId);
      dragTo(event.clientX);
    });

    divider.addEventListener("pointermove", (event) => {
      if (isDragging) dragTo(event.clientX);
    });

    function stopDragging() {
      isDragging = false;
      divider.classList.remove("active");
      document.body.classList.remove("dragging");
    }

    divider.addEventListener("pointerup", stopDragging);
    divider.addEventListener("pointercancel", stopDragging);

    divider.addEventListener("keydown", (event) => {
      const currentColumns = getComputedStyle(workspace).gridTemplateColumns.split(" ");
      const currentLeft = parseFloat(currentColumns[0]) || workspace.clientWidth / 2;

      if (event.key === "ArrowLeft") {
        event.preventDefault();
        setSplit(currentLeft - 24);
      }

      if (event.key === "ArrowRight") {
        event.preventDefault();
        setSplit(currentLeft + 24);
      }

      if (event.key === "Home") {
        event.preventDefault();
        setSplit(minPanelWidth);
      }

      if (event.key === "End") {
        event.preventDefault();
        setSplit(workspace.clientWidth - dividerWidth - minPanelWidth);
      }
    });

    equalizeButton.addEventListener("click", resetSplit);

    swapButton.addEventListener("click", () => {
      const leftSource = leftFrame.src;
      const rightSource = rightFrame.src;
      const leftTitle = leftFrame.title;
      const rightTitle = rightFrame.title;
      const leftText = leftLabel.textContent;
      const rightText = rightLabel.textContent;

      leftFrame.src = rightSource;
      rightFrame.src = leftSource;
      leftFrame.title = rightTitle;
      rightFrame.title = leftTitle;
      leftLabel.textContent = rightText;
      rightLabel.textContent = leftText;
    });

    window.addEventListener("resize", () => {
      const columns = getComputedStyle(workspace).gridTemplateColumns.split(" ");
      const leftWidth = parseFloat(columns[0]);

      if (Number.isFinite(leftWidth)) {
        setSplit(leftWidth);
      }
    });
  </script>
</body>
</html>
