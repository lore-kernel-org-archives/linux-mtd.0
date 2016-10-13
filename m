Received: from aserp1040.oracle.com ([141.146.126.69])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bubQz-0004vO-EQ
 for linux-mtd@lists.infradead.org; Thu, 13 Oct 2016 08:32:14 +0000
Date: Thu, 13 Oct 2016 11:30:39 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marex@denx.de>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [patch 2/2] mtd: spi-nor: Fix some error codes in cqspi_setup_flash()
Message-ID: <20161013080857.GC3389@mwanda>
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

We return success or possibly uninitialized values on these error paths
instead of proper error codes.

Fixes: 140623410536 ("mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 944863b..d489fbd 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -1077,12 +1077,14 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
 
 	/* Get flash device data */
 	for_each_available_child_of_node(dev->of_node, np) {
-		if (of_property_read_u32(np, "reg", &cs)) {
+		ret = of_property_read_u32(np, "reg", &cs);
+		if (ret) {
 			dev_err(dev, "Couldn't determine chip select.\n");
 			goto err;
 		}
 
 		if (cs >= CQSPI_MAX_CHIPSELECT) {
+			ret = -EINVAL;
 			dev_err(dev, "Chip select %d out of range.\n", cs);
 			goto err;
 		}
