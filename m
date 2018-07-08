Received: from smtp47.i.mail.ru ([94.100.177.107])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fc7tS-0007HA-Ge
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2018 11:30:20 +0000
From: Sergey Larin <cerg2010cerg2010@mail.ru>
To: 
Cc: boris.brezillon@bootlin.com, miquel.raynal@bootlin.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sergey Larin <cerg2010cerg2010@mail.ru>
Subject: [PATCH 2/2] mtd: rawnand: docg4: specify bits_per_cell
Date: Sun,  8 Jul 2018 14:29:24 +0300
Message-Id: <48cec9b431a42375cd9033b225f3573002574f17.1531045014.git.cerg2010cerg2010@mail.ru>
In-Reply-To: <cover.1531045014.git.cerg2010cerg2010@mail.ru>
References: <cover.1531045014.git.cerg2010cerg2010@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fixes WARN() in nand_is_slc().

DoC G4 is 2-bit MLC, so set bits_per_cell value according to this.

Signed-off-by: Sergey Larin <cerg2010cerg2010@mail.ru>
---
 drivers/mtd/nand/raw/docg4.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/docg4.c b/drivers/mtd/nand/raw/docg4.c
index bbed8ea7858c..82d97a16e246 100644
--- a/drivers/mtd/nand/raw/docg4.c
+++ b/drivers/mtd/nand/raw/docg4.c
@@ -1250,6 +1250,7 @@ static void __init init_mtd_structs(struct mtd_info *mtd)
 	nand->pagemask = 0x3ffff;
 	nand->badblockpos = NAND_LARGE_BADBLOCK_POS;
 	nand->badblockbits = 8;
+	nand->bits_per_cell = 2;
 	nand->ecc.mode = NAND_ECC_HW_SYNDROME;
 	nand->ecc.size = DOCG4_PAGE_SIZE;
 	nand->ecc.prepad = 8;
-- 
2.18.0
