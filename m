Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NSWVw-0007v6-O5
	for linux-mtd@lists.infradead.org; Wed, 06 Jan 2010 14:05:37 +0000
Received: by bwz4 with SMTP id 4so10832053bwz.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Jan 2010 06:05:31 -0800 (PST)
MIME-Version: 1.0
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 6 Jan 2010 19:35:11 +0530
Message-ID: <ce9ab5791001060605j7a424203lcb90f3d79d0ddfae@mail.gmail.com>
Subject: [PATCH 2/3][NAND][OMAP]: correct 'info' pointer in 'omap_nand_remove'
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-omap@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From bf5256c8c29100c3a55e29a8a5d6718ba5817519 Mon Sep 17 00:00:00 2001
From: Vimal Singh <vimalsingh@ti.com>
Date: Tue, 5 Jan 2010 16:01:08 +0530
Subject: [PATCH] NAND: OMAP: correct 'info' pointer in 'omap_nand_remove'

Removing OMAP NAND driver, when loaded as a module, gives error and
does not get success. This fixes this and makes driver loadable and
removable run time.

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---
 drivers/mtd/nand/omap2.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 4eea97c..16120e2 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1054,7 +1054,8 @@ out_free_info:
 static int omap_nand_remove(struct platform_device *pdev)
 {
 	struct mtd_info *mtd = platform_get_drvdata(pdev);
-	struct omap_nand_info *info = mtd->priv;
+	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
+							mtd);

 	platform_set_drvdata(pdev, NULL);
 	if (use_dma)
-- 
1.5.5
