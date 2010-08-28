Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OpE51-0008EB-M4
	for linux-mtd@lists.infradead.org; Sat, 28 Aug 2010 05:35:52 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: Blackfin NFC: fix build error after nand_scan_ident()
	change
Date: Sat, 28 Aug 2010 01:45:00 -0400
Message-Id: <1282974300-11664-1-git-send-email-vapier@gentoo.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org,
	Andrew Morton <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Seems some patches got out sync when being merged.  The Blackfin NFC
driver was updated to use nand_scan_ident(), but it missed the change
where nand_scan_ident() now takes 3 arguments.  So update this driver
to fix build failures.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
note: this needs to be merged before 2.6.36 final

 drivers/mtd/nand/bf5xx_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index a382e3d..162c5ea 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -710,7 +710,7 @@ static int bf5xx_nand_scan(struct mtd_info *mtd)
 	struct nand_chip *chip = mtd->priv;
 	int ret;
 
-	ret = nand_scan_ident(mtd, 1);
+	ret = nand_scan_ident(mtd, 1, NULL);
 	if (ret)
 		return ret;
 
-- 
1.7.2.2
