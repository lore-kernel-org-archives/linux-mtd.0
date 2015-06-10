Received: from mail-wi0-x244.google.com ([2a00:1450:400c:c05::244])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mml-0003it-9z
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:39:43 +0000
Received: by wibbw19 with SMTP id bw19so11970774wib.2
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:24 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 15/60] mtd: maps: latch-addr-flash: show parent device in
 sysfs
Date: Wed, 10 Jun 2015 22:38:29 +0200
Message-Id: <1433968754-10651-16-git-send-email-fransklaver@gmail.com>
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
2.4.0
