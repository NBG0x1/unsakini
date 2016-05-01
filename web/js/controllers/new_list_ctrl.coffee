window.App.controller 'NewListCtrl', [
  '$scope'
  'ListService'
  '$state'
  'CryptoService'
  ($scope, ListService, $state, CryptoService) ->

    $scope.list = {}

    @create = (list) ->
      ListService.create(list)
      .then (resp) ->
        $state.go('list.items', {id: resp.data.id})
      .catch (resp) ->
        console.log resp


    null
]