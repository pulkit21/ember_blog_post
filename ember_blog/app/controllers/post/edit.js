import Ember from 'ember';

export default Ember.ObjectController.extend({

  actions: {
    saveChanges: function(){
      var self = this;
      this.get('model').save().then(function(){
        self.transitionToRoute('/');
      });
    },

    cancel: function(){
      var model = this.get('model');
      if (model.get('isDirty')){
        this.get('model').rollback();
      }
      this.transitionToRoute('/');
    }
  }

});