Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1feL0W-0006Gd-Ua
 for linux-mtd@lists.infradead.org; Sat, 14 Jul 2018 13:54:46 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/2] mtd: rawnand: marvell: document a bit more the driver
Date: Sat, 14 Jul 2018 15:54:27 +0200
Message-Id: <20180714135428.26955-1-miquel.raynal@bootlin.com>
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
 drivers/mtd/nand/raw/marvell_nand.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index ba6889bbe802..a50ea47baa4f 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -5,6 +5,37 @@
  * Copyright (C) 2017 Marvell
  * Author: Miquel RAYNAL <miquel.raynal@free-electrons.com>
  *
+ *
+ * This NAND controller driver handles two versions of the hardware,
+ * one is called NFCv1 and is available on PXA SoCs and the other is
+ * called NFCv2 and is available on almost all the Armada SoCs.
+ *
+ * The main differences are that the NFCv1 has DMA support and only
+ * has Hamming ECC capabilities, while NFCv2 does not support DMA but
+ * has hardware BCH support.
+ *
+ * The internal ECC operations are depicted in details in Marvell
+ * AN-379.
+ *
+ * The controller has certain limitations that are handled by the
+ * driver:
+ *   - It can only read 2k at a time. To overcome this limitation, the
+ *     driver makes use of 'naked' operations.
+ *   - The ECC strength in BCH mode cannot be tuned easily. It is a
+ *     fixed 16 bytes. What can be tuned is the area on which this
+ *     correction occurs. Hence, using 2048B ECC chunks makes the
+ *     strength to be 4b/512B.
+ *   - The controller will always treat data bytes, spare bytes and
+ *     ECC bytes in that order, no matter the real factory layout
+ *     (which is usually all data then all OOB bytes). But depending
+ *     on the chosen layout, the areas of each section may vary or be
+ *     absent. The same data/spare/ecc layout is repeated until the
+ *     next chunk were each section may be different again. The
+ *     marvell_nfc_layouts array below contains the currently
+ *     supported layouts.
+ *   - Because of these weird layouts, the Bad Block Markers can be
+ *     located in data. In this case, the NAND_BBT_NO_OOB_BBM option
+ *     must be set.
  */
 
 #include <linux/module.h>
-- 
2.14.1
