Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbPy-0001MZ-CJ
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:18:05 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Jani Nikula <jani.nikula@intel.com>,
 "Herton R. Krzesinski" <herton@redhat.com>,
 Markus Heiser <markus.heiser@darmarit.de>,
 Silvio Fricke <silvio.fricke@gmail.com>
Subject: [PATCH v2 28/53] docs-rst: convert networking book to ReST
Date: Tue, 16 May 2017 09:16:20 -0300
Message-Id: <05e0f3b9966c4d6ee8e051607e2ede17b06218c4.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use pandoc to convert documentation to ReST by calling
Documentation/sphinx/tmplcvt script.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/DocBook/Makefile        |   1 -
 Documentation/DocBook/networking.tmpl | 111 -------------------------
 Documentation/conf.py                 |   2 +
 Documentation/index.rst               |   1 +
 Documentation/networking/conf.py      |  10 +++
 Documentation/networking/index.rst    |  17 ++++
 Documentation/networking/kapi.rst     | 147 ++++++++++++++++++++++++++++++++++
 7 files changed, 177 insertions(+), 112 deletions(-)
 delete mode 100644 Documentation/DocBook/networking.tmpl
 create mode 100644 Documentation/networking/conf.py
 create mode 100644 Documentation/networking/index.rst
 create mode 100644 Documentation/networking/kapi.rst

diff --git a/Documentation/DocBook/Makefile b/Documentation/DocBook/Makefile
index a25bf10384e1..8a90891c3712 100644
--- a/Documentation/DocBook/Makefile
+++ b/Documentation/DocBook/Makefile
@@ -7,7 +7,6 @@
 # list of DOCBOOKS.
 
 DOCBOOKS := z8530book.xml  \
-	    networking.xml \
 	    lsm.xml \
 	    mtdnand.xml librs.xml rapidio.xml \
 	    scsi.xml \
diff --git a/Documentation/DocBook/networking.tmpl b/Documentation/DocBook/networking.tmpl
deleted file mode 100644
index 29df25016c7c..000000000000
--- a/Documentation/DocBook/networking.tmpl
+++ /dev/null
@@ -1,111 +0,0 @@
-<?xml version="1.0" encoding="UTF-8"?>
-<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.1.2//EN"
-	"http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd" []>
-
-<book id="LinuxNetworking">
- <bookinfo>
-  <title>Linux Networking and Network Devices APIs</title>
-
-  <legalnotice>
-   <para>
-     This documentation is free software; you can redistribute
-     it and/or modify it under the terms of the GNU General Public
-     License as published by the Free Software Foundation; either
-     version 2 of the License, or (at your option) any later
-     version.
-   </para>
-
-   <para>
-     This program is distributed in the hope that it will be
-     useful, but WITHOUT ANY WARRANTY; without even the implied
-     warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-     See the GNU General Public License for more details.
-   </para>
-
-   <para>
-     You should have received a copy of the GNU General Public
-     License along with this program; if not, write to the Free
-     Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
-     MA 02111-1307 USA
-   </para>
-
-   <para>
-     For more details see the file COPYING in the source
-     distribution of Linux.
-   </para>
-  </legalnotice>
- </bookinfo>
-
-<toc></toc>
-
-  <chapter id="netcore">
-     <title>Linux Networking</title>
-     <sect1><title>Networking Base Types</title>
-!Iinclude/linux/net.h
-     </sect1>
-     <sect1><title>Socket Buffer Functions</title>
-!Iinclude/linux/skbuff.h
-!Iinclude/net/sock.h
-!Enet/socket.c
-!Enet/core/skbuff.c
-!Enet/core/sock.c
-!Enet/core/datagram.c
-!Enet/core/stream.c
-     </sect1>
-     <sect1><title>Socket Filter</title>
-!Enet/core/filter.c
-     </sect1>
-     <sect1><title>Generic Network Statistics</title>
-!Iinclude/uapi/linux/gen_stats.h
-!Enet/core/gen_stats.c
-!Enet/core/gen_estimator.c
-     </sect1>
-     <sect1><title>SUN RPC subsystem</title>
-<!-- The !D functionality is not perfect, garbage has to be protected by comments
-!Dnet/sunrpc/sunrpc_syms.c
--->
-!Enet/sunrpc/xdr.c
-!Enet/sunrpc/svc_xprt.c
-!Enet/sunrpc/xprt.c
-!Enet/sunrpc/sched.c
-!Enet/sunrpc/socklib.c
-!Enet/sunrpc/stats.c
-!Enet/sunrpc/rpc_pipe.c
-!Enet/sunrpc/rpcb_clnt.c
-!Enet/sunrpc/clnt.c
-     </sect1>
-     <sect1><title>WiMAX</title>
-!Enet/wimax/op-msg.c
-!Enet/wimax/op-reset.c
-!Enet/wimax/op-rfkill.c
-!Enet/wimax/stack.c
-!Iinclude/net/wimax.h
-!Iinclude/uapi/linux/wimax.h
-     </sect1>
-  </chapter>
-
-  <chapter id="netdev">
-     <title>Network device support</title>
-     <sect1><title>Driver Support</title>
-!Enet/core/dev.c
-!Enet/ethernet/eth.c
-!Enet/sched/sch_generic.c
-!Iinclude/linux/etherdevice.h
-!Iinclude/linux/netdevice.h
-     </sect1>
-     <sect1><title>PHY Support</title>
-!Edrivers/net/phy/phy.c
-!Idrivers/net/phy/phy.c
-!Edrivers/net/phy/phy_device.c
-!Idrivers/net/phy/phy_device.c
-!Edrivers/net/phy/mdio_bus.c
-!Idrivers/net/phy/mdio_bus.c
-     </sect1>
-<!-- FIXME: Removed for now since no structured comments in source
-     <sect1><title>Wireless</title>
-X!Enet/core/wireless.c
-     </sect1>
--->
-  </chapter>
-
-</book>
diff --git a/Documentation/conf.py b/Documentation/conf.py
index ad9a4781b330..dfe14f7525d0 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -369,6 +369,8 @@ latex_documents = [
      'The kernel development community', 'manual'),
     ('media/index', 'media.tex', 'Linux Media Subsystem Documentation',
      'The kernel development community', 'manual'),
+    ('networking/index', 'networking.tex', 'Linux Networking Documentation',
+     'The kernel development community', 'manual'),
     ('process/index', 'development-process.tex', 'Linux Kernel Development Documentation',
      'The kernel development community', 'manual'),
     ('security/index', 'security.tex', 'The kernel security subsystem manual',
diff --git a/Documentation/index.rst b/Documentation/index.rst
index dae365f3820e..25c4da41da6b 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -68,6 +68,7 @@ needed).
    driver-api/index
    core-api/index
    media/index
+   networking/index
    input/index
    gpu/index
    security/index
diff --git a/Documentation/networking/conf.py b/Documentation/networking/conf.py
new file mode 100644
index 000000000000..40f69e67a883
--- /dev/null
+++ b/Documentation/networking/conf.py
@@ -0,0 +1,10 @@
+# -*- coding: utf-8; mode: python -*-
+
+project = "Linux Networking Documentation"
+
+tags.add("subproject")
+
+latex_documents = [
+    ('index', 'networking.tex', project,
+     'The kernel development community', 'manual'),
+]
diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
new file mode 100644
index 000000000000..ff652ff279e8
--- /dev/null
+++ b/Documentation/networking/index.rst
@@ -0,0 +1,17 @@
+Linux Networking Documentation
+==============================
+
+Contents:
+
+.. toctree::
+   :maxdepth: 2
+
+   kapi
+
+.. only::  subproject
+
+   Indices
+   =======
+
+   * :ref:`genindex`
+
diff --git a/Documentation/networking/kapi.rst b/Documentation/networking/kapi.rst
new file mode 100644
index 000000000000..580289f345da
--- /dev/null
+++ b/Documentation/networking/kapi.rst
@@ -0,0 +1,147 @@
+=========================================
+Linux Networking and Network Devices APIs
+=========================================
+
+Linux Networking
+================
+
+Networking Base Types
+---------------------
+
+.. kernel-doc:: include/linux/net.h
+   :internal:
+
+Socket Buffer Functions
+-----------------------
+
+.. kernel-doc:: include/linux/skbuff.h
+   :internal:
+
+.. kernel-doc:: include/net/sock.h
+   :internal:
+
+.. kernel-doc:: net/socket.c
+   :export:
+
+.. kernel-doc:: net/core/skbuff.c
+   :export:
+
+.. kernel-doc:: net/core/sock.c
+   :export:
+
+.. kernel-doc:: net/core/datagram.c
+   :export:
+
+.. kernel-doc:: net/core/stream.c
+   :export:
+
+Socket Filter
+-------------
+
+.. kernel-doc:: net/core/filter.c
+   :export:
+
+Generic Network Statistics
+--------------------------
+
+.. kernel-doc:: include/uapi/linux/gen_stats.h
+   :internal:
+
+.. kernel-doc:: net/core/gen_stats.c
+   :export:
+
+.. kernel-doc:: net/core/gen_estimator.c
+   :export:
+
+SUN RPC subsystem
+-----------------
+
+.. kernel-doc:: net/sunrpc/xdr.c
+   :export:
+
+.. kernel-doc:: net/sunrpc/svc_xprt.c
+   :export:
+
+.. kernel-doc:: net/sunrpc/xprt.c
+   :export:
+
+.. kernel-doc:: net/sunrpc/sched.c
+   :export:
+
+.. kernel-doc:: net/sunrpc/socklib.c
+   :export:
+
+.. kernel-doc:: net/sunrpc/stats.c
+   :export:
+
+.. kernel-doc:: net/sunrpc/rpc_pipe.c
+   :export:
+
+.. kernel-doc:: net/sunrpc/rpcb_clnt.c
+   :export:
+
+.. kernel-doc:: net/sunrpc/clnt.c
+   :export:
+
+WiMAX
+-----
+
+.. kernel-doc:: net/wimax/op-msg.c
+   :export:
+
+.. kernel-doc:: net/wimax/op-reset.c
+   :export:
+
+.. kernel-doc:: net/wimax/op-rfkill.c
+   :export:
+
+.. kernel-doc:: net/wimax/stack.c
+   :export:
+
+.. kernel-doc:: include/net/wimax.h
+   :internal:
+
+.. kernel-doc:: include/uapi/linux/wimax.h
+   :internal:
+
+Network device support
+======================
+
+Driver Support
+--------------
+
+.. kernel-doc:: net/core/dev.c
+   :export:
+
+.. kernel-doc:: net/ethernet/eth.c
+   :export:
+
+.. kernel-doc:: net/sched/sch_generic.c
+   :export:
+
+.. kernel-doc:: include/linux/etherdevice.h
+   :internal:
+
+.. kernel-doc:: include/linux/netdevice.h
+   :internal:
+
+PHY Support
+-----------
+
+.. kernel-doc:: drivers/net/phy/phy.c
+   :export:
+
+.. kernel-doc:: drivers/net/phy/phy.c
+   :internal:
+
+.. kernel-doc:: drivers/net/phy/phy_device.c
+   :export:
+
+.. kernel-doc:: drivers/net/phy/phy_device.c
+   :internal:
+
+.. kernel-doc:: drivers/net/phy/mdio_bus.c
+   :export:
+
+.. kernel-doc:: drivers/net/phy/mdio_bus.c
+   :internal:
-- 
2.9.3
