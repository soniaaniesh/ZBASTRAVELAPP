@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BookSuppl'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZRAM_C_BookSuppl_Processor_M as projection on ZRAM_I_BOOKSUPPL_M
{
 key travel_id             as TravelID,
  key booking_id            as BookingID,
  key booking_supplement_id as BookingSupplementID,

  supplement_id             as SupplementID,
  _SupplementText.Description as SupplementDescription : localized,

  @Semantics.amount.currencyCode: 'CurrencyCode'
  price                     as Price,

  currency_code             as CurrencyCode,
  last_changed_at           as LastChangedAt,

  /* Associations */
  _Travel  : redirected to ZRAM_C_TRAVEL_PROCESSSOR_M,
  _Booking : redirected to parent ZRAM_C_Booking_Processor_M,
  _Product
}
