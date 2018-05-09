Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGJIk-0002S2-35
 for linux-mtd@lists.infradead.org; Wed, 09 May 2018 07:14:15 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: marvell: Fix read logic for layouts with
 ->nchunks > 2
Date: Wed,  9 May 2018 09:13:58 +0200
Message-Id: <20180509071358.12157-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The code is doing monolithic reads for all chunks except the last one
which is wrong since a monolithic read will issue the
READ0+ADDRS+READ_START sequence. It not only takes longer because it
forces the NAND chip to reload the page content into its internal
cache, but by doing that we also reset the column pointer to 0, which
means we'll always read the first chunk instead of moving to the next
one.

Rework the code to do a monolithic read only for the first chunk,
then switch to naked reads for all intermediate chunks and finally
issue a last naked read for the last chunk.

Fixes: 02f26ecf8c77 mtd: nand: add reworked Marvell NAND controller driver
Cc: stable@vger.kernel.org
Reported-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/mtd/nand/raw/marvell_nand.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index db5ec4e8bde9..ebb1d141b900 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -1194,11 +1194,13 @@ static void marvell_nfc_hw_ecc_bch_read_chunk(struct nand_chip *chip, int chunk,
 				  NDCB0_CMD2(NAND_CMD_READSTART);
 
 	/*
-	 * Trigger the naked read operation only on the last chunk.
-	 * Otherwise, use monolithic read.
+	 * Trigger the monolithic read on the first chunk, then naked read on
+	 * intermediate chunks and finally a last naked read on the last chunk.
 	 */
-	if (lt->nchunks == 1 || (chunk < lt->nchunks - 1))
+	if (chunk == 0)
 		nfc_op.ndcb[0] |= NDCB0_CMD_XTYPE(XTYPE_MONOLITHIC_RW);
+	else if (chunk < lt->nchunks - 1)
+		nfc_op.ndcb[0] |= NDCB0_CMD_XTYPE(XTYPE_NAKED_RW);
 	else
 		nfc_op.ndcb[0] |= NDCB0_CMD_XTYPE(XTYPE_LAST_NAKED_RW);
 
-- 
2.14.1
