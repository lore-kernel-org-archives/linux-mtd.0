Received: from mail-yw0-f193.google.com ([209.85.161.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cUesY-0003ee-Kq
 for linux-mtd@lists.infradead.org; Fri, 20 Jan 2017 19:29:44 +0000
Received: by mail-yw0-f193.google.com with SMTP id u68so12079605ywg.0
 for <linux-mtd@lists.infradead.org>; Fri, 20 Jan 2017 11:29:21 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-spi@vger.kernel.org, f.fainelli@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH, 1/1] mtd: spi-nor: Added support for gd25q16
Date: Fri, 20 Jan 2017 14:25:51 -0500
Message-Id: <1484940351-8145-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add GigaDevice GD25Q16 (16M-bit) to supported list.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index da7cd69..8530d51 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -833,6 +833,11 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 
 	/* GigaDevice */
 	{
+		"gd25q16", INFO(0xc84015, 0, 64 * 1024,  32,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
 		"gd25q32", INFO(0xc84016, 0, 64 * 1024,  64,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-- 
1.9.1
