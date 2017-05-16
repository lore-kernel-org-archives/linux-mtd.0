Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbPy-0001Lj-CW
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:17:58 +0000
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
 Markus Heiser <markus.heiser@darmarit.de>,
 "Herton R. Krzesinski" <herton@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 35/53] docs-rst: convert rapidio book to ReST
Date: Tue, 16 May 2017 09:16:27 -0300
Message-Id: <e85ca0a31f1a2e71a9fe09a3abe55476fc3a25ca.1494935649.git.mchehab@s-opensource.com>
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
 Documentation/DocBook/Makefile       |   4 +-
 Documentation/DocBook/rapidio.tmpl   | 155 -----------------------------------
 Documentation/driver-api/index.rst   |   1 +
 Documentation/driver-api/rapidio.rst | 107 ++++++++++++++++++++++++
 4 files changed, 110 insertions(+), 157 deletions(-)
 delete mode 100644 Documentation/DocBook/rapidio.tmpl
 create mode 100644 Documentation/driver-api/rapidio.rst

diff --git a/Documentation/DocBook/Makefile b/Documentation/DocBook/Makefile
index 3bbda02d6aee..baedb14f3b40 100644
--- a/Documentation/DocBook/Makefile
+++ b/Documentation/DocBook/Makefile
@@ -8,8 +8,8 @@
 
 DOCBOOKS := \
 	    lsm.xml \
-	    mtdnand.xml librs.xml rapidio.xml \
-	    sh.xml w1.xml
+	    mtdnand.xml librs.xml \
+	    sh.xml
 
 ifeq ($(DOCBOOKS),)
 
diff --git a/Documentation/DocBook/rapidio.tmpl b/Documentation/DocBook/rapidio.tmpl
deleted file mode 100644
index ac3cca3399a1..000000000000
--- a/Documentation/DocBook/rapidio.tmpl
+++ /dev/null
@@ -1,155 +0,0 @@
-<?xml version="1.0" encoding="UTF-8"?>
-<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.1.2//EN"
-        "http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd" [
-	<!ENTITY rapidio SYSTEM "rapidio.xml">
-	]>
-
-<book id="RapidIO-Guide">
- <bookinfo>
-  <title>RapidIO Subsystem Guide</title>
-
-  <authorgroup>
-   <author>
-    <firstname>Matt</firstname>
-    <surname>Porter</surname>
-    <affiliation>
-     <address>
-      <email>mporter@kernel.crashing.org</email>
-      <email>mporter@mvista.com</email>
-     </address>
-    </affiliation>
-   </author>
-  </authorgroup>
-
-  <copyright>
-   <year>2005</year>
-   <holder>MontaVista Software, Inc.</holder>
-  </copyright>
-
-  <legalnotice>
-   <para>
-     This documentation is free software; you can redistribute
-     it and/or modify it under the terms of the GNU General Public
-     License version 2 as published by the Free Software Foundation.
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
-  <chapter id="intro">
-      <title>Introduction</title>
-  <para>
-	RapidIO is a high speed switched fabric interconnect with
-	features aimed at the embedded market.  RapidIO provides
-	support for memory-mapped I/O as well as message-based
-	transactions over the switched fabric network. RapidIO has
-	a standardized discovery mechanism not unlike the PCI bus
-	standard that allows simple detection of devices in a
-	network.
-  </para>
-  <para>
-  	This documentation is provided for developers intending
-	to support RapidIO on new architectures, write new drivers,
-	or to understand the subsystem internals.
-  </para>
-  </chapter>
-
-  <chapter id="bugs">
-     <title>Known Bugs and Limitations</title>
-
-     <sect1 id="known_bugs">
-     	<title>Bugs</title>
-	  <para>None. ;)</para>
-     </sect1>
-     <sect1 id="Limitations">
-     	<title>Limitations</title>
-	  <para>
-	    <orderedlist>
-	      <listitem><para>Access/management of RapidIO memory regions is not supported</para></listitem>
-	      <listitem><para>Multiple host enumeration is not supported</para></listitem>
-	    </orderedlist>
-	 </para>
-     </sect1>
-  </chapter>
-
-  <chapter id="drivers">
-     	<title>RapidIO driver interface</title>
-	<para>
-		Drivers are provided a set of calls in order
-		to interface with the subsystem to gather info
-		on devices, request/map memory region resources,
-		and manage mailboxes/doorbells.
-	</para>
-	<sect1 id="Functions">
-		<title>Functions</title>
-!Iinclude/linux/rio_drv.h
-!Edrivers/rapidio/rio-driver.c
-!Edrivers/rapidio/rio.c
-	</sect1>
-  </chapter>
-
-  <chapter id="internals">
-     <title>Internals</title>
-
-     <para>
-     This chapter contains the autogenerated documentation of the RapidIO
-     subsystem.
-     </para>
-
-     <sect1 id="Structures"><title>Structures</title>
-!Iinclude/linux/rio.h
-     </sect1>
-     <sect1 id="Enumeration_and_Discovery"><title>Enumeration and Discovery</title>
-!Idrivers/rapidio/rio-scan.c
-     </sect1>
-     <sect1 id="Driver_functionality"><title>Driver functionality</title>
-!Idrivers/rapidio/rio.c
-!Idrivers/rapidio/rio-access.c
-     </sect1>
-     <sect1 id="Device_model_support"><title>Device model support</title>
-!Idrivers/rapidio/rio-driver.c
-     </sect1>
-     <sect1 id="PPC32_support"><title>PPC32 support</title>
-!Iarch/powerpc/sysdev/fsl_rio.c
-     </sect1>
-  </chapter>
-
-  <chapter id="credits">
-     <title>Credits</title>
-	<para>
-		The following people have contributed to the RapidIO
-		subsystem directly or indirectly:
-		<orderedlist>
-			<listitem><para>Matt Porter<email>mporter@kernel.crashing.org</email></para></listitem>
-			<listitem><para>Randy Vinson<email>rvinson@mvista.com</email></para></listitem>
-			<listitem><para>Dan Malek<email>dan@embeddedalley.com</email></para></listitem>
-		</orderedlist>
-	</para>
-	<para>
-		The following people have contributed to this document:
-		<orderedlist>
-			<listitem><para>Matt Porter<email>mporter@kernel.crashing.org</email></para></listitem>
-		</orderedlist>
-	</para>
-  </chapter>
-</book>
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 8610aab8f342..1f8517db39c7 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -36,6 +36,7 @@ available subsections can be seen below.
    libata
    miscellaneous
    w1
+   rapidio
    s390-drivers
    vme
    80211/index
diff --git a/Documentation/driver-api/rapidio.rst b/Documentation/driver-api/rapidio.rst
new file mode 100644
index 000000000000..71ff658ab78e
--- /dev/null
+++ b/Documentation/driver-api/rapidio.rst
@@ -0,0 +1,107 @@
+=======================
+RapidIO Subsystem Guide
+=======================
+
+:Author: Matt Porter
+
+Introduction
+============
+
+RapidIO is a high speed switched fabric interconnect with features aimed
+at the embedded market. RapidIO provides support for memory-mapped I/O
+as well as message-based transactions over the switched fabric network.
+RapidIO has a standardized discovery mechanism not unlike the PCI bus
+standard that allows simple detection of devices in a network.
+
+This documentation is provided for developers intending to support
+RapidIO on new architectures, write new drivers, or to understand the
+subsystem internals.
+
+Known Bugs and Limitations
+==========================
+
+Bugs
+----
+
+None. ;)
+
+Limitations
+-----------
+
+1. Access/management of RapidIO memory regions is not supported
+
+2. Multiple host enumeration is not supported
+
+RapidIO driver interface
+========================
+
+Drivers are provided a set of calls in order to interface with the
+subsystem to gather info on devices, request/map memory region
+resources, and manage mailboxes/doorbells.
+
+Functions
+---------
+
+.. kernel-doc:: include/linux/rio_drv.h
+   :internal:
+
+.. kernel-doc:: drivers/rapidio/rio-driver.c
+   :export:
+
+.. kernel-doc:: drivers/rapidio/rio.c
+   :export:
+
+Internals
+=========
+
+This chapter contains the autogenerated documentation of the RapidIO
+subsystem.
+
+Structures
+----------
+
+.. kernel-doc:: include/linux/rio.h
+   :internal:
+
+Enumeration and Discovery
+-------------------------
+
+.. kernel-doc:: drivers/rapidio/rio-scan.c
+   :internal:
+
+Driver functionality
+--------------------
+
+.. kernel-doc:: drivers/rapidio/rio.c
+   :internal:
+
+.. kernel-doc:: drivers/rapidio/rio-access.c
+   :internal:
+
+Device model support
+--------------------
+
+.. kernel-doc:: drivers/rapidio/rio-driver.c
+   :internal:
+
+PPC32 support
+-------------
+
+.. kernel-doc:: arch/powerpc/sysdev/fsl_rio.c
+   :internal:
+
+Credits
+=======
+
+The following people have contributed to the RapidIO subsystem directly
+or indirectly:
+
+1. Matt Porter\ mporter@kernel.crashing.org
+
+2. Randy Vinson\ rvinson@mvista.com
+
+3. Dan Malek\ dan@embeddedalley.com
+
+The following people have contributed to this document:
+
+1. Matt Porter\ mporter@kernel.crashing.org
-- 
2.9.3
