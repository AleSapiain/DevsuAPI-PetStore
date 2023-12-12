Feature: Pets Store test script

  Background:
    * url 'https://petstore.swagger.io/'

  Scenario: create a pet - add pet to store
    * def pet =
      """
          {
      "id": 1500,
      "category": {
        "id": 3,
        "name": "cat"
      },
      "name": "misiffu",
      "photoUrls": [
        "https://media.istockphoto.com/id/1063193874/es/foto/furry-brit%C3%A1nicos-cr%C3%ADan-color-de-gato-blanco-sobre-fondo-negro-aislado.jpg?s=612x612&w=0&k=20&c=lJSbQDTXXaOhEJBjyhY60wQeHtO03NNUfZjP41F5ImM="
      ],
      "tags": [
        {
          "id": 1,
          "name": "nice"
        }
      ],
      "status": "available"
    }
      """

    Given url 'https://petstore.swagger.io/v2/pet'
    And request pet
    When method post
    Then status 200

    #* def id = response.id
    #* print 'created id is: ', id

    #Given path id
    # When method get
    # Then status 200
    # And match response contains user

  Scenario: get pet by id

    Given path 'v2/pet/1500'

    When method get
    Then status 200

  Scenario: update a pet - add pet to store

    * def id = 1000
    * def name = 'misiffu - name updated'
    * def status = 'sold'

    Given url 'https://petstore.swagger.io/v2/pet/1500'
    And header Content-Type = 'application/x-www-form-urlencoded'


    And param fieldList = id, name, status
    When method post
    Then status 200

  Scenario: get pet by status

    * def sold = 'sold'

    Given path 'v2/pet/findByStatus'

    And param status = sold
    When method get
    Then status 200