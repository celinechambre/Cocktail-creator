import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Create your own cocktail", "Find cocktail recipe"],
    typeSpeed: 60,
    loop: true
  });
}

export { loadDynamicBannerText };