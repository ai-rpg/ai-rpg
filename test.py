import logging
import logging_loki


handler = logging_loki.LokiHandler(
    url="https://3100-airpg-airpg-nu4x67nmg0j.ws-eu101.gitpod.io/loki/api/v1/push", 
    tags={"application": "my-app"},
    version="1",
)

logger = logging.getLogger("my-logger")
logger.addHandler(handler)
logger.error(
    "Something happened", 
    extra={"tags": {"service": "my-service"}},
)