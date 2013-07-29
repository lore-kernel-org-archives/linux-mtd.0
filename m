Received: from [94.23.35.102] (helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V3woZ-0003CG-Vv
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2013 23:25:22 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 08/13] mtd: nand: pxa3xx: Move cached registers to info
 structure
Date: Mon, 29 Jul 2013 20:24:18 -0300
Message-Id: <1375140263-2028-9-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, leiwen@marvell.com,
 haojian.zhuang@gmail.com, zonque@gmail.com, eric.miao@marvell.com,
 grinberg@compulab.co.il, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 computersforpeace@gmail.com, David Woodhouse <dwmw2@infradead.org>,
 Willy Tarreau <w@1wt.eu>, nikita@compulab.co.il
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This registers are not per-chip (aka host) but controller-wise,
so it's better to store them in the global 'info' structure.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 18320de..3b0b456 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -139,10 +139,6 @@ struct pxa3xx_nand_host {
 	unsigned int		row_addr_cycles;
 	size_t			read_id_bytes;
 
-	/* cached register value */
-	uint32_t		reg_ndcr;
-	uint32_t		ndtr0cs0;
-	uint32_t		ndtr1cs0;
 };
 
 struct pxa3xx_nand_info {
@@ -182,6 +178,11 @@ struct pxa3xx_nand_info {
 	unsigned int		oob_size;
 	int 			retcode;
 
+	/* cached register value */
+	uint32_t		reg_ndcr;
+	uint32_t		ndtr0cs0;
+	uint32_t		ndtr1cs0;
+
 	/* generated NDCBx register values */
 	uint32_t		ndcb0;
 	uint32_t		ndcb1;
@@ -247,8 +248,8 @@ static void pxa3xx_nand_set_timing(struct pxa3xx_nand_host *host,
 		NDTR1_tWHR(ns2cycle(t->tWHR, nand_clk)) |
 		NDTR1_tAR(ns2cycle(t->tAR, nand_clk));
 
-	host->ndtr0cs0 = ndtr0;
-	host->ndtr1cs0 = ndtr1;
+	info->ndtr0cs0 = ndtr0;
+	info->ndtr1cs0 = ndtr1;
 	nand_writel(info, NDTR0CS0, ndtr0);
 	nand_writel(info, NDTR1CS0, ndtr1);
 }
@@ -256,7 +257,7 @@ static void pxa3xx_nand_set_timing(struct pxa3xx_nand_host *host,
 static void pxa3xx_set_datasize(struct pxa3xx_nand_info *info)
 {
 	struct pxa3xx_nand_host *host = info->host[info->cs];
-	int oob_enable = host->reg_ndcr & NDCR_SPARE_EN;
+	int oob_enable = info->reg_ndcr & NDCR_SPARE_EN;
 
 	info->data_size = host->page_size;
 	if (!oob_enable) {
@@ -282,10 +283,9 @@ static void pxa3xx_set_datasize(struct pxa3xx_nand_info *info)
  */
 static void pxa3xx_nand_start(struct pxa3xx_nand_info *info)
 {
-	struct pxa3xx_nand_host *host = info->host[info->cs];
 	uint32_t ndcr;
 
-	ndcr = host->reg_ndcr;
+	ndcr = info->reg_ndcr;
 
 	if (info->use_ecc)
 		ndcr |= NDCR_ECC_EN;
@@ -660,7 +660,7 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 	 * "byte" address into a "word" address appropriate
 	 * for indexing a word-oriented device
 	 */
-	if (host->reg_ndcr & NDCR_DWIDTH_M)
+	if (info->reg_ndcr & NDCR_DWIDTH_M)
 		column /= 2;
 
 	/*
@@ -670,8 +670,8 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 	 */
 	if (info->cs != host->cs) {
 		info->cs = host->cs;
-		nand_writel(info, NDTR0CS0, host->ndtr0cs0);
-		nand_writel(info, NDTR1CS0, host->ndtr1cs0);
+		nand_writel(info, NDTR0CS0, info->ndtr0cs0);
+		nand_writel(info, NDTR1CS0, info->ndtr1cs0);
 	}
 
 	info->state = STATE_PREPARED;
@@ -847,7 +847,7 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
 	ndcr |= NDCR_RD_ID_CNT(host->read_id_bytes);
 	ndcr |= NDCR_SPARE_EN; /* enable spare by default */
 
-	host->reg_ndcr = ndcr;
+	info->reg_ndcr = ndcr;
 
 	pxa3xx_nand_set_timing(host, f->timing);
 	return 0;
@@ -870,11 +870,9 @@ static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
 		host->read_id_bytes = 2;
 	}
 
-	host->reg_ndcr = ndcr & ~NDCR_INT_MASK;
-
-	host->ndtr0cs0 = nand_readl(info, NDTR0CS0);
-	host->ndtr1cs0 = nand_readl(info, NDTR1CS0);
-
+	info->reg_ndcr = ndcr & ~NDCR_INT_MASK;
+	info->ndtr0cs0 = nand_readl(info, NDTR0CS0);
+	info->ndtr1cs0 = nand_readl(info, NDTR1CS0);
 	return 0;
 }
 
@@ -1021,7 +1019,7 @@ KEEP_CONFIG:
 	chip->ecc.size = host->page_size;
 	chip->ecc.strength = 1;
 
-	if (host->reg_ndcr & NDCR_DWIDTH_M)
+	if (info->reg_ndcr & NDCR_DWIDTH_M)
 		chip->options |= NAND_BUSWIDTH_16;
 
 	if (nand_scan_ident(mtd, 1, def))
-- 
1.8.1.5
