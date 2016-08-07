Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bWU5C-0004eb-Eg
 for linux-mtd@lists.infradead.org; Sun, 07 Aug 2016 19:50:04 +0000
Received: by mail-wm0-x242.google.com with SMTP id i5so11987991wmg.2
 for <linux-mtd@lists.infradead.org>; Sun, 07 Aug 2016 12:49:42 -0700 (PDT)
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 1/3] spi: introduce max message size flag in spi_master
To: Mark Brown <broonie@kernel.org>, Brian Norris <computersforpeace@gmail.com>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Message-ID: <6c95366c-7fcc-ef4c-033a-f9f6e152a669@gmail.com>
Date: Sun, 7 Aug 2016 21:47:18 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
As there are no (known) spi controller with differing size limits for
transfer and message, introduce a flag in spi_master to indicate that
the max transfer size is also the maximum message size.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 include/linux/spi/spi.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 072cb2a..cadb1de 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -312,6 +312,8 @@ static inline void spi_unregister_driver(struct spi_driver *sdrv)
  * @flags: other constraints relevant to this driver
  * @max_transfer_size: function that returns the max transfer size for
  *	a &spi_device; may be %NULL, so the default %SIZE_MAX will be used.
+ * @max_message_size_flag: indicates that max transfer size is also
+ *	max message size
  * @io_mutex: mutex for physical bus access
  * @bus_lock_spinlock: spinlock for SPI bus locking
  * @bus_lock_mutex: mutex for exclusion of multiple callers
@@ -446,6 +448,8 @@ struct spi_master {
 	 * the limit may depend on device transfer settings
 	 */
 	size_t (*max_transfer_size)(struct spi_device *spi);
+	/* flag indicating that max transfer size is also max message size */
+	bool			max_message_size_flag;
 
 	/* I/O mutex */
 	struct mutex		io_mutex;
-- 
2.9.2
