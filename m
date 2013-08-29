Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEqj8-0005Tm-4N
 for linux-mtd@lists.infradead.org; Thu, 29 Aug 2013 01:08:47 +0000
Received: by mail-pa0-f54.google.com with SMTP id kx10so192151pab.13
 for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2013 18:08:23 -0700 (PDT)
From: wangyuhang <wangyuhang2014@gmail.com>
To: broonie@kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, pekon@ti.com
Subject: [PATCH V2] spi: dual and quad support(add single macro)
Date: Thu, 29 Aug 2013 09:01:50 +0800
Message-Id: <1377738110-4219-1-git-send-email-wangyuhang2014@gmail.com>
Cc: wangyuhang <wangyuhang2014@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

fix two things in patch:
commit id:f477b7fb13df2b843997559ff34e87d054ba6538

1.Add SPI_TX_SINGLE and SPI_RX_SINGLE to specify SINGLE mode.
 Instead of using default value in mode.
2.Delete a "return" when commit the patch to a new kernel version
 by mistake. So recover it.

Signed-off-by: wangyuhang <wangyuhang2014@gmail.com>
---
 drivers/spi/spi.c       |    5 +++++
 include/linux/spi/spi.h |    4 ++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 8d191f2..81bdc96 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -873,9 +873,11 @@ static void of_register_spi_devices(struct spi_master *master)
 		prop = of_get_property(nc, "spi-tmax-nbits", &len);
 		if (!prop || len < sizeof(*prop)) {
 			/* set tx mode in SINGLE as default */
+			spi->mode &= SPI_TX_SINGLE;
 		} else {
 			switch (be32_to_cpup(prop)) {
 			case SPI_NBITS_SINGLE:
+				spi->mode &= SPI_TX_SINGLE;
 				break;
 			case SPI_NBITS_DUAL:
 				spi->mode |= SPI_TX_DUAL;
@@ -893,9 +895,11 @@ static void of_register_spi_devices(struct spi_master *master)
 		prop = of_get_property(nc, "spi-rmax-nbits", &len);
 		if (!prop || len < sizeof(*prop)) {
 			/* set rx mode in SINGLE as default */
+			spi->mode &= SPI_RX_SINGLE;
 		} else {
 			switch (be32_to_cpup(prop)) {
 			case SPI_NBITS_SINGLE:
+				spi->mode &= SPI_RX_SINGLE;
 				break;
 			case SPI_NBITS_DUAL:
 				spi->mode |= SPI_RX_DUAL;
@@ -1459,6 +1463,7 @@ static int __spi_async(struct spi_device *spi, struct spi_message *message)
 			return -EINVAL;
 		if (xfer->speed_hz && master->max_speed_hz &&
 		    xfer->speed_hz > master->max_speed_hz)
+			return -EINVAL;
 
 		if (xfer->tx_buf && !xfer->tx_nbits)
 			xfer->tx_nbits = SPI_NBITS_SINGLE;
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index ccd7840..faa138c 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -89,8 +89,12 @@ struct spi_device {
 #define	SPI_READY	0x80			/* slave pulls low to pause */
 #define	SPI_TX_DUAL	0x100			/* transmit with 2 wires */
 #define	SPI_TX_QUAD	0x200			/* transmit with 4 wires */
+/* transmit with 1 wire(not using dual-tx and quad-tx) */
+#define	SPI_TX_SINGLE	~(SPI_TX_DUAL | SPI_TX_QUAD)
 #define	SPI_RX_DUAL	0x400			/* receive with 2 wires */
 #define	SPI_RX_QUAD	0x800			/* receive with 4 wires */
+/* receive with 1 wire(not using dual-rx and quad-rx) */
+#define	SPI_RX_SINGLE	~(SPI_RX_DUAL | SPI_RX_QUAD)
 	u8			bits_per_word;
 	int			irq;
 	void			*controller_state;
-- 
1.7.9.5
