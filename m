Received: from mail-la0-x242.google.com ([2a00:1450:4010:c03::242])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mmh-00056o-W8
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:39:40 +0000
Received: by lamq1 with SMTP id q1so5958468lam.0
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:17 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 08/60] mtd: devices: sst251: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:38:22 +0200
Message-Id: <1433968754-10651-9-git-send-email-fransklaver@gmail.com>
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
 drivers/mtd/devices/sst25l.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index c63ecbc..3928014 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -374,9 +374,8 @@ static int sst25l_probe(struct spi_device *spi)
 	data = dev_get_platdata(&spi->dev);
 	if (data && data->name)
 		flash->mtd.name = data->name;
-	else
-		flash->mtd.name = dev_name(&spi->dev);
 
+	flash->mtd.dev.parent   = &spi->dev;
 	flash->mtd.type		= MTD_NORFLASH;
 	flash->mtd.flags	= MTD_CAP_NORFLASH;
 	flash->mtd.erasesize	= flash_info->erase_size;
-- 
2.4.0
