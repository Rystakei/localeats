Localeats.Views.Queries ||= {}

class Localeats.Views.Queries.EditView extends Backbone.View
  template : JST["backbone/templates/queries/edit"]

  events :
    "submit #edit-query" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (query) =>
        @model = query
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
