Received: from mail-lb0-x233.google.com ([2a00:1450:4010:c04::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuUef-0007A9-Tc
 for linux-mtd@lists.infradead.org; Tue, 10 Jun 2014 22:36:34 +0000
Received: by mail-lb0-f179.google.com with SMTP id u10so945513lbd.24
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jun 2014 15:36:10 -0700 (PDT)
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: m25p80: add support for EON EN25QH128
Date: Wed, 11 Jun 2014 02:35:42 +0400
Message-Id: <1402439742-31999-1-git-send-email-ryazanov.s.a@gmail.com>
Cc: Linux MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 524dab3..ad1399d 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -909,6 +909,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "en25q32b",   INFO(0x1c3016, 0, 64 * 1024,   64, 0) },
 	{ "en25p64",    INFO(0x1c2017, 0, 64 * 1024,  128, 0) },
 	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
+	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256, 0) },
 	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512, 0) },
 
 	/* ESMT */
-- 
1.8.1.5
