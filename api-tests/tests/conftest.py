import pytest
import responses
from fastapi.testclient import TestClient

# Dummy placeholders (would be real in production)
RPC_URL = "https://rpc.testnet.example"
app = object()


@pytest.fixture
def mock_blockchain():
    """
    Mock blockchain RPC responses so tests
    do not hit real networks.
    """
    with responses.RequestsMock() as rsps:
        rsps.add(
            responses.POST,
            RPC_URL,
            json={"result": "0x1"},
            status=200,
        )
        yield rsps


@pytest.fixture
def seeded_db():
    """
    Seed database with standard test data.
    Ensures consistent test state.
    """
    db = {
        "protocols": ["protocolA"],
        "vaults": ["stable-vault"],
    }
    return db


@pytest.fixture
def api_client(seeded_db):
    """
    API client using seeded data.
    """
    return TestClient(app)
