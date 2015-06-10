Received: from mail-wg0-x241.google.com ([2a00:1450:400c:c00::241])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mnP-0005Lx-Ul
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:40:24 +0000
Received: by wggx12 with SMTP id x12so8983546wgg.3
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:40:07 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 54/60] mtd: nand: tmio_nand: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:39:08 +0200
Message-Id: <1433968754-10651-55-git-send-email-fransklaver@gmail.com>
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

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/tmio_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
index fb8fd35..befddf0 100644
--- a/drivers/mtd/nand/tmio_nand.c
+++ b/drivers/mtd/nand/tmio_nand.c
@@ -382,6 +382,7 @@ static int tmio_probe(struct platform_device *dev)
 	nand_chip = &tmio->chip;
 	mtd->priv = nand_chip;
 	mtd->name = "tmio-nand";
+	mtd->dev.parent = &dev->dev;
 
 	tmio->ccr = devm_ioremap(&dev->dev, ccr->start, resource_size(ccr));
 	if (!tmio->ccr)
-- 
2.4.0
