Received: from www.osadl.org ([62.245.132.105])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccxFS-0001Lk-6J
 for linux-mtd@lists.infradead.org; Sun, 12 Feb 2017 16:43:43 +0000
From: Nicholas Mc Guire <der.herr@hofr.at>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nicholas Mc Guire <der.herr@hofr.at>
Subject: [PATCH] spi-nor: use ERR_CAST in return
Date: Sun, 12 Feb 2017 17:43:43 +0100
Message-Id: <1486917823-23569-1-git-send-email-der.herr@hofr.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fixes a sparse warning about 

Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>
---

sparse complained about:
drivers/mtd/spi-nor/intel-spi.c:731:28: warning: incorrect type in return expression (different address spaces)
drivers/mtd/spi-nor/intel-spi.c:731:28:    expected struct intel_spi *
drivers/mtd/spi-nor/intel-spi.c:731:28:    got void [noderef] <asn:2>*base

Patch was compile tested with: multi_v7_defconfig (implies CONFIG_MTD_SPI_NOR=y)

Patch is against 4.10-rc6 (localversion-next is next-20170210)

 drivers/mtd/spi-nor/intel-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
index e43ce63..986a3d0 100644
--- a/drivers/mtd/spi-nor/intel-spi.c
+++ b/drivers/mtd/spi-nor/intel-spi.c
@@ -728,7 +728,7 @@ struct intel_spi *intel_spi_probe(struct device *dev,
 
 	ispi->base = devm_ioremap_resource(dev, mem);
 	if (IS_ERR(ispi->base))
-		return ispi->base;
+		return ERR_CAST(ispi->base);
 
 	ispi->dev = dev;
 	ispi->info = info;
-- 
2.1.4
