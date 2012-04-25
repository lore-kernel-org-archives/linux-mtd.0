Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN2ou-000051-F0
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 14:03:51 +0000
Received: by wgbds1 with SMTP id ds1so79461wgb.18
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 07:03:46 -0700 (PDT)
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-mtd@lists.infradead.org,
	linux-sh@vger.kernel.org
Subject: [PATCH v2 01/10] mtd: sh_flctl: Add missing iounmap()
Date: Wed, 25 Apr 2012 16:03:29 +0200
Message-Id: <1335362618-4559-2-git-send-email-hechtb@gmail.com>
In-Reply-To: <1335362618-4559-1-git-send-email-hechtb@gmail.com>
References: <1335362618-4559-1-git-send-email-hechtb@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pichart <laurent.pinchart@ideasonboard.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add the unmapping for the error case and for the driver removal.

Signed-off-by: Bastian Hecht <hechtb@gmail.com>
---
 drivers/mtd/nand/sh_flctl.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 2ee9a1b..ed86a64 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -919,6 +919,7 @@ static int __devinit flctl_probe(struct platform_device *pdev)
 
 err_chip:
 	pm_runtime_disable(&pdev->dev);
+	iounmap(flctl->reg);
 err_iomap:
 	kfree(flctl);
 	return ret;
@@ -930,6 +931,7 @@ static int __devexit flctl_remove(struct platform_device *pdev)
 
 	nand_release(&flctl->mtd);
 	pm_runtime_disable(&pdev->dev);
+	iounmap(flctl->reg);
 	kfree(flctl);
 
 	return 0;
-- 
1.7.5.4
