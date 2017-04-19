Received: from 6.mo177.mail-out.ovh.net ([46.105.51.249])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0qAR-000515-4l
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 14:01:13 +0000
Received: from player779.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id CB29D530C5
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 16:00:48 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 1/2] mtd: spi-nor: Add support for Macronix mx66l1g45g spi
 flash
Date: Wed, 19 Apr 2017 16:00:19 +0200
Message-Id: <1492610420-12397-2-git-send-email-clg@kaod.org>
In-Reply-To: <1492610420-12397-1-git-send-email-clg@kaod.org>
References: <1492610420-12397-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These modules are used on the OpenPOWER Witherspoon systems to hold
the POWER9 host firmware image. The SPI_NOR_DUAL_READ flags is added
for the Aspeed SoCs which do not support QUAD reads.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 The line is over 80 characters but it looks better.

 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 747645c74134..ee777df4466c 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1020,6 +1020,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K) },
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
 	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
+	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
 
 	/* Micron */
-- 
2.7.4
