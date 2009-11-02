Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N51OR-0000Ki-Ap
	for linux-mtd@lists.infradead.org; Mon, 02 Nov 2009 18:12:43 +0000
Subject: NAND: Add option to quieten off the no device found messgae
Message-Id: <20091102181232.800355727@fluff.org.uk>
From: Ben Dooks <ben@simtec.co.uk>
To: linux-mtd@lists.infradead.org,
 dwmw2@infradead.org
Content-Disposition: inline; filename=nand-update-probe3.patch
Date: Mon, 02 Nov 2009 18:12:33 +0000
Cc: Simtec Linux Team <linux@simtec.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add NAND_SCAN_SILENT_NODEV to chip->options to the user-worrying messages
'No NAND device found!!!'. This message often worries users (was three
exclamation marks really necessary?) and especially in systems such as the
Simtec Osiris where there may be optional NAND devices which are not
known until probe time.

Revised version of the original NAND_PROBE_SPECULATIVE patch after comments
by Artem Bityutskiy about adding a whole new call.

Signed-off-by: Ben Dooks <ben@simtec.co.uk>
Signed-off-by: Simtec Linux Team <linux@simtec.co.uk>

---
 drivers/mtd/nand/nand_base.c |    3 ++-
 include/linux/mtd/nand.h     |    4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

Index: b/drivers/mtd/nand/nand_base.c
===================================================================
--- a/drivers/mtd/nand/nand_base.c	2009-11-02 17:33:29.000000000 +0000
+++ b/drivers/mtd/nand/nand_base.c	2009-11-02 18:01:08.000000000 +0000
@@ -2639,7 +2639,8 @@ int nand_scan_ident(struct mtd_info *mtd
 	type = nand_get_flash_type(mtd, chip, busw, &nand_maf_id);
 
 	if (IS_ERR(type)) {
-		printk(KERN_WARNING "No NAND device found!!!\n");
+		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
+			printk(KERN_WARNING "No NAND device found!!!\n");
 		chip->select_chip(mtd, -1);
 		return PTR_ERR(type);
 	}
Index: b/include/linux/mtd/nand.h
===================================================================
--- a/include/linux/mtd/nand.h	2009-11-02 17:32:13.000000000 +0000
+++ b/include/linux/mtd/nand.h	2009-11-02 17:57:47.000000000 +0000
@@ -168,7 +168,6 @@ typedef enum {
 /* Chip does not allow subpage writes */
 #define NAND_NO_SUBPAGE_WRITE	0x00000200
 
-
 /* Options valid for Samsung large page devices */
 #define NAND_SAMSUNG_LP_OPTIONS \
 	(NAND_NO_PADDING | NAND_CACHEPRG | NAND_COPYBACK)
@@ -194,6 +193,9 @@ typedef enum {
 /* This option is defined if the board driver allocates its own buffers
    (e.g. because it needs them DMA-coherent */
 #define NAND_OWN_BUFFERS	0x00040000
+/* Chip may not exist, so silence any errors in scan */
+#define NAND_SCAN_SILENT_NODEV	0x00080000
+
 /* Options set by nand scan */
 /* Nand scan has allocated controller struct */
 #define NAND_CONTROLLER_ALLOC	0x80000000

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
