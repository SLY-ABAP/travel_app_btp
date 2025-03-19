@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Projection View forTravel'

@Metadata.allowExtensions: true

@ObjectModel.semanticKey: [ 'TravelID' ]

@Search.searchable: true

define root view entity ZC_FE_Travel_001554
  provider contract transactional_query
  as projection on ZI_FE_Travel_001554

{
  key TravelUUID,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      TravelID,

      @Consumption.valueHelpDefinition: [ { entity: { name: '/DMO/I_Agency', element: 'AgencyID' } } ]
      AgencyID,

      CustomerID,
      BeginDate,
      EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Currency', element: 'Currency' } } ]
      CurrencyCode,

      Description,
      _TravelStatus.TravelStatusText as TravelStatusText,

      @ObjectModel.text.element: [ 'TravelStatusText' ]
      OverallStatus,

      OverallStatusCriticality,

      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      _Booking : redirected to composition child ZC_FE_Booking_001554,

      _Agency,
      _Currency,
      _Customer,
      _TravelStatus
}
