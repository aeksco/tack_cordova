Service = require './service'
ListRoute = require './list/route'
ShowRoute = require './show/route'

# # # # #

class ContactRouter extends Backbone.Routing.Router

  routes:
    'contacts(/)':          'list'
    'contacts/:id(/)':      'show'

  list: ->
    plugins?.deviceFeedback.haptic()
    plugins?.deviceFeedback.acoustic()
    new ListRoute({ container: @container })

  show: (id) ->
    plugins?.deviceFeedback.haptic()
    plugins?.deviceFeedback.acoustic()
    new ShowRoute({ container: @container, id: id })

# # # # #

module.exports = new ContactRouter()
