Received: from mail-wg0-x242.google.com ([2a00:1450:400c:c00::242])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mnP-0003pz-LJ
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:40:23 +0000
Received: by wggx12 with SMTP id x12so8982736wgg.3
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:40:02 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 49/60] mtd: nand: s3c2410: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:39:03 +0200
Message-Id: <1433968754-10651-50-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
References: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
Cc: linux-mtd@lists.infradead.org, Frans Klaver <fransklaver@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix a bug where parent device symlinks aren't shown in sysfs.

While at it, make use of the default owner set by mtdcore.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/s3c2410.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 0e02be4..3ebfdd1 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -832,7 +832,6 @@ static void s3c2410_nand_init_chip(struct s3c2410_nand_info *info,
 
 	nmtd->info	   = info;
 	nmtd->mtd.priv	   = chip;
-	nmtd->mtd.owner    = THIS_MODULE;
 	nmtd->set	   = set;
 
 #ifdef CONFIG_MTD_NAND_S3C2410_HWECC
@@ -1016,6 +1015,7 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
 		pr_debug("initialising set %d (%p, info %p)\n",
 			 setno, nmtd, info);
 
+		nmtd->mtd.dev.parent = &pdev->dev;
 		s3c2410_nand_init_chip(info, nmtd, sets);
 
 		nmtd->scan_res = nand_scan_ident(&nmtd->mtd,
-- 
2.4.0
