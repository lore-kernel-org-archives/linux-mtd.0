Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1drLAT-0006Cm-7h
 for linux-mtd@lists.infradead.org; Mon, 11 Sep 2017 09:38:16 +0000
Received: by mail-it0-x242.google.com with SMTP id o200so3845332itg.1
 for <linux-mtd@lists.infradead.org>; Mon, 11 Sep 2017 02:37:57 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Cc: Stefan Roese <sr@denx.de>
Subject: [PATCH v2 09/10] spi-nor: intel-spi: Rename swseq to swseq_reg in
 'struct intel_spi'
Date: Mon, 11 Sep 2017 02:41:59 -0700
Message-Id: <1505122921-5534-10-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1505122921-5534-1-git-send-email-bmeng.cn@gmail.com>
References: <1505122921-5534-1-git-send-email-bmeng.cn@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ispi->swseq is used for register access. Let's rename it to
swseq_reg to better describe its usage.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---

Changes in v2: None

 drivers/mtd/spi-nor/intel-spi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
index 91ceef7..5e7a389 100644
--- a/drivers/mtd/spi-nor/intel-spi.c
+++ b/drivers/mtd/spi-nor/intel-spi.c
@@ -126,7 +126,7 @@
  * @pr_num: Maximum number of protected range registers
  * @writeable: Is the chip writeable
  * @locked: Is SPI setting locked
- * @swseq: Use SW sequencer in register reads/writes
+ * @swseq_reg: Use SW sequencer in register reads/writes
  * @erase_64k: 64k erase supported
  * @opcodes: Opcodes which are supported. This are programmed by BIOS
  *           before it locks down the controller.
@@ -143,7 +143,7 @@ struct intel_spi {
 	size_t pr_num;
 	bool writeable;
 	bool locked;
-	bool swseq;
+	bool swseq_reg;
 	bool erase_64k;
 	u8 opcodes[8];
 	u8 preopcodes[2];
@@ -224,7 +224,7 @@ static void intel_spi_dump_regs(struct intel_spi *ispi)
 	}
 
 	dev_dbg(ispi->dev, "Using %cW sequencer for register access\n",
-		ispi->swseq ? 'S' : 'H');
+		ispi->swseq_reg ? 'S' : 'H');
 }
 
 /* Reads max INTEL_SPI_FIFO_SZ bytes from the device fifo */
@@ -297,7 +297,7 @@ static int intel_spi_init(struct intel_spi *ispi)
 		ispi->pregs = ispi->base + BYT_PR;
 		ispi->nregions = BYT_FREG_NUM;
 		ispi->pr_num = BYT_PR_NUM;
-		ispi->swseq = true;
+		ispi->swseq_reg = true;
 
 		if (writeable) {
 			/* Disable write protection */
@@ -318,7 +318,7 @@ static int intel_spi_init(struct intel_spi *ispi)
 		ispi->pregs = ispi->base + LPT_PR;
 		ispi->nregions = LPT_FREG_NUM;
 		ispi->pr_num = LPT_PR_NUM;
-		ispi->swseq = true;
+		ispi->swseq_reg = true;
 		break;
 
 	case INTEL_SPI_BXT:
@@ -343,7 +343,7 @@ static int intel_spi_init(struct intel_spi *ispi)
 	 * sequencer. All other operations are supposed to be carried out
 	 * using software sequencer.
 	 */
-	if (ispi->swseq) {
+	if (ispi->swseq_reg) {
 		/* Disable #SMI generation from SW sequencer */
 		val = readl(ispi->sregs + SSFSTS_CTL);
 		val &= ~SSFSTS_CTL_FSMIE;
@@ -493,7 +493,7 @@ static int intel_spi_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 	/* Address of the first chip */
 	writel(0, ispi->base + FADDR);
 
-	if (ispi->swseq)
+	if (ispi->swseq_reg)
 		ret = intel_spi_sw_cycle(ispi, opcode, len,
 					 OPTYPE_READ_NO_ADDR);
 	else
@@ -529,7 +529,7 @@ static int intel_spi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 	if (ret)
 		return ret;
 
-	if (ispi->swseq)
+	if (ispi->swseq_reg)
 		return intel_spi_sw_cycle(ispi, opcode, len,
 					  OPTYPE_WRITE_NO_ADDR);
 	return intel_spi_hw_cycle(ispi, opcode, len);
-- 
2.9.2
