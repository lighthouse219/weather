  app.controller('homeController', function($scope,$http) {
	  $scope.cityName = "=London,uk";
	  $scope.appKey="b6907d289e10d714a6e88b30761fae22";
	  $scope.apiWeatherByName="samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22";
	  
	  $scope.getRequest = function() {
		    console.log("I've been pressed!"); 
		    $http.get("samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22").then(
		      function successCallback(response) {
		        $scope.response = response;
		      },
		      function errorCallback(response) {
		        console.log("Unable to perform get request");
		      }
		    );
		  };
	  
	  
	  
	});