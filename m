Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuGTX-0006G1-Gy
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2015 09:04:56 +0000
Received: by wmeg8 with SMTP id g8so7179668wme.1
 for <linux-mtd@lists.infradead.org>; Thu, 05 Nov 2015 01:04:33 -0800 (PST)
From: Andreas Fenkart <afenkart@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Andreas Fenkart <andreas.fenkart@dev.digitalstrom.org>
Subject: [PATCH] spi-nor: mx25l3205d/mx25l6405d: append SECT_4K
Date: Thu,  5 Nov 2015 10:04:23 +0100
Message-Id: <1446714263-4374-1-git-send-email-andreas.fenkart@dev.digitalstrom.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

according datasheet both chips can erase 4kByte sectors individually

Signed-off-by: Andreas Fenkart <andreas.fenkart@dev.digitalstrom.org>
---
 drivers/mtd/spi-nor/spi-nor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 14a5d23..abf7cb4 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -565,9 +565,9 @@ static const struct spi_device_id spi_nor_ids[] = {
 	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8, SECT_4K) },
 	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16, 0) },
 	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
-	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, 0) },
+	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
-	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, 0) },
+	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
 	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
-- 
2.6.1
