Received: from eu1sys200aog102.obsmtp.com ([207.126.144.113])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7hXq-0002uf-Ru
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 06:18:50 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>, <dedekind1@gmail.com>
Subject: [PATCH v2 13/13] nand/fsmc: Remove sparse warnings and errors
Date: Wed, 14 Mar 2012 11:47:19 +0530
Message-ID: <5cb06f6c9b2ffdd30f20a7874ed4e84d3c49b0a1.1331705527.git.vipin.kumar@st.com>
In-Reply-To: <cover.1331705527.git.vipin.kumar@st.com>
References: <cover.1331705527.git.vipin.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: sr@denx.de, Vipin Kumar <vipin.kumar@st.com>, linus.walleij@linaro.org,
 spear-devel@list.st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch removes the sparse below warnings and errors for nand/fsmc driver
/root/vipin/spear/kernel/3.3/linux-3.3/drivers/mtd/nand/fsmc_nand.c:363:31:
warning: incorrect type in initializer (different address spaces)
/root/vipin/spear/kernel/3.3/linux-3.3/drivers/mtd/nand/fsmc_nand.c:363:31:
expected struct fsmc_regs *regs
/root/vipin/spear/kernel/3.3/linux-3.3/drivers/mtd/nand/fsmc_nand.c:363:31:
got void [noderef] <asn:2>*regs_va

[...]

Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
---
 drivers/mtd/nand/fsmc_nand.c |   91 +++++++++++++-------------
 include/linux/mtd/fsmc.h     |  143 +++++++++++++++++++----------------------
 2 files changed, 111 insertions(+), 123 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 2e9adfc..32f98c2 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -360,28 +360,29 @@ static void fsmc_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 	struct nand_chip *this = mtd->priv;
 	struct fsmc_nand_data *host = container_of(mtd,
 					struct fsmc_nand_data, mtd);
-	struct fsmc_regs *regs = host->regs_va;
+	void *__iomem *regs = host->regs_va;
 	unsigned int bank = host->bank;
 
 	if (ctrl & NAND_CTRL_CHANGE) {
+		u32 pc;
+
 		if (ctrl & NAND_CLE) {
-			this->IO_ADDR_R = (void __iomem *)host->cmd_va;
-			this->IO_ADDR_W = (void __iomem *)host->cmd_va;
+			this->IO_ADDR_R = host->cmd_va;
+			this->IO_ADDR_W = host->cmd_va;
 		} else if (ctrl & NAND_ALE) {
-			this->IO_ADDR_R = (void __iomem *)host->addr_va;
-			this->IO_ADDR_W = (void __iomem *)host->addr_va;
+			this->IO_ADDR_R = host->addr_va;
+			this->IO_ADDR_W = host->addr_va;
 		} else {
-			this->IO_ADDR_R = (void __iomem *)host->data_va;
-			this->IO_ADDR_W = (void __iomem *)host->data_va;
+			this->IO_ADDR_R = host->data_va;
+			this->IO_ADDR_W = host->data_va;
 		}
 
-		if (ctrl & NAND_NCE) {
-			writel(readl(&regs->bank_regs[bank].pc) | FSMC_ENABLE,
-					&regs->bank_regs[bank].pc);
-		} else {
-			writel(readl(&regs->bank_regs[bank].pc) & ~FSMC_ENABLE,
-				       &regs->bank_regs[bank].pc);
-		}
+		pc = readl(FSMC_NAND_REG(regs, bank, PC));
+		if (ctrl & NAND_NCE)
+			pc |= FSMC_ENABLE;
+		else
+			pc &= ~FSMC_ENABLE;
+		writel(pc, FSMC_NAND_REG(regs, bank, PC));
 	}
 
 	mb();
@@ -396,7 +397,7 @@ static void fsmc_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
  * This routine initializes timing parameters related to NAND memory access in
  * FSMC registers
  */
-static void fsmc_nand_setup(struct fsmc_regs *regs, uint32_t bank,
+static void fsmc_nand_setup(void __iomem *regs, uint32_t bank,
 			   uint32_t busw, struct fsmc_nand_timings *timings)
 {
 	uint32_t value = FSMC_DEVTYPE_NAND | FSMC_ENABLE | FSMC_WAITON;
@@ -424,14 +425,14 @@ static void fsmc_nand_setup(struct fsmc_regs *regs, uint32_t bank,
 	tset = (tims->tset & FSMC_TSET_MASK) << FSMC_TSET_SHIFT;
 
 	if (busw)
-		writel(value | FSMC_DEVWID_16, &regs->bank_regs[bank].pc);
+		writel(value | FSMC_DEVWID_16, FSMC_NAND_REG(regs, bank, PC));
 	else
-		writel(value | FSMC_DEVWID_8, &regs->bank_regs[bank].pc);
+		writel(value | FSMC_DEVWID_8, FSMC_NAND_REG(regs, bank, PC));
 
-	writel(readl(&regs->bank_regs[bank].pc) | tclr | tar,
-	       &regs->bank_regs[bank].pc);
-	writel(thiz | thold | twait | tset, &regs->bank_regs[bank].comm);
-	writel(thiz | thold | twait | tset, &regs->bank_regs[bank].attrib);
+	writel(readl(FSMC_NAND_REG(regs, bank, PC)) | tclr | tar,
+			FSMC_NAND_REG(regs, bank, PC));
+	writel(thiz | thold | twait | tset, FSMC_NAND_REG(regs, bank, COMM));
+	writel(thiz | thold | twait | tset, FSMC_NAND_REG(regs, bank, ATTRIB));
 }
 
 /*
@@ -441,15 +442,15 @@ static void fsmc_enable_hwecc(struct mtd_info *mtd, int mode)
 {
 	struct fsmc_nand_data *host = container_of(mtd,
 					struct fsmc_nand_data, mtd);
-	struct fsmc_regs *regs = host->regs_va;
+	void __iomem *regs = host->regs_va;
 	uint32_t bank = host->bank;
 
-	writel(readl(&regs->bank_regs[bank].pc) & ~FSMC_ECCPLEN_256,
-		       &regs->bank_regs[bank].pc);
-	writel(readl(&regs->bank_regs[bank].pc) & ~FSMC_ECCEN,
-			&regs->bank_regs[bank].pc);
-	writel(readl(&regs->bank_regs[bank].pc) | FSMC_ECCEN,
-			&regs->bank_regs[bank].pc);
+	writel(readl(FSMC_NAND_REG(regs, bank, PC)) & ~FSMC_ECCPLEN_256,
+			FSMC_NAND_REG(regs, bank, PC));
+	writel(readl(FSMC_NAND_REG(regs, bank, PC)) & ~FSMC_ECCEN,
+			FSMC_NAND_REG(regs, bank, PC));
+	writel(readl(FSMC_NAND_REG(regs, bank, PC)) | FSMC_ECCEN,
+			FSMC_NAND_REG(regs, bank, PC));
 }
 
 /*
@@ -462,13 +463,13 @@ static int fsmc_read_hwecc_ecc4(struct mtd_info *mtd, const uint8_t *data,
 {
 	struct fsmc_nand_data *host = container_of(mtd,
 					struct fsmc_nand_data, mtd);
-	struct fsmc_regs *regs = host->regs_va;
+	void __iomem *regs = host->regs_va;
 	uint32_t bank = host->bank;
 	uint32_t ecc_tmp;
 	unsigned long deadline = jiffies + FSMC_BUSY_WAIT_TIMEOUT;
 
 	do {
-		if (readl(&regs->bank_regs[bank].sts) & FSMC_CODE_RDY)
+		if (readl(FSMC_NAND_REG(regs, bank, STS)) & FSMC_CODE_RDY)
 			break;
 		else
 			cond_resched();
@@ -479,25 +480,25 @@ static int fsmc_read_hwecc_ecc4(struct mtd_info *mtd, const uint8_t *data,
 		return -ETIMEDOUT;
 	}
 
-	ecc_tmp = readl(&regs->bank_regs[bank].ecc1);
+	ecc_tmp = readl(FSMC_NAND_REG(regs, bank, ECC1));
 	ecc[0] = (uint8_t) (ecc_tmp >> 0);
 	ecc[1] = (uint8_t) (ecc_tmp >> 8);
 	ecc[2] = (uint8_t) (ecc_tmp >> 16);
 	ecc[3] = (uint8_t) (ecc_tmp >> 24);
 
-	ecc_tmp = readl(&regs->bank_regs[bank].ecc2);
+	ecc_tmp = readl(FSMC_NAND_REG(regs, bank, ECC2));
 	ecc[4] = (uint8_t) (ecc_tmp >> 0);
 	ecc[5] = (uint8_t) (ecc_tmp >> 8);
 	ecc[6] = (uint8_t) (ecc_tmp >> 16);
 	ecc[7] = (uint8_t) (ecc_tmp >> 24);
 
-	ecc_tmp = readl(&regs->bank_regs[bank].ecc3);
+	ecc_tmp = readl(FSMC_NAND_REG(regs, bank, ECC3));
 	ecc[8] = (uint8_t) (ecc_tmp >> 0);
 	ecc[9] = (uint8_t) (ecc_tmp >> 8);
 	ecc[10] = (uint8_t) (ecc_tmp >> 16);
 	ecc[11] = (uint8_t) (ecc_tmp >> 24);
 
-	ecc_tmp = readl(&regs->bank_regs[bank].sts);
+	ecc_tmp = readl(FSMC_NAND_REG(regs, bank, STS));
 	ecc[12] = (uint8_t) (ecc_tmp >> 16);
 
 	return 0;
@@ -513,11 +514,11 @@ static int fsmc_read_hwecc_ecc1(struct mtd_info *mtd, const uint8_t *data,
 {
 	struct fsmc_nand_data *host = container_of(mtd,
 					struct fsmc_nand_data, mtd);
-	struct fsmc_regs *regs = host->regs_va;
+	void __iomem *regs = host->regs_va;
 	uint32_t bank = host->bank;
 	uint32_t ecc_tmp;
 
-	ecc_tmp = readl(&regs->bank_regs[bank].ecc1);
+	ecc_tmp = readl(FSMC_NAND_REG(regs, bank, ECC1));
 	ecc[0] = (uint8_t) (ecc_tmp >> 0);
 	ecc[1] = (uint8_t) (ecc_tmp >> 8);
 	ecc[2] = (uint8_t) (ecc_tmp >> 16);
@@ -771,13 +772,13 @@ static int fsmc_bch8_correct_data(struct mtd_info *mtd, uint8_t *dat,
 	struct fsmc_nand_data *host = container_of(mtd,
 					struct fsmc_nand_data, mtd);
 	struct nand_chip *chip = mtd->priv;
-	struct fsmc_regs *regs = host->regs_va;
+	void __iomem *regs = host->regs_va;
 	unsigned int bank = host->bank;
 	uint32_t err_idx[8];
 	uint32_t num_err, i;
 	uint32_t ecc1, ecc2, ecc3, ecc4;
 
-	num_err = (readl(&regs->bank_regs[bank].sts) >> 10) & 0xF;
+	num_err = (readl(FSMC_NAND_REG(regs, bank, STS)) >> 10) & 0xF;
 
 	/* no bit flipping */
 	if (likely(num_err == 0))
@@ -820,10 +821,10 @@ static int fsmc_bch8_correct_data(struct mtd_info *mtd, uint8_t *dat,
 	 * uint64_t array and error offset indexes are populated in err_idx
 	 * array
 	 */
-	ecc1 = readl(&regs->bank_regs[bank].ecc1);
-	ecc2 = readl(&regs->bank_regs[bank].ecc2);
-	ecc3 = readl(&regs->bank_regs[bank].ecc3);
-	ecc4 = readl(&regs->bank_regs[bank].sts);
+	ecc1 = readl(FSMC_NAND_REG(regs, bank, ECC1));
+	ecc2 = readl(FSMC_NAND_REG(regs, bank, ECC2));
+	ecc3 = readl(FSMC_NAND_REG(regs, bank, ECC3));
+	ecc4 = readl(FSMC_NAND_REG(regs, bank, STS));
 
 	err_idx[0] = (ecc1 >> 0) & 0x1FFF;
 	err_idx[1] = (ecc1 >> 13) & 0x1FFF;
@@ -863,7 +864,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	struct fsmc_nand_data *host;
 	struct mtd_info *mtd;
 	struct nand_chip *nand;
-	struct fsmc_regs *regs;
 	struct resource *res;
 	dma_cap_mask_t mask;
 	int ret = 0;
@@ -976,8 +976,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	if (host->mode == USE_DMA_ACCESS)
 		init_completion(&host->dma_access_complete);
 
-	regs = host->regs_va;
-
 	/* Link all private pointers */
 	mtd = &host->mtd;
 	nand = &host->nand;
@@ -1027,7 +1025,8 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		break;
 	}
 
-	fsmc_nand_setup(regs, host->bank, nand->options & NAND_BUSWIDTH_16,
+	fsmc_nand_setup(host->regs_va, host->bank,
+			nand->options & NAND_BUSWIDTH_16,
 			host->dev_timings);
 
 	if (AMBA_REV_BITS(host->pid) >= 8) {
diff --git a/include/linux/mtd/fsmc.h b/include/linux/mtd/fsmc.h
index 18f9127..823359c 100644
--- a/include/linux/mtd/fsmc.h
+++ b/include/linux/mtd/fsmc.h
@@ -32,88 +32,77 @@
 #define FSMC_FLASH_WIDTH8	1
 #define FSMC_FLASH_WIDTH16	2
 
-struct fsmc_nor_bank_regs {
-	uint32_t ctrl;
-	uint32_t ctrl_tim;
-};
-
-/* ctrl register definitions */
-#define BANK_ENABLE		(1 << 0)
-#define MUXED			(1 << 1)
-#define NOR_DEV			(2 << 2)
-#define WIDTH_8			(0 << 4)
-#define WIDTH_16		(1 << 4)
-#define RSTPWRDWN		(1 << 6)
-#define WPROT			(1 << 7)
-#define WRT_ENABLE		(1 << 12)
-#define WAIT_ENB		(1 << 13)
-
-/* ctrl_tim register definitions */
-
-struct fsmc_nand_bank_regs {
-	uint32_t pc;
-	uint32_t sts;
-	uint32_t comm;
-	uint32_t attrib;
-	uint32_t ioata;
-	uint32_t ecc1;
-	uint32_t ecc2;
-	uint32_t ecc3;
-};
-
+/* fsmc controller registers for NOR flash */
+#define CTRL			0x0
+	/* ctrl register definitions */
+	#define BANK_ENABLE		(1 << 0)
+	#define MUXED			(1 << 1)
+	#define NOR_DEV			(2 << 2)
+	#define WIDTH_8			(0 << 4)
+	#define WIDTH_16		(1 << 4)
+	#define RSTPWRDWN		(1 << 6)
+	#define WPROT			(1 << 7)
+	#define WRT_ENABLE		(1 << 12)
+	#define WAIT_ENB		(1 << 13)
+
+#define CTRL_TIM		0x4
+	/* ctrl_tim register definitions */
+
+#define FSMC_NOR_BANK_SZ	0x8
 #define FSMC_NOR_REG_SIZE	0x40
 
-struct fsmc_regs {
-	struct fsmc_nor_bank_regs nor_bank_regs[FSMC_MAX_NOR_BANKS];
-	uint8_t reserved_1[0x40 - 0x20];
-	struct fsmc_nand_bank_regs bank_regs[FSMC_MAX_NAND_BANKS];
-	uint8_t reserved_2[0xfe0 - 0xc0];
-	uint32_t peripid0;			/* 0xfe0 */
-	uint32_t peripid1;			/* 0xfe4 */
-	uint32_t peripid2;			/* 0xfe8 */
-	uint32_t peripid3;			/* 0xfec */
-	uint32_t pcellid0;			/* 0xff0 */
-	uint32_t pcellid1;			/* 0xff4 */
-	uint32_t pcellid2;			/* 0xff8 */
-	uint32_t pcellid3;			/* 0xffc */
-};
+#define FSMC_NOR_REG(base, bank, reg)		(base + \
+						FSMC_NOR_BANK_SZ * (bank) + \
+						reg)
+
+/* fsmc controller registers for NAND flash */
+#define PC			0x00
+	/* pc register definitions */
+	#define FSMC_RESET		(1 << 0)
+	#define FSMC_WAITON		(1 << 1)
+	#define FSMC_ENABLE		(1 << 2)
+	#define FSMC_DEVTYPE_NAND	(1 << 3)
+	#define FSMC_DEVWID_8		(0 << 4)
+	#define FSMC_DEVWID_16		(1 << 4)
+	#define FSMC_ECCEN		(1 << 6)
+	#define FSMC_ECCPLEN_512	(0 << 7)
+	#define FSMC_ECCPLEN_256	(1 << 7)
+	#define FSMC_TCLR_1		(1)
+	#define FSMC_TCLR_SHIFT		(9)
+	#define FSMC_TCLR_MASK		(0xF)
+	#define FSMC_TAR_1		(1)
+	#define FSMC_TAR_SHIFT		(13)
+	#define FSMC_TAR_MASK		(0xF)
+#define STS			0x04
+	/* sts register definitions */
+	#define FSMC_CODE_RDY		(1 << 15)
+#define COMM			0x08
+	/* comm register definitions */
+	#define FSMC_TSET_0		0
+	#define FSMC_TSET_SHIFT		0
+	#define FSMC_TSET_MASK		0xFF
+	#define FSMC_TWAIT_6		6
+	#define FSMC_TWAIT_SHIFT	8
+	#define FSMC_TWAIT_MASK		0xFF
+	#define FSMC_THOLD_4		4
+	#define FSMC_THOLD_SHIFT	16
+	#define FSMC_THOLD_MASK		0xFF
+	#define FSMC_THIZ_1		1
+	#define FSMC_THIZ_SHIFT		24
+	#define FSMC_THIZ_MASK		0xFF
+#define ATTRIB			0x0C
+#define IOATA			0x10
+#define ECC1			0x14
+#define ECC2			0x18
+#define ECC3			0x1C
+#define FSMC_NAND_BANK_SZ	0x20
+
+#define FSMC_NAND_REG(base, bank, reg)		(base + FSMC_NOR_REG_SIZE + \
+						(FSMC_NAND_BANK_SZ * (bank)) + \
+						reg)
 
 #define FSMC_BUSY_WAIT_TIMEOUT	(1 * HZ)
 
-/* pc register definitions */
-#define FSMC_RESET		(1 << 0)
-#define FSMC_WAITON		(1 << 1)
-#define FSMC_ENABLE		(1 << 2)
-#define FSMC_DEVTYPE_NAND	(1 << 3)
-#define FSMC_DEVWID_8		(0 << 4)
-#define FSMC_DEVWID_16		(1 << 4)
-#define FSMC_ECCEN		(1 << 6)
-#define FSMC_ECCPLEN_512	(0 << 7)
-#define FSMC_ECCPLEN_256	(1 << 7)
-#define FSMC_TCLR_1		(1)
-#define FSMC_TCLR_SHIFT		(9)
-#define FSMC_TCLR_MASK		(0xF)
-#define FSMC_TAR_1		(1)
-#define FSMC_TAR_SHIFT		(13)
-#define FSMC_TAR_MASK		(0xF)
-
-/* sts register definitions */
-#define FSMC_CODE_RDY		(1 << 15)
-
-/* comm register definitions */
-#define FSMC_TSET_0		0
-#define FSMC_TSET_SHIFT		0
-#define FSMC_TSET_MASK		0xFF
-#define FSMC_TWAIT_6		6
-#define FSMC_TWAIT_SHIFT	8
-#define FSMC_TWAIT_MASK		0xFF
-#define FSMC_THOLD_4		4
-#define FSMC_THOLD_SHIFT	16
-#define FSMC_THOLD_MASK		0xFF
-#define FSMC_THIZ_1		1
-#define FSMC_THIZ_SHIFT		24
-#define FSMC_THIZ_MASK		0xFF
-
 /*
  * There are 13 bytes of ecc for every 512 byte block in FSMC version 8
  * and it has to be read consecutively and immediately after the 512
-- 
1.7.0.4
