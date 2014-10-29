Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjPIA-00067n-GN
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 09:11:54 +0000
Received: by mail-wi0-f170.google.com with SMTP id q5so969902wiv.1
 for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2014 02:10:56 -0700 (PDT)
From: Rostislav Lisovy <lisovy@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: spi-nor: Add support for Fujitsu MB85RS1MT FRAM
Date: Wed, 29 Oct 2014 10:10:47 +0100
Message-Id: <1414573847-15897-1-git-send-email-lisovy@merica.cz>
Cc: Marek Vasut <marex@denx.de>, Rostislav Lisovy <lisovy@merica.cz>,
 Rafal Milecki <zajec5@gmail.com>, lisovy@gmail.com, michal.vokac@comap.cz,
 Ben Hutchings <ben@decadent.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tested with this particular FRAM chip

Signed-off-by: Rostislav Lisovy <lisovy@merica.cz>
Acked-by: Marek Vasut <marex@denx.de>
---
Changes since v1:
* Rebased to the newest linux-next

 drivers/mtd/spi-nor/spi-nor.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index a98c134..37a1c39 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -507,6 +507,9 @@ static const struct spi_device_id spi_nor_ids[] = {
 	{ "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
 	{ "mr25h10",  CAT25_INFO(128 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
 
+	/* Fujitsu */
+	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE) },
+
 	/* GigaDevice */
 	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128, SECT_4K) },
-- 
1.9.1
