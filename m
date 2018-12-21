Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gaJW3-0006Cx-S0
 for linux-mtd@lists.infradead.org; Fri, 21 Dec 2018 12:02:57 +0000
Received: by mail-lf1-x141.google.com with SMTP id z13so3713071lfe.11
 for <linux-mtd@lists.infradead.org>; Fri, 21 Dec 2018 04:02:44 -0800 (PST)
From: Emil Lenngren <emil.lenngren@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Emil Lenngren <emil.lenngren@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH] mtd: spinand: Wait after erase in spinand_markbad
Date: Fri, 21 Dec 2018 12:58:14 +0100
Message-Id: <20181221115831.9595-1-emil.lenngren@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SPI NAND flashes don't accept new commands while an erase is ongoing.
Make sure to wait until the device is ready before writing the marker.

Just as with the erase op, no error check is performed since we want
to continue writing the marker even if the erase fails.

Signed-off-by: Emil Lenngren <emil.lenngren@gmail.com>
---
 drivers/mtd/nand/spi/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 479c2f2cf1..c2724d34e6 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -685,6 +685,8 @@ static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
 
 	spinand_erase_op(spinand, pos);
 
+	spinand_wait(spinand, NULL);
+
 	memset(spinand->oobbuf, 0, 2);
 	return spinand_write_page(spinand, &req);
 }
-- 
2.17.1
