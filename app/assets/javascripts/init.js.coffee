root = global ? window
angular = root.angular

thisApp = angular.module('Bookmarklist', ['ngResource', 'ngRoute'])

thisApp.run(($rootScope, $location) ->
  $rootScope.$on('$routeChangeStart', (event, next, current) ->
    if $location.path() != '/login' && $location.path() != '/register' && !$rootScope.authorized()
      $location.path '/register'
    else if ($location.path() == '/login' || $location.path() == '/register') && $rootScope.authorized()
      $location.path '/'
  )
)

root.thisApp = thisApp
