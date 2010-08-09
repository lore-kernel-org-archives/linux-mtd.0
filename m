Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OiSHi-0000cv-I2
	for linux-mtd@lists.infradead.org; Mon, 09 Aug 2010 13:21:00 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 02/12] mxc_nand: rework get_dev_status
Date: Mon,  9 Aug 2010 15:20:46 +0200
Message-Id: <1281360053-8386-3-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1281360053-8386-1-git-send-email-s.hauer@pengutronix.de>
References: <1281360053-8386-1-git-send-email-s.hauer@pengutronix.de>
Cc: Baruch Siach <baruch@tkos.co.il>, Sascha Hauer <s.hauer@pengutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We save/restore the value in the buffer anyway, so it makes
no difference whether we use main_area0 or main_area1. So,
we can use main_area0 and remove main_area1 from the driver
which is otherwise unused. Also, clean up the comments in
get_dev_status.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c |   21 +++++++++------------
 1 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index abec73a..6654446 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -102,7 +102,6 @@ struct mxc_nand_host {
 
 	void			*spare0;
 	void			*main_area0;
-	void			*main_area1;
 
 	void __iomem		*base;
 	void __iomem		*regs;
@@ -305,25 +304,24 @@ static void send_read_id(struct mxc_nand_host *host)
  * NAND device status and returns the current status. */
 static uint16_t get_dev_status(struct mxc_nand_host *host)
 {
-	void __iomem *main_buf = host->main_area1;
+	void __iomem *main_buf = host->main_area0;
 	uint32_t store;
 	uint16_t ret;
-	/* Issue status request to NAND device */
 
-	/* store the main area1 first word, later do recovery */
+	writew(0x0, NFC_V1_V2_BUF_ADDR);
+
+	/*
+	 * The device status is stored in main_area0. To
+	 * prevent corruption of the buffer save the value
+	 * and restore it afterwards.
+	 */
 	store = readl(main_buf);
-	/* NANDFC buffer 1 is used for device status to prevent
-	 * corruption of read/write buffer on status requests. */
-	writew(1, host->regs + NFC_BUF_ADDR);
 
 	writew(NFC_STATUS, host->regs + NFC_CONFIG2);
-
-	/* Wait for operation to complete */
 	wait_op_done(host, true);
 
-	/* Status is placed in first word of main buffer */
-	/* get status, then recovery area 1 data */
 	ret = readw(main_buf);
+
 	writel(store, main_buf);
 
 	return ret;
@@ -761,7 +759,6 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 	}
 
 	host->main_area0 = host->base;
-	host->main_area1 = host->base + 0x200;
 
 	if (nfc_is_v21()) {
 		host->regs = host->base + 0x1e00;
-- 
1.7.1
