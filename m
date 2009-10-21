Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0c15-00021p-Eh
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 14:18:23 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 04/19] mxc_nand: merge send_read_page and send_prog_page
Date: Wed, 21 Oct 2009 16:13:11 +0200
Message-Id: <1256134406-25251-5-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1256134406-25251-4-git-send-email-s.hauer@pengutronix.de>
References: <1256134406-25251-1-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-2-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-3-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-4-git-send-email-s.hauer@pengutronix.de>
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
 drivers/mtd/nand/mxc_nand.c |   54 ++++++++++--------------------------------
 1 files changed, 13 insertions(+), 41 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index b28e5f9..56db5ac 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -226,12 +226,10 @@ static void send_addr(struct mxc_nand_host *host, uint16_t addr, int islast)
 	wait_op_done(host, TROP_US_DELAY, addr, islast);
 }
 
-/* This function requests the NANDFC to initate the transfer
- * of data currently in the NANDFC RAM buffer to the NAND device. */
-static void send_prog_page(struct mxc_nand_host *host, uint8_t buf_id,
-			int spare_only)
+static void send_page(struct mxc_nand_host *host, uint8_t buf_id,
+			int spare_only, unsigned int ops)
 {
-	DEBUG(MTD_DEBUG_LEVEL3, "send_prog_page (%d)\n", spare_only);
+	DEBUG(MTD_DEBUG_LEVEL3, "send_page (%d)\n", spare_only);
 
 	/* NANDFC buffer 0 is used for page read/write */
 	writew(buf_id, host->regs + NFC_BUF_ADDR);
@@ -246,33 +244,7 @@ static void send_prog_page(struct mxc_nand_host *host, uint8_t buf_id,
 		writew(config1, host->regs + NFC_CONFIG1);
 	}
 
-	writew(NFC_INPUT, host->regs + NFC_CONFIG2);
-
-	/* Wait for operation to complete */
-	wait_op_done(host, TROP_US_DELAY, spare_only, true);
-}
-
-/* Requests NANDFC to initated the transfer of data from the
- * NAND device into in the NANDFC ram buffer. */
-static void send_read_page(struct mxc_nand_host *host, uint8_t buf_id,
-		int spare_only)
-{
-	DEBUG(MTD_DEBUG_LEVEL3, "send_read_page (%d)\n", spare_only);
-
-	/* NANDFC buffer 0 is used for page read/write */
-	writew(buf_id, host->regs + NFC_BUF_ADDR);
-
-	/* Configure spare or page+spare access */
-	if (!host->pagesize_2k) {
-		uint32_t config1 = readw(host->regs + NFC_CONFIG1);
-		if (spare_only)
-			config1 |= NFC_SP_EN;
-		else
-			config1 &= ~NFC_SP_EN;
-		writew(config1, host->regs + NFC_CONFIG1);
-	}
-
-	writew(NFC_OUTPUT, host->regs + NFC_CONFIG2);
+	writew(ops, host->regs + NFC_CONFIG2);
 
 	/* Wait for operation to complete */
 	wait_op_done(host, TROP_US_DELAY, spare_only, true);
@@ -756,13 +728,13 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 		break;
 
 	case NAND_CMD_PAGEPROG:
-		send_prog_page(host, 0, host->spare_only);
+		send_page(host, 0, host->spare_only, NFC_INPUT);
 
 		if (host->pagesize_2k) {
 			/* data in 4 areas datas */
-			send_prog_page(host, 1, host->spare_only);
-			send_prog_page(host, 2, host->spare_only);
-			send_prog_page(host, 3, host->spare_only);
+			send_page(host, 1, host->spare_only, NFC_INPUT);
+			send_page(host, 2, host->spare_only, NFC_INPUT);
+			send_page(host, 3, host->spare_only, NFC_INPUT);
 		}
 
 		break;
@@ -827,12 +799,12 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 			/* send read confirm command */
 			send_cmd(host, NAND_CMD_READSTART, true);
 			/* read for each AREA */
-			send_read_page(host, 0, host->spare_only);
-			send_read_page(host, 1, host->spare_only);
-			send_read_page(host, 2, host->spare_only);
-			send_read_page(host, 3, host->spare_only);
+			send_page(host, 0, host->spare_only, NFC_OUTPUT);
+			send_page(host, 1, host->spare_only, NFC_OUTPUT);
+			send_page(host, 2, host->spare_only, NFC_OUTPUT);
+			send_page(host, 3, host->spare_only, NFC_OUTPUT);
 		} else
-			send_read_page(host, 0, host->spare_only);
+			send_page(host, 0, host->spare_only, NFC_OUTPUT);
 		break;
 
 	case NAND_CMD_READID:
-- 
1.6.5
