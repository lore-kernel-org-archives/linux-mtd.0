Received: from aserp1040.oracle.com ([141.146.126.69])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bub4r-0003uO-DW
 for linux-mtd@lists.infradead.org; Thu, 13 Oct 2016 08:09:22 +0000
Date: Thu, 13 Oct 2016 11:06:47 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marex@denx.de>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [patch 1/2] mtd: spi-nor: Off by one in cqspi_setup_flash()
Message-ID: <20161013080646.GB3389@mwanda>
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

There are CQSPI_MAX_CHIPSELECT elements in the ->f_pdata array so the >
should be >=.

Fixes: 140623410536 ('mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index d403ba7..944863b 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -1082,7 +1082,7 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
 			goto err;
 		}
 
-		if (cs > CQSPI_MAX_CHIPSELECT) {
+		if (cs >= CQSPI_MAX_CHIPSELECT) {
 			dev_err(dev, "Chip select %d out of range.\n", cs);
 			goto err;
 		}
