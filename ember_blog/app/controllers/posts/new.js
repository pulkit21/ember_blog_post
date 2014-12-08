import Ember from 'ember';

export default Ember.Controller.extend({
  errors: "",
  actions: {
    createPost: function(){
      var self = this;
      var post = this.store.createRecord('post', this.get('fields'));
      // post.save().then(function(){
      //   self.transitionToRoute('post', post);
      // });
      post.save().then(
        function(post) {
          self.transitionToRoute('post', post);
        },
        function(errorObject) {
          self.set('errors', errorObject);
        }
      );
    }
  }
});
