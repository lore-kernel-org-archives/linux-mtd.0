Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLkan-0000OH-Tc
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
Subject: [PATCH v3 03/22] mtd: rawnand: legacy: Drop useless test in
 nand_legacy_set_defaults()
Date: Sun, 11 Nov 2018 08:55:05 +0100
Message-Id: <20181111075524.13123-4-boris.brezillon@bootlin.com>
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

nand_legacy_set_defaults() returns directly if chip->exec_op != NULL,
no need to test !chip->exec_op after that.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Tested-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
Changes in v3:
- Add Janusz's T-b

Changes in v2:
- None
---
 drivers/mtd/nand/raw/nand_legacy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_legacy.c b/drivers/mtd/nand/raw/nand_legacy.c
index bf0304c4a640..f76b9356ba9c 100644
--- a/drivers/mtd/nand/raw/nand_legacy.c
+++ b/drivers/mtd/nand/raw/nand_legacy.c
@@ -585,7 +585,7 @@ void nand_legacy_set_defaults(struct nand_chip *chip)
 		chip->legacy.chip_delay = 20;
 
 	/* check, if a user supplied command function given */
-	if (!chip->legacy.cmdfunc && !chip->exec_op)
+	if (!chip->legacy.cmdfunc)
 		chip->legacy.cmdfunc = nand_command;
 
 	/* check, if a user supplied wait function given */
-- 
2.17.1
