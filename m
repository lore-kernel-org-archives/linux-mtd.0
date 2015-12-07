From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 Josh Wu <josh.wu@atmel.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Stefan Agner <stefan@agner.ch>, Kyungmin Park <kyungmin.park@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
 punnaiah choudary kalluri <punnaia@xilinx.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 04/23] mtd: nand: s3c2410: kill the ->ecc_layout field
Date: Mon,  7 Dec 2015 23:25:59 +0100
Message-Id: <1449527178-5930-5-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1449527178-5930-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1449527178-5930-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The s3c2410 is allowing board data to overload the default ECC layout
defined inside the driver, but this feature is not used by board
specific definitions.
Kill this field so that we can easily move to a model where ecclayout
are dynamically allocated by the NAND controller driver.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 arch/arm/plat-samsung/devs.c                   | 9 ---------
 drivers/mtd/nand/s3c2410.c                     | 3 ---
 include/linux/platform_data/mtd-nand-s3c2410.h | 1 -
 3 files changed, 13 deletions(-)

diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 8207462..a903ee8 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -710,15 +710,6 @@ static int __init s3c_nand_copy_set(struct s3c2410_nand_set *set)
 			return -ENOMEM;
 	}
 
-	if (set->ecc_layout) {
-		ptr = kmemdup(set->ecc_layout,
-			      sizeof(struct nand_ecclayout), GFP_KERNEL);
-		set->ecc_layout = ptr;
-
-		if (!ptr)
-			return -ENOMEM;
-	}
-
 	return 0;
 }
 
diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 05105ca..b569200 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -860,9 +860,6 @@ static void s3c2410_nand_init_chip(struct s3c2410_nand_info *info,
 	chip->ecc.mode	    = NAND_ECC_SOFT;
 #endif
 
-	if (set->ecc_layout != NULL)
-		chip->ecc.layout = set->ecc_layout;
-
 	if (set->disable_ecc)
 		chip->ecc.mode	= NAND_ECC_NONE;
 
diff --git a/include/linux/platform_data/mtd-nand-s3c2410.h b/include/linux/platform_data/mtd-nand-s3c2410.h
index 36bb921..c55e42ee 100644
--- a/include/linux/platform_data/mtd-nand-s3c2410.h
+++ b/include/linux/platform_data/mtd-nand-s3c2410.h
@@ -40,7 +40,6 @@ struct s3c2410_nand_set {
 	char			*name;
 	int			*nr_map;
 	struct mtd_partition	*partitions;
-	struct nand_ecclayout	*ecc_layout;
 };
 
 struct s3c2410_platform_nand {
-- 
2.1.4
