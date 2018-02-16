Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1emgv9-0001Xn-LN
 for linux-mtd@lists.infradead.org; Fri, 16 Feb 2018 14:23:32 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 1/2] mtd: nand: fsmc: get rid of IO_ADDR_[R|W]
Date: Fri, 16 Feb 2018 15:22:47 +0100
Message-Id: <20180216142248.32345-2-miquel.raynal@bootlin.com>
In-Reply-To: <20180216142248.32345-1-miquel.raynal@bootlin.com>
References: <20180216142248.32345-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove the use of IO_ADDR_[R|W] in the fsmc_nand driver. Instead, use a
pointer to the control registers to avoid doing several arithmetic
operations (including a multiplication) each time a control register is
read or written.

All references to IO_ADDR_[R|W] are not entirely removed from the driver
as, at this time, these values are needed by the NAND core in the
default ->read/write_byte/word() hooks. These references will be
entirely removed when switching to ->exec_op(), that does not make use
of these hooks anymore.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Note: I know that checkpatch.pl complains about the following line but I
decided not to fix it because it was already like that before this
patch, the line is not as easy to split as it looks and it does not
enhance the readability.

    WARNING: line over 80 characters
    #287: FILE: drivers/mtd/nand/fsmc_nand.c:929:
    +		pid |= (readl(base + resource_size(res) - 0x20 + 4 * i) & 255) << (i * 8);

 drivers/mtd/nand/fsmc_nand.c | 96 ++++++++++++++++++--------------------------
 1 file changed, 40 insertions(+), 56 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index b44e5c6545e0..1454d9bf1e49 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -103,10 +103,6 @@
 #define ECC3			0x1C
 #define FSMC_NAND_BANK_SZ	0x20
 
-#define FSMC_NAND_REG(base, bank, reg)		(base + FSMC_NOR_REG_SIZE + \
-						(FSMC_NAND_BANK_SZ * (bank)) + \
-						reg)
-
 #define FSMC_BUSY_WAIT_TIMEOUT	(1 * HZ)
 
 struct fsmc_nand_timings {
@@ -143,7 +139,7 @@ enum access_mode {
  * @data_va:		NAND port for Data.
  * @cmd_va:		NAND port for Command.
  * @addr_va:		NAND port for Address.
- * @regs_va:		FSMC regs base address.
+ * @regs_va:		Registers base address for a given bank.
  */
 struct fsmc_nand_data {
 	u32			pid;
@@ -265,8 +261,6 @@ static void fsmc_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
 	struct nand_chip *this = mtd_to_nand(mtd);
 	struct fsmc_nand_data *host = mtd_to_fsmc(mtd);
-	void __iomem *regs = host->regs_va;
-	unsigned int bank = host->bank;
 
 	if (ctrl & NAND_CTRL_CHANGE) {
 		u32 pc;
@@ -282,12 +276,12 @@ static void fsmc_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 			this->IO_ADDR_W = host->data_va;
 		}
 
-		pc = readl(FSMC_NAND_REG(regs, bank, PC));
+		pc = readl(host->regs_va + PC);
 		if (ctrl & NAND_NCE)
 			pc |= FSMC_ENABLE;
 		else
 			pc &= ~FSMC_ENABLE;
-		writel_relaxed(pc, FSMC_NAND_REG(regs, bank, PC));
+		writel_relaxed(pc, host->regs_va + PC);
 	}
 
 	mb();
@@ -307,8 +301,6 @@ static void fsmc_nand_setup(struct fsmc_nand_data *host,
 {
 	uint32_t value = FSMC_DEVTYPE_NAND | FSMC_ENABLE | FSMC_WAITON;
 	uint32_t tclr, tar, thiz, thold, twait, tset;
-	unsigned int bank = host->bank;
-	void __iomem *regs = host->regs_va;
 
 	tclr = (tims->tclr & FSMC_TCLR_MASK) << FSMC_TCLR_SHIFT;
 	tar = (tims->tar & FSMC_TAR_MASK) << FSMC_TAR_SHIFT;
@@ -318,18 +310,14 @@ static void fsmc_nand_setup(struct fsmc_nand_data *host,
 	tset = (tims->tset & FSMC_TSET_MASK) << FSMC_TSET_SHIFT;
 
 	if (host->nand.options & NAND_BUSWIDTH_16)
-		writel_relaxed(value | FSMC_DEVWID_16,
-				FSMC_NAND_REG(regs, bank, PC));
+		writel_relaxed(value | FSMC_DEVWID_16, host->regs_va + PC);
 	else
-		writel_relaxed(value | FSMC_DEVWID_8,
-				FSMC_NAND_REG(regs, bank, PC));
+		writel_relaxed(value | FSMC_DEVWID_8, host->regs_va + PC);
 
-	writel_relaxed(readl(FSMC_NAND_REG(regs, bank, PC)) | tclr | tar,
-			FSMC_NAND_REG(regs, bank, PC));
-	writel_relaxed(thiz | thold | twait | tset,
-			FSMC_NAND_REG(regs, bank, COMM));
-	writel_relaxed(thiz | thold | twait | tset,
-			FSMC_NAND_REG(regs, bank, ATTRIB));
+	writel_relaxed(readl(host->regs_va + PC) | tclr | tar,
+		       host->regs_va + PC);
+	writel_relaxed(thiz | thold | twait | tset, host->regs_va + COMM);
+	writel_relaxed(thiz | thold | twait | tset, host->regs_va + ATTRIB);
 }
 
 static int fsmc_calc_timings(struct fsmc_nand_data *host,
@@ -419,15 +407,13 @@ static int fsmc_setup_data_interface(struct mtd_info *mtd, int csline,
 static void fsmc_enable_hwecc(struct mtd_info *mtd, int mode)
 {
 	struct fsmc_nand_data *host = mtd_to_fsmc(mtd);
-	void __iomem *regs = host->regs_va;
-	uint32_t bank = host->bank;
 
-	writel_relaxed(readl(FSMC_NAND_REG(regs, bank, PC)) & ~FSMC_ECCPLEN_256,
-			FSMC_NAND_REG(regs, bank, PC));
-	writel_relaxed(readl(FSMC_NAND_REG(regs, bank, PC)) & ~FSMC_ECCEN,
-			FSMC_NAND_REG(regs, bank, PC));
-	writel_relaxed(readl(FSMC_NAND_REG(regs, bank, PC)) | FSMC_ECCEN,
-			FSMC_NAND_REG(regs, bank, PC));
+	writel_relaxed(readl(host->regs_va + PC) & ~FSMC_ECCPLEN_256,
+		       host->regs_va + PC);
+	writel_relaxed(readl(host->regs_va + PC) & ~FSMC_ECCEN,
+		       host->regs_va + PC);
+	writel_relaxed(readl(host->regs_va + PC) | FSMC_ECCEN,
+		       host->regs_va + PC);
 }
 
 /*
@@ -439,13 +425,11 @@ static int fsmc_read_hwecc_ecc4(struct mtd_info *mtd, const uint8_t *data,
 				uint8_t *ecc)
 {
 	struct fsmc_nand_data *host = mtd_to_fsmc(mtd);
-	void __iomem *regs = host->regs_va;
-	uint32_t bank = host->bank;
 	uint32_t ecc_tmp;
 	unsigned long deadline = jiffies + FSMC_BUSY_WAIT_TIMEOUT;
 
 	do {
-		if (readl_relaxed(FSMC_NAND_REG(regs, bank, STS)) & FSMC_CODE_RDY)
+		if (readl_relaxed(host->regs_va + STS) & FSMC_CODE_RDY)
 			break;
 		else
 			cond_resched();
@@ -456,25 +440,25 @@ static int fsmc_read_hwecc_ecc4(struct mtd_info *mtd, const uint8_t *data,
 		return -ETIMEDOUT;
 	}
 
-	ecc_tmp = readl_relaxed(FSMC_NAND_REG(regs, bank, ECC1));
+	ecc_tmp = readl_relaxed(host->regs_va + ECC1);
 	ecc[0] = (uint8_t) (ecc_tmp >> 0);
 	ecc[1] = (uint8_t) (ecc_tmp >> 8);
 	ecc[2] = (uint8_t) (ecc_tmp >> 16);
 	ecc[3] = (uint8_t) (ecc_tmp >> 24);
 
-	ecc_tmp = readl_relaxed(FSMC_NAND_REG(regs, bank, ECC2));
+	ecc_tmp = readl_relaxed(host->regs_va + ECC2);
 	ecc[4] = (uint8_t) (ecc_tmp >> 0);
 	ecc[5] = (uint8_t) (ecc_tmp >> 8);
 	ecc[6] = (uint8_t) (ecc_tmp >> 16);
 	ecc[7] = (uint8_t) (ecc_tmp >> 24);
 
-	ecc_tmp = readl_relaxed(FSMC_NAND_REG(regs, bank, ECC3));
+	ecc_tmp = readl_relaxed(host->regs_va + ECC3);
 	ecc[8] = (uint8_t) (ecc_tmp >> 0);
 	ecc[9] = (uint8_t) (ecc_tmp >> 8);
 	ecc[10] = (uint8_t) (ecc_tmp >> 16);
 	ecc[11] = (uint8_t) (ecc_tmp >> 24);
 
-	ecc_tmp = readl_relaxed(FSMC_NAND_REG(regs, bank, STS));
+	ecc_tmp = readl_relaxed(host->regs_va + STS);
 	ecc[12] = (uint8_t) (ecc_tmp >> 16);
 
 	return 0;
@@ -489,11 +473,9 @@ static int fsmc_read_hwecc_ecc1(struct mtd_info *mtd, const uint8_t *data,
 				uint8_t *ecc)
 {
 	struct fsmc_nand_data *host = mtd_to_fsmc(mtd);
-	void __iomem *regs = host->regs_va;
-	uint32_t bank = host->bank;
 	uint32_t ecc_tmp;
 
-	ecc_tmp = readl_relaxed(FSMC_NAND_REG(regs, bank, ECC1));
+	ecc_tmp = readl_relaxed(host->regs_va + ECC1);
 	ecc[0] = (uint8_t) (ecc_tmp >> 0);
 	ecc[1] = (uint8_t) (ecc_tmp >> 8);
 	ecc[2] = (uint8_t) (ecc_tmp >> 16);
@@ -598,18 +580,18 @@ static int dma_xfer(struct fsmc_nand_data *host, void *buffer, int len,
  */
 static void fsmc_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
+	struct fsmc_nand_data *host  = mtd_to_fsmc(mtd);
 	int i;
-	struct nand_chip *chip = mtd_to_nand(mtd);
 
 	if (IS_ALIGNED((uint32_t)buf, sizeof(uint32_t)) &&
 			IS_ALIGNED(len, sizeof(uint32_t))) {
 		uint32_t *p = (uint32_t *)buf;
 		len = len >> 2;
 		for (i = 0; i < len; i++)
-			writel_relaxed(p[i], chip->IO_ADDR_W);
+			writel_relaxed(p[i], host->data_va);
 	} else {
 		for (i = 0; i < len; i++)
-			writeb_relaxed(buf[i], chip->IO_ADDR_W);
+			writeb_relaxed(buf[i], host->data_va);
 	}
 }
 
@@ -621,18 +603,18 @@ static void fsmc_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
  */
 static void fsmc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
+	struct fsmc_nand_data *host  = mtd_to_fsmc(mtd);
 	int i;
-	struct nand_chip *chip = mtd_to_nand(mtd);
 
 	if (IS_ALIGNED((uint32_t)buf, sizeof(uint32_t)) &&
 			IS_ALIGNED(len, sizeof(uint32_t))) {
 		uint32_t *p = (uint32_t *)buf;
 		len = len >> 2;
 		for (i = 0; i < len; i++)
-			p[i] = readl_relaxed(chip->IO_ADDR_R);
+			p[i] = readl_relaxed(host->data_va);
 	} else {
 		for (i = 0; i < len; i++)
-			buf[i] = readb_relaxed(chip->IO_ADDR_R);
+			buf[i] = readb_relaxed(host->data_va);
 	}
 }
 
@@ -754,13 +736,11 @@ static int fsmc_bch8_correct_data(struct mtd_info *mtd, uint8_t *dat,
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct fsmc_nand_data *host = mtd_to_fsmc(mtd);
-	void __iomem *regs = host->regs_va;
-	unsigned int bank = host->bank;
 	uint32_t err_idx[8];
 	uint32_t num_err, i;
 	uint32_t ecc1, ecc2, ecc3, ecc4;
 
-	num_err = (readl_relaxed(FSMC_NAND_REG(regs, bank, STS)) >> 10) & 0xF;
+	num_err = (readl_relaxed(host->regs_va + STS) >> 10) & 0xF;
 
 	/* no bit flipping */
 	if (likely(num_err == 0))
@@ -803,10 +783,10 @@ static int fsmc_bch8_correct_data(struct mtd_info *mtd, uint8_t *dat,
 	 * uint64_t array and error offset indexes are populated in err_idx
 	 * array
 	 */
-	ecc1 = readl_relaxed(FSMC_NAND_REG(regs, bank, ECC1));
-	ecc2 = readl_relaxed(FSMC_NAND_REG(regs, bank, ECC2));
-	ecc3 = readl_relaxed(FSMC_NAND_REG(regs, bank, ECC3));
-	ecc4 = readl_relaxed(FSMC_NAND_REG(regs, bank, STS));
+	ecc1 = readl_relaxed(host->regs_va + ECC1);
+	ecc2 = readl_relaxed(host->regs_va + ECC2);
+	ecc3 = readl_relaxed(host->regs_va + ECC3);
+	ecc4 = readl_relaxed(host->regs_va + STS);
 
 	err_idx[0] = (ecc1 >> 0) & 0x1FFF;
 	err_idx[1] = (ecc1 >> 13) & 0x1FFF;
@@ -889,6 +869,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	struct nand_chip *nand;
 	struct resource *res;
+	void __iomem *base;
 	dma_cap_mask_t mask;
 	int ret = 0;
 	u32 pid;
@@ -923,9 +904,12 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		return PTR_ERR(host->cmd_va);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "fsmc_regs");
-	host->regs_va = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(host->regs_va))
-		return PTR_ERR(host->regs_va);
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	host->regs_va = base + FSMC_NOR_REG_SIZE +
+		(host->bank * FSMC_NAND_BANK_SZ);
 
 	host->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(host->clk)) {
@@ -942,7 +926,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	 * AMBA PrimeCell bus. However it is not a PrimeCell.
 	 */
 	for (pid = 0, i = 0; i < 4; i++)
-		pid |= (readl(host->regs_va + resource_size(res) - 0x20 + 4 * i) & 255) << (i * 8);
+		pid |= (readl(base + resource_size(res) - 0x20 + 4 * i) & 255) << (i * 8);
 	host->pid = pid;
 	dev_info(&pdev->dev, "FSMC device partno %03x, manufacturer %02x, "
 		 "revision %02x, config %02x\n",
-- 
2.14.1
