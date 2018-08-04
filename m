Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fltJf-0003gA-NP
 for linux-mtd@lists.infradead.org; Sat, 04 Aug 2018 09:57:45 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 1/2] mtd: rawnand: marvell: document a bit more the driver
Date: Sat,  4 Aug 2018 11:57:16 +0200
Message-Id: <20180804095717.8089-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A stale document about the old pxa3cc_nand.c driver is available in
Documentation/mtd/nand/. Rewrite the parts that explain the IP itself
and some non-trivial choices made in the driver directly in
marvell_nand.c to then be able to remove this file.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Changes since v2:
=================
* Addressed Boris comments, mostly typos and rewritting as suggested.

Changes since v1:
=================
* Corrected mistakes pointed by Boris.
* Enlarged the documentation as suggested by Thomas to mention the
  layouts as seen per the controller.
* Added a mention about the maximum ECC size which is 2kiB.


 drivers/mtd/nand/raw/marvell_nand.c | 63 +++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 218e09431d3d..dc1da132e684 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -5,6 +5,69 @@
  * Copyright (C) 2017 Marvell
  * Author: Miquel RAYNAL <miquel.raynal@free-electrons.com>
  *
+ *
+ * This NAND controller driver handles two versions of the hardware,
+ * one is called NFCv1 and is available on PXA SoCs and the other is
+ * called NFCv2 and is available on almost Armada SoCs.
+ *
+ * The main visible difference is that NFCv1 only has Hamming ECC
+ * capabilities, while NFCv2 also embeds a BCH ECC engine. Also, DMA
+ * is not used with NFCv2.
+ *
+ * The ECC layouts are depicted in details in Marvell AN-379.
+ *
+ * When using Hamming, the data is split in 512B chunks (either 0, 1
+ * or 2) and each chunk will have its own ECC "digest" of 6B at the
+ * beginning of the OOB area and eventually the remaining fee OOB
+ * bytes. This engine corrects up to 1 bit per chunk and detects
+ * reliably an error if there are at most 2 bitflips. Here the page
+ * layout used by the controller when Hamming is chosen:
+ *
+ * +-------------------------------------------------------------+
+ * | Data 1 | ... | Data N | ECC 1 | ... | ECCN | Free OOB bytes |
+ * +-------------------------------------------------------------+
+ *
+ * When using the BCH engine, there are N identical (data + spare +
+ * ECC) sections and potentially an extra one to deal with
+ * configurations where the chosen (data + spare + ECC) sizes do not align
+ * with the page (data + OOB) size. Here the page layout used by
+ * the controller when BCH is chosen:
+ *
+ * +-----------------------------------------
+ * | Data 1 | Free OOB bytes 1 | ECC 1 | ...
+ * +-----------------------------------------
+ *
+ *      -------------------------------------------
+ *       ... | Data N | Free OOB bytes N | ECC N |
+ *      -------------------------------------------
+ *
+ *           --------------------------------------------+
+ *            Last Data | Last Free OOB bytes | Last ECC |
+ *           --------------------------------------------+
+ *
+ * In both cases, the layout seen by the user is always: all the
+ * data in one chunk, all the free OOB bytes and finally all the ECC
+ * bytes. With BCH, ECC bytes are 30B long and are padded to 32B with
+ * 0xFF.
+ *
+ * The controller has certain limitations that are handled by the
+ * driver:
+ *   - It can only read 2k at a time. To overcome this limitation, the
+ *     driver makes use of 'naked' operations.
+ *   - The ECC strength in BCH mode cannot be tuned easily. It is
+ *     fixed 16 bits. What can be tuned in the ECC block size as long
+ *     as it stays between 512B and 2kiB. It's usually chosen based on
+ *     the chip ECC requirements. For instance, using 2kiB ECC chunks
+ *     provides 4b/512B correctability.
+ *   - The controller will always treat data bytes, free OOB bytes
+ *     (also referred as "spare bytes") and ECC bytes in that order,
+ *     no matter the real standard layout (which is usually all data
+ *     then all OOB bytes). The marvell_nfc_layouts array below
+ *     contains the currently supported layouts.
+ *   - Because of these weird layouts, the Bad Block Markers can be
+ *     located in data section. In this case, the NAND_BBT_NO_OOB_BBM
+ *     option must be set to prevent scanning/writing bad block
+ *     markers..
  */
 
 #include <linux/module.h>
-- 
2.14.1
