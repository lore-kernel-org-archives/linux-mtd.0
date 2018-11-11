Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLkan-0000OK-Tg
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2018 07:55:39 +0000
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
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Stefan Agner <stefan@agner.ch>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3 04/22] mtd: rawnand: Move nand_exec_op() to internal.h
Date: Sun, 11 Nov 2018 08:55:06 +0100
Message-Id: <20181111075524.13123-5-boris.brezillon@bootlin.com>
In-Reply-To: <20181111075524.13123-1-boris.brezillon@bootlin.com>
References: <20181111075524.13123-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_exec_op() is only used by core code (nand_xxx.c files). Let's
move this inline function in drivers/mtd/nand/raw/internals.h.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Tested-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
Changes in v3:
- Add Janusz's T-b

Changes in v2:
- None
---
 drivers/mtd/nand/raw/internals.h | 9 +++++++++
 include/linux/mtd/rawnand.h      | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index 04c2cf74eff3..6e2f61fbc5f0 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -95,6 +95,15 @@ void nand_decode_ext_id(struct nand_chip *chip);
 void panic_nand_wait(struct nand_chip *chip, unsigned long timeo);
 void sanitize_string(uint8_t *s, size_t len);
 
+static inline int nand_exec_op(struct nand_chip *chip,
+			       const struct nand_operation *op)
+{
+	if (!chip->exec_op)
+		return -ENOTSUPP;
+
+	return chip->exec_op(chip, op, false);
+}
+
 /* BBT functions */
 int nand_markbad_bbt(struct nand_chip *chip, loff_t offs);
 int nand_isreserved_bbt(struct nand_chip *chip, loff_t offs);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 4e91a70ede10..85dd89abcd22 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1098,15 +1098,6 @@ struct nand_chip {
 	} manufacturer;
 };
 
-static inline int nand_exec_op(struct nand_chip *chip,
-			       const struct nand_operation *op)
-{
-	if (!chip->exec_op)
-		return -ENOTSUPP;
-
-	return chip->exec_op(chip, op, false);
-}
-
 extern const struct mtd_ooblayout_ops nand_ooblayout_sp_ops;
 extern const struct mtd_ooblayout_ops nand_ooblayout_lp_ops;
 
-- 
2.17.1
