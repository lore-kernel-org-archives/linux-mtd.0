Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dngox-0001aQ-CS
 for linux-mtd@lists.infradead.org; Fri, 01 Sep 2017 07:56:57 +0000
Received: by mail-io0-x244.google.com with SMTP id z67so339682iof.1
 for <linux-mtd@lists.infradead.org>; Fri, 01 Sep 2017 00:56:38 -0700 (PDT)
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
Subject: [PATCH 10/10] spi-nor: intel-spi: Fall back to use SW sequencer to
 erase
Date: Fri,  1 Sep 2017 01:00:41 -0700
Message-Id: <1504252841-2445-11-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1504252841-2445-1-git-send-email-bmeng.cn@gmail.com>
References: <1504252841-2445-1-git-send-email-bmeng.cn@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

According to the datasheet, the HW sequencer has a predefined list
of opcodes, with only the erase opcode being programmable in LVSCC
and UVSCC registers. If these registers don't contain a valid erase
opcode (eg: BIOS does not program it), erase cannot be done using
the HW sequencer, even though the erase operation does not report
any error, the flash remains not erased.

If such register setting is detected, let's fall back to use the SW
sequencer to erase instead.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

 drivers/mtd/spi-nor/intel-spi.c | 50 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
index 5e7a389..f1e2c5f 100644
--- a/drivers/mtd/spi-nor/intel-spi.c
+++ b/drivers/mtd/spi-nor/intel-spi.c
@@ -111,6 +111,13 @@
 #define BXT_FREG_NUM			12
 #define BXT_PR_NUM			6
 
+#define LVSCC				0xc4
+#define UVSCC				0xc8
+#define ERASE_OPCODE_SHIFT		8
+#define ERASE_OPCODE_MASK		(0xff << ERASE_OPCODE_SHIFT)
+#define ERASE_64K_OPCODE_SHIFT		16
+#define ERASE_64K_OPCODE_MASK		(0xff << ERASE_OPCODE_SHIFT)
+
 #define INTEL_SPI_TIMEOUT		5000 /* ms */
 #define INTEL_SPI_FIFO_SZ		64
 
@@ -127,6 +134,7 @@
  * @writeable: Is the chip writeable
  * @locked: Is SPI setting locked
  * @swseq_reg: Use SW sequencer in register reads/writes
+ * @swseq_erase: Use SW sequencer in erase operation
  * @erase_64k: 64k erase supported
  * @opcodes: Opcodes which are supported. This are programmed by BIOS
  *           before it locks down the controller.
@@ -144,6 +152,7 @@ struct intel_spi {
 	bool writeable;
 	bool locked;
 	bool swseq_reg;
+	bool swseq_erase;
 	bool erase_64k;
 	u8 opcodes[8];
 	u8 preopcodes[2];
@@ -191,6 +200,9 @@ static void intel_spi_dump_regs(struct intel_spi *ispi)
 	if (ispi->info->type == INTEL_SPI_BYT)
 		dev_dbg(ispi->dev, "BCR=0x%08x\n", readl(ispi->base + BYT_BCR));
 
+	dev_dbg(ispi->dev, "LVSCC=0x%08x\n", readl(ispi->base + LVSCC));
+	dev_dbg(ispi->dev, "UVSCC=0x%08x\n", readl(ispi->base + UVSCC));
+
 	dev_dbg(ispi->dev, "Protected regions:\n");
 	for (i = 0; i < ispi->pr_num; i++) {
 		u32 base, limit;
@@ -225,6 +237,8 @@ static void intel_spi_dump_regs(struct intel_spi *ispi)
 
 	dev_dbg(ispi->dev, "Using %cW sequencer for register access\n",
 		ispi->swseq_reg ? 'S' : 'H');
+	dev_dbg(ispi->dev, "Using %cW sequencer for erase operation\n",
+		ispi->swseq_erase ? 'S' : 'H');
 }
 
 /* Reads max INTEL_SPI_FIFO_SZ bytes from the device fifo */
@@ -288,7 +302,7 @@ static int intel_spi_wait_sw_busy(struct intel_spi *ispi)
 
 static int intel_spi_init(struct intel_spi *ispi)
 {
-	u32 opmenu0, opmenu1, val;
+	u32 opmenu0, opmenu1, lvscc, uvscc, val;
 	int i;
 
 	switch (ispi->info->type) {
@@ -339,6 +353,24 @@ static int intel_spi_init(struct intel_spi *ispi)
 	writel(val, ispi->base + HSFSTS_CTL);
 
 	/*
+	 * Determine whether erase operatoin should use HW or SW sequencer.
+	 *
+	 * The HW sequencer has a predefined list of opcodes, with only the
+	 * erase opcode being programmable in LVSCC and UVSCC registers.
+	 * If these registers don't contain a valid erase opcode, erase
+	 * cannot be done using HW sequencer.
+	 */
+	lvscc = readl(ispi->base + LVSCC);
+	uvscc = readl(ispi->base + UVSCC);
+	if (!(lvscc & ERASE_OPCODE_MASK) || !(uvscc & ERASE_OPCODE_MASK))
+		ispi->swseq_erase = true;
+	/* SPI controller on Intel BXT supports 64K erase opcode */
+	if (ispi->info->type == INTEL_SPI_BXT && !ispi->swseq_erase)
+		if (!(lvscc & ERASE_64K_OPCODE_MASK) ||
+		    !(uvscc & ERASE_64K_OPCODE_MASK))
+			ispi->erase_64k = false;
+
+	/*
 	 * Some controllers can only do basic operations using hardware
 	 * sequencer. All other operations are supposed to be carried out
 	 * using software sequencer.
@@ -665,6 +697,22 @@ static int intel_spi_erase(struct spi_nor *nor, loff_t offs)
 		erase_size = SZ_4K;
 	}
 
+	if (ispi->swseq_erase) {
+		while (len > 0) {
+			writel(offs, ispi->base + FADDR);
+
+			ret = intel_spi_sw_cycle(ispi, nor->erase_opcode,
+						 0, OPTYPE_WRITE_WITH_ADDR);
+			if (ret)
+				return ret;
+
+			offs += erase_size;
+			len -= erase_size;
+		}
+
+		return 0;
+	}
+
 	while (len > 0) {
 		writel(offs, ispi->base + FADDR);
 
-- 
2.9.2
