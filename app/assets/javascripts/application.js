// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(function(){
  $('#flash').css('position', 'fixed');
  $('#flash').css('top', '10');
  $('#flash').css('left', '30%');
  $('#flash').css('z-index', '1');
  $('#flash').css('width', '45%');
  $('#flash').css('border-color', 'black');
  $('#flash').delay(500).fadeIn('normal', function(){
    $(this).delay(500).fadeOut(8000);
  });
});