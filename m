Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lexf2-0008Fm-6p
	for linux-mtd@lists.infradead.org; Wed, 04 Mar 2009 20:25:52 +0000
Message-Id: <200903042001.n24K1UwO028753@imap1.linux-foundation.org>
Subject: [patch 02/15] mtd: Blackfin NFC Driver: mark
	bf5xx_nand_add_partition() as __devinit
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 04 Mar 2009 12:01:29 -0800
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	cooloney@kernel.org, vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mike Frysinger <vapier.adi@gmail.com>

The bf5xx_nand_add_partition() func is only called by __devinit functions,
so put it into the __devinit section as well

Signed-off-by: Mike Frysinger <vapier.adi@gmail.com>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/bf5xx_nand.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN drivers/mtd/nand/bf5xx_nand.c~blackfin-nfc-driver-mark-bf5xx_nand_add_partition-as-__devinit drivers/mtd/nand/bf5xx_nand.c
--- a/drivers/mtd/nand/bf5xx_nand.c~blackfin-nfc-driver-mark-bf5xx_nand_add_partition-as-__devinit
+++ a/drivers/mtd/nand/bf5xx_nand.c
@@ -630,7 +630,7 @@ static int bf5xx_nand_hw_init(struct bf5
 /*
  * Device management interface
  */
-static int bf5xx_nand_add_partition(struct bf5xx_nand_info *info)
+static int __devinit bf5xx_nand_add_partition(struct bf5xx_nand_info *info)
 {
 	struct mtd_info *mtd = &info->mtd;
 
_
