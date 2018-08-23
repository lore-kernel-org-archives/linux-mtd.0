Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fsxOf-0003ca-6x
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2018 21:44:06 +0000
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] mtd: rawnand: docg4: Remove wrong __init annotations
Date: Thu, 23 Aug 2018 23:43:45 +0200
Message-Id: <20180823214345.20949-1-geert@linux-m68k.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If gcc (e.g. 4.1.2) decides not to inline init_mtd_structs() and
read_id_reg(), this will cause section mismatches, and crashes:

    WARNING: drivers/mtd/nand/raw/docg4.o(.text+0xc10): Section mismatch in reference from the function docg4_attach_chip() to the function .init.text:init_mtd_structs()
    The function docg4_attach_chip() references
    the function __init init_mtd_structs().
    This is often because docg4_attach_chip lacks a __init
    annotation or the annotation of init_mtd_structs is wrong.

    WARNING: drivers/mtd/nand/raw/docg4.o(.text+0xc3e): Section mismatch in reference from the function docg4_attach_chip() to the function .init.text:read_id_reg()
    The function docg4_attach_chip() references
    the function __init read_id_reg().
    This is often because docg4_attach_chip lacks a __init
    annotation or the annotation of read_id_reg is wrong.

Fix this by dropping the now incorrect __init annotations from
init_mtd_structs() and read_id_reg().

Fixes: 66a38478dcc5b5a3 ("mtd: rawnand: docg4: convert driver to nand_scan()")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/mtd/nand/raw/docg4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/docg4.c b/drivers/mtd/nand/raw/docg4.c
index a3f04315c05c54e6..427fcbc1b71c0551 100644
--- a/drivers/mtd/nand/raw/docg4.c
+++ b/drivers/mtd/nand/raw/docg4.c
@@ -1218,7 +1218,7 @@ static int docg4_resume(struct platform_device *pdev)
 	return 0;
 }
 
-static void __init init_mtd_structs(struct mtd_info *mtd)
+static void init_mtd_structs(struct mtd_info *mtd)
 {
 	/* initialize mtd and nand data structures */
 
@@ -1290,7 +1290,7 @@ static void __init init_mtd_structs(struct mtd_info *mtd)
 
 }
 
-static int __init read_id_reg(struct mtd_info *mtd)
+static int read_id_reg(struct mtd_info *mtd)
 {
 	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct docg4_priv *doc = nand_get_controller_data(nand);
-- 
2.17.1
