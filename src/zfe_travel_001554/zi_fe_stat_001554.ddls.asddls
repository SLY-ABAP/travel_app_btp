@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel Status view entity'

define view entity zi_fe_stat_001554
  as select from zfe_astat_001554 as Status

{
      @ObjectModel.text.element: [ 'TravelStatusText' ]
      @UI.textArrangement: #TEXT_ONLY
  key Status.travel_status_id   as TravelStatusId,

      @UI.hidden: true
      Status.travel_status_text as TravelStatusText
}
