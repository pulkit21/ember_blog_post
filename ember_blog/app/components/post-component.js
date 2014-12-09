import Ember from 'ember';

export default Ember.Component.extend({
  
  didInsertElement: function(){
    Ember.$('.truncate_me').truncate({
      lines: 5,
      lineHeight: 16,
      ellipsis: '...'
    });
  }
});
