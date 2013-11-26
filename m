Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlDBZ-0002fK-Ea
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 07:35:54 +0000
From: Sourav Poddar <sourav.poddar@ti.com>
To: <computersforpeace@gmail.com>, <broonie@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH 01/17] spi/spi.h: Add get_buf/put_buf support in spi master..
Date: Tue, 26 Nov 2013 13:04:57 +0530
Message-ID: <1385451313-1875-2-git-send-email-sourav.poddar@ti.com>
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

Add get_buf, put_buf api support in spi master.
This can be used in a scenario where spi controller
supports memory mapped operations(typically with flash devices).
So, the memcpy needs top be done in slave devices which need the
required memory mapped address. These api can be used to get that
master address.

These can also be used to turm the master controller clock, as usually
the clocks get turned in spi core. But, in memory mapped case, we will
bypass the spi core and hence needa way out to turn on the controller clock.

Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
---
 include/linux/spi/spi.h |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 8c62ba7..3b3743d 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -291,6 +291,10 @@ static inline void spi_unregister_driver(struct spi_driver *sdrv)
  *	number. Any individual value may be -ENOENT for CS lines that
  *	are not GPIOs (driven by the SPI controller itself).
  *
+ * @get_buf: used for memory mapped cases, when the slave device wants to
+ *       know the address to be used for memcopy.
+ * @put_buf: Used for memory mapped cases after get_buf, after the memcpy
+ *       has finished.
  * Each SPI master controller can communicate with one or more @spi_device
  * children.  These make a small bus, sharing MOSI, MISO and SCK signals
  * but not chip select signals.  Each device may be configured to use a
@@ -421,6 +425,9 @@ struct spi_master {
 	int (*transfer_one)(struct spi_master *master, struct spi_device *spi,
 			    struct spi_transfer *transfer);
 
+	void	(*get_buf)(struct spi_master *master);
+	void	(*put_buf)(struct spi_master *master);
+
 	/* gpio chip select */
 	int			*cs_gpios;
 };
-- 
1.7.1
