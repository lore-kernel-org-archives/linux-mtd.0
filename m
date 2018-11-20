Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP1vz-0005oz-IB
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 09:03:15 +0000
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
Subject: [PATCH 06/10] mtd: rawnand: fsmc: Fix all coding style issues
 reported by checkpatch
Date: Tue, 20 Nov 2018 10:02:35 +0100
Message-Id: <20181120090239.5792-7-boris.brezillon@bootlin.com>
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

checkpatch reports a bunch of coding style issues. Let's fix them
all in one step.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 199 +++++++++++++++----------------
 1 file changed, 99 insertions(+), 100 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 3a4b80a121ad..325b4414dccc 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -38,15 +38,14 @@
 /* fsmc controller registers for NOR flash */
 #define CTRL			0x0
 	/* ctrl register definitions */
-	#define BANK_ENABLE		(1 << 0)
-	#define MUXED			(1 << 1)
+	#define BANK_ENABLE		BIT(0)
+	#define MUXED			BIT(1)
 	#define NOR_DEV			(2 << 2)
-	#define WIDTH_8			(0 << 4)
-	#define WIDTH_16		(1 << 4)
-	#define RSTPWRDWN		(1 << 6)
-	#define WPROT			(1 << 7)
-	#define WRT_ENABLE		(1 << 12)
-	#define WAIT_ENB		(1 << 13)
+	#define WIDTH_16		BIT(4)
+	#define RSTPWRDWN		BIT(6)
+	#define WPROT			BIT(7)
+	#define WRT_ENABLE		BIT(12)
+	#define WAIT_ENB		BIT(13)
 
 #define CTRL_TIM		0x4
 	/* ctrl_tim register definitions */
@@ -54,43 +53,35 @@
 #define FSMC_NOR_BANK_SZ	0x8
 #define FSMC_NOR_REG_SIZE	0x40
 
-#define FSMC_NOR_REG(base, bank, reg)		(base + \
-						FSMC_NOR_BANK_SZ * (bank) + \
-						reg)
+#define FSMC_NOR_REG(base, bank, reg)	((base) +			\
+					 (FSMC_NOR_BANK_SZ * (bank)) +	\
+					 (reg))
 
 /* fsmc controller registers for NAND flash */
 #define FSMC_PC			0x00
 	/* pc register definitions */
-	#define FSMC_RESET		(1 << 0)
-	#define FSMC_WAITON		(1 << 1)
-	#define FSMC_ENABLE		(1 << 2)
-	#define FSMC_DEVTYPE_NAND	(1 << 3)
-	#define FSMC_DEVWID_8		(0 << 4)
-	#define FSMC_DEVWID_16		(1 << 4)
-	#define FSMC_ECCEN		(1 << 6)
-	#define FSMC_ECCPLEN_512	(0 << 7)
-	#define FSMC_ECCPLEN_256	(1 << 7)
-	#define FSMC_TCLR_1		(1)
+	#define FSMC_RESET		BIT(0)
+	#define FSMC_WAITON		BIT(1)
+	#define FSMC_ENABLE		BIT(2)
+	#define FSMC_DEVTYPE_NAND	BIT(3)
+	#define FSMC_DEVWID_16		BIT(4)
+	#define FSMC_ECCEN		BIT(6)
+	#define FSMC_ECCPLEN_256	BIT(7)
 	#define FSMC_TCLR_SHIFT		(9)
 	#define FSMC_TCLR_MASK		(0xF)
-	#define FSMC_TAR_1		(1)
 	#define FSMC_TAR_SHIFT		(13)
 	#define FSMC_TAR_MASK		(0xF)
 #define STS			0x04
 	/* sts register definitions */
-	#define FSMC_CODE_RDY		(1 << 15)
+	#define FSMC_CODE_RDY		BIT(15)
 #define COMM			0x08
 	/* comm register definitions */
-	#define FSMC_TSET_0		0
 	#define FSMC_TSET_SHIFT		0
 	#define FSMC_TSET_MASK		0xFF
-	#define FSMC_TWAIT_6		6
 	#define FSMC_TWAIT_SHIFT	8
 	#define FSMC_TWAIT_MASK		0xFF
-	#define FSMC_THOLD_4		4
 	#define FSMC_THOLD_SHIFT	16
 	#define FSMC_THOLD_MASK		0xFF
-	#define FSMC_THIZ_1		1
 	#define FSMC_THIZ_SHIFT		24
 	#define FSMC_THIZ_MASK		0xFF
 #define ATTRIB			0x0C
@@ -103,12 +94,12 @@
 #define FSMC_BUSY_WAIT_TIMEOUT	(1 * HZ)
 
 struct fsmc_nand_timings {
-	uint8_t tclr;
-	uint8_t tar;
-	uint8_t thiz;
-	uint8_t thold;
-	uint8_t twait;
-	uint8_t tset;
+	u8 tclr;
+	u8 tar;
+	u8 thiz;
+	u8 thold;
+	u8 twait;
+	u8 tset;
 };
 
 enum access_mode {
@@ -262,8 +253,8 @@ static inline struct fsmc_nand_data *nand_to_fsmc(struct nand_chip *chip)
 static void fsmc_nand_setup(struct fsmc_nand_data *host,
 			    struct fsmc_nand_timings *tims)
 {
-	uint32_t value = FSMC_DEVTYPE_NAND | FSMC_ENABLE | FSMC_WAITON;
-	uint32_t tclr, tar, thiz, thold, twait, tset;
+	u32 value = FSMC_DEVTYPE_NAND | FSMC_ENABLE | FSMC_WAITON;
+	u32 tclr, tar, thiz, thold, twait, tset;
 
 	tclr = (tims->tclr & FSMC_TCLR_MASK) << FSMC_TCLR_SHIFT;
 	tar = (tims->tar & FSMC_TAR_MASK) << FSMC_TAR_SHIFT;
@@ -273,13 +264,9 @@ static void fsmc_nand_setup(struct fsmc_nand_data *host,
 	tset = (tims->tset & FSMC_TSET_MASK) << FSMC_TSET_SHIFT;
 
 	if (host->nand.options & NAND_BUSWIDTH_16)
-		writel_relaxed(value | FSMC_DEVWID_16,
-			       host->regs_va + FSMC_PC);
-	else
-		writel_relaxed(value | FSMC_DEVWID_8, host->regs_va + FSMC_PC);
+		value |= FSMC_DEVWID_16;
 
-	writel_relaxed(readl(host->regs_va + FSMC_PC) | tclr | tar,
-		       host->regs_va + FSMC_PC);
+	writel_relaxed(value | tclr | tar, host->regs_va + FSMC_PC);
 	writel_relaxed(thiz | thold | twait | tset, host->regs_va + COMM);
 	writel_relaxed(thiz | thold | twait | tset, host->regs_va + ATTRIB);
 }
@@ -290,7 +277,7 @@ static int fsmc_calc_timings(struct fsmc_nand_data *host,
 {
 	unsigned long hclk = clk_get_rate(host->clk);
 	unsigned long hclkn = NSEC_PER_SEC / hclk;
-	uint32_t thiz, thold, twait, tset;
+	u32 thiz, thold, twait, tset;
 
 	if (sdrt->tRC_min < 30000)
 		return -EOPNOTSUPP;
@@ -384,18 +371,18 @@ static void fsmc_enable_hwecc(struct nand_chip *chip, int mode)
  * FSMC. ECC is 13 bytes for 512 bytes of data (supports error correction up to
  * max of 8-bits)
  */
-static int fsmc_read_hwecc_ecc4(struct nand_chip *chip, const uint8_t *data,
-				uint8_t *ecc)
+static int fsmc_read_hwecc_ecc4(struct nand_chip *chip, const u8 *data,
+				u8 *ecc)
 {
 	struct fsmc_nand_data *host = nand_to_fsmc(chip);
-	uint32_t ecc_tmp;
+	u32 ecc_tmp;
 	unsigned long deadline = jiffies + FSMC_BUSY_WAIT_TIMEOUT;
 
 	do {
 		if (readl_relaxed(host->regs_va + STS) & FSMC_CODE_RDY)
 			break;
-		else
-			cond_resched();
+
+		cond_resched();
 	} while (!time_after_eq(jiffies, deadline));
 
 	if (time_after_eq(jiffies, deadline)) {
@@ -404,25 +391,25 @@ static int fsmc_read_hwecc_ecc4(struct nand_chip *chip, const uint8_t *data,
 	}
 
 	ecc_tmp = readl_relaxed(host->regs_va + ECC1);
-	ecc[0] = (uint8_t) (ecc_tmp >> 0);
-	ecc[1] = (uint8_t) (ecc_tmp >> 8);
-	ecc[2] = (uint8_t) (ecc_tmp >> 16);
-	ecc[3] = (uint8_t) (ecc_tmp >> 24);
+	ecc[0] = ecc_tmp;
+	ecc[1] = ecc_tmp >> 8;
+	ecc[2] = ecc_tmp >> 16;
+	ecc[3] = ecc_tmp >> 24;
 
 	ecc_tmp = readl_relaxed(host->regs_va + ECC2);
-	ecc[4] = (uint8_t) (ecc_tmp >> 0);
-	ecc[5] = (uint8_t) (ecc_tmp >> 8);
-	ecc[6] = (uint8_t) (ecc_tmp >> 16);
-	ecc[7] = (uint8_t) (ecc_tmp >> 24);
+	ecc[4] = ecc_tmp;
+	ecc[5] = ecc_tmp >> 8;
+	ecc[6] = ecc_tmp >> 16;
+	ecc[7] = ecc_tmp >> 24;
 
 	ecc_tmp = readl_relaxed(host->regs_va + ECC3);
-	ecc[8] = (uint8_t) (ecc_tmp >> 0);
-	ecc[9] = (uint8_t) (ecc_tmp >> 8);
-	ecc[10] = (uint8_t) (ecc_tmp >> 16);
-	ecc[11] = (uint8_t) (ecc_tmp >> 24);
+	ecc[8] = ecc_tmp;
+	ecc[9] = ecc_tmp >> 8;
+	ecc[10] = ecc_tmp >> 16;
+	ecc[11] = ecc_tmp >> 24;
 
 	ecc_tmp = readl_relaxed(host->regs_va + STS);
-	ecc[12] = (uint8_t) (ecc_tmp >> 16);
+	ecc[12] = ecc_tmp >> 16;
 
 	return 0;
 }
@@ -432,22 +419,22 @@ static int fsmc_read_hwecc_ecc4(struct nand_chip *chip, const uint8_t *data,
  * FSMC. ECC is 3 bytes for 512 bytes of data (supports error correction up to
  * max of 1-bit)
  */
-static int fsmc_read_hwecc_ecc1(struct nand_chip *chip, const uint8_t *data,
-				uint8_t *ecc)
+static int fsmc_read_hwecc_ecc1(struct nand_chip *chip, const u8 *data,
+				u8 *ecc)
 {
 	struct fsmc_nand_data *host = nand_to_fsmc(chip);
-	uint32_t ecc_tmp;
+	u32 ecc_tmp;
 
 	ecc_tmp = readl_relaxed(host->regs_va + ECC1);
-	ecc[0] = (uint8_t) (ecc_tmp >> 0);
-	ecc[1] = (uint8_t) (ecc_tmp >> 8);
-	ecc[2] = (uint8_t) (ecc_tmp >> 16);
+	ecc[0] = ecc_tmp;
+	ecc[1] = ecc_tmp >> 8;
+	ecc[2] = ecc_tmp >> 16;
 
 	return 0;
 }
 
 /* Count the number of 0's in buff upto a max of max_bits */
-static int count_written_bits(uint8_t *buff, int size, int max_bits)
+static int count_written_bits(u8 *buff, int size, int max_bits)
 {
 	int k, written_bits = 0;
 
@@ -468,7 +455,7 @@ static void dma_complete(void *param)
 }
 
 static int dma_xfer(struct fsmc_nand_data *host, void *buffer, int len,
-		enum dma_data_direction direction)
+		    enum dma_data_direction direction)
 {
 	struct dma_chan *chan;
 	struct dma_device *dma_dev;
@@ -519,7 +506,7 @@ static int dma_xfer(struct fsmc_nand_data *host, void *buffer, int len,
 
 	time_left =
 	wait_for_completion_timeout(&host->dma_access_complete,
-				msecs_to_jiffies(3000));
+				    msecs_to_jiffies(3000));
 	if (time_left == 0) {
 		dmaengine_terminate_all(chan);
 		dev_err(host->dev, "wait_for_completion_timeout\n");
@@ -541,14 +528,15 @@ static int dma_xfer(struct fsmc_nand_data *host, void *buffer, int len,
  * @buf:	data buffer
  * @len:	number of bytes to write
  */
-static void fsmc_write_buf(struct fsmc_nand_data *host, const uint8_t *buf,
+static void fsmc_write_buf(struct fsmc_nand_data *host, const u8 *buf,
 			   int len)
 {
 	int i;
 
-	if (IS_ALIGNED((uintptr_t)buf, sizeof(uint32_t)) &&
-			IS_ALIGNED(len, sizeof(uint32_t))) {
-		uint32_t *p = (uint32_t *)buf;
+	if (IS_ALIGNED((uintptr_t)buf, sizeof(u32)) &&
+	    IS_ALIGNED(len, sizeof(u32))) {
+		u32 *p = (u32 *)buf;
+
 		len = len >> 2;
 		for (i = 0; i < len; i++)
 			writel_relaxed(p[i], host->data_va);
@@ -564,13 +552,14 @@ static void fsmc_write_buf(struct fsmc_nand_data *host, const uint8_t *buf,
  * @buf:	buffer to store date
  * @len:	number of bytes to read
  */
-static void fsmc_read_buf(struct fsmc_nand_data *host, uint8_t *buf, int len)
+static void fsmc_read_buf(struct fsmc_nand_data *host, u8 *buf, int len)
 {
 	int i;
 
-	if (IS_ALIGNED((uintptr_t)buf, sizeof(uint32_t)) &&
-			IS_ALIGNED(len, sizeof(uint32_t))) {
-		uint32_t *p = (uint32_t *)buf;
+	if (IS_ALIGNED((uintptr_t)buf, sizeof(u32)) &&
+	    IS_ALIGNED(len, sizeof(u32))) {
+		u32 *p = (u32 *)buf;
+
 		len = len >> 2;
 		for (i = 0; i < len; i++)
 			p[i] = readl_relaxed(host->data_va);
@@ -586,7 +575,7 @@ static void fsmc_read_buf(struct fsmc_nand_data *host, uint8_t *buf, int len)
  * @buf:	buffer to store date
  * @len:	number of bytes to read
  */
-static void fsmc_read_buf_dma(struct fsmc_nand_data *host, uint8_t *buf,
+static void fsmc_read_buf_dma(struct fsmc_nand_data *host, u8 *buf,
 			      int len)
 {
 	dma_xfer(host, buf, len, DMA_FROM_DEVICE);
@@ -598,7 +587,7 @@ static void fsmc_read_buf_dma(struct fsmc_nand_data *host, uint8_t *buf,
  * @buf:	data buffer
  * @len:	number of bytes to write
  */
-static void fsmc_write_buf_dma(struct fsmc_nand_data *host, const uint8_t *buf,
+static void fsmc_write_buf_dma(struct fsmc_nand_data *host, const u8 *buf,
 			       int len)
 {
 	dma_xfer(host, (void *)buf, len, DMA_TO_DEVICE);
@@ -679,7 +668,8 @@ static int fsmc_exec_op(struct nand_chip *chip, const struct nand_operation *op,
 				 ", force 8-bit" : "");
 
 			if (host->mode == USE_DMA_ACCESS)
-				fsmc_write_buf_dma(host, instr->ctx.data.buf.out,
+				fsmc_write_buf_dma(host,
+						   instr->ctx.data.buf.out,
 						   instr->ctx.data.len);
 			else
 				fsmc_write_buf(host, instr->ctx.data.buf.out,
@@ -714,24 +704,24 @@ static int fsmc_exec_op(struct nand_chip *chip, const struct nand_operation *op,
  * After this read, fsmc hardware generates and reports error data bits(up to a
  * max of 8 bits)
  */
-static int fsmc_read_page_hwecc(struct nand_chip *chip, uint8_t *buf,
+static int fsmc_read_page_hwecc(struct nand_chip *chip, u8 *buf,
 				int oob_required, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	int i, j, s, stat, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
 	int eccsteps = chip->ecc.steps;
-	uint8_t *p = buf;
-	uint8_t *ecc_calc = chip->ecc.calc_buf;
-	uint8_t *ecc_code = chip->ecc.code_buf;
+	u8 *p = buf;
+	u8 *ecc_calc = chip->ecc.calc_buf;
+	u8 *ecc_code = chip->ecc.code_buf;
 	int off, len, ret, group = 0;
 	/*
-	 * ecc_oob is intentionally taken as uint16_t. In 16bit devices, we
+	 * ecc_oob is intentionally taken as u16. In 16bit devices, we
 	 * end up reading 14 bytes (7 words) from oob. The local array is
 	 * to maintain word alignment
 	 */
-	uint16_t ecc_oob[7];
-	uint8_t *oob = (uint8_t *)&ecc_oob[0];
+	u16 ecc_oob[7];
+	u8 *oob = (u8 *)&ecc_oob[0];
 	unsigned int max_bitflips = 0;
 
 	for (i = 0, s = 0; s < eccsteps; s++, i += eccbytes, p += eccsize) {
@@ -786,15 +776,15 @@ static int fsmc_read_page_hwecc(struct nand_chip *chip, uint8_t *buf,
  * @calc_ecc:	ecc calculated from read data
  *
  * calc_ecc is a 104 bit information containing maximum of 8 error
- * offset informations of 13 bits each in 512 bytes of read data.
+ * offset information of 13 bits each in 512 bytes of read data.
  */
-static int fsmc_bch8_correct_data(struct nand_chip *chip, uint8_t *dat,
-				  uint8_t *read_ecc, uint8_t *calc_ecc)
+static int fsmc_bch8_correct_data(struct nand_chip *chip, u8 *dat,
+				  u8 *read_ecc, u8 *calc_ecc)
 {
 	struct fsmc_nand_data *host = nand_to_fsmc(chip);
-	uint32_t err_idx[8];
-	uint32_t num_err, i;
-	uint32_t ecc1, ecc2, ecc3, ecc4;
+	u32 err_idx[8];
+	u32 num_err, i;
+	u32 ecc1, ecc2, ecc3, ecc4;
 
 	num_err = (readl_relaxed(host->regs_va + STS) >> 10) & 0xF;
 
@@ -835,8 +825,8 @@ static int fsmc_bch8_correct_data(struct nand_chip *chip, uint8_t *dat,
 	 * |---idx[7]--|--.....-----|---idx[2]--||---idx[1]--||---idx[0]--|
 	 *
 	 * calc_ecc is a 104 bit information containing maximum of 8 error
-	 * offset informations of 13 bits each. calc_ecc is copied into a
-	 * uint64_t array and error offset indexes are populated in err_idx
+	 * offset information of 13 bits each. calc_ecc is copied into a
+	 * u64 array and error offset indexes are populated in err_idx
 	 * array
 	 */
 	ecc1 = readl_relaxed(host->regs_va + ECC1);
@@ -895,11 +885,13 @@ static int fsmc_nand_probe_config_dt(struct platform_device *pdev,
 		nand->options |= NAND_SKIP_BBTSCAN;
 
 	host->dev_timings = devm_kzalloc(&pdev->dev,
-				sizeof(*host->dev_timings), GFP_KERNEL);
+					 sizeof(*host->dev_timings),
+					 GFP_KERNEL);
 	if (!host->dev_timings)
 		return -ENOMEM;
+
 	ret = of_property_read_u8_array(np, "timings", (u8 *)host->dev_timings,
-						sizeof(*host->dev_timings));
+					sizeof(*host->dev_timings));
 	if (ret)
 		host->dev_timings = NULL;
 
@@ -1061,10 +1053,13 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	 * AMBA PrimeCell bus. However it is not a PrimeCell.
 	 */
 	for (pid = 0, i = 0; i < 4; i++)
-		pid |= (readl(base + resource_size(res) - 0x20 + 4 * i) & 255) << (i * 8);
+		pid |= (readl(base + resource_size(res) - 0x20 + 4 * i) &
+			255) << (i * 8);
+
 	host->pid = pid;
-	dev_info(&pdev->dev, "FSMC device partno %03x, manufacturer %02x, "
-		 "revision %02x, config %02x\n",
+
+	dev_info(&pdev->dev,
+		 "FSMC device partno %03x, manufacturer %02x, revision %02x, config %02x\n",
 		 AMBA_PART_BITS(pid), AMBA_MANF_BITS(pid),
 		 AMBA_REV_BITS(pid), AMBA_CONFIG_BITS(pid));
 
@@ -1175,19 +1170,23 @@ static int fsmc_nand_remove(struct platform_device *pdev)
 static int fsmc_nand_suspend(struct device *dev)
 {
 	struct fsmc_nand_data *host = dev_get_drvdata(dev);
+
 	if (host)
 		clk_disable_unprepare(host->clk);
+
 	return 0;
 }
 
 static int fsmc_nand_resume(struct device *dev)
 {
 	struct fsmc_nand_data *host = dev_get_drvdata(dev);
+
 	if (host) {
 		clk_prepare_enable(host->clk);
 		if (host->dev_timings)
 			fsmc_nand_setup(host, host->dev_timings);
 	}
+
 	return 0;
 }
 #endif
-- 
2.17.1
