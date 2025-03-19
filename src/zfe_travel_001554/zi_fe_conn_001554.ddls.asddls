@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Connection view entity'

@Search.searchable: true

define view entity zi_fe_conn_001554
  as select from zfe_aconn_001554 as Connection

  association [1..1] to zi_fe_carr_001554 as _Airline on $projection.AirlineID = _Airline.AirlineID

{
      @Consumption.valueHelpDefinition: [ { entity: { name: 'zi_fe_carr_001554', element: 'AirlineID' } } ]
      @ObjectModel.text.association: '_Airline'
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
  key Connection.carrier_id      as AirlineID,

  key Connection.connection_id   as ConnectionID,

      @Consumption.valueHelpDefinition: [ { entity: { name: '/DMO/I_Airport', element: 'AirportID' } } ]
      Connection.airport_from_id as DepartureAirport,

      @Consumption.valueHelpDefinition: [ { entity: { name: '/DMO/I_Airport', element: 'AirportID' } } ]
      Connection.airport_to_id   as DestinationAirport,

      Connection.departure_time  as DepartureTime,
      Connection.arrival_time    as ArrivalTime,

      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      Connection.distance        as Distance,

      Connection.distance_unit   as DistanceUnit,

      _Airline
}
