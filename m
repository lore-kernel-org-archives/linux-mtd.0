Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0c6F-0007mq-Bl
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 14:23:41 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 18/19] mxc_nand: remove TROP_US_DELAY
Date: Wed, 21 Oct 2009 16:13:25 +0200
Message-Id: <1256134406-25251-19-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1256134406-25251-18-git-send-email-s.hauer@pengutronix.de>
References: <1256134406-25251-1-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-2-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-3-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-4-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-5-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-6-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-7-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-8-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-9-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-10-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-11-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-12-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-13-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-14-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-15-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-16-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-17-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-18-git-send-email-s.hauer@pengutronix.de>
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

wait_op_done is only called with the same timeout, so
code the timeout into the function itself.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c |   17 +++++++----------
 1 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 3fdc172..dd80e88 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -118,9 +118,6 @@ struct mxc_nand_host {
 	int			spare_len;
 };
 
-/* Define delays in microsec for NAND device operations */
-#define TROP_US_DELAY   2000
-
 /* OOB placement block for use with hardware ecc generation */
 static struct nand_ecclayout nandv1_hw_eccoob_smallpage = {
 	.eccbytes = 5,
@@ -185,10 +182,10 @@ static irqreturn_t mxc_nfc_irq(int irq, void *dev_id)
 /* This function polls the NANDFC to wait for the basic operation to
  * complete by checking the INT bit of config2 register.
  */
-static void wait_op_done(struct mxc_nand_host *host, int max_retries,
-				int useirq)
+static void wait_op_done(struct mxc_nand_host *host, int useirq)
 {
 	uint32_t tmp;
+	int max_retries = 2000;
 
 	if (useirq) {
 		if ((readw(host->regs + NFC_CONFIG2) & NFC_INT) == 0) {
@@ -230,7 +227,7 @@ static void send_cmd(struct mxc_nand_host *host, uint16_t cmd, int useirq)
 	writew(NFC_CMD, host->regs + NFC_CONFIG2);
 
 	/* Wait for operation to complete */
-	wait_op_done(host, TROP_US_DELAY, useirq);
+	wait_op_done(host, useirq);
 }
 
 /* This function sends an address (or partial address) to the
@@ -244,7 +241,7 @@ static void send_addr(struct mxc_nand_host *host, uint16_t addr, int islast)
 	writew(NFC_ADDR, host->regs + NFC_CONFIG2);
 
 	/* Wait for operation to complete */
-	wait_op_done(host, TROP_US_DELAY, islast);
+	wait_op_done(host, islast);
 }
 
 static void send_page(struct mtd_info *mtd, unsigned int ops)
@@ -266,7 +263,7 @@ static void send_page(struct mtd_info *mtd, unsigned int ops)
 		writew(ops, host->regs + NFC_CONFIG2);
 
 		/* Wait for operation to complete */
-		wait_op_done(host, TROP_US_DELAY, true);
+		wait_op_done(host, true);
 	}
 }
 
@@ -281,7 +278,7 @@ static void send_read_id(struct mxc_nand_host *host)
 	writew(NFC_ID, host->regs + NFC_CONFIG2);
 
 	/* Wait for operation to complete */
-	wait_op_done(host, TROP_US_DELAY, true);
+	wait_op_done(host, true);
 
 	if (this->options & NAND_BUSWIDTH_16) {
 		void __iomem *main_buf = host->main_area0;
@@ -313,7 +310,7 @@ static uint16_t get_dev_status(struct mxc_nand_host *host)
 	writew(NFC_STATUS, host->regs + NFC_CONFIG2);
 
 	/* Wait for operation to complete */
-	wait_op_done(host, TROP_US_DELAY, true);
+	wait_op_done(host, true);
 
 	/* Status is placed in first word of main buffer */
 	/* get status, then recovery area 1 data */
-- 
1.6.5
