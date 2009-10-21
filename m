Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0cBW-00060D-1M
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 14:29:06 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 14/19] mxc_nand: Get rid of pagesize_2k flag
Date: Wed, 21 Oct 2009 16:13:21 +0200
Message-Id: <1256134406-25251-15-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1256134406-25251-14-git-send-email-s.hauer@pengutronix.de>
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

Later versions of this controller also allow 4k pagesize,
so use mtd->writesize instead of a flag.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c |   29 ++++++++++++++---------------
 1 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 450db4e..6525d0f 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -101,7 +101,6 @@ struct mxc_nand_host {
 	void __iomem		*base;
 	void __iomem		*regs;
 	int			status_request;
-	int			pagesize_2k;
 	struct clk		*clk;
 	int			clk_act;
 	int			irq;
@@ -214,11 +213,13 @@ static void send_addr(struct mxc_nand_host *host, uint16_t addr, int islast)
 	wait_op_done(host, TROP_US_DELAY, islast);
 }
 
-static void send_page(struct mxc_nand_host *host, unsigned int ops)
+static void send_page(struct mtd_info *mtd, unsigned int ops)
 {
+	struct nand_chip *nand_chip = mtd->priv;
+	struct mxc_nand_host *host = nand_chip->priv;
 	int bufs, i;
 
-	if (host->pagesize_2k)
+	if (mtd->writesize > 512)
 		bufs = 4;
 	else
 		bufs = 1;
@@ -490,7 +491,7 @@ static void mxc_do_addr_cycle(struct mtd_info *mtd, int column, int page_addr)
 		 * the full page.
 		 */
 		send_addr(host, 0, page_addr == -1);
-		if (host->pagesize_2k)
+		if (mtd->writesize > 512)
 			/* another col addr cycle for 2k page */
 			send_addr(host, 0, false);
 	}
@@ -500,7 +501,7 @@ static void mxc_do_addr_cycle(struct mtd_info *mtd, int column, int page_addr)
 		/* paddr_0 - p_addr_7 */
 		send_addr(host, (page_addr & 0xff), false);
 
-		if (host->pagesize_2k) {
+		if (mtd->writesize > 512) {
 			if (mtd->size >= 0x10000000) {
 				/* paddr_8 - paddr_15 */
 				send_addr(host, (page_addr >> 8) & 0xff, false);
@@ -554,16 +555,16 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 		else
 			host->buf_start = column + mtd->writesize;
 
-		if (host->pagesize_2k)
+		if (mtd->writesize > 512)
 			command = NAND_CMD_READ0; /* only READ0 is valid */
 
 		send_cmd(host, command, false);
 		mxc_do_addr_cycle(mtd, column, page_addr);
 
-		if (host->pagesize_2k)
+		if (mtd->writesize > 512)
 			send_cmd(host, NAND_CMD_READSTART, true);
 
-		send_page(host, NFC_OUTPUT);
+		send_page(mtd, NFC_OUTPUT);
 
 		memcpy(host->data_buf, host->main_area0, mtd->writesize);
 		copy_spare(mtd, true);
@@ -578,7 +579,7 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 			 * pointer to spare area, we must write the whole page
 			 * including OOB together.
 			 */
-			if (host->pagesize_2k)
+			if (mtd->writesize > 512)
 				/* call ourself to read a page */
 				mxc_nand_command(mtd, NAND_CMD_READ0, 0,
 						page_addr);
@@ -586,13 +587,13 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 			host->buf_start = column;
 
 			/* Set program pointer to spare region */
-			if (!host->pagesize_2k)
+			if (mtd->writesize == 512)
 				send_cmd(host, NAND_CMD_READOOB, false);
 		} else {
 			host->buf_start = column;
 
 			/* Set program pointer to page start */
-			if (!host->pagesize_2k)
+			if (mtd->writesize == 512)
 				send_cmd(host, NAND_CMD_READ0, false);
 		}
 
@@ -603,7 +604,7 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 	case NAND_CMD_PAGEPROG:
 		memcpy(host->main_area0, host->data_buf, mtd->writesize);
 		copy_spare(mtd, false);
-		send_page(host, NFC_INPUT);
+		send_page(mtd, NFC_INPUT);
 		send_cmd(host, command, true);
 		mxc_do_addr_cycle(mtd, column, page_addr);
 		break;
@@ -745,10 +746,8 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 		goto escan;
 	}
 
-	if (mtd->writesize == 2048) {
-		host->pagesize_2k = 1;
+	if (mtd->writesize == 2048)
 		this->ecc.layout = &nand_hw_eccoob_largepage;
-	}
 
 	/* second phase scan */
 	if (nand_scan_tail(mtd)) {
-- 
1.6.5
