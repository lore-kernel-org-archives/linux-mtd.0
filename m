Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWh7-0005sl-J0
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:27:08 +0000
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
Subject: [PATCH 26/29] xillybus.txt: standardize document format
Date: Thu, 18 May 2017 22:26:10 -0300
Message-Id: <0466b4bdf3121ce62e55f1281ef243420cd3915d.1495157082.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
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
- Adjust indentation;
- Mark authorship;
- Comment internal contents table;
- Mark literal blocks;
- Don't use all-upercase titles.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/xillybus.txt | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/Documentation/xillybus.txt b/Documentation/xillybus.txt
index 1660145b9969..2446ee303c09 100644
--- a/Documentation/xillybus.txt
+++ b/Documentation/xillybus.txt
@@ -1,12 +1,11 @@
+==========================================
+Xillybus driver for generic FPGA interface
+==========================================
 
-               ==========================================
-               Xillybus driver for generic FPGA interface
-               ==========================================
+:Author: Eli Billauer, Xillybus Ltd. (http://xillybus.com)
+:Email:  eli.billauer@gmail.com or as advertised on Xillybus' site.
 
-Author: Eli Billauer, Xillybus Ltd. (http://xillybus.com)
-Email:  eli.billauer@gmail.com or as advertised on Xillybus' site.
-
-Contents:
+.. Contents:
 
  - Introduction
   -- Background
@@ -17,7 +16,7 @@ Contents:
   -- Synchronization
   -- Seekable pipes
 
-- Internals
+ - Internals
   -- Source code organization
   -- Pipe attributes
   -- Host never reads from the FPGA
@@ -29,7 +28,7 @@ Contents:
   -- The "nonempty" message (supporting poll)
 
 
-INTRODUCTION
+Introduction
 ============
 
 Background
@@ -105,7 +104,7 @@ driver is used to work out of the box with any Xillybus IP core.
 The data structure just mentioned should not be confused with PCI's
 configuration space or the Flattened Device Tree.
 
-USAGE
+Usage
 =====
 
 User interface
@@ -117,11 +116,11 @@ names of these files depend on the IP core that is loaded in the FPGA (see
 Probing below). To communicate with the FPGA, open the device file that
 corresponds to the hardware FIFO you want to send data or receive data from,
 and use plain write() or read() calls, just like with a regular pipe. In
-particular, it makes perfect sense to go:
+particular, it makes perfect sense to go::
 
-$ cat mydata > /dev/xillybus_thisfifo
+	$ cat mydata > /dev/xillybus_thisfifo
 
-$ cat /dev/xillybus_thatfifo > hisdata
+	$ cat /dev/xillybus_thatfifo > hisdata
 
 possibly pressing CTRL-C as some stage, even though the xillybus_* pipes have
 the capability to send an EOF (but may not use it).
@@ -178,7 +177,7 @@ the attached memory is done by seeking to the desired address, and calling
 read() or write() as required.
 
 
-INTERNALS
+Internals
 =========
 
 Source code organization
@@ -365,7 +364,7 @@ into that page. It can be shown that all pages requested from the kernel
 (except possibly for the last) are 100% utilized this way.
 
 The "nonempty" message (supporting poll)
----------------------------------------
+----------------------------------------
 
 In order to support the "poll" method (and hence select() ), there is a small
 catch regarding the FPGA to host direction: The FPGA may have filled a DMA
-- 
2.9.4
