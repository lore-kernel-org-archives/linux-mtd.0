Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlDBb-0002fe-9D
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 07:35:56 +0000
From: Sourav Poddar <sourav.poddar@ti.com>
To: <computersforpeace@gmail.com>, <broonie@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH 02/17] spi/spi.h: Add configure from slave support.
Date: Tue, 26 Nov 2013 13:04:58 +0530
Message-ID: <1385451313-1875-3-git-send-email-sourav.poddar@ti.com>
In-Reply-To: <1385451313-1875-1-git-send-email-sourav.poddar@ti.com>
References: <1385451313-1875-1-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, Sourav Poddar <sourav.poddar@ti.com>,
 linux-omap@vger.kernel.org, bcousson@baylibre.com, balbi@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are few use cases encountered where the master controller
depends on the slave parameters for some of its register
configure. Add an api in spi master which can be used to enable the
above feature.

Typical usecase encountered till now is
- ti qspi controller required flash opcodes to configure its set up
   register for memory mapped operations.

There was another discussion on some LUT registers for some other
qspi controller in mailing list, these feature can also be used for
that case also.

Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
---
 include/linux/spi/spi.h |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 3b3743d..4be969a 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -295,6 +295,9 @@ static inline void spi_unregister_driver(struct spi_driver *sdrv)
  *       know the address to be used for memcopy.
  * @put_buf: Used for memory mapped cases after get_buf, after the memcpy
  *       has finished.
+ * @configure_from_slave: Used when SPI controller has registers which need
+ *      to be configured from slave specifics information(typical use case for
+ *      SPI flash device).
  * Each SPI master controller can communicate with one or more @spi_device
  * children.  These make a small bus, sharing MOSI, MISO and SCK signals
  * but not chip select signals.  Each device may be configured to use a
@@ -427,6 +430,7 @@ struct spi_master {
 
 	void	(*get_buf)(struct spi_master *master);
 	void	(*put_buf)(struct spi_master *master);
+	void	(*configure_from_slave)(struct spi_device *spi, u8 *val);
 
 	/* gpio chip select */
 	int			*cs_gpios;
-- 
1.7.1
