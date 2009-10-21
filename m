Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0bxJ-0007Nw-Lq
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 14:14:26 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 06/19] mxc nand: remove debug param
Date: Wed, 21 Oct 2009 16:13:13 +0200
Message-Id: <1256134406-25251-7-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1256134406-25251-6-git-send-email-s.hauer@pengutronix.de>
References: <1256134406-25251-1-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-2-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-3-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-4-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-5-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-6-git-send-email-s.hauer@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Eric Benard <ebenard@eukrea.com>,
	Vladimir Barinov <vova.barinov@gmail.com>,
	mathieu.berland@eads.com, jbe@pengutronix.de, sha@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 325c5be..cd09196 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -165,7 +165,7 @@ static irqreturn_t mxc_nfc_irq(int irq, void *dev_id)
  * complete by checking the INT bit of config2 register.
  */
 static void wait_op_done(struct mxc_nand_host *host, int max_retries,
-				uint16_t param, int useirq)
+				int useirq)
 {
 	uint32_t tmp;
 
@@ -194,8 +194,8 @@ static void wait_op_done(struct mxc_nand_host *host, int max_retries,
 			udelay(1);
 		}
 		if (max_retries < 0)
-			DEBUG(MTD_DEBUG_LEVEL0, "%s(%d): INT not set\n",
-			      __func__, param);
+			DEBUG(MTD_DEBUG_LEVEL0, "%s: INT not set\n",
+			      __func__);
 	}
 }
 
@@ -209,7 +209,7 @@ static void send_cmd(struct mxc_nand_host *host, uint16_t cmd, int useirq)
 	writew(NFC_CMD, host->regs + NFC_CONFIG2);
 
 	/* Wait for operation to complete */
-	wait_op_done(host, TROP_US_DELAY, cmd, useirq);
+	wait_op_done(host, TROP_US_DELAY, useirq);
 }
 
 /* This function sends an address (or partial address) to the
@@ -223,7 +223,7 @@ static void send_addr(struct mxc_nand_host *host, uint16_t addr, int islast)
 	writew(NFC_ADDR, host->regs + NFC_CONFIG2);
 
 	/* Wait for operation to complete */
-	wait_op_done(host, TROP_US_DELAY, addr, islast);
+	wait_op_done(host, TROP_US_DELAY, islast);
 }
 
 static void send_page(struct mxc_nand_host *host, uint8_t buf_id,
@@ -247,7 +247,7 @@ static void send_page(struct mxc_nand_host *host, uint8_t buf_id,
 	writew(ops, host->regs + NFC_CONFIG2);
 
 	/* Wait for operation to complete */
-	wait_op_done(host, TROP_US_DELAY, spare_only, true);
+	wait_op_done(host, TROP_US_DELAY, true);
 }
 
 /* Request the NANDFC to perform a read of the NAND device ID. */
@@ -267,7 +267,7 @@ static void send_read_id(struct mxc_nand_host *host)
 	writew(NFC_ID, host->regs + NFC_CONFIG2);
 
 	/* Wait for operation to complete */
-	wait_op_done(host, TROP_US_DELAY, 0, true);
+	wait_op_done(host, TROP_US_DELAY, true);
 
 	if (this->options & NAND_BUSWIDTH_16) {
 		void __iomem *main_buf = host->regs + MAIN_AREA0;
@@ -303,7 +303,7 @@ static uint16_t get_dev_status(struct mxc_nand_host *host)
 	writew(NFC_STATUS, host->regs + NFC_CONFIG2);
 
 	/* Wait for operation to complete */
-	wait_op_done(host, TROP_US_DELAY, 0, true);
+	wait_op_done(host, TROP_US_DELAY, true);
 
 	/* Status is placed in first word of main buffer */
 	/* get status, then recovery area 1 data */
-- 
1.6.5
