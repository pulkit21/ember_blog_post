import Ember from 'ember';

export default Ember.ObjectController.extend({
  isEditing: false,

  actions:{
    saveChange: function(){
      if (this.get('model.isDirty')) {
        this.get('model').save();  
      }
    },

    delete: function(){
      var self = this;
      this.get('model').destroyRecord().then(function(){
        self.transitionToRoute('posts');
      });
    }
  }
});