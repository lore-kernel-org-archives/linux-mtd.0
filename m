Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlDC5-0002iI-Bp
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 07:36:26 +0000
From: Sourav Poddar <sourav.poddar@ti.com>
To: <computersforpeace@gmail.com>, <broonie@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH 10/17] spi/spi.h: Add mmap flag in spi master.
Date: Tue, 26 Nov 2013 13:05:06 +0530
Message-ID: <1385451313-1875-11-git-send-email-sourav.poddar@ti.com>
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

Add "mmap" flag which can be used to show that the master
controller supports memory mapped operations.

Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
---
 include/linux/spi/spi.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 72565ff..9425ea4 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -299,6 +299,7 @@ static inline void spi_unregister_driver(struct spi_driver *sdrv)
  *      to be configured from slave specifics information(typical use case for
  *      SPI flash device).
  * @mem: memory mapped address to be filled by master controller driver.
+ * @mmap: Shows that master controller supports memory mapped operation.
  * Each SPI master controller can communicate with one or more @spi_device
  * children.  These make a small bus, sharing MOSI, MISO and SCK signals
  * but not chip select signals.  Each device may be configured to use a
@@ -437,6 +438,7 @@ struct spi_master {
 
 	/* gpio chip select */
 	int			*cs_gpios;
+	bool	mmap;
 };
 
 static inline void *spi_master_get_devdata(struct spi_master *master)
-- 
1.7.1
