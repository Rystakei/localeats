Localeats.Views.Queries ||= {}

class Localeats.Views.Queries.NewView extends Backbone.View
  template: JST["backbone/templates/queries/new"]

  events:
    "submit #new-query": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (query) =>
        @model = query
        window.location.hash = "/#{@model.id}"

      error: (query, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
