Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OdzKM-0000u4-It
	for linux-mtd@lists.infradead.org; Wed, 28 Jul 2010 05:37:15 +0000
Received: by fxm3 with SMTP id 3so1144687fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Jul 2010 22:37:12 -0700 (PDT)
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] gen_nand: Fix support for multiple chips
Date: Wed, 28 Jul 2010 07:36:54 +0200
Message-Id: <1280295414-3354-1-git-send-email-marek.vasut@gmail.com>
Cc: hsweeten@visionengravers.com, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch corrects a problem where gen_nand driver assumed there can be only
one chip and ignored the pdata->chip.nr_chips value.

Signed-off-by: Marek Vasut <marek.vasut@gmail.com>
---
 drivers/mtd/nand/plat_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 8d46731..90e143e 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -91,7 +91,7 @@ static int __devinit plat_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Scan to find existance of the device */
-	if (nand_scan(&data->mtd, 1)) {
+	if (nand_scan(&data->mtd, pdata->chip.nr_chips)) {
 		err = -ENXIO;
 		goto out;
 	}
-- 
1.7.1
