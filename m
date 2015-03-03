Received: from mail-wg0-x229.google.com ([2a00:1450:400c:c00::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuac-0004xx-HV
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:55 +0000
Received: by wggx12 with SMTP id x12so42792477wgg.6
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:42:35 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 60/60] staging: mt29f_spinand: show device in sysfs
Date: Tue,  3 Mar 2015 22:40:44 +0100
Message-Id: <1425418844-25177-61-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
References: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frans Klaver <fransklaver@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix a bug where mtd devices aren't shown in sysfs.

While at it, take advantage of the default owner and name values set by
mtdcore.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/staging/mt29f_spinand/mt29f_spinand.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
index 3b191fc..b672b0b 100644
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
2.2.2
