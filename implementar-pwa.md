[COMPONENTS 🍎 iOS-Like, Mobile First, Performance First](https://www.notion.so/COMPONENTS-iOS-Like-Mobile-First-Performance-First-2aa8c6e83be080bd8de3c43fcaef22bf?pvs=21)

import React, { useState, useEffect } from 'react';
import {
Home, Trophy, Calendar, User, ChevronRight, Star,
Award, TrendingUp, Clock, MapPin, Share2, Bell,
ChevronLeft, X, CheckCircle2, AlertCircle
} from 'lucide-react';

// iOS-Like Mobile App
const MonstarIOSApp = () => {
const [activeTab, setActiveTab] = useState('home');
const [showNotification, setShowNotification] = useState(false);
const [scrollY, setScrollY] = useState(0);

// Simula notificação ao abrir
useEffect(() => {
setTimeout(() => setShowNotification(true), 1000);
setTimeout(() => setShowNotification(false), 4000);
}, []);

// Status bar (iPhone)
const StatusBar = () => (
<div className="fixed top-0 left-0 right-0 z-50 bg-black/80 backdrop-blur-xl h-12">
<div className="flex justify-between items-center px-6 h-full text-white text-xs">
<span className="font-semibold">9:41</span>
<div className="flex gap-1">
<div className="w-4 h-3 border border-white rounded-sm" />
<div className="w-4 h-3 border border-white rounded-sm opacity-70" />
<div className="w-4 h-3 border border-white rounded-sm opacity-40" />
<div className="w-2 h-3 bg-white rounded-sm ml-1" />
</div>
</div>
</div>
);

// Notificação iOS-style
const Notification = ({ show }) => (
<div
className={`fixed top-14 left-4 right-4 z-50 transition-all duration-300 ${         show ? 'translate-y-0 opacity-100' : '-translate-y-20 opacity-0'       }`}
>
<div className="bg-white/90 backdrop-blur-2xl rounded-2xl shadow-2xl p-4 border border-gray-200/50">
<div className="flex items-start gap-3">
<div className="w-10 h-10 bg-gradient-to-br from-yellow-400 to-orange-500 rounded-lg flex items-center justify-center flex-shrink-0">
<Trophy className="text-white" size={20} />
</div>
<div className="flex-1 min-w-0">
<div className="font-semibold text-sm text-gray-900 mb-0.5">Monstar Games</div>
<div className="text-sm text-gray-700">
Novo WOD liberado: "Fran" • 21-15-9
</div>
</div>
<span className="text-xs text-gray-500 flex-shrink-0">agora</span>
</div>
</div>
</div>
);

// Home Screen
const HomeScreen = () => (
<div className="pt-12 pb-24 overflow-y-auto">
{/* Hero Card com Glassmorphism */}
<div className="px-4 pt-6 pb-4">
<div className="relative overflow-hidden rounded-3xl">
{/* Background com gradiente */}
<div className="absolute inset-0 bg-gradient-to-br from-yellow-400 via-orange-500 to-red-500" />

```
      {/* Pattern overlay */}
      <div
        className="absolute inset-0 opacity-10"
        style={{
          backgroundImage: 'repeating-linear-gradient(45deg, transparent, transparent 20px, white 20px, white 40px)'
        }}
      />

      {/* Content */}
      <div className="relative p-6 text-white">
        <div className="flex items-center gap-2 mb-3">
          <div className="w-2 h-2 bg-green-400 rounded-full animate-pulse" />
          <span className="text-sm font-medium opacity-90">QUALIFIER ABERTO</span>
        </div>

        <h1 className="text-3xl font-black mb-2">
          Monstar Games 2026
        </h1>
        <p className="text-sm opacity-90 mb-6">
          Goiânia • 15-17 Fevereiro
        </p>

        <button className="w-full bg-white/20 backdrop-blur-xl border border-white/30 rounded-2xl py-4 font-bold text-white active:scale-95 transition-transform flex items-center justify-center gap-2">
          INSCREVER-SE AGORA
          <ChevronRight size={20} />
        </button>
      </div>
    </div>
  </div>

  {/* Quick Stats - iOS Cards Style */}
  <div className="px-4 mb-6">
    <div className="grid grid-cols-3 gap-3">
      <StatCard icon={<Trophy size={18} />} label="Posição" value="#23" color="from-yellow-400 to-orange-500" />
      <StatCard icon={<Clock size={18} />} label="WODs" value="4/4" color="from-blue-400 to-cyan-500" />
      <StatCard icon={<TrendingUp size={18} />} label="Score" value="847" color="from-purple-400 to-pink-500" />
    </div>
  </div>

  {/* Section Header */}
  <div className="px-4 mb-3">
    <h2 className="text-2xl font-bold text-gray-900">Modalidades</h2>
  </div>

  {/* Modalidades List - iOS Settings Style */}
  <div className="px-4 space-y-2 mb-6">
    <ModalidadeItem
      icon="🏋️"
      title="Workouts Qualifier"
      subtitle="4 WODs • Finalizado"
      status="completed"
    />
    <ModalidadeItem
      icon="🏃"
      title="Monstar Fitness Race"
      subtitle="7 Fevereiro 2026"
      status="upcoming"
    />
    <ModalidadeItem
      icon="🏊"
      title="Monstar Run"
      subtitle="Em breve"
      status="locked"
    />
  </div>

  {/* Categorias - Horizontal Scroll iOS Style */}
  <div className="mb-6">
    <div className="px-4 mb-3">
      <h2 className="text-2xl font-bold text-gray-900">Categorias</h2>
    </div>

    <div className="overflow-x-auto scrollbar-hide">
      <div className="flex gap-3 px-4 pb-2">
        <CategoryCard name="TEENS" color="from-yellow-400 to-amber-500" age="15-17" />
        <CategoryCard name="AMADOR" color="from-cyan-400 to-blue-500" />
        <CategoryCard name="SCALED" color="from-pink-400 to-rose-500" />
        <CategoryCard name="ELITE" color="from-purple-400 to-indigo-500" />
        <CategoryCard name="MASTER" color="from-orange-400 to-red-500" age="35+" />
      </div>
    </div>
  </div>

  {/* Próximos Eventos - iOS Calendar Style */}
  <div className="px-4 mb-6">
    <h2 className="text-2xl font-bold text-gray-900 mb-3">Próximos</h2>

    <div className="bg-white rounded-2xl overflow-hidden border border-gray-200">
      <EventItem
        date="15"
        month="FEV"
        title="Qualifier Final"
        location="SESI Clube Ferreira Pacheco"
        time="08:00"
      />
      <div className="h-px bg-gray-100 mx-4" />
      <EventItem
        date="17"
        month="FEV"
        title="Final"
        location="Arena Principal"
        time="14:00"
      />
    </div>
  </div>

  {/* Web3 Badge Preview */}
  <div className="px-4 mb-6">
    <div className="bg-gradient-to-br from-gray-900 to-black rounded-2xl p-6 text-white relative overflow-hidden">
      {/* Glow effect */}
      <div className="absolute top-0 right-0 w-32 h-32 bg-yellow-400/20 rounded-full blur-3xl" />

      <div className="relative">
        <div className="flex items-center gap-3 mb-4">
          <div className="w-12 h-12 bg-gradient-to-br from-yellow-400 to-orange-500 rounded-2xl flex items-center justify-center">
            <Star className="text-white" size={24} fill="white" />
          </div>
          <div>
            <div className="font-bold text-lg">Seu Badge NFT</div>
            <div className="text-sm text-gray-400">Verificado • Blockchain</div>
          </div>
        </div>

        <button className="w-full bg-white/10 backdrop-blur-xl border border-white/20 rounded-xl py-3 font-semibold text-sm active:scale-95 transition-transform">
          Ver Certificado Digital
        </button>
      </div>
    </div>
  </div>
</div>

```

);

// Leaderboard Screen
const LeaderboardScreen = () => (
<div className="pt-12 pb-24 overflow-y-auto">
<div className="px-4 py-6">
<h1 className="text-3xl font-black text-gray-900 mb-2">Leaderboard</h1>
<p className="text-gray-500">Qualifier 2026 • AMADOR</p>
</div>

```
  {/* Filter Pills */}
  <div className="px-4 mb-6">
    <div className="flex gap-2 overflow-x-auto scrollbar-hide pb-2">
      <FilterPill label="Todos" active />
      <FilterPill label="Masculino" />
      <FilterPill label="Feminino" />
      <FilterPill label="Minha Categoria" />
    </div>
  </div>

  {/* Your Position Highlight */}
  <div className="px-4 mb-4">
    <div className="bg-gradient-to-br from-yellow-400 to-orange-500 rounded-2xl p-4 text-white">
      <div className="flex items-center justify-between mb-2">
        <span className="text-sm font-medium opacity-90">SUA POSIÇÃO</span>
        <CheckCircle2 size={18} />
      </div>
      <div className="flex items-end gap-2">
        <span className="text-5xl font-black">#23</span>
        <span className="text-lg opacity-90 mb-2">de 847 atletas</span>
      </div>
    </div>
  </div>

  {/* Leaderboard List */}
  <div className="px-4 space-y-2">
    <LeaderboardItem position={1} name="Carlos Silva" score="956" badge="🥇" highlight />
    <LeaderboardItem position={2} name="Ana Costa" score="943" badge="🥈" highlight />
    <LeaderboardItem position={3} name="Pedro Santos" score="921" badge="🥉" highlight />
    <LeaderboardItem position={4} name="Maria Oliveira" score="897" />
    <LeaderboardItem position={5} name="João Alves" score="882" />

    {/* Gap indicator */}
    <div className="text-center py-4 text-gray-400 text-sm">
      • • •
    </div>

    <LeaderboardItem position={23} name="Você" score="847" isYou />
    <LeaderboardItem position={24} name="Lucas Ferreira" score="845" />
    <LeaderboardItem position={25} name="Juliana Rocha" score="839" />
  </div>
</div>

```

);

// Profile Screen
const ProfileScreen = () => (
<div className="pt-12 pb-24 overflow-y-auto">
{/* Header with Avatar */}
<div className="px-4 py-6">
<div className="flex items-center gap-4 mb-6">
<div className="w-20 h-20 bg-gradient-to-br from-yellow-400 to-orange-500 rounded-full flex items-center justify-center text-white text-2xl font-bold">
JS
</div>
<div>
<h1 className="text-2xl font-bold text-gray-900">João Silva</h1>
<p className="text-gray-500">@joaosilva</p>
</div>
</div>

```
    {/* Stats Grid */}
    <div className="grid grid-cols-3 gap-3 mb-6">
      <div className="bg-white rounded-2xl p-4 text-center border border-gray-200">
        <div className="text-2xl font-bold text-gray-900">4</div>
        <div className="text-xs text-gray-500">Eventos</div>
      </div>
      <div className="bg-white rounded-2xl p-4 text-center border border-gray-200">
        <div className="text-2xl font-bold text-gray-900">23</div>
        <div className="text-xs text-gray-500">Melhor Pos.</div>
      </div>
      <div className="bg-white rounded-2xl p-4 text-center border border-gray-200">
        <div className="text-2xl font-bold text-gray-900">847</div>
        <div className="text-xs text-gray-500">Total Score</div>
      </div>
    </div>
  </div>

  {/* Achievements */}
  <div className="px-4 mb-6">
    <h2 className="text-xl font-bold text-gray-900 mb-3">Conquistas</h2>
    <div className="grid grid-cols-4 gap-3">
      <AchievementBadge emoji="🎯" unlocked />
      <AchievementBadge emoji="🏅" unlocked />
      <AchievementBadge emoji="💎" unlocked />
      <AchievementBadge emoji="👑" locked />
    </div>
  </div>

  {/* Settings List */}
  <div className="px-4">
    <div className="bg-white rounded-2xl overflow-hidden border border-gray-200">
      <SettingsItem icon={<Bell size={20} />} label="Notificações" />
      <div className="h-px bg-gray-100 mx-4" />
      <SettingsItem icon={<Share2 size={20} />} label="Compartilhar Perfil" />
      <div className="h-px bg-gray-100 mx-4" />
      <SettingsItem icon={<Star size={20} />} label="Badge NFT" badge="Novo" />
    </div>
  </div>
</div>

```

);

// Tab Bar (iOS Style)
const TabBar = () => (
<div className="fixed bottom-0 left-0 right-0 bg-white/80 backdrop-blur-2xl border-t border-gray-200 pb-safe z-50">
<div className="flex justify-around items-center h-20 px-2">
<TabButton icon={<Home size={24} />} label="Início" active={activeTab === 'home'} onClick={() => setActiveTab('home')} />
<TabButton icon={<Trophy size={24} />} label="Ranking" active={activeTab === 'leaderboard'} onClick={() => setActiveTab('leaderboard')} />
<TabButton icon={<Calendar size={24} />} label="Eventos" active={activeTab === 'events'} onClick={() => setActiveTab('events')} />
<TabButton icon={<User size={24} />} label="Perfil" active={activeTab === 'profile'} onClick={() => setActiveTab('profile')} />
</div>
</div>
);

return (
<div className="relative w-full max-w-md mx-auto h-screen bg-gray-50 overflow-hidden">
<StatusBar />
<Notification show={showNotification} />

```
  {activeTab === 'home' && <HomeScreen />}
  {activeTab === 'leaderboard' && <LeaderboardScreen />}
  {activeTab === 'profile' && <ProfileScreen />}

  <TabBar />

  <style jsx>{`
    .scrollbar-hide::-webkit-scrollbar {
      display: none;
    }
    .scrollbar-hide {
      -ms-overflow-style: none;
      scrollbar-width: none;
    }
    .pb-safe {
      padding-bottom: env(safe-area-inset-bottom);
    }
  `}</style>
</div>

```

);
};

// Reusable Components
const StatCard = ({ icon, label, value, color }) => (
<div className="bg-white rounded-2xl p-4 border border-gray-200">
<div className={`w-8 h-8 bg-gradient-to-br ${color} rounded-xl flex items-center justify-center text-white mb-2`}>
{icon}
</div>
<div className="text-xs text-gray-500 mb-1">{label}</div>
<div className="text-xl font-bold text-gray-900">{value}</div>
</div>
);

const ModalidadeItem = ({ icon, title, subtitle, status }) => (
<button className="w-full bg-white rounded-2xl p-4 border border-gray-200 active:scale-98 transition-transform">
<div className="flex items-center gap-3">
<div className="text-3xl">{icon}</div>
<div className="flex-1 text-left">
<div className="font-semibold text-gray-900">{title}</div>
<div className="text-sm text-gray-500">{subtitle}</div>
</div>
<div className="flex items-center gap-2">
{status === 'completed' && <CheckCircle2 className="text-green-500" size={20} />}
{status === 'upcoming' && <Clock className="text-blue-500" size={20} />}
{status === 'locked' && <div className="text-gray-400">🔒</div>}
<ChevronRight className="text-gray-400" size={20} />
</div>
</div>
</button>
);

const CategoryCard = ({ name, color, age }) => (
<div className="flex-shrink-0 w-32">
<div className={`bg-gradient-to-br ${color} rounded-2xl p-4 text-white aspect-square flex flex-col justify-between`}>
<div className="text-xs font-medium opacity-90">CATEGORIA</div>
<div>
<div className="font-black text-lg mb-1">{name}</div>
{age && <div className="text-sm opacity-90">{age}</div>}
</div>
</div>
</div>
);

const EventItem = ({ date, month, title, location, time }) => (
<div className="flex items-center gap-4 p-4">
<div className="w-14 h-14 bg-red-500 rounded-2xl flex flex-col items-center justify-center text-white flex-shrink-0">
<div className="text-xl font-bold leading-none">{date}</div>
<div className="text-xs font-medium">{month}</div>
</div>
<div className="flex-1">
<div className="font-semibold text-gray-900">{title}</div>
<div className="text-sm text-gray-500 flex items-center gap-1">
<MapPin size={12} />
{location}
</div>
</div>
<div className="text-sm font-medium text-gray-500">{time}</div>
</div>
);

const FilterPill = ({ label, active }) => (
<button
className={`px-4 py-2 rounded-full text-sm font-semibold whitespace-nowrap transition-all active:scale-95 ${       active          ? 'bg-gray-900 text-white'          : 'bg-white text-gray-700 border border-gray-200'     }`}

> 
> 

```
{label}

```

</button>
);

const LeaderboardItem = ({ position, name, score, badge, highlight, isYou }) => (
<div className={`rounded-2xl p-4 flex items-center gap-4 ${     isYou ? 'bg-yellow-100 border-2 border-yellow-400' :     highlight ? 'bg-white border-2 border-gray-300' :     'bg-white border border-gray-200'   }`}>
<div className="w-8 text-center">
{badge || <span className="font-bold text-gray-500">#{position}</span>}
</div>
<div className="flex-1">
<div className={`font-semibold ${isYou ? 'text-yellow-900' : 'text-gray-900'}`}>
{name}
</div>
</div>
<div className={`text-xl font-bold ${isYou ? 'text-yellow-600' : 'text-gray-900'}`}>
{score}
</div>
</div>
);

const AchievementBadge = ({ emoji, unlocked, locked }) => (
<div className={`aspect-square rounded-2xl flex items-center justify-center text-4xl ${     unlocked ? 'bg-gradient-to-br from-yellow-400 to-orange-500' :     'bg-gray-200 grayscale opacity-50'   }`}>
{emoji}
</div>
);

const SettingsItem = ({ icon, label, badge }) => (
<button className="w-full flex items-center gap-3 p-4 active:bg-gray-50 transition-colors">
<div className="text-gray-700">{icon}</div>
<div className="flex-1 text-left font-medium text-gray-900">{label}</div>
{badge && (
<span className="bg-red-500 text-white text-xs font-bold px-2 py-1 rounded-full">
{badge}
</span>
)}
<ChevronRight className="text-gray-400" size={20} />
</button>
);

const TabButton = ({ icon, label, active, onClick }) => (
<button
onClick={onClick}
className={`flex flex-col items-center gap-1 px-4 py-2 transition-all active:scale-95 ${       active ? 'text-gray-900' : 'text-gray-400'     }`}

> 
> 

```
{icon}
<span className="text-xs font-medium">{label}</span>

```

</button>
);

export default MonstarIOSApp;