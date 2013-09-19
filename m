Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMgh2-00015p-NC
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 16:03:05 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 10/21] mtd: nand: pxa3xx: Replace host->page_size by
 mtd->writesize
Date: Thu, 19 Sep 2013 13:01:34 -0300
Message-Id: <1379606505-2529-11-git-send-email-ezequiel.garcia@free-electrons.com>
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

There's no need to privately store the device page size as it's
available in mtd structure field mtd->writesize.
Also, this removes the hardcoded page size value, leaving the
auto-detected value only.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 3f190fd..f3dfeba 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -157,7 +157,6 @@ struct pxa3xx_nand_host {
 	void			*info_data;
 
 	/* page size of attached chip */
-	unsigned int		page_size;
 	int			use_ecc;
 	int			cs;
 
@@ -649,12 +648,12 @@ static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 			info->buf_start += mtd->writesize;
 
 		/* Second command setting for large pages */
-		if (host->page_size >= PAGE_CHUNK_SIZE)
+		if (mtd->writesize >= PAGE_CHUNK_SIZE)
 			info->ndcb0 |= NDCB0_DBC | (NAND_CMD_READSTART << 8);
 
 	case NAND_CMD_SEQIN:
 		/* small page addr setting */
-		if (unlikely(host->page_size < PAGE_CHUNK_SIZE)) {
+		if (unlikely(mtd->writesize < PAGE_CHUNK_SIZE)) {
 			info->ndcb1 = ((page_addr & 0xFFFFFF) << 8)
 					| (column & 0xFF);
 
@@ -939,7 +938,6 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
 	}
 
 	/* calculate flash information */
-	host->page_size = f->page_size;
 	host->read_id_bytes = (f->page_size == 2048) ? 4 : 2;
 
 	/* calculate addressing information */
@@ -978,11 +976,9 @@ static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
 	if (ndcr & NDCR_PAGE_SZ) {
 		/* Controller's FIFO size */
 		info->fifo_size = 2048;
-		host->page_size = 2048;
 		host->read_id_bytes = 4;
 	} else {
 		info->fifo_size = 512;
-		host->page_size = 512;
 		host->read_id_bytes = 2;
 	}
 
-- 
1.8.1.5
