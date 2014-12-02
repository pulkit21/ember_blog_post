import Ember from 'ember';

export default Ember.Route.extend({
  
  model: function(params){
    return this.store.find('post', params.post_path);
  },
  
  activate: function(){
    this.controllerFor('posts').set('isActive', false);
  },

  deactivate: function(){
    this.controllerFor('posts').set('isActive', true);
  }

});
