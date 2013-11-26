Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlDCF-0002k5-Bp
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 07:36:36 +0000
From: Sourav Poddar <sourav.poddar@ti.com>
To: <computersforpeace@gmail.com>, <broonie@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH 13/17] drivers: mtd: m25p80: Add api to configure master
 register.
Date: Tue, 26 Nov 2013 13:05:09 +0530
Message-ID: <1385451313-1875-14-git-send-email-sourav.poddar@ti.com>
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

These can be used to fill information needed to configure 
master controller registers.

Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
---
 drivers/mtd/devices/m25p80.c |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 7dc2c14..6a27677 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -490,6 +490,23 @@ static inline int m25p80_dummy_cycles_read(struct m25p *flash)
 }
 
 /*
+ * This API can be used to transfer flash information to
+ * SPI controller which needs some of its registers to get
+ * configured on flash.
+ */
+static void m25p80_fill_flash_information(struct m25p *flash)
+{
+	struct spi_master *master = flash->spi->master;
+	u8 info[4];
+	info[0] = flash->read_opcode;
+	info[1] = flash->program_opcode;
+	info[2] = flash->addr_width;
+	info[3] = m25p80_dummy_cycles_read(flash);
+
+	master->configure_from_slave(flash->spi, info);
+}
+
+/*
  * Read an address range from the flash chip.  The address range
  * may be any size provided it is within the physical boundaries.
  */
-- 
1.7.1
