Received: from mail-qg0-f51.google.com ([209.85.192.51])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSC5n-0005qx-PB
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 22:44:25 +0000
Received: by qgj62 with SMTP id 62so16418523qgj.2
 for <linux-mtd@lists.infradead.org>; Wed, 19 Aug 2015 15:44:02 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>, robert.jarzmik@free.fr,
 <linux-mtd@lists.infradead.org>
Cc: jogo@openwrt.org,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH v2] nand: pxa3xx: Increase READ_ID buffer and make the size
 static
Date: Wed, 19 Aug 2015 19:40:09 -0300
Message-Id: <1440024009-20177-1-git-send-email-ezequiel@vanguardiasur.com.ar>
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
Changes from v1:

  * Keep "data_size" to 8 bytes, as per hardware
    requirements to read at least a FIFO entry.

  * While here, add a proper comment on READ_ID_BYTES'
    definition.

 drivers/mtd/nand/pxa3xx_nand.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 51f8a58..740983a 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -129,6 +129,13 @@
 #define EXT_CMD_TYPE_LAST_RW	1 /* Last naked read/write */
 #define EXT_CMD_TYPE_MONO	0 /* Monolithic read/write */
 
+/*
+ * This should be large enough to read 'ONFI' and 'JEDEC'.
+ * Let's use 7 bytes, which is the maximum ID count supported
+ * by the controller (see NDCR_RD_ID_CNT_MASK).
+ */
+#define READ_ID_BYTES		7
+
 /* macros for registers read/write */
 #define nand_writel(info, off, val)	\
 	writel_relaxed((val), (info)->mmio_base + (off))
@@ -176,8 +183,6 @@ struct pxa3xx_nand_host {
 	/* calculated from pxa3xx_nand_flash data */
 	unsigned int		col_addr_cycles;
 	unsigned int		row_addr_cycles;
-	size_t			read_id_bytes;
-
 };
 
 struct pxa3xx_nand_info {
@@ -917,7 +922,7 @@ static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
 		break;
 
 	case NAND_CMD_READID:
-		info->buf_count = host->read_id_bytes;
+		info->buf_count = READ_ID_BYTES;
 		info->ndcb0 |= NDCB0_CMD_TYPE(3)
 				| NDCB0_ADDR_CYC(1)
 				| command;
@@ -1254,9 +1259,6 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
 		return -EINVAL;
 	}
 
-	/* calculate flash information */
-	host->read_id_bytes = (f->page_size == 2048) ? 4 : 2;
-
 	/* calculate addressing information */
 	host->col_addr_cycles = (f->page_size == 2048) ? 2 : 1;
 
@@ -1272,7 +1274,7 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
 	ndcr |= (f->flash_width == 16) ? NDCR_DWIDTH_M : 0;
 	ndcr |= (f->dfc_width == 16) ? NDCR_DWIDTH_C : 0;
 
-	ndcr |= NDCR_RD_ID_CNT(host->read_id_bytes);
+	ndcr |= NDCR_RD_ID_CNT(READ_ID_BYTES);
 	ndcr |= NDCR_SPARE_EN; /* enable spare by default */
 
 	info->reg_ndcr = ndcr;
@@ -1283,23 +1285,10 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
 
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
