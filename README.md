A simple ambassador container. It is capable of forwarding a port to another server and/or port.

# Usage

To use, simply define the port(s) (and server address) to forward to.

**SERVICE_PORT**
_Required_
The port the service runs on.

**LOCAL_PORT**
_Default:_ $SERVICE_PORT
The local port to listen on.

**SERVER_IP**
_Default:_ the container's gateway (i.e. the host)
The IP address of the server that runs the service.
