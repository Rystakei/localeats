Localeats.Views.Queries ||= {}

class Localeats.Views.Queries.IndexView extends Backbone.View
  template: JST["backbone/templates/queries/index"]

  initialize: () ->
    @options.queries.bind('reset', @addAll)

  events: 
    "click .addressInput" : "alertMe"

  alertMe: () => 
    alert("hi!")


  addAll: () =>
    @options.queries.each(@addOne)

  addOne: (query) =>
    view = new Localeats.Views.Queries.QueryView({model : query})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(queries: @options.queries.toJSON() ))
    @addAll()

    return this
