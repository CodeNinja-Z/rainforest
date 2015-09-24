$(document).on('ready page:load', function() {
  $('#search-form').submit(function(event) {
    // Why preverntDefault button action here?
    // Reason for preventDefault is: prevent it from being submitted the form synchronously, instead submitting asynchronously
    event.preventDefault();
    var searchValue = $('#search').val();

    // Method 1 of making ajax call:
    // $.ajax({
    //   url: '/products?search=' + searchValue,
    //   type: 'GET',
    //   dataType: 'html'
    // }).done(function(data){
    //   $('#products').html(data);
    // });
    // .done() does the same thing as success

    // Method 2
    // $.get('/products?search=' + searchValue)
    //   .done(function(data){
    //     console.log(data);
    //     $('#products').html(data);
    // });

    // Method 3:
    $.getScript('/products?search=' + searchValue);
  });

  $(window).scroll(function() {
    if ($(window).scrollTop() > $(document).height() - $(window).height() - 50) {
       return alert('near bottom');
    }
  });
});


// Example(sample code) of how to render JSON string(i.e. data retrieved from server) with JS.
// var data = theJson;
// target = $('something');
// theJson.each(function() {
//   htmlTemplate = "<p>"
//   htmlTemplate += theJson + "</p>"
// }
// target.html(htmlTemplate);
