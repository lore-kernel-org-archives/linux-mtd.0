Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlDC8-0002jm-Ai
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 07:36:29 +0000
From: Sourav Poddar <sourav.poddar@ti.com>
To: <computersforpeace@gmail.com>, <broonie@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH 12/17] spi/qspi: convert driver to enable/disable memory
 mapped.
Date: Tue, 26 Nov 2013 13:05:08 +0530
Message-ID: <1385451313-1875-13-git-send-email-sourav.poddar@ti.com>
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

Idea is to enable memory mapped by default at the end of the probe,
if the control reaches the "transfer" api, then the operation is
not a memory mapped one. Hence, we switch to Normal mode and at the
end of the "transfer" function. switch back to memory mapped mode.

Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
---
 drivers/spi/spi-ti-qspi.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
index d21d40d..ba95d64 100644
--- a/drivers/spi/spi-ti-qspi.c
+++ b/drivers/spi/spi-ti-qspi.c
@@ -415,6 +415,8 @@ static int ti_qspi_start_transfer_one(struct spi_master *master,
 	int status = 0, ret;
 	int frame_length;
 
+	disable_qspi_memory_mapped(qspi);
+
 	/* setup device control reg */
 	qspi->dc = 0;
 
@@ -460,6 +462,8 @@ static int ti_qspi_start_transfer_one(struct spi_master *master,
 
 	ti_qspi_write(qspi, qspi->cmd | QSPI_INVAL, QSPI_SPI_CMD_REG);
 
+	enable_qspi_memory_mapped(qspi);
+
 	return status;
 }
 
@@ -613,6 +617,8 @@ static int ti_qspi_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_master;
 
+	enable_qspi_memory_mapped(qspi);
+
 	return 0;
 
 free_master:
-- 
1.7.1
