From: Arnd Bergmann <arnd@arndb.de>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Wenyou Yang <wenyou.yang@microchip.com>,
 Josh Wu <rainyfeeling@outlook.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Peter Rosin <peda@axentia.se>, Romain Izard <romain.izard.pro@gmail.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] mtd: atmel nand: fix build warning on 64-bit
Date: Mon,  9 Jul 2018 17:57:03 +0200
Message-Id: <20180709155730.2422841-2-arnd@arndb.de>
In-Reply-To: <20180709155730.2422841-1-arnd@arndb.de>
References: <20180709155730.2422841-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Build-testing this driver on a 64-bit architecture produces a
harmless warning:

drivers/mtd/nand/raw/atmel/nand-controller.c: In function 'atmel_smc_nand_controller_init':
drivers/mtd/nand/raw/atmel/nand-controller.c:2053:21: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]

To cast the pointer correctly, the destination type should be
uintptr_t rather than a 32-bit int.

Fixes: c2f3d0b913a5 ("mtd: rawnand: atmel: Allow selection of this driver when COMPILE_TEST=y")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index e686fe73159e..e8f7549d0354 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -2050,7 +2050,7 @@ atmel_smc_nand_controller_init(struct atmel_smc_nand_controller *nc)
 		return ret;
 	}
 
-	nc->ebi_csa_offs = (unsigned int)match->data;
+	nc->ebi_csa_offs = (uintptr_t)match->data;
 
 	/*
 	 * The at91sam9263 has 2 EBIs, if the NAND controller is under EBI1
-- 
2.9.0
