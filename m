Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK0ry-0001yr-RC
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 09:08:20 +0000
Date: 28 Jul 2015 09:07:57 -0000
Message-Id: <cb552b89554df49d1e6a24ce45b48c9e203f3b37.1438073915.git.hramrach@gmail.com>
In-Reply-To: <cover.1438073915.git.hramrach@gmail.com>
References: <cover.1438073915.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH 1/2] mtd: spi-nor: Add GD25LQ32C 1.8V SPI NOR flash ID
To: David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>,
  "Rafał Miłecki" <zajec5@gmail.com>, Huang Shijie <shijie.huang@intel.com>,
  Marek Vasut <marex@denx.de>, Michal Suchanek <hramrach@gmail.com>,
  Ben Hutchings <ben@decadent.org.uk>,
  "Bean Huo 霍斌斌 \(beanhuo\)" <beanhuo@micron.com>,
  linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This 1.8V SPI NOR flash is found on ARM Chromebook XE303C and reads
something like 25LQ32VIG in the middle.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d78831b..cba3bd0 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -559,6 +559,7 @@ static const struct spi_device_id spi_nor_ids[] = {
 
 	/* GigaDevice */
 	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
+	{ "gd25lq32c", INFO(0xc86016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "gd25q128", INFO(0xc84018, 0, 64 * 1024, 256, SECT_4K) },
 
-- 
2.1.4
