thisApp.config(['$routeProvider', ($routeProvider) ->
  $routeProvider
  .when('/register', controller: 'UsersCtrl', templateUrl: '/users/register.html')
  .when('/login', controller: 'UsersCtrl', templateUrl: '/users/login.html')
  .when('/bookmarks', controller: BookmarksIndexCtrl, templateUrl: '/bookmarks/index.html')
  .when("/bookmarks/:id/edit", controller: BookmarksEditCtrl, templateUrl: '/bookmarks/edit.html')
  .otherwise redirectTo: '/bookmarks'
])
