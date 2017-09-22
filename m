Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dvEwJ-0004FQ-3M
 for linux-mtd@lists.infradead.org; Fri, 22 Sep 2017 03:47:50 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 12/12] mtd: nand: denali: change the setup_dma choice into
 hook
Date: Fri, 22 Sep 2017 12:46:49 +0900
Message-Id: <1506052009-8285-13-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1506052009-8285-1-git-send-email-yamada.masahiro@socionext.com>
References: <1506052009-8285-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The previous commit added some hooks into struct denali_nand_info,
so here is one more for clean-up.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 15 +++++----------
 drivers/mtd/nand/denali.h |  2 ++
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 7c24983..0b268ec 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -519,15 +519,6 @@ static void denali_setup_dma32(struct denali_nand_info *denali,
 	denali->host_write(denali, mode | 0x14000, 0x2400);
 }
 
-static void denali_setup_dma(struct denali_nand_info *denali,
-			     dma_addr_t dma_addr, int page, int write)
-{
-	if (denali->caps & DENALI_CAP_DMA_64BIT)
-		denali_setup_dma64(denali, dma_addr, page, write);
-	else
-		denali_setup_dma32(denali, dma_addr, page, write);
-}
-
 static int denali_pio_read(struct denali_nand_info *denali, void *buf,
 			   size_t size, int page, int raw)
 {
@@ -619,7 +610,7 @@ static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
 	iowrite32(DMA_ENABLE__FLAG, denali->reg + DMA_ENABLE);
 
 	denali_reset_irq(denali);
-	denali_setup_dma(denali, dma_addr, page, write);
+	denali->setup_dma(denali, dma_addr, page, write);
 
 	irq_status = denali_wait_for_irq(denali, irq_mask);
 	if (!(irq_status & INTR__DMA_CMD_COMP))
@@ -1314,6 +1305,10 @@ int denali_init(struct denali_nand_info *denali)
 	if (denali->dma_avail) {
 		chip->options |= NAND_USE_BOUNCE_BUFFER;
 		chip->buf_align = 16;
+		if (denali->caps & DENALI_CAP_DMA_64BIT)
+			denali->setup_dma = denali_setup_dma64;
+		else
+			denali->setup_dma = denali_setup_dma32;
 	}
 
 	chip->bbt_options |= NAND_BBT_USE_FLASH;
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 3aeb272..2911066 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -321,6 +321,8 @@ struct denali_nand_info {
 	const struct nand_ecc_caps *ecc_caps;
 	u32 (*host_read)(struct denali_nand_info *denali, u32 addr);
 	void (*host_write)(struct denali_nand_info *denali, u32 addr, u32 data);
+	void (*setup_dma)(struct denali_nand_info *denali, dma_addr_t dma_addr,
+			  int page, int write);
 };
 
 #define DENALI_CAP_HW_ECC_FIXUP			BIT(0)
-- 
2.7.4
