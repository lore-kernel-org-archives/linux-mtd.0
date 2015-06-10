Received: from mail-wg0-x241.google.com ([2a00:1450:400c:c00::241])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mmq-0003iu-GK
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:39:48 +0000
Received: by wggx12 with SMTP id x12so8978096wgg.3
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:26 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 16/60] mtd: maps: physmap: drop owner assignment
Date: Wed, 10 Jun 2015 22:38:30 +0200
Message-Id: <1433968754-10651-17-git-send-email-fransklaver@gmail.com>
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
 drivers/mtd/maps/physmap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 4305fd6..cc2adbb 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -167,7 +167,6 @@ static int physmap_flash_probe(struct platform_device *dev)
 		} else {
 			devices_found++;
 		}
-		info->mtd[i]->owner = THIS_MODULE;
 		info->mtd[i]->dev.parent = &dev->dev;
 	}
 
-- 
2.4.0
