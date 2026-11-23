# Friends — web version

The browser version of the Friends random video chat app, live at
**https://srv2189574.hstgr.cloud/app/**

This repo holds the **built files** only. The source code is the mobile app
([friends_app](https://github.com/thelllmike/friends_app)): the same React Native (Expo) code is
exported for the web. The backend ([friends_app_backend](https://github.com/thelllmike/friends_app_backend))
serves these files at `/app`, on the same address as the API, so the browser needs no CORS setup and
the camera works over HTTPS.

## Update the web version

```bash
# 1. build from the mobile app (mobile/.env has EXPO_PUBLIC_API_URL=https://srv2189574.hstgr.cloud)
cd friends/mobile
npx expo export --platform web          # app.json: experiments.baseUrl = "/app"

# 2. copy the build here, then deploy and commit
rsync -a --delete --exclude .git --exclude README.md --exclude deploy.sh dist/ ../../friends_web_version/
cd ../../friends_web_version
./deploy.sh                              # uploads to the VPS; Caddy serves it immediately
git add -A && git commit -m "Update web build" && git push
```

## What works on the web

Sign up with phone (SMS code), profile, random video chat with chat/next/report/block, recent
people, settings. Premium can't be bought on the web (store purchases are in the Android/iOS apps);
the web shows the plans read-only. Google/Apple sign-in are mobile-only for now.
