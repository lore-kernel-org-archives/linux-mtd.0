Received: from mail-wg0-x22a.google.com ([2a00:1450:400c:c00::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSua0-0004s2-6J
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:16 +0000
Received: by wggx13 with SMTP id x13so2614554wgg.4
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:41:54 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 15/60] mtd: maps: latch-addr-flash: show device in sysfs
Date: Tue,  3 Mar 2015 22:39:59 +0100
Message-Id: <1425418844-25177-16-git-send-email-fransklaver@gmail.com>
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

Fix a bug where mtd devices aren't shown in sysfs.

While at it, make use of the default owner value set by mtdcore.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/maps/latch-addr-flash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/latch-addr-flash.c b/drivers/mtd/maps/latch-addr-flash.c
index cadfbe0..6dc97aa 100644
--- a/drivers/mtd/maps/latch-addr-flash.c
+++ b/drivers/mtd/maps/latch-addr-flash.c
@@ -195,7 +195,7 @@ static int latch_addr_flash_probe(struct platform_device *dev)
 		err = -ENODEV;
 		goto iounmap;
 	}
-	info->mtd->owner = THIS_MODULE;
+	info->mtd->dev.parent = &dev->dev;
 
 	mtd_device_parse_register(info->mtd, NULL, NULL,
 				  latch_addr_data->parts,
-- 
2.2.2
