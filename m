Received: from mail-wg0-x241.google.com ([2a00:1450:400c:c00::241])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mnK-0003oQ-5s
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:40:18 +0000
Received: by wggx12 with SMTP id x12so8981973wgg.3
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:56 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 44/60] mtd: nand: orion_nand: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:38:58 +0200
Message-Id: <1433968754-10651-45-git-send-email-fransklaver@gmail.com>
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
 drivers/mtd/nand/orion_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index c3c6d30..81897ef 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -124,7 +124,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	}
 
 	mtd->priv = nc;
-	mtd->owner = THIS_MODULE;
+	mtd->dev.parent = &pdev->dev;
 
 	nc->priv = board;
 	nc->IO_ADDR_R = nc->IO_ADDR_W = io_base;
-- 
2.4.0
