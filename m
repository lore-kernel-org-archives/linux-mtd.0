Received: from mail-wg0-x244.google.com ([2a00:1450:400c:c00::244])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mmf-00056q-HS
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:39:38 +0000
Received: by wggx12 with SMTP id x12so8977191wgg.3
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:19 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 10/60] mtd: maps: bfin-async-flash: show parent device in
 sysfs
Date: Wed, 10 Jun 2015 22:38:24 +0200
Message-Id: <1433968754-10651-11-git-send-email-fransklaver@gmail.com>
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

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/maps/bfin-async-flash.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/maps/bfin-async-flash.c b/drivers/mtd/maps/bfin-async-flash.c
index 41730fe..d10356c 100644
--- a/drivers/mtd/maps/bfin-async-flash.c
+++ b/drivers/mtd/maps/bfin-async-flash.c
@@ -163,6 +163,7 @@ static int bfin_flash_probe(struct platform_device *pdev)
 		kfree(state);
 		return -ENXIO;
 	}
+	state->mtd.dev.parent = &pdev->dev;
 
 	mtd_device_parse_register(state->mtd, part_probe_types, NULL,
 				  pdata->parts, pdata->nr_parts);
-- 
2.4.0
