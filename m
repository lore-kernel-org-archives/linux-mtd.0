Received: from mail-wg0-f65.google.com ([74.125.82.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mms-0000BI-GW
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:39:51 +0000
Received: by wggx12 with SMTP id x12so8978959wgg.1
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:28 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 18/60] mtd: maps: plat_ram: drop owner assignment
Date: Wed, 10 Jun 2015 22:38:32 +0200
Message-Id: <1433968754-10651-19-git-send-email-fransklaver@gmail.com>
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

Owner is automatically set by mtdcore. Make use of that.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/maps/plat-ram.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
index 4b65c08..5157289 100644
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -210,7 +210,6 @@ static int platram_probe(struct platform_device *pdev)
 		goto exit_free;
 	}
 
-	info->mtd->owner = THIS_MODULE;
 	info->mtd->dev.parent = &pdev->dev;
 
 	platram_setrw(info, PLATRAM_RW);
-- 
2.4.0
