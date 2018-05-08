Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fFxXO-00071b-AT
 for linux-mtd@lists.infradead.org; Tue, 08 May 2018 07:59:56 +0000
Date: Tue, 8 May 2018 09:59:37 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: ubifs error with marvell_nand on Armada-98DX4251 (was Re:
 [PATCH] mtd: rawnand: marvell: fix command xtype in BCH write hook)
Message-ID: <20180508095937.46678a01@bbrezillon>
In-Reply-To: <91c282c4fe9344d88684131d1a64dcf2@svr-chch-ex1.atlnz.lc>
References: <20180503100027.16229-1-miquel.raynal@bootlin.com>
 <f1b88811dd88481da1c1b84341bbc9a5@svr-chch-ex1.atlnz.lc>
 <20180504091001.3e6650d6@xps13>
 <729567d8180a4b70ba9226dcd9eee0b4@svr-chch-ex1.atlnz.lc>
 <20180507095053.249547d0@bbrezillon>
 <91c282c4fe9344d88684131d1a64dcf2@svr-chch-ex1.atlnz.lc>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 8 May 2018 01:38:13 +0000
Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:

> Hi Boris,
> 
> Thanks for picking this up while Miquel is taking a break.

Can you try with the following diff applied?

--->8---
diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index db5ec4e8bde9..ebb1d141b900 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -1194,11 +1194,13 @@ static void marvell_nfc_hw_ecc_bch_read_chunk(struct nand_chip *chip, int chunk,
                                  NDCB0_CMD2(NAND_CMD_READSTART);
 
        /*
-        * Trigger the naked read operation only on the last chunk.
-        * Otherwise, use monolithic read.
+        * Trigger the monolithic read on the first chunk, then naked read on
+        * intermediate chunks and finally a last naked read on the last chunk.
         */
-       if (lt->nchunks == 1 || (chunk < lt->nchunks - 1))
+       if (chunk == 0)
                nfc_op.ndcb[0] |= NDCB0_CMD_XTYPE(XTYPE_MONOLITHIC_RW);
+       else if (chunk < lt->nchunks - 1)
+               nfc_op.ndcb[0] |= NDCB0_CMD_XTYPE(XTYPE_NAKED_RW);
        else
                nfc_op.ndcb[0] |= NDCB0_CMD_XTYPE(XTYPE_LAST_NAKED_RW);
 
