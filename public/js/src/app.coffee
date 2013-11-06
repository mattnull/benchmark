$ ->
	socket = io.connect('http://localhost:7777'); 
	$status = $('#status')
	$results = $('#results')
	results = {}
	lang = false
	socket.on 'benchmarkStatus', (data) ->
		data = data.replace(/\n/g, '<br />');

		if not results[lang].status
			results[lang].status = []

		results[lang].status.push '<div>'+data+'</div>'
		$status.append('<div>'+data+'</div>')
		$status.scrollTop($status[0].scrollHeight)
		if data.indexOf('Time taken for tests') isnt -1
			data = $.trim(data).split('<br />')
			for i in data
				
				if i.indexOf('Time taken for tests') isnt -1
					$results.append('<h1>'+lang+' ('+i+')</h1>')

	socket.on 'benchmarkDone', (data) ->
		console.log results

	$('.language').on 'click', (e) ->
		lang = $(this).attr('data-language')
		results[lang] = {}
		socket.emit 'benchmark', lang





