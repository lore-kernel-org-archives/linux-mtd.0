Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlDBy-0002hX-Ad
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 07:36:20 +0000
From: Sourav Poddar <sourav.poddar@ti.com>
To: <computersforpeace@gmail.com>, <broonie@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH 08/17] spi/qspi: Add api for get_buf/put_buf.
Date: Tue, 26 Nov 2013 13:05:04 +0530
Message-ID: <1385451313-1875-9-git-send-email-sourav.poddar@ti.com>
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

Adapt qspi driver to use (get_buf/put_buf) pointers added
earlier.
These can be called just before the memcpy operations to get hold
of the memory mapped address and to turn on the controller clocks.

Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
---
 drivers/spi/spi-ti-qspi.c |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
index 2323572..10bcb37 100644
--- a/drivers/spi/spi-ti-qspi.c
+++ b/drivers/spi/spi-ti-qspi.c
@@ -247,6 +247,21 @@ static void ti_qspi_configure_from_slave(struct spi_device *spi, u8 *val)
 	ti_qspi_write(qspi, memval, QSPI_SPI_SETUP0_REG);
 }
 
+static void ti_qspi_get_mem_buf(struct spi_master *master)
+{
+	struct ti_qspi *qspi = spi_master_get_devdata(master);
+
+	pm_runtime_get_sync(qspi->dev);
+	master->mem = qspi->mmap_base;
+}
+
+static void ti_qspi_put_mem_buf(struct spi_master *master)
+{
+	struct ti_qspi *qspi = spi_master_get_devdata(master);
+
+	pm_runtime_put(qspi->dev);
+}
+
 static void ti_qspi_restore_ctx(struct ti_qspi *qspi)
 {
 	struct ti_qspi_regs *ctx_reg = &qspi->ctx_reg;
@@ -515,6 +530,8 @@ static int ti_qspi_probe(struct platform_device *pdev)
 	master->dev.of_node = pdev->dev.of_node;
 	master->bits_per_word_mask = BIT(32 - 1) | BIT(16 - 1) | BIT(8 - 1);
 	master->configure_from_slave = ti_qspi_configure_from_slave;
+	master->get_buf = ti_qspi_get_mem_buf;
+	master->put_buf = ti_qspi_put_mem_buf;
 
 	if (!of_property_read_u32(np, "num-cs", &num_cs))
 		master->num_chipselect = num_cs;
-- 
1.7.1
