root = global ? window

BookmarksIndexCtrl = ($scope, Bookmark) ->
  $scope.bookmarks = Bookmark.query()

  $scope.save = ->
    Bookmark.save @bookmark, (data) ->
      $scope.bookmarks.push(new Bookmark(data.bookmark))
      $scope.bookmark.title = ''

  $scope.destroy = ->
    original = @bookmark
    bootbox.confirm('Are you sure?', (response) ->
      if response
        original.destroy ->
          $scope.bookmarks = _.without($scope.bookmarks, original)
    )

BookmarksIndexCtrl.$inject = ['$scope', 'Bookmark'];

BookmarksEditCtrl = ($scope, $location, $routeParams, Bookmark) ->
  Bookmark.get id: $routeParams.id, (bookmark) ->
    @original = bookmark
    $scope.bookmark = new Bookmark @original

  $scope.isClean = ->
    angular.equals @original, $scope.bookmark

  $scope.save = ->
    alert 'in'+ JSON.stringify $scope.bookmark
    Bookmark.update $scope.bookmark, (data) ->
      $location.path '/bookmarks'

BookmarksEditCtrl.$inject = ['$scope', '$location', '$routeParams', 'Bookmark'];

# exports
root.BookmarksIndexCtrl  = BookmarksIndexCtrl
root.BookmarksEditCtrl   = BookmarksEditCtrl
