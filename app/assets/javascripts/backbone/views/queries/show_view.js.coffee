Localeats.Views.Queries ||= {}

class Localeats.Views.Queries.ShowView extends Backbone.View
  template: JST["backbone/templates/queries/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
