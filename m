Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3o9Q-0006aX-Ny
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 16:51:40 +0000
Date: 1 Dec 2015 16:51:06 -0000
Message-Id: <8c34c7790244489c2ce0072c72bd9bc7c4cdb965.1448988089.git.hramrach@gmail.com>
In-Reply-To: <cover.1448988089.git.hramrach@gmail.com>
References: <cover.1448988089.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH v5 08/10] spi: expose master transfer size limitation.
To: Heiner Kallweit <hkallweit1@gmail.com>,
  David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
  Mark Brown <broonie@kernel.org>, Michal Suchanek <hramrach@gmail.com>,
  Boris Brezillon <boris.brezillon@free-electrons.com>,
  Javier Martinez Canillas <javier@osg.samsung.com>,
  Stephen Warren <swarren@nvidia.com>, "Andrew F. Davis" <afd@ti.com>,
  Marek Vasut <marex@denx.de>, "Rafał Miłecki" <zajec5@gmail.com>,
  Mika Westerberg <mika.westerberg@linux.intel.com>,
  Gabor Juhos <juhosg@openwrt.org>,
  "Bean Huo 霍斌斌 " <beanhuo@micron.com>,
  Furquan Shaikh <furquan@google.com>, linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On some SPI controllers it is not feasible to transfer arbitrary amount
of data at once.

When the limit on transfer size is a few kilobytes at least it makes
sense to use the SPI hardware rather than reverting to gpio driver.

The protocol drivers need a way to check that they do not sent overly
long messages, though.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 include/linux/spi/spi.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index cce80e6..9598bae 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -425,6 +425,12 @@ struct spi_master {
 #define SPI_MASTER_MUST_RX      BIT(3)		/* requires rx */
 #define SPI_MASTER_MUST_TX      BIT(4)		/* requires tx */
 
+	/*
+	 * on some hardware transfer size may be constrained
+	 * the limit may depend on device transfer settings
+	 */
+	size_t (*max_transfer_size)(struct spi_device *spi);
+
 	/* lock and mutex for SPI bus locking */
 	spinlock_t		bus_lock_spinlock;
 	struct mutex		bus_lock_mutex;
@@ -832,6 +838,15 @@ extern int spi_async(struct spi_device *spi, struct spi_message *message);
 extern int spi_async_locked(struct spi_device *spi,
 			    struct spi_message *message);
 
+static inline size_t
+spi_max_transfer_size(struct spi_device *spi)
+{
+	struct spi_master *master = spi->master;
+	if (!master->max_transfer_size)
+		return 0;
+	return master->max_transfer_size(spi);
+}
+
 /*---------------------------------------------------------------------------*/
 
 /* All these synchronous SPI transfer routines are utilities layered
-- 
2.6.2
