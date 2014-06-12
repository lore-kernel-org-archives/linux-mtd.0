Received: from mail-la0-x22a.google.com ([2a00:1450:4010:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wv5oI-00067S-TZ
 for linux-mtd@lists.infradead.org; Thu, 12 Jun 2014 14:16:59 +0000
Received: by mail-la0-f42.google.com with SMTP id el20so744845lab.29
 for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2014 07:16:33 -0700 (PDT)
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2] mtd: spi-nor: add support for EON EN25QH128
Date: Thu, 12 Jun 2014 18:16:46 +0400
Message-Id: <1402582606-3523-1-git-send-email-ryazanov.s.a@gmail.com>
In-Reply-To: <1402439742-31999-1-git-send-email-ryazanov.s.a@gmail.com>
References: <1402439742-31999-1-git-send-email-ryazanov.s.a@gmail.com>
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
v2
* Rebased on l2-mtd.git
* Patch spi-nor instead of m25p80
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c713c86..ac1fefc 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -449,6 +449,7 @@ const struct spi_device_id spi_nor_ids[] = {
 	{ "en25q32b",   INFO(0x1c3016, 0, 64 * 1024,   64, 0) },
 	{ "en25p64",    INFO(0x1c2017, 0, 64 * 1024,  128, 0) },
 	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
+	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256, 0) },
 	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512, 0) },
 
 	/* ESMT */
-- 
1.8.1.5
