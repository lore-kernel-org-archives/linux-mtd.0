Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbPy-0001MU-CM
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:17:54 +0000
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Markus Heiser <markus.heiser@darmarit.de>
Subject: [PATCH v2 34/53] docs-rst: convert w1 book to ReST
Date: Tue, 16 May 2017 09:16:26 -0300
Message-Id: <b4c1064a76e7101fa1f2bcce2f56b820d475a585.1494935649.git.mchehab@s-opensource.com>
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
 Documentation/DocBook/w1.tmpl      | 101 -------------------------------------
 Documentation/driver-api/index.rst |   1 +
 Documentation/driver-api/w1.rst    |  70 +++++++++++++++++++++++++
 3 files changed, 71 insertions(+), 101 deletions(-)
 delete mode 100644 Documentation/DocBook/w1.tmpl
 create mode 100644 Documentation/driver-api/w1.rst

diff --git a/Documentation/DocBook/w1.tmpl b/Documentation/DocBook/w1.tmpl
deleted file mode 100644
index b0228d4c81bb..000000000000
--- a/Documentation/DocBook/w1.tmpl
+++ /dev/null
@@ -1,101 +0,0 @@
-<?xml version="1.0" encoding="UTF-8"?>
-<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.1.2//EN"
-	"http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd" []>
-
-<book id="w1id">
-  <bookinfo>
-    <title>W1: Dallas' 1-wire bus</title>
-
-    <authorgroup>
-      <author>
-        <firstname>David</firstname>
-        <surname>Fries</surname>
-        <affiliation>
-          <address>
-            <email>David@Fries.net</email>
-          </address>
-        </affiliation>
-      </author>
-
-    </authorgroup>
-
-    <copyright>
-      <year>2013</year>
-      <!--
-      <holder></holder>
-      -->
-    </copyright>
-
-    <legalnotice>
-      <para>
-        This documentation is free software; you can redistribute
-        it and/or modify it under the terms of the GNU General Public
-        License version 2.
-      </para>
-
-      <para>
-        This program is distributed in the hope that it will be
-        useful, but WITHOUT ANY WARRANTY; without even the implied
-        warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-        For more details see the file COPYING in the source
-        distribution of Linux.
-      </para>
-    </legalnotice>
-  </bookinfo>
-
-  <toc></toc>
-
-  <chapter id="w1_internal">
-    <title>W1 API internal to the kernel</title>
-
-    <sect1 id="w1_internal_api">
-      <title>W1 API internal to the kernel</title>
-      <sect2 id="w1.h">
-        <title>drivers/w1/w1.h</title>
-        <para>W1 core functions.</para>
-!Idrivers/w1/w1.h
-      </sect2>
-
-      <sect2 id="w1.c">
-        <title>drivers/w1/w1.c</title>
-        <para>W1 core functions.</para>
-!Idrivers/w1/w1.c
-      </sect2>
-
-      <sect2 id="w1_family.h">
-        <title>drivers/w1/w1_family.h</title>
-        <para>Allows registering device family operations.</para>
-!Idrivers/w1/w1_family.h
-      </sect2>
-
-      <sect2 id="w1_family.c">
-        <title>drivers/w1/w1_family.c</title>
-        <para>Allows registering device family operations.</para>
-!Edrivers/w1/w1_family.c
-      </sect2>
-
-      <sect2 id="w1_int.c">
-        <title>drivers/w1/w1_int.c</title>
-        <para>W1 internal initialization for master devices.</para>
-!Edrivers/w1/w1_int.c
-      </sect2>
-
-      <sect2 id="w1_netlink.h">
-        <title>drivers/w1/w1_netlink.h</title>
-        <para>W1 external netlink API structures and commands.</para>
-!Idrivers/w1/w1_netlink.h
-      </sect2>
-
-      <sect2 id="w1_io.c">
-        <title>drivers/w1/w1_io.c</title>
-        <para>W1 input/output.</para>
-!Edrivers/w1/w1_io.c
-!Idrivers/w1/w1_io.c
-      </sect2>
-
-    </sect1>
-
-
-  </chapter>
-
-</book>
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 9589b06e374e..8610aab8f342 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -35,6 +35,7 @@ available subsections can be seen below.
    scsi
    libata
    miscellaneous
+   w1
    s390-drivers
    vme
    80211/index
diff --git a/Documentation/driver-api/w1.rst b/Documentation/driver-api/w1.rst
new file mode 100644
index 000000000000..c1da8f0cb476
--- /dev/null
+++ b/Documentation/driver-api/w1.rst
@@ -0,0 +1,70 @@
+======================
+W1: Dallas' 1-wire bus
+======================
+
+:Author: David Fries
+
+W1 API internal to the kernel
+=============================
+
+W1 API internal to the kernel
+-----------------------------
+
+drivers/w1/w1.h
+~~~~~~~~~~~~~~~
+
+W1 core functions.
+
+.. kernel-doc:: drivers/w1/w1.h
+   :internal:
+
+drivers/w1/w1.c
+~~~~~~~~~~~~~~~
+
+W1 core functions.
+
+.. kernel-doc:: drivers/w1/w1.c
+   :internal:
+
+drivers/w1/w1_family.h
+~~~~~~~~~~~~~~~~~~~~~~~
+
+Allows registering device family operations.
+
+.. kernel-doc:: drivers/w1/w1_family.h
+   :internal:
+
+drivers/w1/w1_family.c
+~~~~~~~~~~~~~~~~~~~~~~~
+
+Allows registering device family operations.
+
+.. kernel-doc:: drivers/w1/w1_family.c
+   :export:
+
+drivers/w1/w1_int.c
+~~~~~~~~~~~~~~~~~~~~
+
+W1 internal initialization for master devices.
+
+.. kernel-doc:: drivers/w1/w1_int.c
+   :export:
+
+drivers/w1/w1_netlink.h
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+W1 external netlink API structures and commands.
+
+.. kernel-doc:: drivers/w1/w1_netlink.h
+   :internal:
+
+drivers/w1/w1_io.c
+~~~~~~~~~~~~~~~~~~~
+
+W1 input/output.
+
+.. kernel-doc:: drivers/w1/w1_io.c
+   :export:
+
+.. kernel-doc:: drivers/w1/w1_io.c
+   :internal:
-- 
2.9.3
