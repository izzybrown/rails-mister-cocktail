import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-content-new', {
    strings: ["Have a party", "Make a Cocktail"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
