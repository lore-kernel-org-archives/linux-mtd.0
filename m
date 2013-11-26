Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlDCI-0002lV-An
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 07:36:39 +0000
From: Sourav Poddar <sourav.poddar@ti.com>
To: <computersforpeace@gmail.com>, <broonie@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH 14/17] drivers: mtd: m25p80: Adapt driver to support memory
 mapped read.
Date: Tue, 26 Nov 2013 13:05:10 +0530
Message-ID: <1385451313-1875-15-git-send-email-sourav.poddar@ti.com>
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

Adapt driver to do a memory mapped read.

Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
---
 drivers/mtd/devices/m25p80.c |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 6a27677..b7ed4be 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -514,6 +514,7 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 	size_t *retlen, u_char *buf)
 {
 	struct m25p *flash = mtd_to_m25p(mtd);
+	struct spi_master *master = flash->spi->master;
 	struct spi_transfer t[2];
 	struct spi_message m;
 	uint8_t opcode;
@@ -522,6 +523,14 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 	pr_debug("%s: %s from 0x%08x, len %zd\n", dev_name(&flash->spi->dev),
 			__func__, (u32)from, len);
 
+	if (master->mmap) {
+		master->get_buf(master);
+		memcpy(buf, master->mem + from, len);
+		master->put_buf(master);
+		*retlen = len;
+		goto out;
+	}
+
 	spi_message_init(&m);
 	memset(t, 0, (sizeof t));
 
@@ -559,6 +568,7 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	mutex_unlock(&flash->lock);
 
+out:
 	return 0;
 }
 
@@ -1285,6 +1295,9 @@ static int m25p_probe(struct spi_device *spi)
 		flash->addr_width = 3;
 	}
 
+	if (spi->master->configure_from_slave)
+		m25p80_fill_flash_information(flash);
+
 	dev_info(&spi->dev, "%s (%lld Kbytes)\n", id->name,
 			(long long)flash->mtd.size >> 10);
 
-- 
1.7.1
