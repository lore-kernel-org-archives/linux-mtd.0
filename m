Received: from mail-da0-f53.google.com ([209.85.210.53])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U90ma-0000rW-Sn
 for linux-mtd@lists.infradead.org; Fri, 22 Feb 2013 22:07:57 +0000
Received: by mail-da0-f53.google.com with SMTP id g27so553997dan.26
 for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2013 14:07:54 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd: m25p80: n25q064 is Micron, not Intel/Numonyx
Date: Fri, 22 Feb 2013 14:07:22 -0800
Message-Id: <1361570842-6442-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
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
 drivers/mtd/devices/m25p80.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 5b6b072..ae3c8c6 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -740,7 +740,6 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
 	{ "320s33b",  INFO(0x898912, 0, 64 * 1024,  64, 0) },
 	{ "640s33b",  INFO(0x898913, 0, 64 * 1024, 128, 0) },
-	{ "n25q064",  INFO(0x20ba17, 0, 64 * 1024, 128, 0) },
 
 	/* Macronix */
 	{ "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4, SECT_4K) },
@@ -755,6 +754,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
 
 	/* Micron */
+	{ "n25q064",  INFO(0x20ba17, 0, 64 * 1024, 128, 0) },
 	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024, 256, 0) },
 	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024, 256, 0) },
 	{ "n25q256a", INFO(0x20ba19, 0, 64 * 1024, 512, SECT_4K) },
-- 
1.8.1.1
