Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V72um-0006pf-Eo
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 12:32:42 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 09/14] mtd: nand: pxa3xx: Move cached registers to info
 structure
Date: Wed,  7 Aug 2013 09:31:14 -0300
Message-Id: <1375878679-18098-10-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1375878679-18098-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1375878679-18098-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Artem Bityutskiy <dedekind1@gmail.com>,
 Daniel Mack <zonque@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
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
index 9f6e21a..1498fd6 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -144,10 +144,6 @@ struct pxa3xx_nand_host {
 	unsigned int		row_addr_cycles;
 	size_t			read_id_bytes;
 
-	/* cached register value */
-	uint32_t		reg_ndcr;
-	uint32_t		ndtr0cs0;
-	uint32_t		ndtr1cs0;
 };
 
 struct pxa3xx_nand_info {
@@ -193,6 +189,11 @@ struct pxa3xx_nand_info {
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
@@ -258,8 +259,8 @@ static void pxa3xx_nand_set_timing(struct pxa3xx_nand_host *host,
 		NDTR1_tWHR(ns2cycle(t->tWHR, nand_clk)) |
 		NDTR1_tAR(ns2cycle(t->tAR, nand_clk));
 
-	host->ndtr0cs0 = ndtr0;
-	host->ndtr1cs0 = ndtr1;
+	info->ndtr0cs0 = ndtr0;
+	info->ndtr1cs0 = ndtr1;
 	nand_writel(info, NDTR0CS0, ndtr0);
 	nand_writel(info, NDTR1CS0, ndtr1);
 }
@@ -267,7 +268,7 @@ static void pxa3xx_nand_set_timing(struct pxa3xx_nand_host *host,
 static void pxa3xx_set_datasize(struct pxa3xx_nand_info *info)
 {
 	struct pxa3xx_nand_host *host = info->host[info->cs];
-	int oob_enable = host->reg_ndcr & NDCR_SPARE_EN;
+	int oob_enable = info->reg_ndcr & NDCR_SPARE_EN;
 
 	info->data_size = host->page_size;
 	if (!oob_enable) {
@@ -293,10 +294,9 @@ static void pxa3xx_set_datasize(struct pxa3xx_nand_info *info)
  */
 static void pxa3xx_nand_start(struct pxa3xx_nand_info *info)
 {
-	struct pxa3xx_nand_host *host = info->host[info->cs];
 	uint32_t ndcr;
 
-	ndcr = host->reg_ndcr;
+	ndcr = info->reg_ndcr;
 
 	if (info->use_ecc)
 		ndcr |= NDCR_ECC_EN;
@@ -674,7 +674,7 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 	 * "byte" address into a "word" address appropriate
 	 * for indexing a word-oriented device
 	 */
-	if (host->reg_ndcr & NDCR_DWIDTH_M)
+	if (info->reg_ndcr & NDCR_DWIDTH_M)
 		column /= 2;
 
 	/*
@@ -684,8 +684,8 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 	 */
 	if (info->cs != host->cs) {
 		info->cs = host->cs;
-		nand_writel(info, NDTR0CS0, host->ndtr0cs0);
-		nand_writel(info, NDTR1CS0, host->ndtr1cs0);
+		nand_writel(info, NDTR0CS0, info->ndtr0cs0);
+		nand_writel(info, NDTR1CS0, info->ndtr1cs0);
 	}
 
 	info->state = STATE_PREPARED;
@@ -861,7 +861,7 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
 	ndcr |= NDCR_RD_ID_CNT(host->read_id_bytes);
 	ndcr |= NDCR_SPARE_EN; /* enable spare by default */
 
-	host->reg_ndcr = ndcr;
+	info->reg_ndcr = ndcr;
 
 	pxa3xx_nand_set_timing(host, f->timing);
 	return 0;
@@ -884,11 +884,9 @@ static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
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
 
@@ -1035,7 +1033,7 @@ KEEP_CONFIG:
 	chip->ecc.size = host->page_size;
 	chip->ecc.strength = 1;
 
-	if (host->reg_ndcr & NDCR_DWIDTH_M)
+	if (info->reg_ndcr & NDCR_DWIDTH_M)
 		chip->options |= NAND_BUSWIDTH_16;
 
 	if (nand_scan_ident(mtd, 1, def))
-- 
1.8.1.5
