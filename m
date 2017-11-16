Received: from ec2-18-194-220-216.eu-central-1.compute.amazonaws.com
 ([18.194.220.216] helo=sysam.it)
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eFPYp-00058p-Do
 for linux-mtd@lists.infradead.org; Thu, 16 Nov 2017 19:10:52 +0000
Date: Thu, 16 Nov 2017 20:09:51 +0100
From: Angelo Dureghello <angelo@sysam.it>
To: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 cyrille.pitchen@wedev4u.fr
Subject: [PATCH v2] mtd: spi-nor: add support for ISSI is25lp128
Message-ID: <20171116190950.odsscmakabyi26cc@jerusalem>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for ISSI is25lp128 spi nor flash.

Signed-off-by: Angelo Dureghello <angelo@sysam.it>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 19c000722cbc..88cd10a0ee9e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1005,6 +1005,7 @@ static const struct flash_info spi_nor_ids[] = {
 
 	/* ISSI */
 	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
+	{ "is25lp128", INFO(0x9d6018, 0, 64 * 1024,   256, SECT_4K) },
 
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
-- 
2.15.0
