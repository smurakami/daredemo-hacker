
all_code = ""
step = 1

$ ->
  hljs.initHighlightingOnLoad()
  counter = 0

  $.ajax
    url: 'js/sample.js'
    success: (res) ->
      all_code = res

  update = ->
    counter += step
    if counter > all_code.length
      counter = all_code.length
    code = all_code.slice 0, counter

    $('code').text code

    $('pre code').each (i, block) ->
      hljs.highlightBlock(block)

  $('body').keydown ->
    update()

  $('.button').click ->
    $('code').text all_code
    $('pre code').each (i, block) ->
      hljs.highlightBlock(block)



