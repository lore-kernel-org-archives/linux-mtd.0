Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMghC-000179-NX
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 16:03:18 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 14/21] mtd: nand: pxa3xx: Move the data buffer clean to
 prepare_start_command()
Date: Thu, 19 Sep 2013 13:01:38 -0300
Message-Id: <1379606505-2529-15-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Daniel Mack <zonque@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To allow future support of multiple page reading/writing, move the data
buffer clean out of prepare_set_command().

This is done to prevent the data buffer from being cleaned on every command
preparation, when a multiple command sequence is implemented to read/write
pages larger than the FIFO size (2 KiB).

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 562b968..6251939 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -610,6 +610,9 @@ static void set_command_address(struct pxa3xx_nand_info *info,
 
 static void prepare_start_command(struct pxa3xx_nand_info *info, int command)
 {
+	struct pxa3xx_nand_host *host = info->host[info->cs];
+	struct mtd_info *mtd = host->mtd;
+
 	/* reset data and oob column point to handle data */
 	info->buf_start		= 0;
 	info->buf_count		= 0;
@@ -635,6 +638,19 @@ static void prepare_start_command(struct pxa3xx_nand_info *info, int command)
 		info->ndcb2 = 0;
 		break;
 	}
+
+	/*
+	 * If we are about to isse a read command, or about to set
+	 * the write address, then clean the data buffer.
+	 */
+	if (command == NAND_CMD_READ0 ||
+	    command == NAND_CMD_READOOB ||
+	    command == NAND_CMD_SEQIN) {
+
+		info->buf_count = mtd->writesize + mtd->oobsize;
+		memset(info->data_buff, 0xFF, info->buf_count);
+	}
+
 }
 
 static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
@@ -676,16 +692,11 @@ static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
 			info->ndcb0 |= NDCB0_DBC | (NAND_CMD_READSTART << 8);
 
 		set_command_address(info, mtd->writesize, column, page_addr);
-		info->buf_count = mtd->writesize + mtd->oobsize;
-		memset(info->data_buff, 0xFF, info->buf_count);
 		break;
 
 	case NAND_CMD_SEQIN:
 
 		set_command_address(info, mtd->writesize, column, page_addr);
-		info->buf_count = mtd->writesize + mtd->oobsize;
-		memset(info->data_buff, 0xFF, info->buf_count);
-
 		break;
 
 	case NAND_CMD_PAGEPROG:
-- 
1.8.1.5
