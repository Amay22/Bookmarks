root = global ? window

angular.module('bookmarks', ['ngResource']).factory 'Bookmark', ['$resource', ($resource) ->
  Bookmark = $resource('/bookmarks/:id/:action.json',
    id: '@id'
    action: '@action'
  ,
    update:
      method: 'PUT'

    destroy:
      method: 'DELETE'
  )

  Bookmark::destroy = (cb) ->
    Bookmark.remove
      id: @id
    , cb

  Bookmark
]

root.angular = angular
