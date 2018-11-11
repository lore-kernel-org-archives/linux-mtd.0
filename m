Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLkaz-0000QQ-TT
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2018 07:55:51 +0000
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
Subject: [PATCH v3 05/22] mtd: rawnand: Remove unused NAND_CONTROLLER_ALLOC
 flag
Date: Sun, 11 Nov 2018 08:55:07 +0100
Message-Id: <20181111075524.13123-6-boris.brezillon@bootlin.com>
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

Looks like NAND_CONTROLLER_ALLOC has been introduced a long time ago
back when the dummy nand_hw_ctrl object was dynamically allocated
instead of being embedded in nand_chip.

We can safely get rid of this unused flag.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Tested-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
Changes in v3:
- Add Janusz's T-b

Changes in v2:
- None
---
 include/linux/mtd/rawnand.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 85dd89abcd22..2a3dd3e633f1 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -203,10 +203,6 @@ enum nand_ecc_algo {
  */
 #define NAND_IS_BOOT_MEDIUM	0x00400000
 
-/* Options set by nand scan */
-/* Nand scan has allocated controller struct */
-#define NAND_CONTROLLER_ALLOC	0x80000000
-
 /* Cell info constants */
 #define NAND_CI_CHIPNR_MSK	0x03
 #define NAND_CI_CELLTYPE_MSK	0x0C
-- 
2.17.1
