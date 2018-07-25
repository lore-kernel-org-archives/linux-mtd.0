Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiKls-0005St-1A
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 14:28:10 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 1/2] mtd: rawnand: marvell: document a bit more the driver
Date: Wed, 25 Jul 2018 16:27:53 +0200
Message-Id: <20180725142754.2647-1-miquel.raynal@bootlin.com>
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

Changes since v1:
=================
* Corrected mistakes pointed by Boris.
* Enlarged the documentation as suggested by Thomas to mention the
  layouts as seen per the controller.
* Added a mention about the maximum ECC size which is 2kiB.

 drivers/mtd/nand/raw/marvell_nand.c | 66 +++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 218e09431d3d..de74ea18c539 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -5,6 +5,72 @@
  * Copyright (C) 2017 Marvell
  * Author: Miquel RAYNAL <miquel.raynal@free-electrons.com>
  *
+ *
+ * This NAND controller driver handles two versions of the hardware,
+ * one is called NFCv1 and is available on PXA SoCs and the other is
+ * called NFCv2 and is available on almost all the Armada SoCs.
+ *
+ * The main visible difference is that the NFCv1 only has Hamming ECC
+ * capabilities, while NFCv2 also embeds a BCH ECC engine. Also, DMA
+ * is not used with NFCv2.
+ *
+ * The internal ECC operations are depicted in details in Marvell
+ * AN-379.
+ *
+ * When using the Hamming engine, the data is cut in 512B chunks
+ * (either 0, 1 or 2) and each chunk will have its own ECC "digest" of
+ * 6B at the beginning of the OOB area and eventually the remaining
+ * free OOB bytes. This engine corrects up to 1 bit per chunk and
+ * detects reliably an error if there are at most 2 bitflips. Here is
+ * the controller view:
+ *
+ * +-------------------------------------------------------------+
+ * | Data 1 | ... | Data N | ECC 1 | ... | ECCN | Free OOB bytes |
+ * +-------------------------------------------------------------+
+ *
+ * When using the BCH engine, the generic pattern is that the
+ * controller sees only up to 2kiB chunks of data, followed by free
+ * OOB bytes (if any) and then ECC bytes. This pattern is repeated as
+ * much as needed with the same length for each section, until arrives
+ * the last patter which has the same organization but each section
+ * may be of different length. The layout presented to the user in the
+ * raw accessors is always: all the data, then in the OOB all the
+ * free OOB bytes and all the ECC digests. Here is the controller
+ * view:
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
+ * The controller has certain limitations that are handled by the
+ * driver:
+ *   - It can only read 2k at a time. To overcome this limitation, the
+ *     driver makes use of 'naked' operations.
+ *   - The ECC strength in BCH mode cannot be tuned easily. It is a
+ *     fixed 16 bits. What can be tuned is the area on which this
+ *     correction occurs which is something between 512B and 2kiB based
+ *     on the chip's requirements. Hence, using 2kiB ECC chunks leads
+ *     to use a strength of 4b/512B.
+ *   - The controller will always treat data bytes, free OOB bytes
+ *     (also referred as "spare bytes") and ECC bytes in that order,
+ *     no matter the real factory layout (which is usually all data
+ *     then all OOB bytes). But depending on the chosen layout, the
+ *     areas of each section may vary or be absent. The same
+ *     data/spare/ecc layout is repeated until the last chunk, were
+ *     the data, spare and ECC sections may be different again. The
+ *     marvell_nfc_layouts array below contains the currently
+ *     supported layouts.
+ *   - Because of these weird layouts, the Bad Block Markers can be
+ *     located in data. In this case, the NAND_BBT_NO_OOB_BBM option
+ *     must be set.
  */
 
 #include <linux/module.h>
-- 
2.14.1
