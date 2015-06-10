Received: from mail-wi0-x244.google.com ([2a00:1450:400c:c05::244])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mnW-0003r6-Cr
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:40:31 +0000
Received: by wibbw19 with SMTP id bw19so11978688wib.2
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:40:09 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 56/60] mtd: onenand: generic: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:39:10 +0200
Message-Id: <1433968754-10651-57-git-send-email-fransklaver@gmail.com>
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

Fix a bug where mtd parent device symlinks aren't shown in sysfs.

While at it, take advantage of the default owner and name values set by
mtdcore.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/onenand/generic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/onenand/generic.c b/drivers/mtd/onenand/generic.c
index 32a216d..9ed801b 100644
--- a/drivers/mtd/onenand/generic.c
+++ b/drivers/mtd/onenand/generic.c
@@ -60,9 +60,8 @@ static int generic_onenand_probe(struct platform_device *pdev)
 	info->onenand.mmcontrol = pdata ? pdata->mmcontrol : NULL;
 	info->onenand.irq = platform_get_irq(pdev, 0);
 
-	info->mtd.name = dev_name(&pdev->dev);
+	info->mtd.dev.parent = &pdev->dev;
 	info->mtd.priv = &info->onenand;
-	info->mtd.owner = THIS_MODULE;
 
 	if (onenand_scan(&info->mtd, 1)) {
 		err = -ENXIO;
-- 
2.4.0
