Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dArgp-0003aG-JO
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 05:40:06 +0000
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: dwmw2@infradead.org, computersforpeace@gmail.com, andrew@lunn.ch,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [PATCH 3/4] mtd: mchp23k256: add partitioning support
Date: Wed, 17 May 2017 17:39:07 +1200
Message-Id: <20170517053908.26138-4-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
References: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Setting the of_node for the mtd device allows the generic mtd code to
setup the partitions. Additionally we must specify a non-zero erasesize
for the partitions to be writeable.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/mtd/devices/mchp23k256.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
index 2542f5b8b63f..02c6b9dcbd3e 100644
--- a/drivers/mtd/devices/mchp23k256.c
+++ b/drivers/mtd/devices/mchp23k256.c
@@ -143,6 +143,7 @@ static int mchp23k256_probe(struct spi_device *spi)
 
 	data = dev_get_platdata(&spi->dev);
 
+	mtd_set_of_node(&flash->mtd, spi->dev.of_node);
 	flash->mtd.dev.parent	= &spi->dev;
 	flash->mtd.type		= MTD_RAM;
 	flash->mtd.flags	= MTD_CAP_RAM;
@@ -151,6 +152,10 @@ static int mchp23k256_probe(struct spi_device *spi)
 	flash->mtd._read	= mchp23k256_read;
 	flash->mtd._write	= mchp23k256_write;
 
+	flash->mtd.erasesize = PAGE_SIZE;
+	while (flash->mtd.size & (flash->mtd.erasesize - 1))
+		flash->mtd.erasesize >>= 1;
+
 	err = mtd_device_register(&flash->mtd, data ? data->parts : NULL,
 				  data ? data->nr_parts : 0);
 	if (err)
-- 
2.11.0.24.ge6920cf
