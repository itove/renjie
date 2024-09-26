const swiper1 = new Swiper('.swiper-1', {
  loop: true,
  pagination: {
    el: '.swiper-1 .swiper-pagination',
    clickable: true,
  },
});

const swiper2_1 = new Swiper('.swiper-2-1', {
  loop: true,
  pagination: {
    el: '.swiper-2-1 .swiper-pagination',
    clickable: true,
  },
  navigation: {
    nextEl: ".swiper-2-1 .swiper-button-next",
    prevEl: ".swiper-2-1 .swiper-button-prev",
  },
});
const swiper2_2 = new Swiper('.swiper-2-2', {
  loop: true,
  pagination: {
    el: '.swiper-2-2 .swiper-pagination',
    clickable: true,
  },
  navigation: {
    nextEl: ".swiper-2-2 .swiper-button-next",
    prevEl: ".swiper-2-2 .swiper-button-prev",
  },
});
const swiper2_3 = new Swiper('.swiper-2-3', {
  loop: true,
  pagination: {
    el: '.swiper-2-3 .swiper-pagination',
    clickable: true,
  },
  navigation: {
    nextEl: ".swiper-2-3 .swiper-button-next",
    prevEl: ".swiper-2-3 .swiper-button-prev",
  },
});
const switchs = document.querySelectorAll('.switch button');

const activeBtn = (id) => {
  const swiper2 = document.querySelectorAll('.swiper-2');
  for (const i of swiper2) {
    if (i.dataset.id === id) {
      i.classList.remove('d-none')
    } else {
      i.classList.add('d-none')
    }
  }
  for (const i of switchs) {
    if (i.dataset.id === id) {
      i.classList.remove('btn-light')
      i.classList.add('btn-danger')
      // i.classList.add('active')
    } else {
      i.classList.add('btn-light')
      i.classList.remove('btn-danger')
      // i.classList.remove('active')
    }
  }
};

for (const i of switchs) {
  i.addEventListener('click', () => activeBtn(i.dataset.id));
}

var swiper3_1 = new Swiper(".swiper-3-1", {
	on:{
		slideNextTransitionStart: function(){
      swiper3_2.slideNext();
    },
		slidePrevTransitionStart: function(){
      swiper3_2.slidePrev();
    },
  },
  loop: true,
  loopAddBlankSlides: true,
  grabCursor: true,
  centeredSlides: true,
  slidesPerView: "auto",
  pagination: {
    el: ".swiper-3-1 .swiper-pagination",
  },
  navigation: {
    nextEl: ".swiper-3-1 .swiper-button-next",
    prevEl: ".swiper-3-1 .swiper-button-prev",
  },
});

var swiper3_2 = new Swiper(".swiper-3-2", {
  allowTouchMove: false,
  loop: true,
  loopAddBlankSlides: true,
  effect: "coverflow",
  grabCursor: true,
  centeredSlides: true,
  slidesPerView: "auto",
  coverflowEffect: {
    rotate: 50,
    stretch: 100,
    depth: 10,
    modifier: 1,
    slideShadows: true,
  },
});
