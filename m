Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEJKg-0003Fm-9s
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 17:15:11 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <marek.vasut@gmail.com>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 1/1] mtd: spi-nor: remove WARN_ONCE() message in
 spi_nor_write()
Date: Tue, 6 Dec 2016 18:14:24 +0100
Message-ID: <0078578d0f5d2402ac623afabf601d25998f84a9.1481044434.git.cyrille.pitchen@atmel.com>
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

This patch removes the WARN_ONCE() test in spi_nor_write().
This macro triggers the display of a warning message almost every time we
use a UBI file-system because a write operation is performed at offset 64,
which is in the middle of the SPI NOR memory page. This is a valid
operation for ubifs.

Hence this warning is pretty annoying and useless so we just remove it.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Suggested-by: Richard Weinberger <richard@nod.at>
Suggested-by: Andras Szemzo <szemzo.andras@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c9bcd05ca5d9..cdeb2c6b1492 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1265,9 +1265,6 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 		ssize_t written;
 
 		page_offset = (to + i) & (nor->page_size - 1);
-		WARN_ONCE(page_offset,
-			  "Writing at offset %zu into a NOR page. Writing partial pages may decrease reliability and increase wear of NOR flash.",
-			  page_offset);
 		/* the size of data remaining on the first page */
 		page_remain = min_t(size_t,
 				    nor->page_size - page_offset, len - i);
-- 
2.7.4
