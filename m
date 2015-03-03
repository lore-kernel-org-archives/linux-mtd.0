Received: from mail-wg0-x235.google.com ([2a00:1450:400c:c00::235])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuZw-00073x-IF
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:13 +0000
Received: by wggx12 with SMTP id x12so42789298wgg.6
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:41:56 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 17/60] mtd: maps: physmap_of: drop owner assignment
Date: Tue,  3 Mar 2015 22:40:01 +0100
Message-Id: <1425418844-25177-18-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
References: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
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
 drivers/mtd/maps/physmap_of.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index ff26e97..10954f7 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -288,7 +288,6 @@ static int of_flash_probe(struct platform_device *dev)
 		} else {
 			info->list_size++;
 		}
-		info->list[i].mtd->owner = THIS_MODULE;
 		info->list[i].mtd->dev.parent = &dev->dev;
 	}
 
-- 
2.2.2
