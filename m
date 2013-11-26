Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlDBl-0002g3-Qe
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 07:36:07 +0000
From: Sourav Poddar <sourav.poddar@ti.com>
To: <computersforpeace@gmail.com>, <broonie@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH 04/17] spi/qspi: parse control module register.
Date: Tue, 26 Nov 2013 13:05:00 +0530
Message-ID: <1385451313-1875-5-git-send-email-sourav.poddar@ti.com>
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

In qspi controller, we need to switch to memory mapped operations.
These switching depends on

1. For DRA7x: qspi register bit and control module register.
2. For AM437x: qspi register bit.

Hence add support for parsing control module register and provide a
flag "ctrl_mod" which can be used for conditional execution of
control module part.

Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
---
 drivers/spi/spi-ti-qspi.c |   17 ++++++++++++++++-
 1 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
index 67aa905..776e93d 100644
--- a/drivers/spi/spi-ti-qspi.c
+++ b/drivers/spi/spi-ti-qspi.c
@@ -46,6 +46,7 @@ struct ti_qspi {
 
 	struct spi_master	*master;
 	void __iomem            *base;
+	void __iomem            *ctrl_base;
 	struct clk		*fclk;
 	struct device           *dev;
 
@@ -54,6 +55,8 @@ struct ti_qspi {
 	u32 spi_max_frequency;
 	u32 cmd;
 	u32 dc;
+
+	bool ctrl_mod;
 };
 
 #define QSPI_PID			(0x0)
@@ -437,7 +440,7 @@ static int ti_qspi_probe(struct platform_device *pdev)
 {
 	struct  ti_qspi *qspi;
 	struct spi_master *master;
-	struct resource         *r;
+	struct resource         *r, *res_ctrl;
 	struct device_node *np = pdev->dev.of_node;
 	u32 max_freq;
 	int ret = 0, num_cs, irq;
@@ -471,6 +474,9 @@ static int ti_qspi_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	res_ctrl = platform_get_resource_byname(pdev,
+			IORESOURCE_MEM, "qspi_ctrlmod");
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		dev_err(&pdev->dev, "no irq resource?\n");
@@ -485,6 +491,15 @@ static int ti_qspi_probe(struct platform_device *pdev)
 		goto free_master;
 	}
 
+	if (res_ctrl) {
+		qspi->ctrl_mod = true;
+		qspi->ctrl_base = devm_ioremap_resource(&pdev->dev, res_ctrl);
+		if (IS_ERR(qspi->ctrl_base)) {
+			ret = PTR_ERR(qspi->ctrl_base);
+			goto free_master;
+		}
+	}
+
 	ret = devm_request_irq(&pdev->dev, irq, ti_qspi_isr, 0,
 			dev_name(&pdev->dev), qspi);
 	if (ret < 0) {
-- 
1.7.1
