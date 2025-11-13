<template>
  <div class="relative w-full max-w-md mx-auto h-screen flex flex-col overflow-hidden z-10">
    <!-- Status Bar -->
    <div class="fixed top-0 left-0 right-0 z-50 bg-black/40 backdrop-blur-xl h-12">
      <div class="flex justify-between items-center px-6 h-full text-white text-xs">
        <span class="font-semibold">{{ currentTime }}</span>
        <img 
          src="/logo/logo_hrz.png" 
          alt="Monstar Games" 
          class="h-6 object-contain"
        />
      </div>
    </div>

    <!-- Notification -->
    <div
      :class="[
        'fixed top-14 left-4 right-4 z-50 transition-all duration-300',
        showNotification ? 'translate-y-0 opacity-100' : '-translate-y-20 opacity-0'
      ]"
    >
      <div class="bg-white/90 backdrop-blur-2xl rounded-2xl shadow-2xl p-4 border border-gray-200/50">
        <div class="flex items-start gap-3">
          <div class="w-10 h-10 bg-gradient-to-br from-yellow-400 to-orange-500 rounded-lg flex items-center justify-center flex-shrink-0">
            <Trophy class="text-white" :size="20" />
          </div>
          <div class="flex-1 min-w-0">
            <div class="font-semibold text-sm text-gray-900 mb-0.5">
              Monstar Games
            </div>
            <div class="text-sm text-gray-700">
              Teste de App liberado: "NEØ" • 21-15-9
            </div>
          </div>
          <span class="text-xs text-gray-500 flex-shrink-0">agora</span>
        </div>
      </div>
    </div>

    <!-- Home Screen -->
    <div v-if="activeTab === 'home'" class="flex-1 pt-12 pb-24 overflow-y-auto scrollable-content">
      <!-- Hero Card -->
      <div class="px-4 pt-6 pb-4">
        <div class="relative overflow-hidden rounded-3xl">
          <div class="absolute inset-0 bg-gradient-to-br from-pink-800 via-orange-800 to-red-500" />
          <div
            class="absolute inset-0 opacity-10"
            :style="{
              backgroundImage:
                'repeating-linear-gradient(45deg, transparent, transparent 20px, white 20px, white 40px)'
            }"
          />
          <div class="relative p-6 text-white">
            <div class="flex items-center gap-2 mb-3">
              <div class="w-2 h-2 bg-green-400 rounded-full animate-pulse" />
              <span class="text-sm font-medium opacity-90">QUALIFIER ABERTO</span>
            </div>
            <div class="flex items-center gap-4 mb-2">
              <img 
                src="/logo/logo_oficial.png" 
                alt="Monstar Games Logo" 
                class="w-16 h-16 object-contain flex-shrink-0"
              />
              <div>
                <h1 class="text-3xl font-black">Monstar Games 2026</h1>
                <p class="text-sm opacity-90 mt-1">Goiânia • 15-17 Fevereiro</p>
              </div>
            </div>
            <button class="w-full bg-white/20 backdrop-blur-xl border border-white/30 rounded-2xl py-4 font-bold text-white active:scale-95 transition-transform flex items-center justify-center gap-2 mt-6">
              INSCREVER-SE AGORA
              <ChevronRight :size="20" />
            </button>
          </div>
        </div>
      </div>

      <!-- Quick Stats -->
      <div class="px-4 mb-6">
        <div class="grid grid-cols-3 gap-3">
          <div class="glass-card rounded-2xl p-4">
            <div class="w-8 h-8 bg-gradient-to-br from-yellow-400 to-orange-500 rounded-xl flex items-center justify-center text-black mb-2">
              <Trophy :size="18" />
            </div>
            <div class="text-xs text-black/80 mb-1">Posição</div>
            <div class="text-xl font-bold text-black">#23</div>
          </div>
          <div class="glass-card rounded-2xl p-4">
            <div class="w-8 h-8 bg-gradient-to-br from-blue-400 to-cyan-500 rounded-xl flex items-center justify-center text-black mb-2">
              <Clock :size="18" />
            </div>
            <div class="text-xs text-black/80 mb-1">WODs</div>
            <div class="text-xl font-bold text-black">4/4</div>
          </div>
          <div class="glass-card rounded-2xl p-4">
            <div class="w-8 h-8 bg-gradient-to-br from-purple-400 to-pink-500 rounded-xl flex items-center justify-center text-black mb-2">
              <TrendingUp :size="18" />
            </div>
            <div class="text-xs text-black/80 mb-1">Score</div>
            <div class="text-xl font-bold text-black">847</div>
          </div>
        </div>
      </div>

      <!-- Modalidades -->
      <div class="px-4 mb-3">
        <h2 class="text-2xl font-bold text-black drop-shadow-lg">Modalidades</h2>
      </div>
      <div class="px-4 space-y-2 mb-6">
        <button class="w-full glass-card rounded-2xl p-4 active:scale-98 transition-transform">
          <div class="flex items-center gap-3">
            <div class="text-3xl">🏋️</div>
            <div class="flex-1 text-left">
              <div class="font-semibold text-black">Workouts Qualifier</div>
              <div class="text-sm text-black/80">4 WODs • Finalizado</div>
            </div>
            <div class="flex items-center gap-2">
              <CheckCircle2 class="text-green-300" :size="20" />
              <ChevronRight class="text-white/60" :size="20" />
            </div>
          </div>
        </button>
        <button class="w-full glass-card rounded-2xl p-4 active:scale-98 transition-transform">
          <div class="flex items-center gap-3">
            <div class="text-3xl">🏃</div>
            <div class="flex-1 text-left">
              <div class="font-semibold text-black">Monstar Fitness Race</div>
              <div class="text-sm text-black/80">7 Fevereiro 2026</div>
            </div>
            <div class="flex items-center gap-2">
              <Clock class="text-blue-300" :size="20" />
              <ChevronRight class="text-black/60" :size="20" />
            </div>
          </div>
        </button>
        <button class="w-full glass-card rounded-2xl p-4 active:scale-98 transition-transform">
          <div class="flex items-center gap-3">
            <div class="text-3xl">🏊</div>
            <div class="flex-1 text-left">
              <div class="font-semibold text-black">Monstar Run</div>
              <div class="text-sm text-black/80">Em breve</div>
            </div>
            <div class="flex items-center gap-2">
              <div class="text-black/60">🔒</div>
              <ChevronRight class="text-black/60" :size="20" />
            </div>
          </div>
        </button>
      </div>

      <!-- Categorias -->
      <div class="mb-6">
        <div class="px-4 mb-3">
          <h2 class="text-2xl font-bold text-black drop-shadow-lg">Categorias</h2>
        </div>
        <div class="overflow-x-auto scrollbar-hide -mx-4 px-4">
          <div class="flex gap-3 pb-2">
            <div class="flex-shrink-0 w-32">
              <div class="bg-gradient-to-br from-yellow-400 to-amber-500 rounded-2xl p-4 text-white aspect-square flex flex-col justify-between">
                <div class="text-xs font-medium opacity-90">CATEGORIA</div>
                <div>
                  <div class="font-black text-lg mb-1">TEENS</div>
                  <div class="text-sm opacity-90">15-17</div>
                </div>
              </div>
            </div>
            <div class="flex-shrink-0 w-32">
              <div class="bg-gradient-to-br from-cyan-400 to-blue-500 rounded-2xl p-4 text-white aspect-square flex flex-col justify-between">
                <div class="text-xs font-medium opacity-90">CATEGORIA</div>
                <div>
                  <div class="font-black text-lg mb-1">AMADOR</div>
                </div>
              </div>
            </div>
            <div class="flex-shrink-0 w-32">
              <div class="bg-gradient-to-br from-pink-400 to-rose-500 rounded-2xl p-4 text-white aspect-square flex flex-col justify-between">
                <div class="text-xs font-medium opacity-90">CATEGORIA</div>
                <div>
                  <div class="font-black text-lg mb-1">SCALED</div>
                </div>
              </div>
            </div>
            <div class="flex-shrink-0 w-32">
              <div class="bg-gradient-to-br from-purple-400 to-indigo-500 rounded-2xl p-4 text-white aspect-square flex flex-col justify-between">
                <div class="text-xs font-medium opacity-90">CATEGORIA</div>
                <div>
                  <div class="font-black text-lg mb-1">ELITE</div>
                </div>
              </div>
            </div>
            <div class="flex-shrink-0 w-32">
              <div class="bg-gradient-to-br from-orange-400 to-red-500 rounded-2xl p-4 text-white aspect-square flex flex-col justify-between">
                <div class="text-xs font-medium opacity-90">CATEGORIA</div>
                <div>
                  <div class="font-black text-lg mb-1">MASTER</div>
                  <div class="text-sm opacity-90">35+</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Próximos Eventos -->
      <div class="px-4 mb-6">
        <h2 class="text-2xl font-bold text-black drop-shadow-lg mb-3">Próximos</h2>
        <div class="glass-card rounded-2xl overflow-hidden">
          <div class="flex items-center gap-4 p-4">
            <div class="w-14 h-14 bg-red-500 rounded-2xl flex flex-col items-center justify-center text-white flex-shrink-0">
              <div class="text-xl font-bold leading-none">15</div>
              <div class="text-xs font-medium">FEV</div>
            </div>
            <div class="flex-1">
              <div class="font-semibold text-black">Qualifier Final</div>
              <div class="text-sm text-black/80 flex items-center gap-1">
                <MapPin :size="12" />
                SESI Clube Ferreira Pacheco
              </div>
            </div>
            <div class="text-sm font-medium text-black/80">08:00</div>
          </div>
          <div class="h-px bg-white/20 mx-4" />
          <div class="flex items-center gap-4 p-4">
            <div class="w-14 h-14 bg-red-500 rounded-2xl flex flex-col items-center justify-center text-white flex-shrink-0">
              <div class="text-xl font-bold leading-none">17</div>
              <div class="text-xs font-medium">FEV</div>
            </div>
            <div class="flex-1">
              <div class="font-semibold text-black">Finals</div>
              <div class="text-sm text-black/80 flex items-center gap-1">
                <MapPin :size="12" />
                Arena Principal
              </div>
            </div>
            <div class="text-sm font-medium text-black/80">14:00</div>
          </div>
        </div>
      </div>

      <!-- Web3 Badge -->
      <div class="px-4 mb-6">
        <div class="glass-card-dark rounded-2xl p-6 text-white relative overflow-hidden">
          <div class="absolute top-0 right-0 w-32 h-32 bg-yellow-400/20 rounded-full blur-3xl" />
          <div class="relative">
            <div class="flex items-center gap-3 mb-4">
              <div class="w-12 h-12 bg-gradient-to-br from-yellow-400 to-orange-500 rounded-2xl flex items-center justify-center">
                <Star class="text-white" :size="24" fill="white" />
              </div>
              <div>
                <div class="font-bold text-lg">Seu QR Code de acesso</div>
                <div class="text-sm text-gray-400"> • Confirmado • Monstar Games 2026</div>
              </div>
            </div>
            <button class="w-full bg-white/10 backdrop-blur-xl border border-white/20 rounded-xl py-3 font-semibold text-sm active:scale-95 transition-transform">
              Ver QR Code
            </button>
          </div>
        </div>
      </div>
    </div>

    <!-- Leaderboard Screen -->
    <div v-if="activeTab === 'leaderboard'" class="flex-1 pt-12 pb-24 overflow-y-auto scrollable-content">
      <div class="px-4 py-6">
        <h1 class="text-3xl font-black text-black drop-shadow-lg mb-2">Leaderboard</h1>
        <p class="text-white/80">Qualifier 2026 • AMADOR</p>
      </div>

      <div class="px-4 mb-6">
        <div class="flex gap-2 overflow-x-auto scrollbar-hide pb-2">
          <button class="px-4 py-2 rounded-full text-sm font-semibold whitespace-nowrap transition-all active:scale-95 bg-gray-900 text-white">
            Todos
          </button>
          <button class="px-4 py-2 rounded-full text-sm font-semibold whitespace-nowrap transition-all active:scale-95 bg-white text-gray-700 border border-gray-200">
            Masculino
          </button>
          <button class="px-4 py-2 rounded-full text-sm font-semibold whitespace-nowrap transition-all active:scale-95 bg-white text-gray-700 border border-gray-200">
            Feminino
          </button>
          <button class="px-4 py-2 rounded-full text-sm font-semibold whitespace-nowrap transition-all active:scale-95 bg-white text-gray-700 border border-gray-200">
            Minha Categoria
          </button>
        </div>
      </div>

      <div class="px-4 mb-4">
        <div class="bg-gradient-to-br from-yellow-400 to-orange-500 rounded-2xl p-4 text-white">
          <div class="flex items-center justify-between mb-2">
            <span class="text-sm font-medium opacity-90">SUA POSIÇÃO</span>
            <CheckCircle2 :size="18" />
          </div>
          <div class="flex items-end gap-2">
            <span class="text-5xl font-black">#23</span>
            <span class="text-lg opacity-90 mb-2">de 847 atletas</span>
          </div>
        </div>
      </div>

      <div class="px-4 space-y-2">
        <div class="glass-card rounded-2xl p-4 flex items-center gap-4 border-2 border-white/30">
          <div class="w-8 text-center">🥇</div>
          <div class="flex-1">
            <div class="font-semibold text-white">Carlos Silva</div>
          </div>
          <div class="text-xl font-bold text-white">956</div>
        </div>
        <div class="glass-card rounded-2xl p-4 flex items-center gap-4 border-2 border-white/30">
          <div class="w-8 text-center">🥈</div>
          <div class="flex-1">
            <div class="font-semibold text-white">Ana Costa</div>
          </div>
          <div class="text-xl font-bold text-white">943</div>
        </div>
        <div class="glass-card rounded-2xl p-4 flex items-center gap-4 border-2 border-white/30">
          <div class="w-8 text-center">🥉</div>
          <div class="flex-1">
            <div class="font-semibold text-white">Pedro Santos</div>
          </div>
          <div class="text-xl font-bold text-white">921</div>
        </div>
        <div class="glass-card rounded-2xl p-4 flex items-center gap-4">
          <div class="w-8 text-center">
            <span class="font-bold text-white/70">#4</span>
          </div>
          <div class="flex-1">
            <div class="font-semibold text-white">Maria Oliveira</div>
          </div>
          <div class="text-xl font-bold text-white">897</div>
        </div>
        <div class="glass-card rounded-2xl p-4 flex items-center gap-4">
          <div class="w-8 text-center">
            <span class="font-bold text-white/70">#5</span>
          </div>
          <div class="flex-1">
            <div class="font-semibold text-white">João Alves</div>
          </div>
          <div class="text-xl font-bold text-white">882</div>
        </div>
        <div class="text-center py-4 text-white/60 text-sm">• • •</div>
        <div class="glass-card-highlight rounded-2xl p-4 flex items-center gap-4 border-2 border-yellow-400/50">
          <div class="w-8 text-center">
            <span class="font-bold text-white/70">#23</span>
          </div>
          <div class="flex-1">
            <div class="font-semibold text-white">Você</div>
          </div>
          <div class="text-xl font-bold text-yellow-300">847</div>
        </div>
        <div class="glass-card rounded-2xl p-4 flex items-center gap-4">
          <div class="w-8 text-center">
            <span class="font-bold text-white/70">#24</span>
          </div>
          <div class="flex-1">
            <div class="font-semibold text-white">Lucas Ferreira</div>
          </div>
          <div class="text-xl font-bold text-white">845</div>
        </div>
        <div class="glass-card rounded-2xl p-4 flex items-center gap-4">
          <div class="w-8 text-center">
            <span class="font-bold text-white/70">#25</span>
          </div>
          <div class="flex-1">
            <div class="font-semibold text-white">Juliana Rocha</div>
          </div>
          <div class="text-xl font-bold text-white">839</div>
        </div>
      </div>
    </div>

    <!-- Events Screen -->
    <div v-if="activeTab === 'events'" class="flex-1 pt-12 pb-24 overflow-y-auto scrollable-content">
      <div class="px-4 py-6">
        <h1 class="text-3xl font-black text-black drop-shadow-lg mb-2">Eventos</h1>
        <p class="text-white/80">Calendário de eventos 2026</p>
      </div>

      <div class="px-4 space-y-4 mb-6">
        <div class="glass-card rounded-2xl overflow-hidden">
          <div class="flex items-center gap-4 p-4">
            <div class="w-14 h-14 bg-red-500 rounded-2xl flex flex-col items-center justify-center text-white flex-shrink-0">
              <div class="text-xl font-bold leading-none">15</div>
              <div class="text-xs font-medium">FEV</div>
            </div>
            <div class="flex-1">
              <div class="font-semibold text-white">Qualifier Final</div>
              <div class="text-sm text-white/80 flex items-center gap-1">
                <MapPin :size="12" />
                SESI Clube Ferreira Pacheco
              </div>
              <div class="text-xs text-white/60 mt-1">08:00 - 18:00</div>
            </div>
            <ChevronRight class="text-white/60" :size="20" />
          </div>
        </div>

        <div class="glass-card rounded-2xl overflow-hidden">
          <div class="flex items-center gap-4 p-4">
            <div class="w-14 h-14 bg-red-500 rounded-2xl flex flex-col items-center justify-center text-white flex-shrink-0">
              <div class="text-xl font-bold leading-none">17</div>
              <div class="text-xs font-medium">FEV</div>
            </div>
            <div class="flex-1">
              <div class="font-semibold text-white">Finals</div>
              <div class="text-sm text-white/80 flex items-center gap-1">
                <MapPin :size="12" />
                Arena Principal
              </div>
              <div class="text-xs text-white/60 mt-1">14:00 - 22:00</div>
            </div>
            <ChevronRight class="text-white/60" :size="20" />
          </div>
        </div>

        <div class="glass-card rounded-2xl overflow-hidden opacity-60">
          <div class="flex items-center gap-4 p-4">
            <div class="w-14 h-14 bg-gray-400 rounded-2xl flex flex-col items-center justify-center text-white flex-shrink-0">
              <div class="text-xl font-bold leading-none">7</div>
              <div class="text-xs font-medium">FEV</div>
            </div>
            <div class="flex-1">
              <div class="font-semibold text-white">Monstar Fitness Race</div>
              <div class="text-sm text-white/80 flex items-center gap-1">
                <MapPin :size="12" />
                Local a confirmar
              </div>
              <div class="text-xs text-white/60 mt-1">Em breve</div>
            </div>
            <Clock class="text-white/60" :size="20" />
          </div>
        </div>
      </div>
    </div>

    <!-- Profile Screen -->
    <div v-if="activeTab === 'profile'" class="flex-1 pt-12 pb-24 overflow-y-auto scrollable-content">
      <div class="px-4 py-6">
        <div class="flex items-center gap-4 mb-6">
          <div class="w-20 h-20 bg-gradient-to-br from-yellow-400 to-orange-500 rounded-full flex items-center justify-center text-white text-2xl font-bold">
            JS
          </div>
          <div>
            <h1 class="text-2xl font-bold text-white drop-shadow-lg">João Silva</h1>
            <p class="text-white/80">@joaosilva</p>
          </div>
        </div>

        <div class="grid grid-cols-3 gap-3 mb-6">
          <div class="glass-card rounded-2xl p-4 text-center">
            <div class="text-2xl font-bold text-white">4</div>
            <div class="text-xs text-white/80">Eventos</div>
          </div>
          <div class="glass-card rounded-2xl p-4 text-center">
            <div class="text-2xl font-bold text-white">23</div>
            <div class="text-xs text-white/80">Melhor Pos.</div>
          </div>
          <div class="glass-card rounded-2xl p-4 text-center">
            <div class="text-2xl font-bold text-white">847</div>
            <div class="text-xs text-white/80">Total Score</div>
          </div>
        </div>
      </div>

      <div class="px-4 mb-6">
        <h2 class="text-xl font-bold text-white drop-shadow-lg mb-3">Conquistas</h2>
        <div class="grid grid-cols-4 gap-3">
          <div class="aspect-square rounded-2xl flex items-center justify-center text-4xl bg-gradient-to-br from-yellow-400 to-orange-500">
            🎯
          </div>
          <div class="aspect-square rounded-2xl flex items-center justify-center text-4xl bg-gradient-to-br from-yellow-400 to-orange-500">
            🏅
          </div>
          <div class="aspect-square rounded-2xl flex items-center justify-center text-4xl bg-gradient-to-br from-yellow-400 to-orange-500">
            💎
          </div>
          <div class="aspect-square rounded-2xl flex items-center justify-center text-4xl bg-gray-200 grayscale opacity-50">
            👑
          </div>
        </div>
      </div>

      <div class="px-4">
        <div class="glass-card rounded-2xl overflow-hidden">
          <button class="w-full flex items-center gap-3 p-4 active:bg-white/10 transition-colors">
            <Bell class="text-white" :size="20" />
            <div class="flex-1 text-left font-medium text-white">Notificações</div>
            <ChevronRight class="text-white/60" :size="20" />
          </button>
          <div class="h-px bg-white/20 mx-4" />
          <button class="w-full flex items-center gap-3 p-4 active:bg-white/10 transition-colors">
            <Share2 class="text-white" :size="20" />
            <div class="flex-1 text-left font-medium text-white">Compartilhar Perfil</div>
            <ChevronRight class="text-white/60" :size="20" />
          </button>
          <div class="h-px bg-white/20 mx-4" />
          <button class="w-full flex items-center gap-3 p-4 active:bg-white/10 transition-colors">
            <Star class="text-white" :size="20" />
            <div class="flex-1 text-left font-medium text-white">Badge NFT</div>
            <span class="bg-red-500 text-white text-xs font-bold px-2 py-1 rounded-full">Novo</span>
            <ChevronRight class="text-white/60" :size="20" />
          </button>
        </div>
      </div>
    </div>

    <!-- Tab Bar -->
    <div class="fixed bottom-0 left-0 right-0 bg-white/80 backdrop-blur-2xl border-t border-gray-200 pb-safe z-50">
      <div class="flex justify-around items-center h-20 px-2">
        <button
          @click="activeTab = 'home'"
          :class="[
            'flex flex-col items-center gap-1 px-4 py-2 transition-all active:scale-95',
            activeTab === 'home' ? 'text-gray-900' : 'text-gray-400'
          ]"
        >
          <Home :size="24" />
          <span class="text-xs font-medium">Início</span>
        </button>
        <button
          @click="activeTab = 'leaderboard'"
          :class="[
            'flex flex-col items-center gap-1 px-4 py-2 transition-all active:scale-95',
            activeTab === 'leaderboard' ? 'text-gray-900' : 'text-gray-400'
          ]"
        >
          <Trophy :size="24" />
          <span class="text-xs font-medium">Ranking</span>
        </button>
        <button
          @click="activeTab = 'events'"
          :class="[
            'flex flex-col items-center gap-1 px-4 py-2 transition-all active:scale-95',
            activeTab === 'events' ? 'text-gray-900' : 'text-gray-400'
          ]"
        >
          <Calendar :size="24" />
          <span class="text-xs font-medium">Eventos</span>
        </button>
        <button
          @click="activeTab = 'profile'"
          :class="[
            'flex flex-col items-center gap-1 px-4 py-2 transition-all active:scale-95',
            activeTab === 'profile' ? 'text-gray-900' : 'text-gray-400'
          ]"
        >
          <User :size="24" />
          <span class="text-xs font-medium">Perfil</span>
        </button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'
import {
  Home,
  Trophy,
  Calendar,
  User,
  ChevronRight,
  Star,
  TrendingUp,
  Clock,
  MapPin,
  Share2,
  Bell,
  CheckCircle2,
} from 'lucide-vue-next'

const activeTab = ref('home')
const showNotification = ref(false)
const currentTime = ref('')

// Função para formatar a hora
const updateTime = () => {
  const now = new Date()
  const hours = now.getHours().toString().padStart(2, '0')
  const minutes = now.getMinutes().toString().padStart(2, '0')
  currentTime.value = `${hours}:${minutes}`
}

let timeInterval: NodeJS.Timeout | null = null

onMounted(() => {
  // Atualiza a hora imediatamente
  updateTime()
  
  // Atualiza a cada minuto
  timeInterval = setInterval(updateTime, 60000)
  
  // Notificação
  setTimeout(() => (showNotification.value = true), 1000)
  setTimeout(() => (showNotification.value = false), 4000)
})

onUnmounted(() => {
  if (timeInterval) {
    clearInterval(timeInterval)
  }
})
</script>
