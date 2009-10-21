Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0bxq-0001xf-Jt
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 14:14:59 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 16/19] mxc_nand: disable sp_en bit only once
Date: Wed, 21 Oct 2009 16:13:23 +0200
Message-Id: <1256134406-25251-17-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1256134406-25251-16-git-send-email-s.hauer@pengutronix.de>
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
 drivers/mtd/nand/mxc_nand.c |   15 +++------------
 1 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index f2297eb..199a5f2 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -274,16 +274,10 @@ static void send_page(struct mtd_info *mtd, unsigned int ops)
 static void send_read_id(struct mxc_nand_host *host)
 {
 	struct nand_chip *this = &host->nand;
-	uint16_t tmp;
 
 	/* NANDFC buffer 0 is used for device ID output */
 	writew(0x0, host->regs + NFC_BUF_ADDR);
 
-	/* Read ID into main buffer */
-	tmp = readw(host->regs + NFC_CONFIG1);
-	tmp &= ~NFC_SP_EN;
-	writew(tmp, host->regs + NFC_CONFIG1);
-
 	writew(NFC_ID, host->regs + NFC_CONFIG2);
 
 	/* Wait for operation to complete */
@@ -307,7 +301,7 @@ static uint16_t get_dev_status(struct mxc_nand_host *host)
 {
 	void __iomem *main_buf = host->main_area1;
 	uint32_t store;
-	uint16_t ret, tmp;
+	uint16_t ret;
 	/* Issue status request to NAND device */
 
 	/* store the main area1 first word, later do recovery */
@@ -316,11 +310,6 @@ static uint16_t get_dev_status(struct mxc_nand_host *host)
 	 * corruption of read/write buffer on status requests. */
 	writew(1, host->regs + NFC_BUF_ADDR);
 
-	/* Read status into main buffer */
-	tmp = readw(host->regs + NFC_CONFIG1);
-	tmp &= ~NFC_SP_EN;
-	writew(tmp, host->regs + NFC_CONFIG1);
-
 	writew(NFC_STATUS, host->regs + NFC_CONFIG2);
 
 	/* Wait for operation to complete */
@@ -739,8 +728,10 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 	} else
 		BUG();
 
+	/* disable interrupt and spare enable */
 	tmp = readw(host->regs + NFC_CONFIG1);
 	tmp |= NFC_INT_MSK;
+	tmp &= ~NFC_SP_EN;
 	writew(tmp, host->regs + NFC_CONFIG1);
 
 	init_waitqueue_head(&host->irq_waitq);
-- 
1.6.5
