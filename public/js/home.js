const swiper1 = new Swiper('.swiper-1', {
  loop: true,
  pagination: {
    el: '.swiper-1 .swiper-pagination',
    clickable: true,
  },
});

const swiper2 = new Swiper('.swiper-2', {
  loop: true,
  pagination: {
    el: '.swiper-2 .swiper-pagination',
    clickable: true,
  },
  navigation: {
    nextEl: ".swiper-2 .swiper-button-next",
    prevEl: ".swiper-2 .swiper-button-prev",
  },
});
