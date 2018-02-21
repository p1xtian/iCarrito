$(document).ready ->
  $('select[name="invoice[name]"]').on 'change', (evt) ->
    $('#invoice_uid').val $(this).find(':selected').data('uid')
    return
  $('select[name="invoice[name]"]').trigger 'change'
  return


$(document).on 'turbolinks:load', ->
  $('select[name="invoice[name]"]').on 'change', (evt) ->
    $('#invoice_uid').val $(this).find(':selected').data('uid')
    return
  $('select[name="invoice[name]"]').trigger 'change'
  return