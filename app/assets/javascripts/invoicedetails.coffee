anadirProducto = undefined

anadirProducto = (invoicedetail) ->
  tr = undefined
  tr = $('<tr>')
  tr.append '<td>' + invoicedetail.invoice_id + '</td>' + '<td>' + invoicedetail.sku + '</td>' + '<td>' + invoicedetail.name + '</td>' + '<td>' + invoicedetail.quantity + '</td>' + '<td>' + invoicedetail.price + '</td>' + '<td>' + invoicedetail.total + '</td>' + '<td><a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/invoicedetails/' + invoicedetail.id + '">Remover</a></td>'
  $('#invoicedetail_table').append tr
  $('select[name="invoicedetail[fakename]"]').val ''
  $('select[name="invoicedetail[fakename]"]').trigger 'change'
  $('#invoicedetail_quantity').val ''
  $('#invoicedetail_total').val ''
  return

$(document).on 'turbolinks:load', ->
  $('select[name="invoicedetail[fakename]"]').on 'change', (evt) ->
    $('#invoicedetail_sku').val $(this).find(':selected').data('sku')
    $('#invoicedetail_price').val $(this).find(':selected').data('price')
    $('#invoicedetail_name').val $(this).find(':selected').data('name')
    $('#invoicedetail_price').trigger 'change'
    return
  $('select[name="invoicedetail[fakename]"]').trigger 'change'
  $('#invoicedetail_quantity').on 'change', (evt) ->
    $('#invoicedetail_total').val $('#invoicedetail_quantity').val() * $('#invoicedetail_price').val()
    return
  $('#invoicedetail_price').on 'change', (evt) ->
    $('#invoicedetail_total').val $('#invoicedetail_quantity').val() * $('#invoicedetail_price').val()
    return
  $('#invoicedetail-form').on('ajax:success', (e, data, status, xhr) ->
    detail = undefined
    detail = e.detail
    data = detail[0]
    console.log data.gst
    anadirProducto data.gst
    return
  ).on 'ajax:error', (e, xhr, status, error) ->
    console.log 'error'
    return
  return



