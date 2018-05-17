Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJ8qd-0008VO-2A
 for linux-mtd@lists.infradead.org; Thu, 17 May 2018 02:40:56 +0000
Received: by mail-pl0-x244.google.com with SMTP id v24-v6so1571927plo.3
 for <linux-mtd@lists.infradead.org>; Wed, 16 May 2018 19:40:44 -0700 (PDT)
From: YuheiOKAWA <tochiro.srchack@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: YuheiOKAWA <tochiro.srchack@gmail.com>
Subject: [PATCH] mtd: spi-nor: Add support for EN25QH32
Date: Thu, 17 May 2018 11:40:27 +0900
Message-Id: <1526524827-30380-1-git-send-email-tochiro.srchack@gmail.com>
In-Reply-To: <1526524384-30303-1-git-send-email-tochiro.srchack@gmail.com>
References: <1526524384-30303-1-git-send-email-tochiro.srchack@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for Eon en25qh32 spi nor flash.

Sorry, very sorry.
I had misspelled it. chip name is en25qh32, non en25ph32.

Signed-off-by: YuheiOKAWA <tochiro.srchack@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 5bfa36e..7bc556c 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -980,6 +980,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "en25q32b",   INFO(0x1c3016, 0, 64 * 1024,   64, 0) },
 	{ "en25p64",    INFO(0x1c2017, 0, 64 * 1024,  128, 0) },
 	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
+	{ "en25qh32",   INFO(0x1c7016, 0, 64 * 1024,   64, 0) },
 	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256, 0) },
 	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512, 0) },
 	{ "en25s64",	INFO(0x1c3817, 0, 64 * 1024,  128, SECT_4K) },
-- 
2.7.4
