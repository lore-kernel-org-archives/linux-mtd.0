Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDg2E-0000H8-WF
 for linux-mtd@lists.infradead.org; Wed, 24 May 2017 23:49:50 +0000
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: linux-mtd@lists.infradead.org, andrew@lunn.ch, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 linux-kernel@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [PATCH v4 2/5] mtd: mchp23k256: switch to mtd_device_register()
Date: Thu, 25 May 2017 11:49:13 +1200
Message-Id: <20170524234916.16181-3-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20170524234916.16181-1-chris.packham@alliedtelesis.co.nz>
References: <20170524234916.16181-1-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use mtd_device_register() instead of mtd_device_parse_register() to
eliminate two unused parameters.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Andrew Lunn <andrew@lunn.ch>
---
Changes in v2
- collect review/test from Andrew
Changes in v3:
- None
Changes in v4:
- None

 drivers/mtd/devices/mchp23k256.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
index 9d8306a15833..2542f5b8b63f 100644
--- a/drivers/mtd/devices/mchp23k256.c
+++ b/drivers/mtd/devices/mchp23k256.c
@@ -151,9 +151,8 @@ static int mchp23k256_probe(struct spi_device *spi)
 	flash->mtd._read	= mchp23k256_read;
 	flash->mtd._write	= mchp23k256_write;
 
-	err = mtd_device_parse_register(&flash->mtd, NULL, NULL,
-					data ? data->parts : NULL,
-					data ? data->nr_parts : 0);
+	err = mtd_device_register(&flash->mtd, data ? data->parts : NULL,
+				  data ? data->nr_parts : 0);
 	if (err)
 		return err;
 
-- 
2.13.0
