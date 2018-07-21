Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgqaI-00088W-99
 for linux-mtd@lists.infradead.org; Sat, 21 Jul 2018 12:02:03 +0000
Received: by mail-lf1-x144.google.com with SMTP id j143-v6so3474471lfj.12
 for <linux-mtd@lists.infradead.org>; Sat, 21 Jul 2018 05:01:51 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Bert Kenward <bkenward@solarflare.com>, linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/2] mtd: spi-nor: intel-spi: use mtd_device_register()
Date: Sat, 21 Jul 2018 13:55:10 +0200
Message-Id: <20180721115510.24078-2-zajec5@gmail.com>
In-Reply-To: <20180721115510.24078-1-zajec5@gmail.com>
References: <20180721115510.24078-1-zajec5@gmail.com>
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
 drivers/mtd/spi-nor/intel-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
index d2cbfc27826e..af0a22019516 100644
--- a/drivers/mtd/spi-nor/intel-spi.c
+++ b/drivers/mtd/spi-nor/intel-spi.c
@@ -908,7 +908,7 @@ struct intel_spi *intel_spi_probe(struct device *dev,
 	if (!ispi->writeable || !writeable)
 		ispi->nor.mtd.flags &= ~MTD_WRITEABLE;
 
-	ret = mtd_device_parse_register(&ispi->nor.mtd, NULL, NULL, &part, 1);
+	ret = mtd_device_register(&ispi->nor.mtd, &part, 1);
 	if (ret)
 		return ERR_PTR(ret);
 
-- 
2.13.7
