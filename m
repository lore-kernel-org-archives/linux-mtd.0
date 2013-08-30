Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VFLbI-0001Th-1R
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2013 10:06:44 +0000
Received: by mail-pa0-f44.google.com with SMTP id fz6so2142891pac.3
 for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2013 03:06:21 -0700 (PDT)
From: wangyuhang <wangyuhang2014@gmail.com>
To: broonie@kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, pekon@ti.com
Subject: [PATCH 1/2] spi: dual and quad support(add single macro)
Date: Fri, 30 Aug 2013 18:05:09 +0800
Message-Id: <1377857110-6882-1-git-send-email-wangyuhang2014@gmail.com>
Cc: wangyuhang <wangyuhang2014@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

fix using default value to specify single mode in patch:
commit id:f477b7fb13df2b843997559ff34e87d054ba6538

Using mode & ~(DUAL | QUAD) to specify SINGLE mode, instead
of using default value in mode. Which means if select neither
DUAL nor QUAD, SINGLE will be in use.

Signed-off-by: wangyuhang <wangyuhang2014@gmail.com>
---
 drivers/spi/spi.c |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 8d191f2..6653913 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -872,10 +872,15 @@ static void of_register_spi_devices(struct spi_master *master)
 		/* Device DUAL/QUAD mode */
 		prop = of_get_property(nc, "spi-tmax-nbits", &len);
 		if (!prop || len < sizeof(*prop)) {
-			/* set tx mode in SINGLE as default */
+			/*
+			 * set tx mode in SINGLE as default
+			 * if select neither DUAL nor QUAD, regarded as single.
+			 */
+			spi->mode &= ~(SPI_TX_DUAL | SPI_TX_QUAD);
 		} else {
 			switch (be32_to_cpup(prop)) {
 			case SPI_NBITS_SINGLE:
+				spi->mode &= ~(SPI_TX_DUAL | SPI_TX_QUAD);
 				break;
 			case SPI_NBITS_DUAL:
 				spi->mode |= SPI_TX_DUAL;
@@ -893,9 +898,11 @@ static void of_register_spi_devices(struct spi_master *master)
 		prop = of_get_property(nc, "spi-rmax-nbits", &len);
 		if (!prop || len < sizeof(*prop)) {
 			/* set rx mode in SINGLE as default */
+			spi->mode &= ~(SPI_RX_DUAL | SPI_RX_QUAD);
 		} else {
 			switch (be32_to_cpup(prop)) {
 			case SPI_NBITS_SINGLE:
+				spi->mode &= ~(SPI_RX_DUAL | SPI_RX_QUAD);
 				break;
 			case SPI_NBITS_DUAL:
 				spi->mode |= SPI_RX_DUAL;
-- 
1.7.9.5
