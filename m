Received: from mail-pa0-f47.google.com ([209.85.220.47])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEU9J-00030Q-EB
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2013 01:02:18 +0000
Received: by mail-pa0-f47.google.com with SMTP id kl13so5489516pab.20
 for <linux-mtd@lists.infradead.org>; Tue, 27 Aug 2013 18:01:52 -0700 (PDT)
From: wangyuhang <wangyuhang2014@gmail.com>
To: broonie@kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, pekon@ti.com
Subject: [PATCH] spi: dual and quad support(add single macro)
Date: Wed, 28 Aug 2013 09:00:42 +0800
Message-Id: <1377651642-3988-1-git-send-email-wangyuhang2014@gmail.com>
Cc: wangyuhang <wangyuhang2014@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

fix using default value to specify SINGLE mode in patch:
commit id:f477b7fb13df2b843997559ff34e87d054ba6538

Add SPI_TX_SINGLE and SPI_RX_SINGLE to specify SINGLE mode.

Signed-off-by: wangyuhang <wangyuhang2014@gmail.com>
---
 drivers/spi/spi.c       |    4 ++++
 include/linux/spi/spi.h |    4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 8d191f2..dbcd406 100644
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
