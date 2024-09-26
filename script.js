$(document).ready(function() {
  // Menampilkan pesan salam berdasarkan waktu
  let currentHour = new Date().getHours();
  let greeting;
  if (currentHour < 12) {
      greeting = "Good Morning!";
  } else if (currentHour < 18) {
      greeting = "Good Afternoon!";
  } else {
      greeting = "Good Evening!";
  }
  $("#greeting").text(greeting);

  // Menambahkan efek scroll animation
  $(window).on("scroll", function() {
      $(".animate").each(function() {
          const elemTop = $(this).offset().top;
          const scrollPos = $(window).scrollTop() + $(window).height();
          if (elemTop < scrollPos) {
              $(this).addClass("animate");
          } else {
              $(this).removeClass("animate");
          }
      });
  });

  // Menyembunyikan elemen sebelum scroll
  $(".animate").addClass("hidden");
});
