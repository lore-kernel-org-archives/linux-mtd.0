Received: from mail-wg0-x241.google.com ([2a00:1450:400c:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mnH-0000L1-Lh
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:40:16 +0000
Received: by wggy19 with SMTP id y19so8969533wgg.2
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:53 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 41/60] mtd: nand: ndfc: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:38:55 +0200
Message-Id: <1433968754-10651-42-git-send-email-fransklaver@gmail.com>
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
 drivers/mtd/nand/ndfc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index 3187c6b..9c3f6c8 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -171,7 +171,7 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	chip->priv = ndfc;
 
 	ndfc->mtd.priv = chip;
-	ndfc->mtd.owner = THIS_MODULE;
+	ndfc->mtd.dev.parent = &ndfc->ofdev->dev;
 
 	flash_np = of_get_next_child(node, NULL);
 	if (!flash_np)
-- 
2.4.0
