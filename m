Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctTs2-0007Dv-HJ
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 06:47:55 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v3 08/37] mtd: nand: denali: support 64bit capable DMA engine
Date: Thu, 30 Mar 2017 15:45:54 +0900
Message-Id: <1490856383-31560-9-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The current driver only supports the DMA engine up to 32 bit
physical address, but there also exists 64 bit capable DMA engine
for this IP.

The data DMA setup sequence is completely different, so I added the
64 bit DMA code as a new function denali_setup_dma64().  The 32 bit
one has been renamed to denali_setup_dma32().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3:
  - Move DENALI_CAP_ define out of struct denali_nand_info

Changes in v2:
  - Change the capability prefix DENALI_CAPS_ -> DENALI_CAP_

 drivers/mtd/nand/denali.c | 39 +++++++++++++++++++++++++++++++++++----
 drivers/mtd/nand/denali.h |  1 +
 2 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index b95e33a..417a895 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -979,8 +979,30 @@ static void denali_enable_dma(struct denali_nand_info *denali, bool en)
 	ioread32(denali->flash_reg + DMA_ENABLE);
 }
 
-/* setups the HW to perform the data DMA */
-static void denali_setup_dma(struct denali_nand_info *denali, int op)
+static void denali_setup_dma64(struct denali_nand_info *denali, int op)
+{
+	uint32_t mode;
+	const int page_count = 1;
+	uint64_t addr = denali->buf.dma_buf;
+
+	mode = MODE_10 | BANK(denali->flash_bank) | denali->page;
+
+	/* DMA is a three step process */
+
+	/*
+	 * 1. setup transfer type, interrupt when complete,
+	 *    burst len = 64 bytes, the number of pages
+	 */
+	index_addr(denali, mode, 0x01002000 | (64 << 16) | op | page_count);
+
+	/* 2. set memory low address */
+	index_addr(denali, mode, addr);
+
+	/* 3. set memory high address */
+	index_addr(denali, mode, addr >> 32);
+}
+
+static void denali_setup_dma32(struct denali_nand_info *denali, int op)
 {
 	uint32_t mode;
 	const int page_count = 1;
@@ -1003,6 +1025,14 @@ static void denali_setup_dma(struct denali_nand_info *denali, int op)
 	index_addr(denali, mode | 0x14000, 0x2400);
 }
 
+static void denali_setup_dma(struct denali_nand_info *denali, int op)
+{
+	if (denali->caps & DENALI_CAP_DMA_64BIT)
+		denali_setup_dma64(denali, op);
+	else
+		denali_setup_dma32(denali, op);
+}
+
 /*
  * writes a page. user specifies type, and this function handles the
  * configuration details.
@@ -1518,8 +1548,9 @@ int denali_init(struct denali_nand_info *denali)
 		goto failed_req_irq;
 	}
 
-	/* Is 32-bit DMA supported? */
-	ret = dma_set_mask(denali->dev, DMA_BIT_MASK(32));
+	ret = dma_set_mask(denali->dev,
+			   DMA_BIT_MASK(denali->caps & DENALI_CAP_DMA_64BIT ?
+					64 : 32));
 	if (ret) {
 		dev_err(denali->dev, "No usable DMA configuration\n");
 		goto failed_req_irq;
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index e532956..1f413d0 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -347,6 +347,7 @@ struct denali_nand_info {
 };
 
 #define DENALI_CAP_HW_ECC_FIXUP			BIT(0)
+#define DENALI_CAP_DMA_64BIT			BIT(1)
 
 extern int denali_init(struct denali_nand_info *denali);
 extern void denali_remove(struct denali_nand_info *denali);
-- 
2.7.4
