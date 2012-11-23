Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TbvPs-0003fg-Tf
 for linux-mtd@lists.infradead.org; Fri, 23 Nov 2012 15:43:45 +0000
Received: by mail-wg0-f49.google.com with SMTP id gg4so633401wgb.18
 for <linux-mtd@lists.infradead.org>; Fri, 23 Nov 2012 07:43:42 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [RFC][PATCH] bcm47xxnflash: use small delay between polling
Date: Fri, 23 Nov 2012 16:43:38 +0100
Message-Id: <1353685418-30623-1-git-send-email-zajec5@gmail.com>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---
I think it's a good idea to add some delays between polling the
hardware. I'm not sure however what delays should be used.

In the proposed patch I put "ndelay(1)" which is extermely low delay,
but even with that it's common for the loop to make only 0-3 iterations.
For that reason I don't want to put delays like "ndelay(10)" or bigger.
This could mean waiting 10ns while the hardware is ready after 1ns.

What do you think about this?
---
 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c |   16 +++++++++++-----
 1 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
index ece343c..1026100 100644
--- a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
@@ -16,9 +16,13 @@
 
 #include "bcm47xxnflash.h"
 
-/* Broadcom uses 1'000'000 but it seems to be too many. Tests on WNDR4500 has
- * shown 164 retries as maxiumum. */
-#define NFLASH_READY_RETRIES		1000
+/* Broadcom uses 1'000'000 for both without any delay.
+ * Tests on WNDR4500 have shown that in can take:
+ * 1) 0-5 retries for ctl_cmd with ndelay(1)
+ * 2) 0-800 retries for poll with ndelay(1)
+ */
+#define NFLASH_CTL_CMD_RETRIES		100
+#define NFLASH_POLL_RETRIES		10000
 
 #define NFLASH_SECTOR_SIZE		512
 
@@ -45,11 +49,12 @@ static int bcm47xxnflash_ops_bcm4706_ctl_cmd(struct bcma_drv_cc *cc, u32 code)
 	int i = 0;
 
 	bcma_cc_write32(cc, BCMA_CC_NFLASH_CTL, NCTL_START | code);
-	for (i = 0; i < NFLASH_READY_RETRIES; i++) {
+	for (i = 0; i < NFLASH_CTL_CMD_RETRIES; i++) {
 		if (!(bcma_cc_read32(cc, BCMA_CC_NFLASH_CTL) & NCTL_START)) {
 			i = 0;
 			break;
 		}
+		ndelay(1);
 	}
 	if (i) {
 		pr_err("NFLASH control command not ready!\n");
@@ -62,7 +67,7 @@ static int bcm47xxnflash_ops_bcm4706_poll(struct bcma_drv_cc *cc)
 {
 	int i;
 
-	for (i = 0; i < NFLASH_READY_RETRIES; i++) {
+	for (i = 0; i < NFLASH_POLL_RETRIES; i++) {
 		if (bcma_cc_read32(cc, BCMA_CC_NFLASH_CTL) & NCTL_READY) {
 			if (bcma_cc_read32(cc, BCMA_CC_NFLASH_CTL) &
 			    BCMA_CC_NFLASH_CTL_ERR) {
@@ -72,6 +77,7 @@ static int bcm47xxnflash_ops_bcm4706_poll(struct bcma_drv_cc *cc)
 				return 0;
 			}
 		}
+		ndelay(1);
 	}
 
 	pr_err("Polling timeout!\n");
-- 
1.7.7
