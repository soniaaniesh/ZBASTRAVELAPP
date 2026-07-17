@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Processor'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZRAM_C_TRAVEL_PROCESSSOR_M
  provider contract transactional_query
  as projection on ZRAM_I_Travel_M
{
  key travel_id                 as TravelID,
      @ObjectModel.text.element: [ 'AgencyName' ]
      agency_id                 as AgencyID,
      _Agency.Name              as AgencyName,

      @ObjectModel.text.element: [ 'CustomerName' ]
      customer_id               as CustomerID,

      _Customer.LastName        as CustomerName,

      begin_date                as BeginDate,
      end_date                  as EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee               as BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
       total_price               as TotalPrice,

      currency_code             as CurrencyCode,
      @ObjectModel.text.element: [ 'OverallStatusText' ]
      overall_status            as OverallStatus,
      _OverallStatus._Text.Text as OverallStatusText : localized,

      description               as Description,
      last_changed_at           as LastChangedAt,

      /* Associations */
      _Booking : redirected to composition child ZRAM_C_Booking_Processor_M,
      _Agency,
      _Customer,
      _OverallStatus

      /*  Removed all @UI.* annotations (headerInfo, facets, hidden, etc.)

       */
}
