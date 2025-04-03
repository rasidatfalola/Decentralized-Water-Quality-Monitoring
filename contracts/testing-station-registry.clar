;; Testing Station Registration Contract
;; Records locations of monitoring points

(define-data-var next-station-id uint u0)

(define-map stations
  { station-id: uint }
  {
    owner: principal,
    latitude: int,
    longitude: int,
    name: (string-utf8 100),
    active: bool
  }
)

(define-read-only (get-station (station-id uint))
  (map-get? stations { station-id: station-id })
)

(define-read-only (get-station-count)
  (var-get next-station-id)
)

(define-public (register-station (latitude int) (longitude int) (name (string-utf8 100)))
  (let
    (
      (station-id (var-get next-station-id))
    )
    (map-set stations
      { station-id: station-id }
      {
        owner: tx-sender,
        latitude: latitude,
        longitude: longitude,
        name: name,
        active: true
      }
    )
    (var-set next-station-id (+ station-id u1))
    (ok station-id)
  )
)

(define-public (update-station-status (station-id uint) (active bool))
  (let
    (
      (station (unwrap! (map-get? stations { station-id: station-id }) (err u1)))
    )
    (asserts! (is-eq tx-sender (get owner station)) (err u2))
    (map-set stations
      { station-id: station-id }
      (merge station { active: active })
    )
    (ok true)
  )
)

(define-public (update-station-location (station-id uint) (latitude int) (longitude int))
  (let
    (
      (station (unwrap! (map-get? stations { station-id: station-id }) (err u1)))
    )
    (asserts! (is-eq tx-sender (get owner station)) (err u2))
    (map-set stations
      { station-id: station-id }
      (merge station { latitude: latitude, longitude: longitude })
    )
    (ok true)
  )
)
