
class ContactMethodForm extends Marionette.LayoutView
  className: 'row'

  template: =>
    switch @options.type
      when 'email' then return require './templates/email_form'
      when 'phone' then return require './templates/phone_form'
      when 'address' then return require './templates/address_form'
      when 'social' then return require './templates/social_form'

  behaviors:
    ModelEvents: {}
    SubmitButton: {}

    Flashes:
      success:
        message:  'Contact Method created.'
      error:
        message:  'Error creating Contact Method.'

  onRender: ->
    Backbone.Syphon.deserialize( @, @model.attributes )

  onSubmit: (e) ->
    attrs = Backbone.Syphon.serialize(@)
    @model.save(attrs)

  onRequest: ->
    @disableSubmit() # TODO - disable inputs as well?

  onError: ->
    @flashError()
    @enableSubmit()

  onSync: ->
    @flashSuccess()
    window.location = '#contact_methods' # TODO - redirection, state service?

# # # # #

module.exports = ContactMethodForm
