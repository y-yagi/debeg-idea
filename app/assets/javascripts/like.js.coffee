@like = (id) ->
  $(id).addClass('disabled')
  $(id).text('イイネ済み')

  text = $(id).parent().html()
  old_number = text.match(/(\d)/)[0]
  new_number = parseInt(old_number) + 1
  $(id).parent().html(text.replace(old_number, new_number))

