Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dvEwN-0004Fh-KM
 for linux-mtd@lists.infradead.org; Fri, 22 Sep 2017 03:47:57 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 04/12] mtd: nand: denali: squash denali_enable_dma() helper
 into caller
Date: Fri, 22 Sep 2017 12:46:41 +0900
Message-Id: <1506052009-8285-5-git-send-email-yamada.masahiro@socionext.com>
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

This helper just sets/clears a flag of DMA_ENABLE register (with
register read-back, I do not know why it is necessary).

Move the register write code to the caller, and remove the helper.
It works for me without the register read-back.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/mtd/nand/denali.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 4daeb7f..e7b25de 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -465,13 +465,6 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
 	return max_bitflips;
 }
 
-/* programs the controller to either enable/disable DMA transfers */
-static void denali_enable_dma(struct denali_nand_info *denali, bool en)
-{
-	iowrite32(en ? DMA_ENABLE__FLAG : 0, denali->reg + DMA_ENABLE);
-	ioread32(denali->reg + DMA_ENABLE);
-}
-
 static void denali_setup_dma64(struct denali_nand_info *denali,
 			       dma_addr_t dma_addr, int page, int write)
 {
@@ -619,7 +612,7 @@ static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
 		ecc_err_mask = INTR__ECC_ERR;
 	}
 
-	denali_enable_dma(denali, true);
+	iowrite32(DMA_ENABLE__FLAG, denali->reg + DMA_ENABLE);
 
 	denali_reset_irq(denali);
 	denali_setup_dma(denali, dma_addr, page, write);
@@ -631,7 +624,8 @@ static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
 	else if (irq_status & ecc_err_mask)
 		ret = -EBADMSG;
 
-	denali_enable_dma(denali, false);
+	iowrite32(0, denali->reg + DMA_ENABLE);
+
 	dma_unmap_single(denali->dev, dma_addr, size, dir);
 
 	if (irq_status & INTR__ERASED_PAGE)
-- 
2.7.4
