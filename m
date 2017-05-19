Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWdG-0000LR-BK
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:23:10 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 18/31] debugging-via-ohci1394.txt: standardize document format
Date: Thu, 18 May 2017 22:22:23 -0300
Message-Id: <ff99f0940e66e4a42b67113363f4643e4ecb3340.1495156488.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156488.git.mchehab@s-opensource.com>
References: <cover.1495156488.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156488.git.mchehab@s-opensource.com>
References: <cover.1495156488.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx:

- Mark and adjust titles;
- Mark and indent literal blocks.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/debugging-via-ohci1394.txt | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/Documentation/debugging-via-ohci1394.txt b/Documentation/debugging-via-ohci1394.txt
index 9ff026d22b75..981ad4f89fd3 100644
--- a/Documentation/debugging-via-ohci1394.txt
+++ b/Documentation/debugging-via-ohci1394.txt
@@ -1,6 +1,6 @@
-
-  Using physical DMA provided by OHCI-1394 FireWire controllers for debugging
-  ---------------------------------------------------------------------------
+===========================================================================
+Using physical DMA provided by OHCI-1394 FireWire controllers for debugging
+===========================================================================
 
 Introduction
 ------------
@@ -91,10 +91,10 @@ Step-by-step instructions for using firescope with early OHCI initialization:
 1) Verify that your hardware is supported:
 
    Load the firewire-ohci module and check your kernel logs.
-   You should see a line similar to
+   You should see a line similar to::
 
-   firewire_ohci 0000:15:00.1: added OHCI v1.0 device as card 2, 4 IR + 4 IT
-   ... contexts, quirks 0x11
+     firewire_ohci 0000:15:00.1: added OHCI v1.0 device as card 2, 4 IR + 4 IT
+     ... contexts, quirks 0x11
 
    when loading the driver. If you have no supported controller, many PCI,
    CardBus and even some Express cards which are fully compliant to OHCI-1394
@@ -113,9 +113,9 @@ Step-by-step instructions for using firescope with early OHCI initialization:
    stable connection and has matching connectors (there are small 4-pin and
    large 6-pin FireWire ports) will do.
 
-   If an driver is running on both machines you should see a line like
+   If an driver is running on both machines you should see a line like::
 
-   firewire_core 0000:15:00.1: created device fw1: GUID 00061b0020105917, S400
+     firewire_core 0000:15:00.1: created device fw1: GUID 00061b0020105917, S400
 
    on both machines in the kernel log when the cable is plugged in
    and connects the two machines.
@@ -123,7 +123,7 @@ Step-by-step instructions for using firescope with early OHCI initialization:
 3) Test physical DMA using firescope:
 
    On the debug host, make sure that /dev/fw* is accessible,
-   then start firescope:
+   then start firescope::
 
 	$ firescope
 	Port 0 (/dev/fw1) opened, 2 nodes detected
@@ -163,7 +163,7 @@ Step-by-step instructions for using firescope with early OHCI initialization:
    host loaded, reboot the debugged machine, booting the kernel which has
    CONFIG_PROVIDE_OHCI1394_DMA_INIT enabled, with the option ohci1394_dma=early.
 
-   Then, on the debugging host, run firescope, for example by using -A:
+   Then, on the debugging host, run firescope, for example by using -A::
 
 	firescope -A System.map-of-debug-target-kernel
 
@@ -178,6 +178,7 @@ Step-by-step instructions for using firescope with early OHCI initialization:
 
 Notes
 -----
+
 Documentation and specifications: http://halobates.de/firewire/
 
 FireWire is a trademark of Apple Inc. - for more information please refer to:
-- 
2.9.4
