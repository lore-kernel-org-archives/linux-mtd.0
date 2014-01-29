Received: from mail-ie0-x229.google.com ([2607:f8b0:4001:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8d2k-0002DB-VH
 for linux-mtd@lists.infradead.org; Wed, 29 Jan 2014 21:51:36 +0000
Received: by mail-ie0-f169.google.com with SMTP id to1so2730633ieb.14
 for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2014 13:51:13 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: m25p80: add Macronix mx66l1g55g 1Gbit SPI flash
Date: Wed, 29 Jan 2014 13:43:46 -0800
Message-Id: <1391031826-28794-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 1e147a849c35..5124b649d68c 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -940,6 +940,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
 	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, M25P80_QUAD_READ) },
+	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, M25P80_QUAD_READ) },
 
 	/* Micron */
 	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, 0) },
-- 
1.8.3.2
