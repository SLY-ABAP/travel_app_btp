@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Projection View forBooking'

@Metadata.allowExtensions: true

@ObjectModel.semanticKey: [ 'BookingID' ]

@Search.searchable: true

define view entity ZC_FE_Booking_001554
  as projection on ZI_FE_Booking_001554

{
  key BookingUUID,

      TravelUUID,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      BookingID,

      BookingDate,

      @Consumption.valueHelpDefinition: [ { entity: { name: '/DMO/I_Customer', element: 'CustomerID' } } ]
      CustomerID,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'zi_fe_carr_001554', element: 'AirlineID' } } ]
      CarrierID,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'zi_fe_flig_001554', element: 'ConnectionID' },
                                            additionalBinding: [ { localElement: 'FlightDate',   element: 'FlightDate'   },
                                                                 { localElement: 'CarrierID',    element: 'AirlineID'    },
                                                                 { localElement: 'FlightPrice',  element: 'Price'        },
                                                                 { localElement: 'CurrencyCode', element: 'CurrencyCode' } ] } ]
      ConnectionID,

      FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Currency', element: 'Currency' } } ]
      CurrencyCode,

      CreatedBy,
      LastChangedBy,
      LocalLastChangedAt,
      _Travel : redirected to parent ZC_FE_Travel_001554,

      _Connection,
      _Flight,
      _Carrier,
      _Currency,
      _Customer
}
