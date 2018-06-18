Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fUmAY-0003Rj-Tt
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2018 04:53:39 +0000
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com, boris.brezillon@bootlin.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>
Subject: [RFC PATCH 2/2] mtd: rawnand: marvell: Support page size of 2048 with
 8-bit ECC
Date: Mon, 18 Jun 2018 16:52:55 +1200
Message-Id: <20180618045255.8015-3-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20180618045255.8015-1-chris.packham@alliedtelesis.co.nz>
References: <20180618045255.8015-1-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The MT29F1G08ABAFAWP-ITE:F chip has 2048 byte pages and requires a
minimum ECC strength of 8-bits. Allow for this combination of
requirements using the marvell_nand controller.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
I've tried to follow the recommended AN-379 from Marvell. They do seem
to have information that covers this particular set of chip requirements
but I'm not confident I've translated their code correctly into the
current marvell_nand implementation.

This is enough to make the nand_scan work but ubi/ubifs fails to initialise
and/or mount so I may have something completely wrong. This may also be
because this chip has internal ECC enabled which cannot be disabled. I
turned up an old thread on this from April last year[1] but I didn't see
anything resulting from this. Can this combination of ECC
implementations even co-exist?

[1] - http://lists.infradead.org/pipermail/linux-mtd/2017-April/073370.html

 drivers/mtd/nand/raw/marvell_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index ebb1d141b900..5712df553a8e 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -217,6 +217,7 @@ static const struct marvell_hw_ecc_layout marvell_nfc_layouts[] = {
 	MARVELL_LAYOUT(  512,   512,  1,  1,  1,  512,  8,  8,  0,  0,  0),
 	MARVELL_LAYOUT( 2048,   512,  1,  1,  1, 2048, 40, 24,  0,  0,  0),
 	MARVELL_LAYOUT( 2048,   512,  4,  1,  1, 2048, 32, 30,  0,  0,  0),
+	MARVELL_LAYOUT( 2048,   512,  8,  1,  1, 1024, 0, 30,  1024,  32,  30),
 	MARVELL_LAYOUT( 4096,   512,  4,  2,  2, 2048, 32, 30,  0,  0,  0),
 	MARVELL_LAYOUT( 4096,   512,  8,  5,  4, 1024,  0, 30,  0, 64, 30),
 };
-- 
2.17.1
