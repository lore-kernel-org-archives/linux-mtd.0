Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SlvpP-00042D-Qm
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2012 05:39:12 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dedekind1@gmail.com>
Subject: [PATCH] mtd: add a new macro about the subpage write
Date: Tue, 3 Jul 2012 13:32:13 +0800
Message-ID: <1341293533-2214-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: marex@denx.de, Huang Shijie <shijie8@gmail.com>,
 linux-mtd@lists.infradead.org, Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Huang Shijie <shijie8@gmail.com>

The nand chip may does not support the subpage writes, while the nand
controller may also does not support the subpage writes too.

Now, the nand controller drivers use the NAND_NO_SUBPAGE_WRITE(0x00000200)
to tell the MTD layer that they do not support the subpage writes. But
this flag could be masked off in nand_get_flash_type():
	....................................................
	/* Get chip options, preserve non chip based options */
	chip->options &= ~NAND_CHIPOPTIONS_MSK;
	....................................................

So in nand_scan_tail(), there is a risk that the subpage write could be
enabled by mistake:
	....................................................
	if (!(chip->options & NAND_NO_SUBPAGE_WRITE) &&
	    !(chip->cellinfo & NAND_CI_CELLTYPE_MSK)) {
	....................................................

Absolutely, this is what we do not want.

So add a new macro NAND_CONTROLLER_NO_SUBPAGE_WRITE, which is only used
by the nand controller, and it could not be masked off.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/docg4.c               |    2 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 +-
 drivers/mtd/nand/nand_base.c           |    3 ++-
 include/linux/mtd/nand.h               |    3 +++
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index a225e49..85e74b4 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -1193,7 +1193,7 @@ static void __init init_mtd_structs(struct mtd_info *mtd)
 	nand->ecc.prepad = 8;
 	nand->ecc.bytes	= 8;
 	nand->ecc.strength = DOCG4_T;
-	nand->options = NAND_BUSWIDTH_16 | NAND_NO_SUBPAGE_WRITE;
+	nand->options = NAND_BUSWIDTH_16 | NAND_CONTROLLER_NO_SUBPAGE_WRITE;
 	nand->IO_ADDR_R = nand->IO_ADDR_W = doc->virtadr + DOC_IOSPACE_DATA;
 	nand->controller = &nand->hwcontrol;
 	spin_lock_init(&nand->controller->lock);
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index b821517..5a90df1 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1556,7 +1556,7 @@ static int __devinit gpmi_nfc_init(struct gpmi_nand_data *this)
 	chip->scan_bbt		= gpmi_scan_bbt;
 	chip->badblock_pattern	= &gpmi_bbt_descr;
 	chip->block_markbad	= gpmi_block_markbad;
-	chip->options		|= NAND_NO_SUBPAGE_WRITE;
+	chip->options		|= NAND_CONTROLLER_NO_SUBPAGE_WRITE;
 	chip->ecc.mode		= NAND_ECC_HW;
 	chip->ecc.size		= 1;
 	chip->ecc.strength	= 8;
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d47586c..c58df65 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3453,7 +3453,8 @@ int nand_scan_tail(struct mtd_info *mtd)
 	chip->ecc.total = chip->ecc.steps * chip->ecc.bytes;
 
 	/* Allow subpage writes up to ecc.steps. Not possible for MLC flash */
-	if (!(chip->options & NAND_NO_SUBPAGE_WRITE) &&
+	if (!(chip->options &
+		(NAND_NO_SUBPAGE_WRITE | NAND_CONTROLLER_NO_SUBPAGE_WRITE)) &&
 	    !(chip->cellinfo & NAND_CI_CELLTYPE_MSK)) {
 		switch (chip->ecc.steps) {
 		case 2:
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 57977c6..cd62dd8 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -226,6 +226,9 @@ typedef enum {
 /* Chip may not exist, so silence any errors in scan */
 #define NAND_SCAN_SILENT_NODEV	0x00040000
 
+/* The nand controller does not support the subpage write. */
+#define NAND_CONTROLLER_NO_SUBPAGE_WRITE	0x00080000
+
 /* Options set by nand scan */
 /* Nand scan has allocated controller struct */
 #define NAND_CONTROLLER_ALLOC	0x80000000
-- 
1.7.0.4
