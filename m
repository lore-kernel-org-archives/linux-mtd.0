Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWdG-0000LL-BL
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
Subject: [PATCH 17/31] DMA-ISA-LPC.txt: standardize document format
Date: Thu, 18 May 2017 22:22:22 -0300
Message-Id: <6ac1c549a03ccf64f7833b2159ad2b0866df686a.1495156488.git.mchehab@s-opensource.com>
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

- use proper markups for titles;
- use :Author: for authorship;
- identify the literal blocks.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/DMA-ISA-LPC.txt | 71 ++++++++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 35 deletions(-)

diff --git a/Documentation/DMA-ISA-LPC.txt b/Documentation/DMA-ISA-LPC.txt
index c41331398752..c44be1a2176f 100644
--- a/Documentation/DMA-ISA-LPC.txt
+++ b/Documentation/DMA-ISA-LPC.txt
@@ -1,19 +1,20 @@
-                        DMA with ISA and LPC devices
-                        ============================
+============================
+DMA with ISA and LPC devices
+============================
 
-                      Pierre Ossman <drzeus@drzeus.cx>
+:Author: Pierre Ossman <drzeus@drzeus.cx>
 
 This document describes how to do DMA transfers using the old ISA DMA
 controller. Even though ISA is more or less dead today the LPC bus
 uses the same DMA system so it will be around for quite some time.
 
-Part I - Headers and dependencies
----------------------------------
+Headers and dependencies
+------------------------
 
-To do ISA style DMA you need to include two headers:
+To do ISA style DMA you need to include two headers::
 
-#include <linux/dma-mapping.h>
-#include <asm/dma.h>
+	#include <linux/dma-mapping.h>
+	#include <asm/dma.h>
 
 The first is the generic DMA API used to convert virtual addresses to
 bus addresses (see Documentation/DMA-API.txt for details).
@@ -23,8 +24,8 @@ this is not present on all platforms make sure you construct your
 Kconfig to be dependent on ISA_DMA_API (not ISA) so that nobody tries
 to build your driver on unsupported platforms.
 
-Part II - Buffer allocation
----------------------------
+Buffer allocation
+-----------------
 
 The ISA DMA controller has some very strict requirements on which
 memory it can access so extra care must be taken when allocating
@@ -47,8 +48,8 @@ __GFP_REPEAT and __GFP_NOWARN to make the allocator try a bit harder.
 (This scarcity also means that you should allocate the buffer as
 early as possible and not release it until the driver is unloaded.)
 
-Part III - Address translation
-------------------------------
+Address translation
+-------------------
 
 To translate the virtual address to a bus address, use the normal DMA
 API. Do _not_ use isa_virt_to_phys() even though it does the same
@@ -61,8 +62,8 @@ Note: x86_64 had a broken DMA API when it came to ISA but has since
 been fixed. If your arch has problems then fix the DMA API instead of
 reverting to the ISA functions.
 
-Part IV - Channels
-------------------
+Channels
+--------
 
 A normal ISA DMA controller has 8 channels. The lower four are for
 8-bit transfers and the upper four are for 16-bit transfers.
@@ -80,8 +81,8 @@ The ability to use 16-bit or 8-bit transfers is _not_ up to you as a
 driver author but depends on what the hardware supports. Check your
 specs or test different channels.
 
-Part V - Transfer data
-----------------------
+Transfer data
+-------------
 
 Now for the good stuff, the actual DMA transfer. :)
 
@@ -112,37 +113,37 @@ Once the DMA transfer is finished (or timed out) you should disable
 the channel again. You should also check get_dma_residue() to make
 sure that all data has been transferred.
 
-Example:
+Example::
 
-int flags, residue;
+	int flags, residue;
 
-flags = claim_dma_lock();
+	flags = claim_dma_lock();
 
-clear_dma_ff();
+	clear_dma_ff();
 
-set_dma_mode(channel, DMA_MODE_WRITE);
-set_dma_addr(channel, phys_addr);
-set_dma_count(channel, num_bytes);
+	set_dma_mode(channel, DMA_MODE_WRITE);
+	set_dma_addr(channel, phys_addr);
+	set_dma_count(channel, num_bytes);
 
-dma_enable(channel);
+	dma_enable(channel);
 
-release_dma_lock(flags);
+	release_dma_lock(flags);
 
-while (!device_done());
+	while (!device_done());
 
-flags = claim_dma_lock();
+	flags = claim_dma_lock();
 
-dma_disable(channel);
+	dma_disable(channel);
 
-residue = dma_get_residue(channel);
-if (residue != 0)
-	printk(KERN_ERR "driver: Incomplete DMA transfer!"
-		" %d bytes left!\n", residue);
+	residue = dma_get_residue(channel);
+	if (residue != 0)
+		printk(KERN_ERR "driver: Incomplete DMA transfer!"
+			" %d bytes left!\n", residue);
 
-release_dma_lock(flags);
+	release_dma_lock(flags);
 
-Part VI - Suspend/resume
-------------------------
+Suspend/resume
+--------------
 
 It is the driver's responsibility to make sure that the machine isn't
 suspended while a DMA transfer is in progress. Also, all DMA settings
-- 
2.9.4
