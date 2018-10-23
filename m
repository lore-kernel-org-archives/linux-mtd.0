Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gF1lE-0005XM-Oi
 for linux-mtd@lists.infradead.org; Tue, 23 Oct 2018 18:50:38 +0000
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
Subject: [PATCH 05/15] mtd: rawnand: Remove unused NAND_CONTROLLER_ALLOC flag
Date: Tue, 23 Oct 2018 20:50:01 +0200
Message-Id: <20181023185011.3356-6-boris.brezillon@bootlin.com>
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

Looks like NAND_CONTROLLER_ALLOC has been introduced a long time ago
back when the dummy nand_hw_ctrl object was dynamically allocated
instead of being embedded in nand_chip.

We can safely get rid of this unused flag.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 include/linux/mtd/rawnand.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index c789026426c1..bcdc3819ad17 100644
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
