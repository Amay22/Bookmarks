thisApp.controller 'UsersCtrl', ($scope, $http, $location, $rootScope) ->
  $rootScope.current_user = JSON.parse($("meta[name='current_user']").attr('content'))

  $rootScope.authorized = ->
    $rootScope.current_user? and $rootScope.current_user.id?

  $scope.login = ->
    authData = {user: {email: $scope.email, password: $scope.password}}
    $http(method: 'POST' , url: '/devsie-login', data: authData).success (data) ->
      $rootScope.current_user = data.current_user
      $("meta[name='current_user']").attr('content', JSON.stringify(data))
      $location.path '/tasks'

  $scope.logout = ->
    $http(method: 'DELETE', url: '/devsie-logout').success (data) ->
      $rootScope.current_user = null
      $("meta[name='current_user']").attr('content', 'null')
      $location.path '/login'

  $scope.register = ->
    registerData = {user: {name: $scope.name, email: $scope.email, password: $scope.password, password_confirmation: $scope.password}}

    $http.post('/devsie-register', registerData).success (data) ->
      $rootScope.current_user = data
      $("meta[name='current_user']").attr('content', JSON.stringify(data))
      $location.path '/tasks'
