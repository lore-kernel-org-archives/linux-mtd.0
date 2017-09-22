Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dvEwN-0004Fl-KZ
 for linux-mtd@lists.infradead.org; Fri, 22 Sep 2017 03:47:57 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 01/12] mtd: nand: denali: squash setup_ecc_for_xfer()
 helper into caller
Date: Fri, 22 Sep 2017 12:46:38 +0900
Message-Id: <1506052009-8285-2-git-send-email-yamada.masahiro@socionext.com>
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

The setup_ecc_for_xfer() is only called from denali_data_xfer().
This helper is small enough, so squash it into the caller.
This looks cleaner to me.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/mtd/nand/denali.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index aefdc83..d847ae4 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -208,24 +208,6 @@ static uint32_t denali_check_irq(struct denali_nand_info *denali)
 	return irq_status;
 }
 
-/*
- * This helper function setups the registers for ECC and whether or not
- * the spare area will be transferred.
- */
-static void setup_ecc_for_xfer(struct denali_nand_info *denali, bool ecc_en,
-				bool transfer_spare)
-{
-	int ecc_en_flag, transfer_spare_flag;
-
-	/* set ECC, transfer spare bits if needed */
-	ecc_en_flag = ecc_en ? ECC_ENABLE__FLAG : 0;
-	transfer_spare_flag = transfer_spare ? TRANSFER_SPARE_REG__FLAG : 0;
-
-	/* Enable spare area/ECC per user's request. */
-	iowrite32(ecc_en_flag, denali->reg + ECC_ENABLE);
-	iowrite32(transfer_spare_flag, denali->reg + TRANSFER_SPARE_REG);
-}
-
 static void denali_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
@@ -659,7 +641,9 @@ static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
 static int denali_data_xfer(struct denali_nand_info *denali, void *buf,
 			    size_t size, int page, int raw, int write)
 {
-	setup_ecc_for_xfer(denali, !raw, raw);
+	iowrite32(raw ? 0 : ECC_ENABLE__FLAG, denali->reg + ECC_ENABLE);
+	iowrite32(raw ? TRANSFER_SPARE_REG__FLAG : 0,
+		  denali->reg + TRANSFER_SPARE_REG);
 
 	if (denali->dma_avail)
 		return denali_dma_xfer(denali, buf, size, page, raw, write);
-- 
2.7.4
