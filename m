Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fduNW-0007Ro-Mr
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2018 09:28:49 +0000
Received: by mail-lf0-x241.google.com with SMTP id f18-v6so10532698lfc.2
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2018 02:28:32 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>, linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 4/4] mtd: sst25l: use mtd_device_register()
Date: Fri, 13 Jul 2018 11:27:34 +0200
Message-Id: <20180713092734.16408-5-zajec5@gmail.com>
In-Reply-To: <20180713092734.16408-1-zajec5@gmail.com>
References: <20180713092734.16408-1-zajec5@gmail.com>
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

From: Rafał Miłecki <rafal@milecki.pl>

This driver doesn't specify parsers so it can use that little helper.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/devices/sst25l.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index 1897f33fe3e7..10d24efb4629 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -394,9 +394,8 @@ static int sst25l_probe(struct spi_device *spi)
 	      flash->mtd.numeraseregions);
 
 
-	ret = mtd_device_parse_register(&flash->mtd, NULL, NULL,
-					data ? data->parts : NULL,
-					data ? data->nr_parts : 0);
+	ret = mtd_device_register(&flash->mtd, data ? data->parts : NULL,
+				  data ? data->nr_parts : 0);
 	if (ret)
 		return -ENODEV;
 
-- 
2.13.7
