Localeats.Views.Queries ||= {}

class Localeats.Views.Queries.QueryView extends Backbone.View
  template: JST["backbone/templates/queries/query"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
