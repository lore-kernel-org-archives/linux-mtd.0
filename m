Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0cEC-00015v-JW
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 14:31:56 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 11/19] mxc nand: modify send_page to send all pages,
	not only one
Date: Wed, 21 Oct 2009 16:13:18 +0200
Message-Id: <1256134406-25251-12-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1256134406-25251-11-git-send-email-s.hauer@pengutronix.de>
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
 drivers/mtd/nand/mxc_nand.c |   45 +++++++++++++++++++-----------------------
 1 files changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index e5de71a..04b2bf2 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -228,16 +228,25 @@ static void send_addr(struct mxc_nand_host *host, uint16_t addr, int islast)
 	wait_op_done(host, TROP_US_DELAY, islast);
 }
 
-static void send_page(struct mxc_nand_host *host, uint8_t buf_id,
-		unsigned int ops)
+static void send_page(struct mxc_nand_host *host, unsigned int ops)
 {
-	/* NANDFC buffer 0 is used for page read/write */
-	writew(buf_id, host->regs + NFC_BUF_ADDR);
+	int bufs, i;
 
-	writew(ops, host->regs + NFC_CONFIG2);
+	if (host->pagesize_2k)
+		bufs = 4;
+	else
+		bufs = 1;
 
-	/* Wait for operation to complete */
-	wait_op_done(host, TROP_US_DELAY, true);
+	for (i = 0; i < bufs; i++) {
+
+		/* NANDFC buffer 0 is used for page read/write */
+		writew(i, host->regs + NFC_BUF_ADDR);
+
+		writew(ops, host->regs + NFC_CONFIG2);
+
+		/* Wait for operation to complete */
+		wait_op_done(host, TROP_US_DELAY, true);
+	}
 }
 
 /* Request the NANDFC to perform a read of the NAND device ID. */
@@ -565,16 +574,10 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 		send_cmd(host, command, false);
 		mxc_do_addr_cycle(mtd, column, page_addr);
 
-		if (host->pagesize_2k) {
-			/* send read confirm command */
+		if (host->pagesize_2k)
 			send_cmd(host, NAND_CMD_READSTART, true);
-			/* read for each AREA */
-			send_page(host, 0, NFC_OUTPUT);
-			send_page(host, 1, NFC_OUTPUT);
-			send_page(host, 2, NFC_OUTPUT);
-			send_page(host, 3, NFC_OUTPUT);
-		} else
-			send_page(host, 0, NFC_OUTPUT);
+
+		send_page(host, NFC_OUTPUT);
 
 		memcpy(host->data_buf, host->regs + MAIN_AREA0, mtd->writesize);
 		copy_spare(mtd, true);
@@ -614,15 +617,7 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 	case NAND_CMD_PAGEPROG:
 		memcpy(host->regs + MAIN_AREA0, host->data_buf, mtd->writesize);
 		copy_spare(mtd, false);
-		send_page(host, 0, NFC_INPUT);
-
-		if (host->pagesize_2k) {
-			/* data in 4 areas datas */
-			send_page(host, 1, NFC_INPUT);
-			send_page(host, 2, NFC_INPUT);
-			send_page(host, 3, NFC_INPUT);
-		}
-
+		send_page(host, NFC_INPUT);
 		send_cmd(host, command, true);
 		mxc_do_addr_cycle(mtd, column, page_addr);
 		break;
-- 
1.6.5
