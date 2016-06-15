Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bD727-0001XF-QS
 for linux-mtd@lists.infradead.org; Wed, 15 Jun 2016 09:22:48 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com
Subject: [PATCH] mtd: nand: sunxi: Fix OOB bytes retrieval in read_chunks_dma()
Date: Wed, 15 Jun 2016 11:22:12 +0200
Message-Id: <1465982532-30174-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The column address passed to the RNDOUT operation was missing the page
size offset.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
---
 drivers/mtd/nand/sunxi_nand.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index ea74827..bcdd015 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -1094,7 +1094,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct mtd_info *mtd, uint8_t *buf,
 
 		if (oob_required && !erased) {
 			/* TODO: use DMA to retrieve OOB */
-			nand->cmdfunc(mtd, NAND_CMD_RNDOUT, oob_off, -1);
+			nand->cmdfunc(mtd, NAND_CMD_RNDOUT,
+				      mtd->writesize + oob_off, -1);
 			nand->read_buf(mtd, oob, ecc->bytes + 4);
 
 			sunxi_nfc_hw_ecc_get_prot_oob_bytes(mtd, oob, i,
@@ -1129,7 +1130,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct mtd_info *mtd, uint8_t *buf,
 			}
 
 			/* TODO: use DMA to retrieve OOB */
-			nand->cmdfunc(mtd, NAND_CMD_RNDOUT, oob_off, -1);
+			nand->cmdfunc(mtd, NAND_CMD_RNDOUT,
+				      mtd->writesize + oob_off, -1);
 			nand->read_buf(mtd, oob, ecc->bytes + 4);
 
 			ret = nand_check_erased_ecc_chunk(data,	ecc->size,
-- 
2.7.4
