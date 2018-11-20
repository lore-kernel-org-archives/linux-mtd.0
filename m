Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP1vn-0005mA-J8
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 09:03:04 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>, Stefan Agner <stefan@agner.ch>
Subject: [PATCH 01/10] mtd: rawnand: fsmc: Stop passing mtd_info objects to
 internal functions
Date: Tue, 20 Nov 2018 10:02:30 +0100
Message-Id: <20181120090239.5792-2-boris.brezillon@bootlin.com>
In-Reply-To: <20181120090239.5792-1-boris.brezillon@bootlin.com>
References: <20181120090239.5792-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mimic what has been done in the core and stop passing mtd_info
objects to internal functions.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 51 ++++++++++++++------------------
 1 file changed, 23 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 61927c4c2650..54c854451493 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -248,9 +248,9 @@ static const struct mtd_ooblayout_ops fsmc_ecc4_ooblayout_ops = {
 	.free = fsmc_ecc4_ooblayout_free,
 };
 
-static inline struct fsmc_nand_data *mtd_to_fsmc(struct mtd_info *mtd)
+static inline struct fsmc_nand_data *nand_to_fsmc(struct nand_chip *chip)
 {
-	return container_of(mtd_to_nand(mtd), struct fsmc_nand_data, nand);
+	return container_of(chip, struct fsmc_nand_data, nand);
 }
 
 /*
@@ -369,7 +369,7 @@ static int fsmc_setup_data_interface(struct nand_chip *nand, int csline,
  */
 static void fsmc_enable_hwecc(struct nand_chip *chip, int mode)
 {
-	struct fsmc_nand_data *host = mtd_to_fsmc(nand_to_mtd(chip));
+	struct fsmc_nand_data *host = nand_to_fsmc(chip);
 
 	writel_relaxed(readl(host->regs_va + FSMC_PC) & ~FSMC_ECCPLEN_256,
 		       host->regs_va + FSMC_PC);
@@ -387,7 +387,7 @@ static void fsmc_enable_hwecc(struct nand_chip *chip, int mode)
 static int fsmc_read_hwecc_ecc4(struct nand_chip *chip, const uint8_t *data,
 				uint8_t *ecc)
 {
-	struct fsmc_nand_data *host = mtd_to_fsmc(nand_to_mtd(chip));
+	struct fsmc_nand_data *host = nand_to_fsmc(chip);
 	uint32_t ecc_tmp;
 	unsigned long deadline = jiffies + FSMC_BUSY_WAIT_TIMEOUT;
 
@@ -435,7 +435,7 @@ static int fsmc_read_hwecc_ecc4(struct nand_chip *chip, const uint8_t *data,
 static int fsmc_read_hwecc_ecc1(struct nand_chip *chip, const uint8_t *data,
 				uint8_t *ecc)
 {
-	struct fsmc_nand_data *host = mtd_to_fsmc(nand_to_mtd(chip));
+	struct fsmc_nand_data *host = nand_to_fsmc(chip);
 	uint32_t ecc_tmp;
 
 	ecc_tmp = readl_relaxed(host->regs_va + ECC1);
@@ -537,13 +537,13 @@ static int dma_xfer(struct fsmc_nand_data *host, void *buffer, int len,
 
 /*
  * fsmc_write_buf - write buffer to chip
- * @mtd:	MTD device structure
+ * @host:	FSMC NAND controller
  * @buf:	data buffer
  * @len:	number of bytes to write
  */
-static void fsmc_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
+static void fsmc_write_buf(struct fsmc_nand_data *host, const uint8_t *buf,
+			   int len)
 {
-	struct fsmc_nand_data *host  = mtd_to_fsmc(mtd);
 	int i;
 
 	if (IS_ALIGNED((uintptr_t)buf, sizeof(uint32_t)) &&
@@ -560,13 +560,12 @@ static void fsmc_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 
 /*
  * fsmc_read_buf - read chip data into buffer
- * @mtd:	MTD device structure
+ * @host:	FSMC NAND controller
  * @buf:	buffer to store date
  * @len:	number of bytes to read
  */
-static void fsmc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
+static void fsmc_read_buf(struct fsmc_nand_data *host, uint8_t *buf, int len)
 {
-	struct fsmc_nand_data *host  = mtd_to_fsmc(mtd);
 	int i;
 
 	if (IS_ALIGNED((uintptr_t)buf, sizeof(uint32_t)) &&
@@ -583,28 +582,25 @@ static void fsmc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 
 /*
  * fsmc_read_buf_dma - read chip data into buffer
- * @mtd:	MTD device structure
+ * @host:	FSMC NAND controller
  * @buf:	buffer to store date
  * @len:	number of bytes to read
  */
-static void fsmc_read_buf_dma(struct mtd_info *mtd, uint8_t *buf, int len)
+static void fsmc_read_buf_dma(struct fsmc_nand_data *host, uint8_t *buf,
+			      int len)
 {
-	struct fsmc_nand_data *host  = mtd_to_fsmc(mtd);
-
 	dma_xfer(host, buf, len, DMA_FROM_DEVICE);
 }
 
 /*
  * fsmc_write_buf_dma - write buffer to chip
- * @mtd:	MTD device structure
+ * @host:	FSMC NAND controller
  * @buf:	data buffer
  * @len:	number of bytes to write
  */
-static void fsmc_write_buf_dma(struct mtd_info *mtd, const uint8_t *buf,
-		int len)
+static void fsmc_write_buf_dma(struct fsmc_nand_data *host, const uint8_t *buf,
+			       int len)
 {
-	struct fsmc_nand_data *host = mtd_to_fsmc(mtd);
-
 	dma_xfer(host, (void *)buf, len, DMA_TO_DEVICE);
 }
 
@@ -634,8 +630,7 @@ static void fsmc_ce_ctrl(struct fsmc_nand_data *host, bool assert)
 static int fsmc_exec_op(struct nand_chip *chip, const struct nand_operation *op,
 			bool check_only)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct fsmc_nand_data *host = mtd_to_fsmc(mtd);
+	struct fsmc_nand_data *host = nand_to_fsmc(chip);
 	const struct nand_op_instr *instr = NULL;
 	int ret = 0;
 	unsigned int op_id;
@@ -671,10 +666,10 @@ static int fsmc_exec_op(struct nand_chip *chip, const struct nand_operation *op,
 				 ", force 8-bit" : "");
 
 			if (host->mode == USE_DMA_ACCESS)
-				fsmc_read_buf_dma(mtd, instr->ctx.data.buf.in,
+				fsmc_read_buf_dma(host, instr->ctx.data.buf.in,
 						  instr->ctx.data.len);
 			else
-				fsmc_read_buf(mtd, instr->ctx.data.buf.in,
+				fsmc_read_buf(host, instr->ctx.data.buf.in,
 					      instr->ctx.data.len);
 			break;
 
@@ -684,10 +679,10 @@ static int fsmc_exec_op(struct nand_chip *chip, const struct nand_operation *op,
 				 ", force 8-bit" : "");
 
 			if (host->mode == USE_DMA_ACCESS)
-				fsmc_write_buf_dma(mtd, instr->ctx.data.buf.out,
+				fsmc_write_buf_dma(host, instr->ctx.data.buf.out,
 						   instr->ctx.data.len);
 			else
-				fsmc_write_buf(mtd, instr->ctx.data.buf.out,
+				fsmc_write_buf(host, instr->ctx.data.buf.out,
 					       instr->ctx.data.len);
 			break;
 
@@ -796,7 +791,7 @@ static int fsmc_read_page_hwecc(struct nand_chip *chip, uint8_t *buf,
 static int fsmc_bch8_correct_data(struct nand_chip *chip, uint8_t *dat,
 				  uint8_t *read_ecc, uint8_t *calc_ecc)
 {
-	struct fsmc_nand_data *host = mtd_to_fsmc(nand_to_mtd(chip));
+	struct fsmc_nand_data *host = nand_to_fsmc(chip);
 	uint32_t err_idx[8];
 	uint32_t num_err, i;
 	uint32_t ecc1, ecc2, ecc3, ecc4;
@@ -923,7 +918,7 @@ static int fsmc_nand_probe_config_dt(struct platform_device *pdev,
 static int fsmc_nand_attach_chip(struct nand_chip *nand)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
-	struct fsmc_nand_data *host = mtd_to_fsmc(mtd);
+	struct fsmc_nand_data *host = nand_to_fsmc(nand);
 
 	if (AMBA_REV_BITS(host->pid) >= 8) {
 		switch (mtd->oobsize) {
-- 
2.17.1
