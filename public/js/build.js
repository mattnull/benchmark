// Generated by CoffeeScript 1.6.3
(function() {
  $(function() {
    var $results, $status, lang, results, socket;
    socket = io.connect('http://localhost:7777');
    $status = $('#status');
    $results = $('#results');
    results = {};
    lang = false;
    socket.on('benchmarkStatus', function(data) {
      var i, _i, _len, _results;
      data = data.replace(/\n/g, '<br />');
      if (!results[lang].status) {
        results[lang].status = [];
      }
      results[lang].status.push('<div>' + data + '</div>');
      $status.append('<div>' + data + '</div>');
      $status.scrollTop($status[0].scrollHeight);
      if (data.indexOf('Time taken for tests') !== -1) {
        data = $.trim(data).split('<br />');
        _results = [];
        for (_i = 0, _len = data.length; _i < _len; _i++) {
          i = data[_i];
          if (i.indexOf('Time taken for tests') !== -1) {
            _results.push($results.append('<h1>' + lang + ' (' + i + ')</h1>'));
          } else {
            _results.push(void 0);
          }
        }
        return _results;
      }
    });
    socket.on('benchmarkDone', function(data) {
      return console.log(results);
    });
    return $('.language').on('click', function(e) {
      lang = $(this).attr('data-language');
      results[lang] = {};
      return socket.emit('benchmark', lang);
    });
  });

}).call(this);
