// $(document).on('ready page:load', function() {
//   $('#search-form').submit(function(event) {
//     // Why preverntDefault button action here?
//     // Reason for preventDefault is: prevent it from being submitted the form synchronously, instead submitting asynchronously
//     event.preventDefault();
//     var searchValue = $('#search').val();

//     $.ajax({
//       url: '/products?search=' + searchValue,
//       type: 'GET',
//       dataType: 'html'
//     }).done(function(data){
//       $('#products').html(data);
//     });
//   });
// });

// $.get('/products?search=' + searchValue)
//   .done(function(data){
//     console.log(data);
//     $('#products').html(data);
//   });

var data = theJson;
target = $('something');
theJson.each(function() {
  htmlTemplate = "<p>"
  htmlTemplate += theJson + "</p>"
}
target.html(htmlTemplate);
