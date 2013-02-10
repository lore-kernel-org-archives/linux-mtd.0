Received: from mail-bk0-f48.google.com ([209.85.214.48])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U4c2V-0007T8-KF
 for linux-mtd@lists.infradead.org; Sun, 10 Feb 2013 18:54:11 +0000
Received: by mail-bk0-f48.google.com with SMTP id jf20so2356020bkc.35
 for <linux-mtd@lists.infradead.org>; Sun, 10 Feb 2013 10:54:09 -0800 (PST)
From: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: m25p80: add support for EON EN25QH256
Date: Sun, 10 Feb 2013 19:54:07 +0100
Message-Id: <1360522447-3427-1-git-send-email-daniel.schwierzeck@gmail.com>
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
index 03838ba..33ec9229 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -641,6 +641,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "en25q32b", INFO(0x1c3016, 0, 64 * 1024,  64, 0) },
 	{ "en25p64", INFO(0x1c2017, 0, 64 * 1024, 128, 0) },
 	{ "en25q64", INFO(0x1c3017, 0, 64 * 1024, 128, SECT_4K) },
+	{ "en25qh256", INFO(0x1c7019, 0, 64 * 1024, 512, 0) },
 
 	/* Everspin */
 	{ "mr25h256", CAT25_INFO(  32 * 1024, 1, 256, 2) },
-- 
1.8.1.1
