Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlDBy-0002i7-JL
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 07:36:20 +0000
From: Sourav Poddar <sourav.poddar@ti.com>
To: <computersforpeace@gmail.com>, <broonie@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH 09/17] spi/spi.h: Add "mem" variable in spi master.
Date: Tue, 26 Nov 2013 13:05:05 +0530
Message-ID: <1385451313-1875-10-git-send-email-sourav.poddar@ti.com>
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

Add "mem" variable in spi_master, which can be used to hold on the
memory mapped address.

Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
---
 include/linux/spi/spi.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 4be969a..72565ff 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -298,6 +298,7 @@ static inline void spi_unregister_driver(struct spi_driver *sdrv)
  * @configure_from_slave: Used when SPI controller has registers which need
  *      to be configured from slave specifics information(typical use case for
  *      SPI flash device).
+ * @mem: memory mapped address to be filled by master controller driver.
  * Each SPI master controller can communicate with one or more @spi_device
  * children.  These make a small bus, sharing MOSI, MISO and SCK signals
  * but not chip select signals.  Each device may be configured to use a
@@ -432,6 +433,8 @@ struct spi_master {
 	void	(*put_buf)(struct spi_master *master);
 	void	(*configure_from_slave)(struct spi_device *spi, u8 *val);
 
+	void __iomem *mem;
+
 	/* gpio chip select */
 	int			*cs_gpios;
 };
-- 
1.7.1
