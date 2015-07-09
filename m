From: Ranjit Waghmode <ranjit.waghmode@xilinx.com>
To: <broonie@kernel.org>, <michal.simek@xilinx.com>,
 <soren.brinkmann@xilinx.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <zajec5@gmail.com>, <marex@denx.de>,
 <shijie.huang@intel.com>, <juhosg@openwrt.org>, <ben@decadent.org.uk>
CC: <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <harinik@xilinx.com>, <punnaia@xilinx.com>, <ran27jit@gmail.com>, Ranjit
 Waghmode <ranjit.waghmode@xilinx.com>
Subject: [RFC PATCH 2/2] spi: zynqmp: gqspi: add support for stacked mode
 configuration
Date: Thu, 9 Jul 2015 18:14:55 +0530
Message-ID: <1436445895-25504-3-git-send-email-ranjit.waghmode@xilinx.com>
In-Reply-To: <1436445895-25504-1-git-send-email-ranjit.waghmode@xilinx.com>
References: <1436445895-25504-1-git-send-email-ranjit.waghmode@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds support of stacked mode configuration for
Zynq Ultrascale+ MPSoC GQSPI controller driver.

Signed-off-by: Ranjit Waghmode <ranjit.waghmode@xilinx.com>
---
 drivers/spi/spi-zynqmp-gqspi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index 271fa80..6c9f7d9 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -410,6 +410,10 @@ static void zynqmp_qspi_chipselect(struct spi_device *qspi, bool is_high)
 		zynqmp_gqspi_selectslave(xqspi,
 				GQSPI_SELECT_FLASH_CS_BOTH,
 				GQSPI_SELECT_FLASH_BUS_BOTH);
+	} else if (qspi->master->flags & SPI_MASTER_U_PAGE) {
+		zynqmp_gqspi_selectflash(xqspi,
+				GQSPI_SELECT_FLASH_CS_UPPER,
+				GQSPI_SELECT_FLASH_BUS_LOWER);
 	} else {
 		zynqmp_gqspi_selectslave(xqspi,
 				GQSPI_SELECT_FLASH_CS_LOWER,
--
2.1.2
