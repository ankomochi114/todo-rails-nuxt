import { defineNitroConfig } from "nitropack";

// https://nitro.unjs.io/config#devproxy
// https://github.com/http-party/node-http-proxy#options
export default defineNitroConfig({
  devProxy: {
    "/api/": {
      target: "http://api:8000/",
      changeOrigin: true,
      hostRewrite: true,
      cookieDomainRewrite: true,
      headers: {
        "X-Forwarded-Host": "localhost:3000",
        "X-Forwarded-Proto": "http",
      },
    },
  },
});
