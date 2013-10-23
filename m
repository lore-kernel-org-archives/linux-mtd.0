Received: from mail-oa0-x22c.google.com ([2607:f8b0:4003:c02::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZ5F5-0007m6-Va
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2013 20:41:24 +0000
Received: by mail-oa0-f44.google.com with SMTP id l20so1469251oag.17
 for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2013 13:41:02 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: m25p80: add support for Macronix mx25l3255e
Date: Wed, 23 Oct 2013 13:40:42 -0700
Message-Id: <1382560842-428-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A new 32Gbit SPI NOR flash from Macronix. Nothing special.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>
---
 drivers/mtd/devices/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 8d6c87be..72c37f0 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -778,6 +778,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16, 0) },
 	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
 	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, 0) },
+	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
 	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, 0) },
 	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
-- 
1.8.4
