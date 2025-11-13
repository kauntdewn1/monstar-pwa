# Monstar Games PWA

PWA oficial do Monstar Games 2026 desenvolvido com Nuxt 3.

## 🚀 Tecnologias

- **Nuxt 3** - Framework Vue.js
- **Vue 3** - Framework JavaScript
- **Tailwind CSS** - Framework CSS
- **@vite-pwa/nuxt** - Plugin PWA
- **lucide-vue-next** - Ícones

## 📦 Instalação

```bash
npm install
```

## 🛠️ Desenvolvimento

```bash
npm run dev
```

Acesse `http://localhost:3000`

## 🏗️ Build

```bash
npm run build
```

## 📱 Deploy na Vercel

### Opção 1: Deploy Automático via GitHub

1. Acesse [vercel.com](https://vercel.com)
2. Conecte seu repositório GitHub: `https://github.com/kauntdewn1/monstar-pwa.git`
3. A Vercel detectará automaticamente o Nuxt 3
4. Clique em "Deploy"
5. Pronto! O PWA estará online

### Opção 2: Deploy via CLI

```bash
npm i -g vercel
vercel
```

### Configurações importantes:

- ✅ Porta padrão: 3000 (configurada no `nuxt.config.ts`)
- ✅ PWA configurado com `@vite-pwa/nuxt`
- ✅ Ícones em `/public/logo/`
- ✅ Manifest.json gerado automaticamente
- ✅ Service Worker configurado para cache offline

## 📄 Licença

Monstar Games 2026

