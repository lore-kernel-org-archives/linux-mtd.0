Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0cRE-0004BU-4b
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 14:45:23 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 10/19] mxc nand: simplify command processing
Date: Wed, 21 Oct 2009 16:13:17 +0200
Message-Id: <1256134406-25251-11-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1256134406-25251-10-git-send-email-s.hauer@pengutronix.de>
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

Instead of having two switch/case with other operations
in between, use only one switch/case

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c |   81 ++++++++++++++++++------------------------
 1 files changed, 35 insertions(+), 46 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 4c338ae..e5de71a 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -533,7 +533,6 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 {
 	struct nand_chip *nand_chip = mtd->priv;
 	struct mxc_nand_host *host = nand_chip->priv;
-	int useirq = true;
 
 	DEBUG(MTD_DEBUG_LEVEL3,
 	      "mxc_nand_command (cmd = 0x%x, col = 0x%x, page = 0x%x)\n",
@@ -548,19 +547,37 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 	case NAND_CMD_STATUS:
 		host->buf_start = 0;
 		host->status_request = true;
-		break;
 
-	case NAND_CMD_READ0:
-		host->buf_start = column;
-		useirq = false;
+		send_cmd(host, command, true);
+		mxc_do_addr_cycle(mtd, column, page_addr);
 		break;
 
+	case NAND_CMD_READ0:
 	case NAND_CMD_READOOB:
-		host->buf_start = column + mtd->writesize;
+		if (command == NAND_CMD_READ0)
+			host->buf_start = column;
+		else
+			host->buf_start = column + mtd->writesize;
 
-		useirq = false;
 		if (host->pagesize_2k)
 			command = NAND_CMD_READ0; /* only READ0 is valid */
+
+		send_cmd(host, command, false);
+		mxc_do_addr_cycle(mtd, column, page_addr);
+
+		if (host->pagesize_2k) {
+			/* send read confirm command */
+			send_cmd(host, NAND_CMD_READSTART, true);
+			/* read for each AREA */
+			send_page(host, 0, NFC_OUTPUT);
+			send_page(host, 1, NFC_OUTPUT);
+			send_page(host, 2, NFC_OUTPUT);
+			send_page(host, 3, NFC_OUTPUT);
+		} else
+			send_page(host, 0, NFC_OUTPUT);
+
+		memcpy(host->data_buf, host->regs + MAIN_AREA0, mtd->writesize);
+		copy_spare(mtd, true);
 		break;
 
 	case NAND_CMD_SEQIN:
@@ -589,7 +606,9 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 			if (!host->pagesize_2k)
 				send_cmd(host, NAND_CMD_READ0, false);
 		}
-		useirq = false;
+
+		send_cmd(host, command, false);
+		mxc_do_addr_cycle(mtd, column, page_addr);
 		break;
 
 	case NAND_CMD_PAGEPROG:
@@ -604,51 +623,21 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 			send_page(host, 3, NFC_INPUT);
 		}
 
-		break;
-
-	case NAND_CMD_ERASE1:
-		useirq = false;
-		break;
-	}
-
-	/* Write out the command to the device. */
-	send_cmd(host, command, useirq);
-	mxc_do_addr_cycle(mtd, column, page_addr);
-
-	/* Command post-processing step */
-	switch (command) {
-
-	case NAND_CMD_RESET:
-		break;
-
-	case NAND_CMD_READOOB:
-	case NAND_CMD_READ0:
-		if (host->pagesize_2k) {
-			/* send read confirm command */
-			send_cmd(host, NAND_CMD_READSTART, true);
-			/* read for each AREA */
-			send_page(host, 0, NFC_OUTPUT);
-			send_page(host, 1, NFC_OUTPUT);
-			send_page(host, 2, NFC_OUTPUT);
-			send_page(host, 3, NFC_OUTPUT);
-		} else
-			send_page(host, 0, NFC_OUTPUT);
-
-		memcpy(host->data_buf, host->regs + MAIN_AREA0, mtd->writesize);
-		copy_spare(mtd, true);
+		send_cmd(host, command, true);
+		mxc_do_addr_cycle(mtd, column, page_addr);
 		break;
 
 	case NAND_CMD_READID:
+		send_cmd(host, command, true);
+		mxc_do_addr_cycle(mtd, column, page_addr);
 		send_read_id(host);
 		break;
 
-	case NAND_CMD_PAGEPROG:
-		break;
-
-	case NAND_CMD_STATUS:
-		break;
-
+	case NAND_CMD_ERASE1:
 	case NAND_CMD_ERASE2:
+		send_cmd(host, command, false);
+		mxc_do_addr_cycle(mtd, column, page_addr);
+
 		break;
 	}
 }
-- 
1.6.5
