Received: from mx.radiofid.ru ([31.193.125.156])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aTCnR-0004TP-TF
 for linux-mtd@lists.infradead.org; Tue, 09 Feb 2016 18:14:14 +0000
Received: from MAIL2.radiofid.local (mail2.radiofid.local [192.168.106.210])
 by mail.radiofid.ru (Postfix) with ESMTP id 048F7170C6
 for <linux-mtd@lists.infradead.org>; Tue,  9 Feb 2016 21:12:47 +0300 (MSK)
From: Nikita Nazarenko <nnazarenko@radiofid.com>
To: <linux-mtd@lists.infradead.org>
CC: Nikita Nazarenko <nnazarenko@radiofid.com>
Subject: [PATCH] mtd: spi-nor: Add support for ISSI is25lp128
Date: Tue, 9 Feb 2016 21:12:43 +0300
Message-ID: <1455041563-12483-1-git-send-email-nnazarenko@radiofid.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Nikita Nazarenko <nnazarenko@radiofid.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index ed0c19c..e0bb151 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -739,6 +739,7 @@ static const struct flash_info spi_nor_ids[] = {
 
 	/* ISSI */
 	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
+	{ "is25lp128", INFO(0x9d6018, 0, 32 * 1024,   512, SECT_4K) },
 
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
-- 
2.7.0
