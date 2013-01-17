jQuery ($) ->
  searchField = $("input#search_field")

  shouldSubmitSearch = false

  searchField.on "keyup", ->
    if searchField.val() is ""
      if shouldSubmitSearch
        $("#search_form").submit()
        shuoldSubmitSearch = false
    else
      shouldSubmitSearch = true

  $("#search_form").on "submit", (event) ->
    event.preventDefault()
    $.ajax
      dataType: "script"
      url: @action
      data: $(this).serialize()


  $("select#categories_select").on "change", (event) ->
    selected = $(this).find(":selected")
    $.getScript selected.data("ajax-href")
    
    # Refresh search form link
    $("#search_form").get(0).setAttribute "action", selected.data("ajax-href")