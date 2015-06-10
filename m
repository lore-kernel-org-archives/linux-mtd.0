Received: from mail-wi0-x243.google.com ([2a00:1450:400c:c05::243])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mnX-0003sD-Ek
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:40:32 +0000
Received: by wibbw19 with SMTP id bw19so11979350wib.2
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:40:13 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 60/60] staging: mt29f_spinand: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:39:14 +0200
Message-Id: <1433968754-10651-61-git-send-email-fransklaver@gmail.com>
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
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/mt29f_spinand/mt29f_spinand.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
index 7285c64..c066ee0 100644
--- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
+++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
@@ -912,8 +912,7 @@ static int spinand_probe(struct spi_device *spi_nand)
 	dev_set_drvdata(&spi_nand->dev, mtd);
 
 	mtd->priv = chip;
-	mtd->name = dev_name(&spi_nand->dev);
-	mtd->owner = THIS_MODULE;
+	mtd->dev.parent = &spi_nand->dev;
 	mtd->oobsize = 64;
 
 	if (nand_scan(mtd, 1))
-- 
2.4.0
