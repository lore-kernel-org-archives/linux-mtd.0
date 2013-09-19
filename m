Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMgh5-00015h-1E
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 16:03:12 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 15/21] mtd: nand: pxa3xx: Add a read/write buffers markers
Date: Thu, 19 Sep 2013 13:01:39 -0300
Message-Id: <1379606505-2529-16-git-send-email-ezequiel.garcia@free-electrons.com>
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

In preparation to support multiple (aka chunked, aka splitted)
page I/O, this commit adds 'data_buff_pos' and 'oob_buff_pos' fields
to keep track of where the next read (or write) should be done.

This will allow multiple calls to handle_data_pio() to continue
the read (or write) operation.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 40 +++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 6251939..0dc6fa4 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -179,6 +179,8 @@ struct pxa3xx_nand_info {
 	unsigned int 		buf_start;
 	unsigned int		buf_count;
 	unsigned int		buf_size;
+	unsigned int		data_buff_pos;
+	unsigned int		oob_buff_pos;
 
 	/* DMA information */
 	int			drcmr_dat;
@@ -328,11 +330,12 @@ static void pxa3xx_nand_set_timing(struct pxa3xx_nand_host *host,
  * spare and ECC configuration.
  * Only applicable to READ0, READOOB and PAGEPROG commands.
  */
-static void pxa3xx_set_datasize(struct pxa3xx_nand_info *info)
+static void pxa3xx_set_datasize(struct pxa3xx_nand_info *info,
+				struct mtd_info *mtd)
 {
 	int oob_enable = info->reg_ndcr & NDCR_SPARE_EN;
 
-	info->data_size = info->fifo_size;
+	info->data_size = mtd->writesize;
 	if (!oob_enable) {
 		info->oob_size = 0;
 		return;
@@ -430,26 +433,39 @@ static void disable_int(struct pxa3xx_nand_info *info, uint32_t int_mask)
 
 static void handle_data_pio(struct pxa3xx_nand_info *info)
 {
+	unsigned int do_bytes = min(info->data_size, info->fifo_size);
+
 	switch (info->state) {
 	case STATE_PIO_WRITING:
-		__raw_writesl(info->mmio_base + NDDB, info->data_buff,
-				DIV_ROUND_UP(info->data_size, 4));
+		__raw_writesl(info->mmio_base + NDDB,
+			      info->data_buff + info->data_buff_pos,
+			      DIV_ROUND_UP(do_bytes, 4));
+
 		if (info->oob_size > 0)
-			__raw_writesl(info->mmio_base + NDDB, info->oob_buff,
-					DIV_ROUND_UP(info->oob_size, 4));
+			__raw_writesl(info->mmio_base + NDDB,
+				      info->oob_buff + info->oob_buff_pos,
+				      DIV_ROUND_UP(info->oob_size, 4));
 		break;
 	case STATE_PIO_READING:
-		__raw_readsl(info->mmio_base + NDDB, info->data_buff,
-				DIV_ROUND_UP(info->data_size, 4));
+		__raw_readsl(info->mmio_base + NDDB,
+			     info->data_buff + info->data_buff_pos,
+			     DIV_ROUND_UP(do_bytes, 4));
+
 		if (info->oob_size > 0)
-			__raw_readsl(info->mmio_base + NDDB, info->oob_buff,
-					DIV_ROUND_UP(info->oob_size, 4));
+			__raw_readsl(info->mmio_base + NDDB,
+				     info->oob_buff + info->oob_buff_pos,
+				     DIV_ROUND_UP(info->oob_size, 4));
 		break;
 	default:
 		dev_err(&info->pdev->dev, "%s: invalid state %d\n", __func__,
 				info->state);
 		BUG();
 	}
+
+	/* Update buffer pointers for multi-page read/write */
+	info->data_buff_pos += do_bytes;
+	info->oob_buff_pos += info->oob_size;
+	info->data_size -= do_bytes;
 }
 
 #ifdef ARCH_HAS_DMA
@@ -617,6 +633,8 @@ static void prepare_start_command(struct pxa3xx_nand_info *info, int command)
 	info->buf_start		= 0;
 	info->buf_count		= 0;
 	info->oob_size		= 0;
+	info->data_buff_pos	= 0;
+	info->oob_buff_pos	= 0;
 	info->use_ecc		= 0;
 	info->use_spare		= 1;
 	info->use_dma		= (use_dma) ? 1 : 0;
@@ -628,7 +646,7 @@ static void prepare_start_command(struct pxa3xx_nand_info *info, int command)
 	case NAND_CMD_PAGEPROG:
 		info->use_ecc = 1;
 	case NAND_CMD_READOOB:
-		pxa3xx_set_datasize(info);
+		pxa3xx_set_datasize(info, mtd);
 		break;
 	case NAND_CMD_PARAM:
 		info->use_spare = 0;
-- 
1.8.1.5
