// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "dart:io";

void testHostAndPort() {
  ServerSocket.bind().then((server) {

    Socket.connect("127.0.0.1", server.port).then((clientSocket) {
      server.listen((socket) {
        Expect.equals(socket.port, server.port);
        Expect.equals(clientSocket.port, socket.remotePort);
        Expect.equals(clientSocket.remotePort, socket.port);
        Expect.equals(socket.remoteHost, "127.0.0.1");
        Expect.equals(clientSocket.remoteHost, "127.0.0.1");

        server.close();
      });
    });
  });
}

void main() {
  testHostAndPort();
}
