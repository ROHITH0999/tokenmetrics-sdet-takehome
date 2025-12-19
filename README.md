
## Token Metrics – SDET Take-Home

This repository demonstrates a reusable test infrastructure covering:
- Smart contracts (Foundry)
- Backend APIs (pytest)
- Mobile app E2E flows (Maestro)

Focus areas:
- Reusable fixtures
- Test isolation
- Clear coverage tracking
- CI automation


## Test Coverage Matrix

| Component | Unit | Integration | E2E | Status |
|----------|------|-------------|-----|--------|
| Vault deposit | ✅ | ✅ | ✅ | Ready |
| Vault withdraw | ✅ | ❌ | ❌ | Planned |
| Yield simulation | ✅ | N/A | N/A | Ready |
| Protocol routing | ✅ | ✅ | N/A | Ready |
| Mobile connect wallet | N/A | N/A | ✅ | Ready |
| Mobile deposit flow | N/A | N/A | ✅ | Ready |
| Mobile error handling | N/A | N/A | 🔄 | In progress |


## Test Isolation Strategy
- Each test uses fresh mocks and fixtures
- Blockchain RPC calls are mocked
- Seeded data ensures deterministic results
- No test depends on another test’s state
