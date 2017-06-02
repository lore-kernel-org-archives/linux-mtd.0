Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGdAO-0004g7-FR
 for linux-mtd@lists.infradead.org; Fri, 02 Jun 2017 03:22:27 +0000
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: linux-mtd@lists.infradead.org, andrew@lunn.ch, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com
Cc: linux-kernel@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [PATCH v5 4/5] mtd: mchp23k256: add partitioning support
Date: Fri,  2 Jun 2017 15:21:18 +1200
Message-Id: <20170602032119.22282-5-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20170602032119.22282-1-chris.packham@alliedtelesis.co.nz>
References: <20170602032119.22282-1-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Setting the of_node for the mtd device allows the generic mtd code to
setup the partitions.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Andrew Lunn <andrew@lunn.ch>
---
Changes in v2
- collect revew/test from Andrew
Changes in v3:
- remove setting of erasesize
Changes in v4:
- none
Changes in v5:
- update commit message

 drivers/mtd/devices/mchp23k256.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
index 2542f5b8b63f..3e5feb454644 100644
--- a/drivers/mtd/devices/mchp23k256.c
+++ b/drivers/mtd/devices/mchp23k256.c
@@ -143,6 +143,7 @@ static int mchp23k256_probe(struct spi_device *spi)
 
 	data = dev_get_platdata(&spi->dev);
 
+	mtd_set_of_node(&flash->mtd, spi->dev.of_node);
 	flash->mtd.dev.parent	= &spi->dev;
 	flash->mtd.type		= MTD_RAM;
 	flash->mtd.flags	= MTD_CAP_RAM;
-- 
2.13.0
