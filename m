Received: from mail-wg0-x232.google.com ([2a00:1450:400c:c00::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuZx-0004rW-V4
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:14 +0000
Received: by wgha1 with SMTP id a1so42793886wgh.5
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:41:47 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 08/60] mtd: devices: sst251: show device in sysfs
Date: Tue,  3 Mar 2015 22:39:52 +0100
Message-Id: <1425418844-25177-9-git-send-email-fransklaver@gmail.com>
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
2.2.2
