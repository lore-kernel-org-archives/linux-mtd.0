Received: from mail-oa0-x235.google.com ([2607:f8b0:4003:c02::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbfQ4-0002S9-Av
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2013 23:43:24 +0000
Received: by mail-oa0-f53.google.com with SMTP id n12so2270972oag.40
 for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2013 16:43:02 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: m25p80: fixup device removal failure path
Date: Wed, 30 Oct 2013 19:42:51 -0400
Message-Id: <1383176571-28057-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Device removal shouls fail if MTD unregistration fails.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 58978892c321..7eda71dbc183 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -1125,9 +1125,7 @@ static int m25p_remove(struct spi_device *spi)
 	struct m25p	*flash = spi_get_drvdata(spi);
 
 	/* Clean up MTD stuff. */
-	mtd_device_unregister(&flash->mtd);
-
-	return 0;
+	return mtd_device_unregister(&flash->mtd);
 }
 
 
-- 
1.8.1.2
