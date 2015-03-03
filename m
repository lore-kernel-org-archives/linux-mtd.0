Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuZv-00073W-TC
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:13 +0000
Received: by wiwl15 with SMTP id l15so26121425wiw.3
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:41:50 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 11/60] mtd: maps: gpio-addr-flash: show device in sysfs
Date: Tue,  3 Mar 2015 22:39:55 +0100
Message-Id: <1425418844-25177-12-git-send-email-fransklaver@gmail.com>
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

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/maps/gpio-addr-flash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index 2fb3460..385305e 100644
--- a/drivers/mtd/maps/gpio-addr-flash.c
+++ b/drivers/mtd/maps/gpio-addr-flash.c
@@ -266,7 +266,7 @@ static int gpio_flash_probe(struct platform_device *pdev)
 		kfree(state);
 		return -ENXIO;
 	}
-
+	state->mtd->dev.parent = &pdev->dev;
 
 	mtd_device_parse_register(state->mtd, part_probe_types, NULL,
 				  pdata->parts, pdata->nr_parts);
-- 
2.2.2
