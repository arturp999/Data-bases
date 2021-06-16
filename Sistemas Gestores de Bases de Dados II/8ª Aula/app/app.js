var myApp = angular.module("myApp", ["ui.router"]);

myApp.controller("arrayController", function ($scope) {
  $scope.testes = [
    { name: "Physics", marks: 70 },
    { name: "Chemistry", marks: 80 },
    { name: "Math", marks: 65 },
    { name: "English", marks: 75 },
    { name: "Hindi", marks: 67 },
  ];
});

myApp.controller("buscarArrayController", function ($scope, $http) {
  $http.get("dados.json").then(function (response) {
    $scope.myData = response.data.dados1.sort(function (a, b) {
      if (a.pais < b.pais) {
        return -1;
      }
      if (a.pais > b.pais) {
        return 1;
      }
      return 0;
    });

    if (response.data.dados1.length == 0) {
      $scope.listaVazia = "Empty List";
    }

    $scope.remove = function ($index) {
      $scope.myData.splice($index, 1);
    };
  });
});

myApp.controller("showIt", function ($scope) {
  $scope.showMe = false;
  $scope.myFunc = function () {
    $scope.showMe = !$scope.showMe;
  };
});

myApp.config(function ($stateProvider) {
  var ex1 = {
    name: "spaEX1",
    url: "/spaEX1",
    templateUrl: "ex1.html",
  };

  $stateProvider.state(ex1);
});

myApp.config(function ($stateProvider) {
  var ex4 = {
    name: "spaEX4",
    url: "/spaEX4",
    templateUrl: "ex3.html",
  };

  $stateProvider.state(ex4);
});
