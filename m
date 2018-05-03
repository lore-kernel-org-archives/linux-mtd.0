Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEB2W-0005sa-FV
 for linux-mtd@lists.infradead.org; Thu, 03 May 2018 10:00:46 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 Miquel Raynal <miquel.raynal@bootlin.com>, stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: marvell: fix command xtype in BCH write hook
Date: Thu,  3 May 2018 12:00:27 +0200
Message-Id: <20180503100027.16229-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

One layout supported by the Marvell NAND controller supports NAND pages
of 2048 bytes, all handled in one single chunk when using BCH with a
strength of 4-bit per 512 bytes. In this case, instead of the generic
XTYPE_WRITE_DISPATCH/XTYPE_LAST_NAKED_RW couple, the controller expects
to receive XTYPE_MONOLITHIC_RW.

This fixes problems at boot like:

[    1.315475] Scanning device for bad blocks
[    3.203108] marvell-nfc f10d0000.flash: Timeout waiting for RB signal
[    3.209564] nand_bbt: error while writing BBT block -110
[    4.243106] marvell-nfc f10d0000.flash: Timeout waiting for RB signal
[    5.283106] marvell-nfc f10d0000.flash: Timeout waiting for RB signal
[    5.289562] nand_bbt: error -110 while marking block 2047 bad
[    6.323106] marvell-nfc f10d0000.flash: Timeout waiting for RB signal
[    6.329559] nand_bbt: error while writing BBT block -110
[    7.363106] marvell-nfc f10d0000.flash: Timeout waiting for RB signal
[    8.403105] marvell-nfc f10d0000.flash: Timeout waiting for RB signal
[    8.409559] nand_bbt: error -110 while marking block 2046 bad
...

Fixes: 02f26ecf8c772 ("mtd: nand: add reworked Marvell NAND controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Chris,

Can you please give this patch a try? This is very likely to solve your
boot issue.

Thanks,
Miquèl

 drivers/mtd/nand/raw/marvell_nand.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index e4b964fd40d8..db5ec4e8bde9 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -1408,6 +1408,7 @@ marvell_nfc_hw_ecc_bch_write_chunk(struct nand_chip *chip, int chunk,
 	struct marvell_nand_chip *marvell_nand = to_marvell_nand(chip);
 	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
 	const struct marvell_hw_ecc_layout *lt = to_marvell_nand(chip)->layout;
+	u32 xtype;
 	int ret;
 	struct marvell_nfc_op nfc_op = {
 		.ndcb[0] = NDCB0_CMD_TYPE(TYPE_WRITE) | NDCB0_LEN_OVRD,
@@ -1423,7 +1424,12 @@ marvell_nfc_hw_ecc_bch_write_chunk(struct nand_chip *chip, int chunk,
 	 * last naked write.
 	 */
 	if (chunk == 0) {
-		nfc_op.ndcb[0] |= NDCB0_CMD_XTYPE(XTYPE_WRITE_DISPATCH) |
+		if (lt->nchunks == 1)
+			xtype = XTYPE_MONOLITHIC_RW;
+		else
+			xtype = XTYPE_WRITE_DISPATCH;
+
+		nfc_op.ndcb[0] |= NDCB0_CMD_XTYPE(xtype) |
 				  NDCB0_ADDR_CYC(marvell_nand->addr_cyc) |
 				  NDCB0_CMD1(NAND_CMD_SEQIN);
 		nfc_op.ndcb[1] |= NDCB1_ADDRS_PAGE(page);
-- 
2.14.1
