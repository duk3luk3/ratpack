# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->
  $('#request-form').focusout ->
    $('request_system_name').val($('#system-search').val())


$(document).ready(ready)
$(document).on('page:load', ready)