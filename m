Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fltJf-0003gB-NR
 for linux-mtd@lists.infradead.org; Sat, 04 Aug 2018 09:57:45 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 2/2] Documentation: mtd: remove stale pxa3xx NAND
 controller documentation
Date: Sat,  4 Aug 2018 11:57:17 +0200
Message-Id: <20180804095717.8089-2-miquel.raynal@bootlin.com>
In-Reply-To: <20180804095717.8089-1-miquel.raynal@bootlin.com>
References: <20180804095717.8089-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It is preferred to have the documentation about the drivers directly
embedded in the driver itself. Remove this file now that the most
important information from this file have been re-written in
marvell_nand.c.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Boris Brezillon <boris.brezillon@bootlin.com>
---

Changes since v1/v2:
====================
* None.

 Documentation/mtd/nand/pxa3xx-nand.txt | 113 ---------------------------------
 1 file changed, 113 deletions(-)
 delete mode 100644 Documentation/mtd/nand/pxa3xx-nand.txt

diff --git a/Documentation/mtd/nand/pxa3xx-nand.txt b/Documentation/mtd/nand/pxa3xx-nand.txt
deleted file mode 100644
index 1074cbc67ec6..000000000000
--- a/Documentation/mtd/nand/pxa3xx-nand.txt
+++ /dev/null
@@ -1,113 +0,0 @@
-
-About this document
-===================
-
-Some notes about Marvell's NAND controller available in PXA and Armada 370/XP
-SoC (aka NFCv1 and NFCv2), with an emphasis on the latter.
-
-NFCv2 controller background
-===========================
-
-The controller has a 2176 bytes FIFO buffer. Therefore, in order to support
-larger pages, I/O operations on 4 KiB and 8 KiB pages is done with a set of
-chunked transfers.
-
-For instance, if we choose a 2048 data chunk and set "BCH" ECC (see below)
-we'll have this layout in the pages:
-
-  ------------------------------------------------------------------------------
-  | 2048B data | 32B spare | 30B ECC || 2048B data | 32B spare | 30B ECC | ... |
-  ------------------------------------------------------------------------------
-
-The driver reads the data and spare portions independently and builds an internal
-buffer with this layout (in the 4 KiB page case):
-
-  ------------------------------------------
-  |     4096B data     |     64B spare     |
-  ------------------------------------------
-
-Also, for the READOOB command the driver disables the ECC and reads a 'spare + ECC'
-OOB, one per chunk read.
-
-  -------------------------------------------------------------------
-  |     4096B data     |  32B spare | 30B ECC | 32B spare | 30B ECC |
-  -------------------------------------------------------------------
-
-So, in order to achieve reading (for instance), we issue several READ0 commands
-(with some additional controller-specific magic) and read two chunks of 2080B
-(2048 data + 32 spare) each.
-The driver accommodates this data to expose the NAND core a contiguous buffer
-(4096 data + spare) or (4096 + spare + ECC + spare + ECC).
-
-ECC
-===
-
-The controller has built-in hardware ECC capabilities. In addition it is
-configurable between two modes: 1) Hamming, 2) BCH.
-
-Note that the actual BCH mode: BCH-4 or BCH-8 will depend on the way
-the controller is configured to transfer the data.
-
-In the BCH mode the ECC code will be calculated for each transferred chunk
-and expected to be located (when reading/programming) right after the spare
-bytes as the figure above shows.
-
-So, repeating the above scheme, a 2048B data chunk will be followed by 32B
-spare, and then the ECC controller will read/write the ECC code (30B in
-this case):
-
-  ------------------------------------
-  | 2048B data | 32B spare | 30B ECC |
-  ------------------------------------
-
-If the ECC mode is 'BCH' then the ECC is *always* 30 bytes long.
-If the ECC mode is 'Hamming' the ECC is 6 bytes long, for each 512B block.
-So in Hamming mode, a 2048B page will have a 24B ECC.
-
-Despite all of the above, the controller requires the driver to only read or
-write in multiples of 8-bytes, because the data buffer is 64-bits.
-
-OOB
-===
-
-Because of the above scheme, and because the "spare" OOB is really located in
-the middle of a page, spare OOB cannot be read or write independently of the
-data area. In other words, in order to read the OOB (aka READOOB), the entire
-page (aka READ0) has to be read.
-
-In the same sense, in order to write to the spare OOB the driver has to write
-an *entire* page.
-
-Factory bad blocks handling
-===========================
-
-Given the ECC BCH requires to layout the device's pages in a split
-data/OOB/data/OOB way, the controller has a view of the flash page that's
-different from the specified (aka the manufacturer's) view. In other words,
-
-Factory view:
-
-  -----------------------------------------------
-  |                    Data           |x  OOB   |
-  -----------------------------------------------
-
-Driver's view:
-
-  -----------------------------------------------
-  |      Data      | OOB |      Data   x  | OOB |
-  -----------------------------------------------
-
-It can be seen from the above, that the factory bad block marker must be
-searched within the 'data' region, and not in the usual OOB region.
-
-In addition, this means under regular usage the driver will write such
-position (since it belongs to the data region) and every used block is
-likely to be marked as bad.
-
-For this reason, marking the block as bad in the OOB is explicitly
-disabled by using the NAND_BBT_NO_OOB_BBM option in the driver. The rationale
-for this is that there's no point in marking a block as bad, because good
-blocks are also 'marked as bad' (in the OOB BBM sense) under normal usage.
-
-Instead, the driver relies on the bad block table alone, and should only perform
-the bad block scan on the very first time (when the device hasn't been used).
-- 
2.14.1
