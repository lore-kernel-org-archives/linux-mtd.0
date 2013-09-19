Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMgh2-00015l-NB
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 16:03:06 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 09/21] mtd: nand: pxa3xx: Split FIFO size from to-be-read FIFO
 count
Date: Thu, 19 Sep 2013 13:01:33 -0300
Message-Id: <1379606505-2529-10-git-send-email-ezequiel.garcia@free-electrons.com>
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

Introduce a fifo_size field to represent the size of the controller's
FIFO buffer, and use it to distinguish that size from the amount
of data bytes to be read from the FIFO.

This is important to support devices with pages larger than the
controller's internal FIFO, that need to read the pages in FIFO-sized
chunks.

In particular, the current code is at least confusing, for it mixes
all the different sizes involved: FIFO size, page size and data size.

This commit starts the cleaning by removing the info->page_size field
that is not currently used. The host->page_size field should also
be removed and use always mtd->writesize instead. Follow up commits
will clean this up.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index d8e4311..3f190fd 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -214,8 +214,8 @@ struct pxa3xx_nand_info {
 	 */
 	atomic_t		is_ready;
 
-	unsigned int		page_size;	/* page size of attached chip */
-	unsigned int		data_size;	/* data size in FIFO */
+	unsigned int		fifo_size;	/* max. data size in the FIFO */
+	unsigned int		data_size;	/* data to be read from FIFO */
 	unsigned int		oob_size;
 	int 			retcode;
 
@@ -331,16 +331,15 @@ static void pxa3xx_nand_set_timing(struct pxa3xx_nand_host *host,
  */
 static void pxa3xx_set_datasize(struct pxa3xx_nand_info *info)
 {
-	struct pxa3xx_nand_host *host = info->host[info->cs];
 	int oob_enable = info->reg_ndcr & NDCR_SPARE_EN;
 
-	info->data_size = host->page_size;
+	info->data_size = info->fifo_size;
 	if (!oob_enable) {
 		info->oob_size = 0;
 		return;
 	}
 
-	switch (host->page_size) {
+	switch (info->fifo_size) {
 	case 2048:
 		if (info->ecc_bch)
 			info->oob_size = (info->use_ecc) ? 32 : 64;
@@ -977,9 +976,12 @@ static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
 	uint32_t ndcr = nand_readl(info, NDCR);
 
 	if (ndcr & NDCR_PAGE_SZ) {
+		/* Controller's FIFO size */
+		info->fifo_size = 2048;
 		host->page_size = 2048;
 		host->read_id_bytes = 4;
 	} else {
+		info->fifo_size = 512;
 		host->page_size = 512;
 		host->read_id_bytes = 2;
 	}
-- 
1.8.1.5
