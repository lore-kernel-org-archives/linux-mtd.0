Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fccUB-0008Mt-Du
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2018 20:10:17 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-wireless@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 02/24] mtd: rawnand: atmel: Add an __iomem cast on
 gen_pool_dma_alloc() call
Date: Mon,  9 Jul 2018 22:09:23 +0200
Message-Id: <20180709200945.30116-3-boris.brezillon@bootlin.com>
In-Reply-To: <20180709200945.30116-1-boris.brezillon@bootlin.com>
References: <20180709200945.30116-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

gen_pool_dma_alloc() return type is void *, while internally, the
memory region exposed by the sram driver has been mapped with
ioremap().

Add a void * to void __iomem * cast to make sparse happy.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index e8f7549d0354..30dae4c9d439 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -2219,9 +2219,9 @@ atmel_hsmc_nand_controller_init(struct atmel_hsmc_nand_controller *nc)
 		return -ENOMEM;
 	}
 
-	nc->sram.virt = gen_pool_dma_alloc(nc->sram.pool,
-					    ATMEL_NFC_SRAM_SIZE,
-					    &nc->sram.dma);
+	nc->sram.virt = (void __iomem *)gen_pool_dma_alloc(nc->sram.pool,
+							   ATMEL_NFC_SRAM_SIZE,
+							   &nc->sram.dma);
 	if (!nc->sram.virt) {
 		dev_err(nc->base.dev,
 			"Could not allocate memory from the NFC SRAM pool\n");
-- 
2.14.1
