Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fm3eG-00062B-2W
 for linux-mtd@lists.infradead.org; Sat, 04 Aug 2018 20:59:43 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Mike Dunn <mikedunn@newsguy.com>,
 Sergey Larin <cerg2010cerg2010@mail.ru>
Subject: [PATCH v2 4/4] mtd: rawnand: Do not treat !maxchips specially in
 nand_scan_with_ids()
Date: Sat,  4 Aug 2018 22:59:23 +0200
Message-Id: <20180804205923.25298-4-boris.brezillon@bootlin.com>
In-Reply-To: <20180804205923.25298-1-boris.brezillon@bootlin.com>
References: <20180804205923.25298-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The only reason we were skipping nand_scan_ident() when maxchips == 0
was to make the docg4 to work. Now that this driver is gone we can
remove this special case and return an error when maxchips is 0.

Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v2:
- new patch
---
 drivers/mtd/nand/raw/nand_base.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index b1bc63b76580..7ec5ee31784d 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -6772,9 +6772,7 @@ static void nand_detach(struct nand_chip *chip)
 /**
  * nand_scan_with_ids - [NAND Interface] Scan for the NAND device
  * @mtd: MTD device structure
- * @maxchips: number of chips to scan for. @nand_scan_ident() will not be run if
- *	      this parameter is zero (useful for specific drivers that must
- *	      handle this part of the process themselves, e.g docg4).
+ * @maxchips: number of chips to scan for.
  * @ids: optional flash IDs table
  *
  * This fills out all the uninitialized function pointers with the defaults.
@@ -6787,11 +6785,12 @@ int nand_scan_with_ids(struct mtd_info *mtd, unsigned int maxchips,
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	int ret;
 
-	if (maxchips) {
-		ret = nand_scan_ident(mtd, maxchips, ids);
-		if (ret)
-			return ret;
-	}
+	if (!maxchips)
+		return -EINVAL;
+
+	ret = nand_scan_ident(mtd, maxchips, ids);
+	if (ret)
+		return ret;
 
 	ret = nand_attach(chip);
 	if (ret)
-- 
2.14.1
