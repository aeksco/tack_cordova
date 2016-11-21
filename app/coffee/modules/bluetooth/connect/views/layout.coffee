
ShareProfilePicker = require '../../../contact/new/views/shareProfilePicker'

# # # # #

class ContactAdder extends Backbone.Model
  urlRoot: '/share'

class BluetoothView extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  behaviors:
    ModelEvents: {}
    SubmitButton: {}

    Flashes:
      success:
        message:  'Contact Method created.'
      error:
        message:  'Error creating Contact Method.'

  # # # # #
  # TODO - this is identical to the contact/new view
  regions:
    shareProfileRegion: '[data-region=share-profiles]'

  ui:
    shareProfileId: '[name=share_profile_id]'

  onRender: ->
    @showShareProfilePicker()

  # TODO - validate phone.length & displayName.presence

  showShareProfilePicker: ->
    shareProfilePicker = new ShareProfilePicker({ collection: @collection })
    shareProfilePicker.on 'childview:selected', (view, selected) => @ui.shareProfileId.val(view.model.id)
    shareProfilePicker.on 'childview:deselected', (view, selected) => @ui.shareProfileId.val('')
    @shareProfileRegion.show shareProfilePicker
  #
  # # # # #


  onSubmit: (e) ->
    attrs = Backbone.Syphon.serialize(@)
    console.log attrs
    # @model.save(attrs)

  onRequest: ->
    @disableSubmit() # TODO - disable inputs as well?

  onError: ->
    @flashError()
    @enableSubmit()

  onSync: ->
    @flashSuccess()
    Backbone.Radio.channel('app').trigger('redirect','#contact_methods')


# # # # #

module.exports = BluetoothView
