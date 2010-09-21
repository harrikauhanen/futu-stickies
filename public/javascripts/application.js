$(function() {
  var pusher = new Pusher(pusher_key, pusher_channel);
  
  pusher.bind('update', function(note) {
    $("#" + note.id)
      .effect('shake', { distance: 3, times: 2}, 100)
      .removeClass('yellow green purple').addClass(note.color)
      .find("p").text(note.text);
  });
  
  pusher.bind('create', function(note) {
    note_html = '<li style="display: none;" id="' + note.id + '" class="note ' + note.color + '"><p>' + note.text + '</p><span><a href="/notes/' + note.id + '/edit">Edit</a></span></li>';
    $(note_html).prependTo("#notes").delay(300).fadeIn();
  });
});
