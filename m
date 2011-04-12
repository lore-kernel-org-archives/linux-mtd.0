Received: from smtp-out-051.synserver.de ([212.40.185.51]
	helo=smtp-out-049.synserver.de)
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9jny-00043A-Qo
	for linux-mtd@lists.infradead.org; Tue, 12 Apr 2011 20:03:19 +0000
From: Lars-Peter Clausen <lars@metafoo.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 1/2] MTD: s3c2410_nand: Add option to disable hw ECC at runtime
Date: Tue, 12 Apr 2011 21:47:51 +0200
Message-Id: <1302637672-25339-1-git-send-email-lars@metafoo.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-kernel@vger.kernel.org,
	Holger Freyther <zecke@openmoko.org>, Lars-Peter Clausen <lars@metafoo.de>,
	linux-mtd@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Holger Freyther <zecke@openmoko.org>

This patch adds a flag to the s3c2410_nand platform data, which configures
whether hardware ECC is used.

Currently it is only possible to decide whether hw ECC should be used or not at
compile time through a config option. But if you want to build a kernel which
runs on multiple devices you might have a configuration where some devices
require hw ECC and some devices which want software ECC.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 arch/arm/plat-samsung/include/plat/nand.h |    1 +
 drivers/mtd/nand/s3c2410.c                |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/nand.h b/arch/arm/plat-samsung/include/plat/nand.h
index b64115f..cbdc8f0 100644
--- a/arch/arm/plat-samsung/include/plat/nand.h
+++ b/arch/arm/plat-samsung/include/plat/nand.h
@@ -49,6 +49,7 @@ struct s3c2410_platform_nand {
 	int	twrph1;	/* time for release CLE/ALE from nWE/nOE inactive */
 
 	unsigned int	ignore_unset_ecc:1;
+	unsigned int	software_ecc:1; /* force software ecc at runtime */
 
 	int			nr_sets;
 	struct s3c2410_nand_set *sets;
diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index cea775a..4666b5e 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -842,7 +842,7 @@ static void s3c2410_nand_init_chip(struct s3c2410_nand_info *info,
 	nmtd->mtd.owner    = THIS_MODULE;
 	nmtd->set	   = set;
 
-	if (hardware_ecc) {
+	if (!(info->platform && info->platform->software_ecc) && hardware_ecc) {
 		chip->ecc.calculate = s3c2410_nand_calculate_ecc;
 		chip->ecc.correct   = s3c2410_nand_correct_data;
 		chip->ecc.mode	    = NAND_ECC_HW;
-- 
1.7.2.5
