Received: from vs81.iboxed.net ([185.82.85.146])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cmmHe-0005vj-Tk
 for linux-mtd@lists.infradead.org; Sat, 11 Mar 2017 19:02:32 +0000
From: Alexander Kurz <akurz@blala.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Alexander Kurz <akurz@blala.de>
Subject: [PATCH v3 1/2] drivers mtd: spi-nor: add Winbond W25Q20 variants
Date: Sat, 11 Mar 2017 20:01:04 +0100
Message-Id: <1489258865-831-1-git-send-email-akurz@blala.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Winbond W25Q20BW devices are used in 4/5th generation Kindle ebook readers.
Add this spi-nor device and the similar W25Q20 devices to the list of known
devices.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/mtd/spi-nor/spi-nor.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 1ae872b..4fbd98c 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1128,6 +1128,9 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "w25x80", INFO(0xef3014, 0, 64 * 1024,  16, SECT_4K) },
 	{ "w25x16", INFO(0xef3015, 0, 64 * 1024,  32, SECT_4K) },
 	{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64, SECT_4K) },
+	{ "w25q20cl", INFO(0xef4012, 0, 64 * 1024,  4, SECT_4K) },
+	{ "w25q20bw", INFO(0xef5012, 0, 64 * 1024,  4, SECT_4K) },
+	{ "w25q20ew", INFO(0xef6012, 0, 64 * 1024,  4, SECT_4K) },
 	{ "w25q32", INFO(0xef4016, 0, 64 * 1024,  64, SECT_4K) },
 	{
 		"w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64,
-- 
2.1.4
