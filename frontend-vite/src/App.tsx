import React, { useEffect } from 'react';
import Navbar from './components/molecules/Navbar';
import HomeSection from './pages/Home';
import { DarkModeProvider } from './services/context/DarkMode';
import { useDarkMode } from './services/customhook/useDarkMode';
import About from './pages/About';
import './App.css';


function App() {
  return (
    <DarkModeProvider>
      <AppContent />
    </DarkModeProvider>
  );
}

const AppContent: React.FC = () => {
  const { isDark } = useDarkMode();

  useEffect(() => {
    document.body.style.color = isDark ? '#fff' : '#000',
    document.body.style.fontWeight = isDark ? '500' : 'inherit',
    document.body.style.backgroundColor =  isDark ? "#003950" : "#fff"
  },[isDark])

  return (
    <>
      <Navbar />
      <HomeSection />
      <About />
    </>
  );
};

export default App;
