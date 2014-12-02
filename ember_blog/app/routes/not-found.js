import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    error: function (error) {
      Ember.Logger.error(error);
      this.transitionTo('/not-found');
    }
  }
});