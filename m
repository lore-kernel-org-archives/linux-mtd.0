Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYqt7-0007oH-7D
 for linux-mtd@lists.infradead.org; Tue, 09 Jan 2018 10:12:12 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 8/8] mtd: nand: mxc: remove now unused code
Date: Tue,  9 Jan 2018 11:11:48 +0100
Message-Id: <20180109101148.13728-9-s.hauer@pengutronix.de>
In-Reply-To: <20180109101148.13728-1-s.hauer@pengutronix.de>
References: <20180109101148.13728-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since we now have our own read_page/write_page functions
mxc_nand_command() will no longer be called with NAND_CMD_READ0,
NAND_CMD_READOOB, NAND_CMD_SEQIN and NAND_CMD_PAGEPROG. Remove
the code handling these commands.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c | 51 ---------------------------------------------
 1 file changed, 51 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 1d2c55e5ca89..efe29a179c5c 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1403,57 +1403,6 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 		mxc_do_addr_cycle(mtd, column, page_addr);
 		break;
 
-	case NAND_CMD_READ0:
-	case NAND_CMD_READOOB:
-		if (command == NAND_CMD_READ0)
-			host->buf_start = column;
-		else
-			host->buf_start = column + mtd->writesize;
-
-		command = NAND_CMD_READ0; /* only READ0 is valid */
-
-		host->devtype_data->send_cmd(host, command, false);
-		WARN_ONCE(column < 0,
-			  "Unexpected column/row value (cmd=%u, col=%d, row=%d)\n",
-			  command, column, page_addr);
-		mxc_do_addr_cycle(mtd, 0, page_addr);
-
-		if (mtd->writesize > 512)
-			host->devtype_data->send_cmd(host,
-					NAND_CMD_READSTART, true);
-
-		host->devtype_data->send_page(mtd, NFC_OUTPUT);
-
-		memcpy32_fromio(host->data_buf, host->main_area0,
-				mtd->writesize);
-		copy_spare(mtd, true, host->data_buf + mtd->writesize);
-		break;
-
-	case NAND_CMD_SEQIN:
-		if (column >= mtd->writesize)
-			/* call ourself to read a page */
-			mxc_nand_command(mtd, NAND_CMD_READ0, 0, page_addr);
-
-		host->buf_start = column;
-
-		host->devtype_data->send_cmd(host, command, false);
-		WARN_ONCE(column < -1,
-			  "Unexpected column/row value (cmd=%u, col=%d, row=%d)\n",
-			  command, column, page_addr);
-		mxc_do_addr_cycle(mtd, 0, page_addr);
-		break;
-
-	case NAND_CMD_PAGEPROG:
-		memcpy32_toio(host->main_area0, host->data_buf, mtd->writesize);
-		copy_spare(mtd, false, host->data_buf + mtd->writesize);
-		host->devtype_data->send_page(mtd, NFC_INPUT);
-		host->devtype_data->send_cmd(host, command, true);
-		WARN_ONCE(column != -1 || page_addr != -1,
-			  "Unexpected column/row value (cmd=%u, col=%d, row=%d)\n",
-			  command, column, page_addr);
-		mxc_do_addr_cycle(mtd, column, page_addr);
-		break;
-
 	case NAND_CMD_READID:
 		host->devtype_data->send_cmd(host, command, true);
 		mxc_do_addr_cycle(mtd, column, page_addr);
-- 
2.11.0
