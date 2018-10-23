Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gF1lR-0005Yj-EW
 for linux-mtd@lists.infradead.org; Tue, 23 Oct 2018 18:51:01 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Han Xu <han.xu@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Stefan Agner <stefan@agner.ch>
Subject: [PATCH 08/15] mtd: rawnand: Make ->select_chip() optional when
 ->exec_op() is implemented
Date: Tue, 23 Oct 2018 20:50:04 +0200
Message-Id: <20181023185011.3356-9-boris.brezillon@bootlin.com>
In-Reply-To: <20181023185011.3356-1-boris.brezillon@bootlin.com>
References: <20181023185011.3356-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that the CS to be selected on a nand_operation is passed in
nand_operation->cs we can make the ->select_chip() hook optional for
drivers implementing ->exec_op().

When not implemented, the core is assuming the CS line is automatically
asserted/deasserted by the driver ->exec_op() implementation.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 06c5fbe574eb..ae70f27b0d41 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -248,7 +248,9 @@ void nand_select_target(struct nand_chip *chip, unsigned int cs)
 		return;
 
 	chip->cur_cs = cs;
-	chip->select_chip(chip, cs);
+
+	if (chip->select_chip)
+		chip->select_chip(chip, cs);
 }
 EXPORT_SYMBOL_GPL(nand_select_target);
 
@@ -261,7 +263,9 @@ EXPORT_SYMBOL_GPL(nand_select_target);
  */
 void nand_deselect_target(struct nand_chip *chip)
 {
-	chip->select_chip(chip, -1);
+	if (chip->select_chip)
+		chip->select_chip(chip, -1);
+
 	chip->cur_cs = -1;
 }
 EXPORT_SYMBOL_GPL(nand_deselect_target);
@@ -4995,11 +4999,6 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 	if (!mtd->name && mtd->dev.parent)
 		mtd->name = dev_name(mtd->dev.parent);
 
-	if (chip->exec_op && !chip->select_chip) {
-		pr_err("->select_chip() is mandatory when implementing ->exec_op()\n");
-		return -EINVAL;
-	}
-
 	ret = nand_legacy_check_hooks(chip);
 	if (ret)
 		return ret;
-- 
2.17.1
