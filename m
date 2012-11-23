Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tbn6v-0001DV-1x
 for linux-mtd@lists.infradead.org; Fri, 23 Nov 2012 06:51:38 +0000
Received: by mail-ee0-f49.google.com with SMTP id c4so3266629eek.36
 for <linux-mtd@lists.infradead.org>; Thu, 22 Nov 2012 22:51:34 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] bcm47xxnflash: define some magic numbers
Date: Fri, 23 Nov 2012 07:51:31 +0100
Message-Id: <1353653491-21944-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c |   31 ++++++++++++++++---------
 1 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
index e42e182..672dc90 100644
--- a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
@@ -22,6 +22,15 @@
 
 #define NFLASH_SECTOR_SIZE		512
 
+#define NCTL_CMD0			0x00010000
+#define NCTL_CMD1W			0x00080000
+#define NCTL_READ			0x00100000
+#define NCTL_SPECADDR			0x01000000
+#define NCTL_READY			0x04000000
+#define NCTL_ERR			0x08000000
+#define NCTL_CSA			0x40000000
+#define NCTL_START			0x80000000
+
 /**************************************************
  * Various helpers
  **************************************************/
@@ -35,9 +44,9 @@ static int bcm47xxnflash_ops_bcm4706_ctl_cmd(struct bcma_drv_cc *cc, u32 code)
 {
 	int i = 0;
 
-	bcma_cc_write32(cc, BCMA_CC_NFLASH_CTL, 0x80000000 | code);
+	bcma_cc_write32(cc, BCMA_CC_NFLASH_CTL, NCTL_START | code);
 	for (i = 0; i < NFLASH_READY_RETRIES; i++) {
-		if (!(bcma_cc_read32(cc, BCMA_CC_NFLASH_CTL) & 0x80000000)) {
+		if (!(bcma_cc_read32(cc, BCMA_CC_NFLASH_CTL) & NCTL_START)) {
 			i = 0;
 			break;
 		}
@@ -54,7 +63,7 @@ static int bcm47xxnflash_ops_bcm4706_poll(struct bcma_drv_cc *cc)
 	int i;
 
 	for (i = 0; i < NFLASH_READY_RETRIES; i++) {
-		if (bcma_cc_read32(cc, BCMA_CC_NFLASH_CTL) & 0x04000000) {
+		if (bcma_cc_read32(cc, BCMA_CC_NFLASH_CTL) & NCTL_READY) {
 			if (bcma_cc_read32(cc, BCMA_CC_NFLASH_CTL) &
 			    BCMA_CC_NFLASH_CTL_ERR) {
 				pr_err("Error on polling\n");
@@ -99,8 +108,8 @@ static void bcm47xxnflash_ops_bcm4706_read(struct mtd_info *mtd, uint8_t *buf,
 				b47n->curr_page_addr);
 
 		/* Prepare to read */
-		ctlcode = 0x40000000 | 0x00080000 | 0x00040000 | 0x00020000 |
-			  0x00010000;
+		ctlcode = NCTL_CSA | NCTL_CMD1W | 0x00040000 | 0x00020000 |
+			  NCTL_CMD0;
 		ctlcode |= NAND_CMD_READSTART << 8;
 		if (bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, ctlcode))
 			return;
@@ -109,9 +118,9 @@ static void bcm47xxnflash_ops_bcm4706_read(struct mtd_info *mtd, uint8_t *buf,
 
 		/* Eventually read some data :) */
 		for (i = 0; i < toread; i += 4, dest++) {
-			ctlcode = 0x40000000 | 0x30000000 | 0x00100000;
+			ctlcode = NCTL_CSA | 0x30000000 | NCTL_READ;
 			if (i == toread - 4) /* Last read goes without that */
-				ctlcode &= ~0x40000000;
+				ctlcode &= ~NCTL_CSA;
 			if (bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc,
 							      ctlcode))
 				return;
@@ -160,7 +169,7 @@ static void bcm47xxnflash_ops_bcm4706_cmdfunc(struct mtd_info *mtd,
 		pr_warn("Chip reset not implemented yet\n");
 		break;
 	case NAND_CMD_READID:
-		ctlcode = 0x40000000 | 0x01000000 | 0x00080000 | 0x00010000;
+		ctlcode = NCTL_CSA | 0x01000000 | NCTL_CMD1W | NCTL_CMD0;
 		ctlcode |= NAND_CMD_READID;
 		if (bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, ctlcode)) {
 			pr_err("READID error\n");
@@ -168,14 +177,14 @@ static void bcm47xxnflash_ops_bcm4706_cmdfunc(struct mtd_info *mtd,
 		}
 
 		/*
-		 * Reading is specific, last one has to go without 0x40000000
+		 * Reading is specific, last one has to go without NCTL_CSA
 		 * bit. We don't know how many reads NAND subsystem is going
 		 * to perform, so cache everything.
 		 */
 		for (i = 0; i < ARRAY_SIZE(b47n->id_data); i++) {
-			ctlcode = 0x40000000 | 0x00100000;
+			ctlcode = NCTL_CSA | NCTL_READ;
 			if (i == ARRAY_SIZE(b47n->id_data) - 1)
-				ctlcode &= ~0x40000000;
+				ctlcode &= ~NCTL_CSA;
 			if (bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc,
 							      ctlcode)) {
 				pr_err("READID error\n");
-- 
1.7.7
