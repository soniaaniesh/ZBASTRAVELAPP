@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
@Metadata.ignorePropagatedAnnotations: true
@Metadata: {
    allowExtensions: true
}
define view entity ZRAM_C_Booking_Processor_M
  as projection on ZRAM_I_Booking_M
{
  key travel_id                 as TravelID,
  key booking_id                as BookingID,

      booking_date              as BookingDate,
      @ObjectModel.text.element: [ 'CustomerName' ]
      customer_id               as CustomerID,
      _Customer.LastName        as CustomerName,
      @ObjectModel.text.element: [ 'CarrierName' ]
      carrier_id                as CarrierID,
      _Carrier.Name             as CarrierName,

      connection_id             as ConnectionID,
      flight_date               as FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price              as FlightPrice,

      currency_code             as CurrencyCode,
      @ObjectModel.text.element: [ 'BookingStatusText' ]
      booking_status            as BookingStatus,
      _BookingStatus._Text.Text as BookingStatusText : localized,

      last_changed_at           as LastChangedAt,

      /* Associations */
      _Travel         : redirected to parent ZRAM_C_TRAVEL_PROCESSSOR_M,
      _BookSupplement : redirected to composition child ZRAM_C_BookSuppl_Processor_M,
      _Customer,
      _Carrier,
      _BookingStatus
}
