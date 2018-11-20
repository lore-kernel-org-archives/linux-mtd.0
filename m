Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP1vn-0005mC-JD
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 09:02:58 +0000
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
Subject: [PATCH 02/10] mtd: rawnand: fsmc: Fix the fsmc_nand_data kernel-doc
Date: Tue, 20 Nov 2018 10:02:31 +0100
Message-Id: <20181120090239.5792-3-boris.brezillon@bootlin.com>
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

The kernel-doc describing struct fsmc_nand_data is not in sync with
the struct itself. Add missing entries and drop invalid ones.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 54c854451493..01044b858a93 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -123,18 +123,19 @@ enum access_mode {
  * struct fsmc_nand_data - structure for FSMC NAND device state
  *
  * @pid:		Part ID on the AMBA PrimeCell format
- * @mtd:		MTD info for a NAND flash.
  * @nand:		Chip related info for a NAND flash.
- * @partitions:		Partition info for a NAND Flash.
- * @nr_partitions:	Total number of partition of a NAND flash.
  *
  * @bank:		Bank number for probed device.
+ * @dev:		Parent device
+ * @mode:		Access mode
  * @clk:		Clock structure for FSMC.
  *
  * @read_dma_chan:	DMA channel for read access
  * @write_dma_chan:	DMA channel for write access to NAND
  * @dma_access_complete: Completion structure
  *
+ * @dev_timings:	NAND timings
+ *
  * @data_pa:		NAND Physical port for Data.
  * @data_va:		NAND port for Data.
  * @cmd_va:		NAND port for Command.
-- 
2.17.1
