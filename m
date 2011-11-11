Received: from saturn.retrosnub.co.uk
 ([2001:470:9321:f003:bc9d:1dff:fe9b:7466])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ROuYd-0007vF-U9
 for linux-mtd@lists.infradead.org; Fri, 11 Nov 2011 17:06:28 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: pxa2xx-flash.c: It used to fall back to provided table.
Date: Fri, 11 Nov 2011 17:06:20 +0000
Message-Id: <1321031180-6153-2-git-send-email-jic23@kernel.org>
In-Reply-To: <1321031180-6153-1-git-send-email-jic23@kernel.org>
References: <1321031180-6153-1-git-send-email-jic23@kernel.org>
Cc: dbaryshkov@gmail.com, Artem.Bityutskiy@nokia.com, dwmw2@infradead.org,
 Jonathan Cameron <jic23@cam.ac.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Jonathan Cameron <jic23@cam.ac.uk>

Make this work again.

Signed-off-by: Jonathan Cameron <jic23@cam.ac.uk>
---
 drivers/mtd/maps/pxa2xx-flash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index 411a17d..2a25b67 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -98,7 +98,7 @@ static int __devinit pxa2xx_flash_probe(struct platform_device *pdev)
 	}
 	info->mtd->owner = THIS_MODULE;
 
-	mtd_device_parse_register(info->mtd, probes, 0, NULL, 0);
+	mtd_device_parse_register(info->mtd, probes, 0, flash->parts, flash->nr_parts);
 
 	platform_set_drvdata(pdev, info);
 	return 0;
-- 
1.7.7.2
