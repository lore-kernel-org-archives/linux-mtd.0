Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMgh7-000170-NQ
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 16:03:12 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 11/21] mtd: nand: pxa3xx: Add helper function to set page
 address
Date: Thu, 19 Sep 2013 13:01:35 -0300
Message-Id: <1379606505-2529-12-git-send-email-ezequiel.garcia@free-electrons.com>
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

Let's simplify the code by first introducing a helper function
to set the page address, as done by the READ0, READOOB and SEQIN
commands.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index f3dfeba..80f0105 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -588,6 +588,26 @@ static inline int is_buf_blank(uint8_t *buf, size_t len)
 	return 1;
 }
 
+static void set_command_address(struct pxa3xx_nand_info *info,
+		unsigned int page_size, uint16_t column, int page_addr)
+{
+	/* small page addr setting */
+	if (page_size < PAGE_CHUNK_SIZE) {
+		info->ndcb1 = ((page_addr & 0xFFFFFF) << 8)
+				| (column & 0xFF);
+
+		info->ndcb2 = 0;
+	} else {
+		info->ndcb1 = ((page_addr & 0xFFFF) << 16)
+				| (column & 0xFFFF);
+
+		if (page_addr & 0xFF0000)
+			info->ndcb2 = (page_addr & 0xFF0000) >> 16;
+		else
+			info->ndcb2 = 0;
+	}
+}
+
 static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 		uint16_t column, int page_addr)
 {
@@ -652,22 +672,8 @@ static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 			info->ndcb0 |= NDCB0_DBC | (NAND_CMD_READSTART << 8);
 
 	case NAND_CMD_SEQIN:
-		/* small page addr setting */
-		if (unlikely(mtd->writesize < PAGE_CHUNK_SIZE)) {
-			info->ndcb1 = ((page_addr & 0xFFFFFF) << 8)
-					| (column & 0xFF);
-
-			info->ndcb2 = 0;
-		} else {
-			info->ndcb1 = ((page_addr & 0xFFFF) << 16)
-					| (column & 0xFFFF);
-
-			if (page_addr & 0xFF0000)
-				info->ndcb2 = (page_addr & 0xFF0000) >> 16;
-			else
-				info->ndcb2 = 0;
-		}
 
+		set_command_address(info, mtd->writesize, column, page_addr);
 		info->buf_count = mtd->writesize + mtd->oobsize;
 		memset(info->data_buff, 0xFF, info->buf_count);
 
-- 
1.8.1.5
