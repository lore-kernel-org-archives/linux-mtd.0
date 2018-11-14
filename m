Received: from smtprz14.163.net ([106.3.154.247] helo=smtp.tom.com)
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMuib-0004nM-Ow
 for linux-mtd@lists.infradead.org; Wed, 14 Nov 2018 12:56:30 +0000
Received: from antispam1.tom.com (unknown [172.25.16.55])
 by freemail01.tom.com (Postfix) with ESMTP id E0DF61C80EDE
 for <linux-mtd@lists.infradead.org>; Wed, 14 Nov 2018 20:56:15 +0800 (CST)
Received: from antispam1.tom.com (antispam1.tom.com [127.0.0.1])
 by antispam1.tom.com (Postfix) with ESMTP id DB3941001566
 for <linux-mtd@lists.infradead.org>; Wed, 14 Nov 2018 20:56:15 +0800 (CST)
Received: from antispam1.tom.com ([127.0.0.1])
 by antispam1.tom.com (antispam1.tom.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CdCgFn9Of4bb for <linux-mtd@lists.infradead.org>;
 Wed, 14 Nov 2018 20:56:15 +0800 (CST)
From: Liu Xiang <liu.xiang6@zte.com.cn>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, boris.brezillon@bootlin.com,
 marek.vasut@gmail.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 richard@nod.at, liuxiang_1999@126.com, Liu Xiang <liu.xiang6@zte.com.cn>
Subject: [PATCH] mtd: spi-nor: Return error when nor->addr_width not match the
 device size
Date: Wed, 14 Nov 2018 20:56:05 +0800
Message-Id: <1542200165-3073-1-git-send-email-liu.xiang6@zte.com.cn>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In is25lp256, the DWORD1 of JEDEC Basic Flash Parameter Header
is 0xfff920e5. So the DWORD1[18:17] Address Bytes bits are 0b00,
means that 3-Byte only addressing. But the device size is larger
than 16MB, nor->addr_width must be 4 to access the whole address.
An error should be returned when nor->addr_width not match
the device size in spi_nor_parse_sfdp().

Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>
---
 drivers/mtd/spi-nor/spi-nor.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 3eba13a..77eaf22 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2669,6 +2669,10 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	}
 	params->size >>= 3; /* Convert to bytes. */
 
+	/*if the device exceeds 16MiB, addr_width must be 4*/
+	if ((params->size > 0x1000000) && (nor->addr_width == 3))
+		return -EINVAL;
+
 	/* Fast Read settings. */
 	for (i = 0; i < ARRAY_SIZE(sfdp_bfpt_reads); i++) {
 		const struct sfdp_bfpt_read *rd = &sfdp_bfpt_reads[i];
-- 
1.9.1
