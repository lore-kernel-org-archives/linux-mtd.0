Received: from protonic.xs4all.nl ([213.84.116.84])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TTVbd-0003CU-Ry
 for linux-mtd@lists.infradead.org; Wed, 31 Oct 2012 10:33:08 +0000
From: Robin van der Gracht <robin@protonic.nl>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: Take celltype into account when parsing Samsung
 ext. nand ID's
Date: Wed, 31 Oct 2012 11:32:19 +0100
Message-Id: <1351679539-30651-1-git-send-email-robin@protonic.nl>
Cc: sjhill@realitydiluted.com, tglx@linutronix.de, computersforpeace@gmail.com,
 dwmw2@infradead.org, Robin van der Gracht <robin@protonic.nl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When using a Samsung nandflash with 2 level cells, the wrong page size,
erase size and oobsize is calculated.

I'm using a Samsung K9K8G08U0B nandflash (ID: 0xECD3519558). When booting the kernel i get:
NAND device: Manufacturer ID: 0xec, Chip ID: 0xd3 (Samsung NAND 1GiB 3,3V 8-bit), page size: 4096, OOB size: 128

This is wrong. My nand flash has a pagesize of 2048 and oobsize 64.

This patch should work for all Samsung 6 byte ID chips, found on:
http://www.linux-mtd.infradead.org/nand-data/nanddata.html

Signed-off-by: Robin van der Gracht <robin@protonic.nl>
---
 drivers/mtd/nand/nand_base.c |    3 ++-
 include/linux/mtd/nand.h     |    4 ++++
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ec6841d..e292074 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2989,7 +2989,8 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 	 * Check for ID length, cell type, and Hynix/Samsung ID to decide what
 	 * to do.
 	 */
-	if (id_len == 6 && id_data[0] == NAND_MFR_SAMSUNG) {
+	if (id_len == 6 && id_data[0] == NAND_MFR_SAMSUNG &&
+			(chip->cellinfo & NAND_CI_CELLTYPE_4LVL)) {
 		/* Calc pagesize */
 		mtd->writesize = 2048 << (extid & 0x03);
 		extid >>= 2;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 24e9159..3e3860e 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -227,6 +227,10 @@ typedef enum {
 /* Cell info constants */
 #define NAND_CI_CHIPNR_MSK	0x03
 #define NAND_CI_CELLTYPE_MSK	0x0C
+#define NAND_CI_CELLTYPE_2LVL	0x00
+#define NAND_CI_CELLTYPE_4LVL	0x04
+#define NAND_CI_CELLTYPE_8LVL	0x08
+#define NAND_CI_CELLTYPE_16LVL	0x0C
 
 /* Keep gcc happy */
 struct nand_chip;
-- 
1.7.5.4
