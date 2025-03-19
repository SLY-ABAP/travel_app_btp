@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Projection View for Booking Analysis'

@Metadata.allowExtensions: true

@Search.searchable: true

define root view entity zc_fe_booking_analytics_001554
  provider contract transactional_interface
  as projection on zi_fe_booking_analytics_001554

{
  key BookingUUID,

      TravelUUID,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.9
      BookingID,

      BookingDate,

      @EndUserText.label: 'Booking Date (Year)'
      BookingDateYear,

      @EndUserText.label: 'Customer'
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerID,

      CustomerName,

      @EndUserText.label: 'Airline'
      @ObjectModel.text.element: [ 'CarrierName' ]
      CarrierID,

      CarrierName,
      ConnectionID,
      FlightDate,

      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,

      CurrencyCode,

      @EndUserText.label: 'Agency'
      @ObjectModel.text.element: [ 'AgencyName' ]
      AgencyID,

      AgencyName,
      CreatedBy,
      LastChangedBy,
      LocalLastChangedAt,

      _Travel,
      _Carrier,
      _Customer,
      _Connection
}
