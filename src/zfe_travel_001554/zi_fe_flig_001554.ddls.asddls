@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Flight view entity'

@Search.searchable: true

define view entity zi_fe_flig_001554
  as select from zfe_aflig_001554 as Flight

  association [1] to    zi_fe_carr_001554 as _Airline    on $projection.AirlineID = _Airline.AirlineID
  association [1] to    zi_fe_conn_001554 as _Connection on $projection.ConnectionID = _Connection.ConnectionID and $projection.AirlineID = _Connection.AirlineID
  association [0..1] to I_Currency        as _Currency   on $projection.CurrencyCode = _Currency.Currency

{
      @Consumption.valueHelpDefinition: [ { entity: { name: 'zi_fe_carr_001554', element: 'AirlineID' } } ]
      @ObjectModel.text.association: '_Airline'
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
  key Flight.carrier_id     as AirlineID,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'zi_fe_conn_001554', element: 'ConnectionID' },
                                            additionalBinding: [ { element: 'AirlineID', localElement: 'AirlineID' } ] } ]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
  key Flight.connection_id  as ConnectionID,

  key Flight.flight_date    as FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      Flight.price          as Price,

      Flight.currency_code  as CurrencyCode,
      Flight.plane_type_id  as PlaneType,
      Flight.seats_max      as MaximumSeats,
      Flight.seats_occupied as OccupiedSeats,

      _Airline,
      _Connection,
      _Currency
}
