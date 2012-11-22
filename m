Received: from mail-da0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TbQkD-0006JY-HM
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 06:58:42 +0000
Received: by mail-da0-f49.google.com with SMTP id v40so2306725dad.36
 for <linux-mtd@lists.infradead.org>; Wed, 21 Nov 2012 22:58:40 -0800 (PST)
From: Liming Wang <walimisdev@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [resend] [PATCH] mtd: m25p80: modify info for Micron N25Q128
Date: Thu, 22 Nov 2012 14:58:09 +0800
Message-Id: <1353567489-29220-1-git-send-email-walimisdev@gmail.com>
Cc: linux-mtd@lists.infradead.org, Jan Luebbe <jlu@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Micron N25Q128 has two types of flash:

 - One is for 1.8v supply voltage, prefixed with "n25q128a11" and the jedec
   code is 0x20bb18.

 - Another is for 3v supply voltage, prefixed with "n25q128a13" and the jedec
   code is 0x20ba18.

So modify the original type info and add another type for Micron N25Q128.

Signed-off-by: Liming Wang <walimisdev@gmail.com>
---
 drivers/mtd/devices/m25p80.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 03838ba..9945a2a 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -664,7 +664,8 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
 
 	/* Micron */
-	{ "n25q128",  INFO(0x20ba18, 0, 64 * 1024, 256, 0) },
+	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024, 256, 0) },
+	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024, 256, 0) },
 	{ "n25q256a", INFO(0x20ba19, 0, 64 * 1024, 512, SECT_4K) },
 
 	/* Spansion -- single (large) sector size only, at least
-- 
1.7.9.5
