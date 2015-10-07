Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zju7G-0002Qo-QI
 for linux-mtd@lists.infradead.org; Wed, 07 Oct 2015 19:11:07 +0000
Received: by padhy16 with SMTP id hy16so29339710pad.1
 for <linux-mtd@lists.infradead.org>; Wed, 07 Oct 2015 12:10:45 -0700 (PDT)
Received: from achanot-lt
 (173-10-76-58-BusName-Washington.hfc.comcastbusiness.net. [173.10.76.58])
 by smtp.gmail.com with ESMTPSA id lo9sm11588693pab.19.2015.10.07.12.10.44
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Oct 2015 12:10:44 -0700 (PDT)
Date: Wed, 7 Oct 2015 12:10:08 -0700
From: Aurelien Chanot <chanot.a@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: Add support for Micron n25q032a
Message-ID: <20151007191008.GA31411@achanot-lt>
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

The N25Q032A is identical to the N25Q032 except it has a different
supply voltage range. Therefore, it has a new JEDEC ID.

Signed-off-by: Aurelien Chanot <chanot.a@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f59aedf..9122a2e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -585,6 +585,7 @@ static const struct flash_info spi_nor_ids[] = {
 
 	/* Micron */
 	{ "n25q032",	 INFO(0x20ba16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
+	{ "n25q032a",	 INFO(0x20bb16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
 	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SPI_NOR_QUAD_READ) },
-- 
2.1.4
