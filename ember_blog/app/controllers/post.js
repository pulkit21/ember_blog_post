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
      this.store.find('post', this.get('model').get('id')).then(function (record){
        var result = confirm("Do you really want to delete?");
        if (result === true){
          record.destroyRecord().then(function(){
            self.transitionToRoute('posts');
          });
        }
      });
      // this.get('model').destroyRecord().then(function(){
      //   self.transitionToRoute('posts');
      // });
    }
  }
});