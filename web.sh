#!/bin/bash

#install apache
sudo yum -y install httpd

#enable and start apache
sudo systemctl enable httpd
sudo systemctl start httpd

sudo echo '<!DOCTYPE html>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Motivation</title>
  <style>
    :root { --bg:#0f172a; --fg:#e2e8f0; --muted:#94a3b8; }
    html,body { height:100%; margin:0; }
    body {
      display:grid;
      place-items:center;
      background:var(--bg);
      color:var(--fg);
      font:16px/1.6 system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, "Helvetica Neue", Arial, "Apple Color Emoji","Segoe UI Emoji";
    }
    main {
      max-width: 800px;
      padding: 2rem;
      text-align: center;
    }
    h1 { font-size: clamp(1.8rem, 4vw, 2.6rem); margin: 0 0 .5rem; }
    p  { font-size: clamp(1rem, 2.2vw, 1.25rem); color: var(--muted); margin: 0; }
  </style>
</head>
<body>
  <main>
    <h1>Are you alone? You have nobody. Don't be depress. Keep Moving</h1>
    <p>You're stronger than you think.</p>
  </main>
</body>
</html>

<style>
	body {
		background-color: #34333d;
		display: flex;
		align-items: center;
		justify-content: center;
		font-family: Inter;
		padding-top: 128px;
	}

	.container {
		box-sizing: border-box;
		width: 741px;
		height: 449px;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: flex-start;
		padding: 48px 48px 48px 48px;
		box-shadow: 0px 1px 32px 11px rgba(38, 37, 44, 0.49);
		background-color: #5d5b6b;
		overflow: hidden;
		align-content: flex-start;
		flex-wrap: nowrap;
		gap: 24;
		border-radius: 24px;
	}

	.container h1 {
		flex-shrink: 0;
		width: 100%;
		height: auto; /* 144px */
		position: relative;
		color: #ffffff;
		line-height: 1.2;
		font-size: 40px;
	}
	.container p {
		position: relative;
		color: #ffffff;
		line-height: 1.2;
		font-size: 18px;
	}
</style>