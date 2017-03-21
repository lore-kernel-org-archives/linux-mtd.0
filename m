Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqGej-0000NV-Rx
 for linux-mtd@lists.infradead.org; Tue, 21 Mar 2017 10:04:48 +0000
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Stefan Roese <sr@denx.de>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 04/13] mtd: nand: fsmc: move fsmc_nand_data definition
Date: Tue, 21 Mar 2017 11:03:56 +0100
Message-Id: <1490090645-8576-5-git-send-email-thomas.petazzoni@free-electrons.com>
In-Reply-To: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit simply moves the "struct fsmc_nand_data" definition to be
towards the beginning of the file, with the other defines and type
definitions, instead of in the middle of the driver code. This is much
more consistent with what most Linux drivers do.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/mtd/nand/fsmc_nand.c | 98 ++++++++++++++++++++++----------------------
 1 file changed, 49 insertions(+), 49 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index d2e85c6..bc1c764 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -161,6 +161,55 @@ struct fsmc_nand_platform_data {
 	void			*write_dma_priv;
 };
 
+/**
+ * struct fsmc_nand_data - structure for FSMC NAND device state
+ *
+ * @pid:		Part ID on the AMBA PrimeCell format
+ * @mtd:		MTD info for a NAND flash.
+ * @nand:		Chip related info for a NAND flash.
+ * @partitions:		Partition info for a NAND Flash.
+ * @nr_partitions:	Total number of partition of a NAND flash.
+ *
+ * @bank:		Bank number for probed device.
+ * @clk:		Clock structure for FSMC.
+ *
+ * @read_dma_chan:	DMA channel for read access
+ * @write_dma_chan:	DMA channel for write access to NAND
+ * @dma_access_complete: Completion structure
+ *
+ * @data_pa:		NAND Physical port for Data.
+ * @data_va:		NAND port for Data.
+ * @cmd_va:		NAND port for Command.
+ * @addr_va:		NAND port for Address.
+ * @regs_va:		FSMC regs base address.
+ */
+struct fsmc_nand_data {
+	u32			pid;
+	struct nand_chip	nand;
+	struct mtd_partition	*partitions;
+	unsigned int		nr_partitions;
+
+	unsigned int		bank;
+	struct device		*dev;
+	enum access_mode	mode;
+	struct clk		*clk;
+
+	/* DMA related objects */
+	struct dma_chan		*read_dma_chan;
+	struct dma_chan		*write_dma_chan;
+	struct completion	dma_access_complete;
+
+	struct fsmc_nand_timings *dev_timings;
+
+	dma_addr_t		data_pa;
+	void __iomem		*data_va;
+	void __iomem		*cmd_va;
+	void __iomem		*addr_va;
+	void __iomem		*regs_va;
+
+	void			(*select_chip)(uint32_t bank, uint32_t busw);
+};
+
 static int fsmc_ecc1_ooblayout_ecc(struct mtd_info *mtd, int section,
 				   struct mtd_oob_region *oobregion)
 {
@@ -245,55 +294,6 @@ static const struct mtd_ooblayout_ops fsmc_ecc4_ooblayout_ops = {
 	.free = fsmc_ecc4_ooblayout_free,
 };
 
-/**
- * struct fsmc_nand_data - structure for FSMC NAND device state
- *
- * @pid:		Part ID on the AMBA PrimeCell format
- * @mtd:		MTD info for a NAND flash.
- * @nand:		Chip related info for a NAND flash.
- * @partitions:		Partition info for a NAND Flash.
- * @nr_partitions:	Total number of partition of a NAND flash.
- *
- * @bank:		Bank number for probed device.
- * @clk:		Clock structure for FSMC.
- *
- * @read_dma_chan:	DMA channel for read access
- * @write_dma_chan:	DMA channel for write access to NAND
- * @dma_access_complete: Completion structure
- *
- * @data_pa:		NAND Physical port for Data.
- * @data_va:		NAND port for Data.
- * @cmd_va:		NAND port for Command.
- * @addr_va:		NAND port for Address.
- * @regs_va:		FSMC regs base address.
- */
-struct fsmc_nand_data {
-	u32			pid;
-	struct nand_chip	nand;
-	struct mtd_partition	*partitions;
-	unsigned int		nr_partitions;
-
-	unsigned int		bank;
-	struct device		*dev;
-	enum access_mode	mode;
-	struct clk		*clk;
-
-	/* DMA related objects */
-	struct dma_chan		*read_dma_chan;
-	struct dma_chan		*write_dma_chan;
-	struct completion	dma_access_complete;
-
-	struct fsmc_nand_timings *dev_timings;
-
-	dma_addr_t		data_pa;
-	void __iomem		*data_va;
-	void __iomem		*cmd_va;
-	void __iomem		*addr_va;
-	void __iomem		*regs_va;
-
-	void			(*select_chip)(uint32_t bank, uint32_t busw);
-};
-
 static inline struct fsmc_nand_data *mtd_to_fsmc(struct mtd_info *mtd)
 {
 	return container_of(mtd_to_nand(mtd), struct fsmc_nand_data, nand);
-- 
2.7.4
