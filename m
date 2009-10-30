Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N3n4N-0005C0-Qv
	for linux-mtd@lists.infradead.org; Fri, 30 Oct 2009 08:42:56 +0000
Received: by mail-bw0-f212.google.com with SMTP id 4so3633358bwz.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 30 Oct 2009 01:42:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <ce9ab5790910292321y1e7239b7pbffe9a5891d66448@mail.gmail.com>
References: <ce9ab5790910292321y1e7239b7pbffe9a5891d66448@mail.gmail.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Fri, 30 Oct 2009 14:12:31 +0530
Message-ID: <ce9ab5790910300142kf12e31cpd6249d4c7383553f@mail.gmail.com>
Subject: Re: [PATCH 2/3]NAND: OMAP: Fixing omap nand driver, compiled as
	module
To: Linux MTD <linux-mtd@lists.infradead.org>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Looping Linux-omap mailing list.


From: Vimal Singh <vimalsingh@ti.com>
Date: Fri, 30 Oct 2009 11:32:17 +0530
Subject: [PATCH] NAND: OMAP: Fixing omap nand driver, compiled as module

Removing OMAP NAND driver, when loaded as a module, gives error and
does not get success. This fixes this and makes driver loadable and
removable run time.

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---
 drivers/mtd/nand/omap2.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 92573d5..ecc4d32 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1056,7 +1056,8 @@ out_free_info:
 static int omap_nand_remove(struct platform_device *pdev)
 {
 	struct mtd_info *mtd = platform_get_drvdata(pdev);
-	struct omap_nand_info *info = mtd->priv;
+	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
+							mtd);

 	platform_set_drvdata(pdev, NULL);
 	if (use_dma)
@@ -1064,7 +1065,9 @@ static int omap_nand_remove(struct platform_device *pdev)

 	/* Release NAND device, its internal structures and partitions */
 	nand_release(&info->mtd);
+	release_mem_region(info->phys_base, NAND_IO_SIZE);
 	iounmap(info->nand_pref_fifo_add);
+	gpmc_cs_free(info->gpmc_cs);
 	kfree(&info->mtd);
 	return 0;
 }
-- 
1.5.5
