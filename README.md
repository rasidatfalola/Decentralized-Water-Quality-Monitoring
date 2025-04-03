# Decentralized Water Quality Monitoring System

A blockchain-based system for monitoring water quality using Clarity smart contracts. This system enables transparent, tamper-proof recording of water quality data, automated alerts for quality issues, and tracking of remediation efforts.

## System Architecture

The system consists of four main smart contracts:

1. **Testing Station Registry**: Manages monitoring stations
2. **Data Collection**: Records water quality measurements
3. **Alert System**: Monitors measurements and triggers alerts
4. **Remediation Tracking**: Tracks efforts to address quality issues

## Contracts

### Testing Station Registry

This contract manages the registration and metadata of water quality monitoring stations.

Key functions:
- `register-station`: Register a new monitoring station with location data
- `update-station-status`: Update the active status of a station
- `update-station-location`: Update the geographical coordinates of a station
- `get-station`: Retrieve information about a specific station

### Data Collection

This contract handles the recording and retrieval of water quality measurements.

Key functions:
- `record-measurement`: Record a new water quality measurement
- `get-measurement`: Retrieve a specific measurement
- `get-station-measurements`: Get all measurements for a station
- `get-latest-measurements`: Get the most recent measurements for a station

### Alert System

This contract defines quality thresholds and generates alerts when measurements exceed them.

Key functions:
- `set-threshold`: Set or update a quality threshold
- `check-measurement`: Check a measurement against thresholds
- `resolve-alert`: Mark an alert as resolved
- `get-unresolved-alerts`: Get all unresolved alerts

### Remediation Tracking

This contract tracks efforts to address water quality issues identified by alerts.

Key functions:
- `create-remediation`: Create a new remediation record for an alert
- `update-remediation-status`: Update the status of a remediation effort
- `update-remediation-description`: Update the description of remediation actions
- `reassign-remediation`: Change the assignee of a remediation task

## Data Structure

### Water Quality Parameters

The system tracks the following water quality parameters:

- **pH Level**: Acidity/alkalinity (stored as integer, divide by 100 for actual value)
- **Temperature**: Water temperature in Celsius (stored as integer, divide by 100 for actual value)
- **Turbidity**: Water clarity measurement (stored as integer, divide by 100 for actual value)
- **Dissolved Oxygen**: Oxygen content (stored as integer, divide by 100 for actual value)

### Thresholds

Default thresholds are set for each parameter:

- **pH Level**: 6.5-8.5 (stored as 650-850)
- **Temperature**: 5-30°C (stored as 500-3000)
- **Turbidity**: 0-5 NTU (stored as 0-500)
- **Dissolved Oxygen**: 5-14 mg/L (stored as 500-1400)

## Testing

Run tests using Vitest:

```bash
npm test
