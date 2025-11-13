// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  devServer: {
    port: 3000,
    host: 'localhost'
  },
  modules: [
    '@nuxtjs/tailwindcss',
    '@vite-pwa/nuxt'
  ],
  pwa: {
    registerType: 'autoUpdate',
    manifest: {
      name: 'Monstar Games 2026',
      short_name: 'Monstar Games',
      description: 'App oficial do Monstar Games 2026 - Goiânia',
      theme_color: '#fbbf24',
      background_color: '#f9fafb',
      display: 'standalone',
      orientation: 'portrait',
      scope: '/',
      start_url: '/',
      icons: [
        {
          src: '/logo/logo_oficial.png',
          sizes: '512x512',
          type: 'image/png',
          purpose: 'any maskable'
        },
        {
          src: '/logo/logo_oficial_pb.png',
          sizes: '512x512',
          type: 'image/png',
          purpose: 'any maskable'
        }
      ]
    },
    workbox: {
      navigateFallback: '/',
      globPatterns: ['**/*.{js,css,html,png,svg,ico}']
    },
    client: {
      installPrompt: true,
      periodicSyncForUpdates: 20
    },
    devOptions: {
      enabled: true,
      suppressWarnings: true,
      navigateFallbackAllowlist: [/^\/$/],
      type: 'module'
    }
  },
  app: {
    head: {
      title: 'Monstar Games 2026',
      meta: [
        { charset: 'utf-8' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' },
        { name: 'description', content: 'App oficial do Monstar Games 2026 - Goiânia' },
        { name: 'theme-color', content: '#fbbf24' },
        { name: 'apple-mobile-web-app-capable', content: 'yes' },
        { name: 'apple-mobile-web-app-status-bar-style', content: 'black-translucent' },
        { name: 'apple-mobile-web-app-title', content: 'Monstar Games' }
      ],
      link: [
        { rel: 'icon', href: '/logo/logo_oficial.png' },
        { rel: 'apple-touch-icon', href: '/logo/logo_oficial.png' }
      ]
    }
  },
  css: ['~/assets/css/main.css']
})

