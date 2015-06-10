Received: from mail-wi0-x244.google.com ([2a00:1450:400c:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mnL-0000Mx-8F
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:40:19 +0000
Received: by wivz2 with SMTP id z2so11959735wiv.0
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:57 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 45/60] mtd: nand: pasemi_nand: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:38:59 +0200
Message-Id: <1433968754-10651-46-git-send-email-fransklaver@gmail.com>
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

While at it, make use of the default owner value set by mtdcore.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/pasemi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pasemi_nand.c b/drivers/mtd/nand/pasemi_nand.c
index 66c345b..83cf021 100644
--- a/drivers/mtd/nand/pasemi_nand.c
+++ b/drivers/mtd/nand/pasemi_nand.c
@@ -124,7 +124,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 
 	/* Link the private data with the MTD structure */
 	pasemi_nand_mtd->priv = chip;
-	pasemi_nand_mtd->owner = THIS_MODULE;
+	pasemi_nand_mtd->dev.parent = &ofdev->dev;
 
 	chip->IO_ADDR_R = of_iomap(np, 0);
 	chip->IO_ADDR_W = chip->IO_ADDR_R;
-- 
2.4.0
