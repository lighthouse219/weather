<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<head>
  <title>Search Weather</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
  <script>
  var app = angular.module('WeatherApp', []);
  app.controller('homeController', function($scope,$http) {
	  $scope.cityName = "London,GB";
	  var appKey="b362b50a68dfb9ccd1edce74032e2c3b";
	  $scope.apiWeatherByName="samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22";
	  var url = "/Test";
	  $scope.showData=false;
	  $scope.data1=
	  {
				"coord": {
					"lon": -0.13,
					"lat": 51.51
				},
				"weather": [{
					"id": 300,
					"main": "Drizzle",
					"description": "light intensity drizzle",
					"icon": "09d"
				}],
				"base": "stations",
				"main": {
					"temp": 280.32,
					"pressure": 1012,
					"humidity": 81,
					"temp_min": 279.15,
					"temp_max": 281.15
				},
				"visibility": 10000,
				"wind": {
					"speed": 4.1,
					"deg": 80
				},
				"clouds": {
					"all": 90
				},
				"dt": 1485789600,
				"sys": {
					"type": 1,
					"id": 5091,
					"message": 0.0103,
					"country": "GB",
					"sunrise": 1485762037,
					"sunset": 1485794875
				},
				"id": 2643743,
				"name": "London",
				"cod": 200
			}
	  ;
	  
	  $scope.getRequest = function() {
				 $scope.showData=true;
		    $http.get(url).then(
		      function successCallback(response) {
		        $scope.response2 = response;
		      },
		      function errorCallback(response) {
		    	  $scope.response2="fail.."
		      }
		    ); 
		    
		  $scope.response = $scope.data1
		
		  }
	 
  
  });
  </script>
</head>
<body ng-app="WeatherApp">

<div class="container" ng-controller="homeController">

<!-- response = {{response2|json}} <hr/> -->

  <h2>Weather Search</h2>
  <form action="#">
    <div class="form-group">
      <label for="email">Enter Your City:</label>
      <input type="email" class="form-control" id="city" placeholder="City Name" ng-model="cityName" >
    </div>
    <button type="button" class="btn btn-default" ng-click="getRequest()">Search</button>
  </form>
  
  
  <div class="row" ng-if="showData">
  <h2>Weather in <b>{{response.name}},{{response.sys.country}}</b></h2>   
  <p>Today : {{ response.dt | date : "MMM d, y" }}</p>   
  <table class="table table-striped" width="50%">
    <tbody>
      <tr>
        <td>City name</td>
        <td><b>{{response.name}},{{response.sys.country}}</b></td>
       
      </tr>
      <tr>
        		
		<td rowspan="2">Weather</td>
        <td>{{response.weather[0].main}}</td>
      </tr>
	  
	   <tr>
       <td>Description :{{response.weather[0].description}}</td>
      </tr>

      <tr>
        <td rowspan="2">Temperature</td>
        <td>Temp :{{ response.main.temp}} , Pressure :{{ response.main.pressure}} ,  Humidity :{{ response.main.humidity}} </td>
      </tr>
	  
	   <tr>
       <td>Temp Min :{{ response.main.temp_min}},Temp Max :{{ response.main.temp_max}}</td>
      </tr>
	  	  
	   <tr>
        <td>Sunrise</td>
        <td>{{ response.sys.sunrise | date : "h:mm:a" }}</td>
      </tr>
	
	 <tr>
        <td>Sunset</td>
        <td>{{ response.sys.sunset | date : "h:mm:a" }}</td>
      </tr>	
	
    </tbody>
  </table>
</div>

</div>

</body>
</html>
