Received: from mail-qk0-f181.google.com ([209.85.220.181])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMGq9-0002z2-Ft
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 14:35:46 +0000
Received: by qkbm65 with SMTP id m65so51304898qkb.2
 for <linux-mtd@lists.infradead.org>; Mon, 03 Aug 2015 07:35:24 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
Cc: antoine.tenart@free-electrons.com, robert.jarzmik@free.fr,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 1/2] nand: pxa3xx: Increase READ_ID buffer and make the size
 static
Date: Mon,  3 Aug 2015 11:31:25 -0300
Message-Id: <1438612286-16070-2-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1438612286-16070-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1438612286-16070-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The read ID count should be made as large as the maximum READ_ID size,
so there's no need to have dynamic size. This commit sets the hardware
maximum read ID count, which should be more than enough on all cases.
Also, we get rid of the read_id_bytes, and use a macro instead.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/nand/pxa3xx_nand.c | 28 ++++++----------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 1259cc5..0815f11 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -126,6 +126,8 @@
 #define EXT_CMD_TYPE_LAST_RW	1 /* Last naked read/write */
 #define EXT_CMD_TYPE_MONO	0 /* Monolithic read/write */
 
+#define READ_ID_BYTES		7 /* Large enough to read 'JEDEC' */
+
 /* macros for registers read/write */
 #define nand_writel(info, off, val)	\
 	writel_relaxed((val), (info)->mmio_base + (off))
@@ -173,8 +175,6 @@ struct pxa3xx_nand_host {
 	/* calculated from pxa3xx_nand_flash data */
 	unsigned int		col_addr_cycles;
 	unsigned int		row_addr_cycles;
-	size_t			read_id_bytes;
-
 };
 
 struct pxa3xx_nand_info {
@@ -910,13 +910,13 @@ static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
 		break;
 
 	case NAND_CMD_READID:
-		info->buf_count = host->read_id_bytes;
+		info->buf_count = READ_ID_BYTES;
 		info->ndcb0 |= NDCB0_CMD_TYPE(3)
 				| NDCB0_ADDR_CYC(1)
 				| command;
 		info->ndcb1 = (column & 0xFF);
 
-		info->data_size = 8;
+		info->data_size = READ_ID_BYTES;
 		break;
 	case NAND_CMD_STATUS:
 		info->buf_count = 1;
@@ -1247,9 +1247,6 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
 		return -EINVAL;
 	}
 
-	/* calculate flash information */
-	host->read_id_bytes = (f->page_size == 2048) ? 4 : 2;
-
 	/* calculate addressing information */
 	host->col_addr_cycles = (f->page_size == 2048) ? 2 : 1;
 
@@ -1265,7 +1262,7 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
 	ndcr |= (f->flash_width == 16) ? NDCR_DWIDTH_M : 0;
 	ndcr |= (f->dfc_width == 16) ? NDCR_DWIDTH_C : 0;
 
-	ndcr |= NDCR_RD_ID_CNT(host->read_id_bytes);
+	ndcr |= NDCR_RD_ID_CNT(READ_ID_BYTES);
 	ndcr |= NDCR_SPARE_EN; /* enable spare by default */
 
 	info->reg_ndcr = ndcr;
@@ -1276,23 +1273,10 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
 
 static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
 {
-	/*
-	 * We set 0 by hard coding here, for we don't support keep_config
-	 * when there is more than one chip attached to the controller
-	 */
-	struct pxa3xx_nand_host *host = info->host[0];
 	uint32_t ndcr = nand_readl(info, NDCR);
 
-	if (ndcr & NDCR_PAGE_SZ) {
-		/* Controller's FIFO size */
-		info->chunk_size = 2048;
-		host->read_id_bytes = 4;
-	} else {
-		info->chunk_size = 512;
-		host->read_id_bytes = 2;
-	}
-
 	/* Set an initial chunk size */
+	info->chunk_size = ndcr & NDCR_PAGE_SZ ? 2048 : 512;
 	info->reg_ndcr = ndcr & ~NDCR_INT_MASK;
 	info->ndtr0cs0 = nand_readl(info, NDTR0CS0);
 	info->ndtr1cs0 = nand_readl(info, NDTR1CS0);
-- 
2.4.6
