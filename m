Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlDBq-0002gS-Bp
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 07:36:12 +0000
From: Sourav Poddar <sourav.poddar@ti.com>
To: <computersforpeace@gmail.com>, <broonie@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH 06/17] spi/qspi: Add support to switc to memory mapped
 operation.
Date: Tue, 26 Nov 2013 13:05:02 +0530
Message-ID: <1385451313-1875-7-git-send-email-sourav.poddar@ti.com>
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

These add apis that can be used to switch to memory mapped operatons
by configuring control module and qspi registers.

Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
---
 drivers/spi/spi-ti-qspi.c |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
index 39aefd7..40f1c35 100644
--- a/drivers/spi/spi-ti-qspi.c
+++ b/drivers/spi/spi-ti-qspi.c
@@ -113,6 +113,10 @@ struct ti_qspi {
 #define QSPI_CSPOL(n)			(1 << (1 + n * 8))
 #define QSPI_CKPOL(n)			(1 << (n * 8))
 
+#define MM_SWITCH	(1 << 0)
+#define MEM_CS		(1 << 8)
+#define MEM_CS_DIS	(0 << 8)
+
 #define	QSPI_FRAME			4096
 
 #define QSPI_AUTOSUSPEND_TIMEOUT         2000
@@ -129,6 +133,30 @@ static inline void ti_qspi_write(struct ti_qspi *qspi,
 	writel(val, qspi->base + reg);
 }
 
+void enable_qspi_memory_mapped(struct ti_qspi *qspi)
+{
+	u32 val;
+
+	ti_qspi_write(qspi, MM_SWITCH, QSPI_SPI_SWITCH_REG);
+	if (qspi->ctrl_mod) {
+		val = readl(qspi->ctrl_base);
+		val |= MEM_CS;
+		writel(val, qspi->ctrl_base);
+	}
+}
+
+void disable_qspi_memory_mapped(struct ti_qspi *qspi)
+{
+	u32 val;
+
+	ti_qspi_write(qspi, ~MM_SWITCH, QSPI_SPI_SWITCH_REG);
+	if (qspi->ctrl_mod) {
+		val = readl(qspi->ctrl_base);
+		val &= MEM_CS_DIS;
+		writel(val, qspi->ctrl_base);
+	}
+}
+
 static int ti_qspi_setup(struct spi_device *spi)
 {
 	struct ti_qspi	*qspi = spi_master_get_devdata(spi->master);
-- 
1.7.1
