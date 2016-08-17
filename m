Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1ba6G9-0000xG-UA
 for linux-mtd@lists.infradead.org; Wed, 17 Aug 2016 19:12:19 +0000
Received: by mail-wm0-x242.google.com with SMTP id i138so122902wmf.3
 for <linux-mtd@lists.infradead.org>; Wed, 17 Aug 2016 12:11:57 -0700 (PDT)
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 1/3] spi: introduce max_message_size hook in spi_master
To: Mark Brown <broonie@kernel.org>, Brian Norris <computersforpeace@gmail.com>
References: <6c95366c-7fcc-ef4c-033a-f9f6e152a669@gmail.com>
 <20160816164204.GV9347@sirena.org.uk>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Message-ID: <69c4ce26-7b41-222e-07b2-92818cedd05f@gmail.com>
Date: Wed, 17 Aug 2016 21:08:01 +0200
MIME-Version: 1.0
In-Reply-To: <20160816164204.GV9347@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Recently a maximum transfer size was was introduced in struct spi_master.
However there are also spi controllers with a maximum message size, e.g.
fsl-espi has a max message size of 64KB.
Introduce a hook max_message_size to deal with such limitations.

Also make sure that spi_max_transfer_size doesn't return greater values
than spi_max_message_size, even if hook max_transfer_size is not set.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- replace the flag with a hook that allows to define a message size
  limit independednt of a potential transfer size limit
---
 include/linux/spi/spi.h | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 072cb2a..f2d3960 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -312,6 +312,8 @@ static inline void spi_unregister_driver(struct spi_driver *sdrv)
  * @flags: other constraints relevant to this driver
  * @max_transfer_size: function that returns the max transfer size for
  *	a &spi_device; may be %NULL, so the default %SIZE_MAX will be used.
+ * @max_message_size: function that returns the max message size for
+ *	a &spi_device; may be %NULL, so the default %SIZE_MAX will be used.
  * @io_mutex: mutex for physical bus access
  * @bus_lock_spinlock: spinlock for SPI bus locking
  * @bus_lock_mutex: mutex for exclusion of multiple callers
@@ -442,10 +444,11 @@ struct spi_master {
 #define SPI_MASTER_MUST_TX      BIT(4)		/* requires tx */
 
 	/*
-	 * on some hardware transfer size may be constrained
+	 * on some hardware transfer / message size may be constrained
 	 * the limit may depend on device transfer settings
 	 */
 	size_t (*max_transfer_size)(struct spi_device *spi);
+	size_t (*max_message_size)(struct spi_device *spi);
 
 	/* I/O mutex */
 	struct mutex		io_mutex;
@@ -905,12 +908,26 @@ extern int spi_async_locked(struct spi_device *spi,
 			    struct spi_message *message);
 
 static inline size_t
-spi_max_transfer_size(struct spi_device *spi)
+spi_max_message_size(struct spi_device *spi)
 {
 	struct spi_master *master = spi->master;
-	if (!master->max_transfer_size)
+	if (!master->max_message_size)
 		return SIZE_MAX;
-	return master->max_transfer_size(spi);
+	return master->max_message_size(spi);
+}
+
+static inline size_t
+spi_max_transfer_size(struct spi_device *spi)
+{
+	struct spi_master *master = spi->master;
+	size_t tr_max = SIZE_MAX;
+	size_t msg_max = spi_max_message_size(spi);
+
+	if (master->max_transfer_size)
+		tr_max = master->max_transfer_size(spi);
+
+	/* transfer size limit must not be greater than messsage size limit */
+	return min(tr_max, msg_max);
 }
 
 /*---------------------------------------------------------------------------*/
-- 
2.9.2
