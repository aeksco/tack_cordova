
class ContactMethodShowLayout extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  behaviors:
    ModelEvents: {}

    DestroyButton:
      message: 'Are you sure you want to destroy this Contact Method?'

    Flashes:
      success:
        message:  'Contact Method destroyed.'
      error:
        message:  'Error destroying Contact Method.'

  onSync: ->
    @flashSuccess()
    window.location = '#contact_methods' # TODO - handle redirection in state service?

  onError: ->
    @flashError()

# # # # #

module.exports = ContactMethodShowLayout
