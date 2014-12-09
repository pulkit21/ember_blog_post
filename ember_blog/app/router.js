import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.resource('posts', {path: "/"}, function() {
    this.resource('post', {path: "posts/:post_path"}, function(){
      this.route('edit');
  });

    this.route('new');
  });
  this.route('not-found', { path: '/*path' });
  this.route('search', {path: '/search/:query'});
});

export default Router;
