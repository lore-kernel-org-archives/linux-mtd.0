Received: from mail-bk0-f54.google.com ([209.85.214.54])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U4c2A-0007SH-VZ
 for linux-mtd@lists.infradead.org; Sun, 10 Feb 2013 18:53:51 +0000
Received: by mail-bk0-f54.google.com with SMTP id w5so2373676bku.27
 for <linux-mtd@lists.infradead.org>; Sun, 10 Feb 2013 10:53:49 -0800 (PST)
From: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: m25p80: add support for Macronix MX66L51235L
Date: Sun, 10 Feb 2013 19:53:44 +0100
Message-Id: <1360522424-3360-1-git-send-email-daniel.schwierzeck@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 33ec9229..702c3e2 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -663,6 +663,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
 	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
+	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, 0) },
 
 	/* Micron */
 	{ "n25q128",  INFO(0x20ba18, 0, 64 * 1024, 256, 0) },
-- 
1.8.1.1
