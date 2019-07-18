import $ from 'jquery';

let videoSrc;
const videoBtns = document.querySelectorAll('.video-btn');

 videoBtns.forEach((btn) => {
  btn.addEventListener('click', (e) => {
    videoSrc = e.target.dataset.src;
  });
 });

// when the modal is opened autoplay it
$('#video-popup').on('shown.bs.modal', function (e) {
  $("#video").attr('src',videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0" );
})

// stop playing the youtube video when I close the modal
$('#video-popup').on('hide.bs.modal', function (e) {
    // a poor man's stop video
    $("#video").attr('src',videoSrc);
})
