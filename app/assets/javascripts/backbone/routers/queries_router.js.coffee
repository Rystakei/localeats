class Localeats.Routers.QueriesRouter extends Backbone.Router
  initialize: (options) ->
    @queries = new Localeats.Collections.QueriesCollection()
    @queries.reset options.queries

  routes:
    "new"      : "newQuery"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newQuery: ->
    @view = new Localeats.Views.Queries.NewView(collection: @queries)
    $("#queries").html(@view.render().el)

  index: ->
    @view = new Localeats.Views.Queries.IndexView(queries: @queries)
    $("#queries").html(@view.render().el)

  show: (id) ->
    query = @queries.get(id)

    @view = new Localeats.Views.Queries.ShowView(model: query)
    $("#queries").html(@view.render().el)

  edit: (id) ->
    query = @queries.get(id)

    @view = new Localeats.Views.Queries.EditView(model: query)
    $("#queries").html(@view.render().el)
