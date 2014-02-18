class Localeats.Models.Query extends Backbone.Model
  paramRoot: 'query'

  defaults:
    input: null
    content: null

class Localeats.Collections.QueriesCollection extends Backbone.Collection
  model: Localeats.Models.Query
  url: '/queries'

