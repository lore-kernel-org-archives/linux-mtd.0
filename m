Received: from mail-cys01nam02on0086.outbound.protection.outlook.com
 ([104.47.37.86] helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezLjP-0006Xh-4i
 for linux-mtd@lists.infradead.org; Fri, 23 Mar 2018 12:23:46 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <cyrille.pitchen@wedev4u.fr>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>
CC: <linux-mtd@lists.infradead.org>, Naga Sureshkumar Relli
 <nagasure@xilinx.com>
Subject: [RFC PATCH 4/5] spi: Add PM Support for Zynq QSPI controller
Date: Fri, 23 Mar 2018 17:52:01 +0530
Message-ID: <1521807722-21626-5-git-send-email-nagasure@xilinx.com>
In-Reply-To: <1521807722-21626-1-git-send-email-nagasure@xilinx.com>
References: <1521807722-21626-1-git-send-email-nagasure@xilinx.com>
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

This patch adds PM Support for Xilinx Zynq QSPI Controller
driver.

Signed-off-by: Naga Sureshkumar Relli <nagasure@xilinx.com>
---
 drivers/spi/spi-zynq-qspi.c | 58 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
index 7a772ca..9f87ee1 100644
--- a/drivers/spi/spi-zynq-qspi.c
+++ b/drivers/spi/spi-zynq-qspi.c
@@ -604,6 +604,64 @@ static int zynq_qspi_start_transfer(struct spi_master *master,
 }
 
 /**
+ * zynq_qspi_suspend - Suspend method for the QSPI driver
+ * @_dev:	Address of the platform_device structure
+ *
+ * This function stops the QSPI driver queue and disables the QSPI controller
+ *
+ * Return:	Always 0
+ */
+static int __maybe_unused zynq_qspi_suspend(struct device *_dev)
+{
+	struct platform_device *pdev = container_of(_dev,
+			struct platform_device, dev);
+	struct spi_master *master = platform_get_drvdata(pdev);
+
+	spi_master_suspend(master);
+
+	zynq_unprepare_transfer_hardware(master);
+
+	return 0;
+}
+
+/**
+ * zynq_qspi_resume - Resume method for the QSPI driver
+ * @dev:	Address of the platform_device structure
+ *
+ * The function starts the QSPI driver queue and initializes the QSPI controller
+ *
+ * Return:	0 on success and error value on error
+ */
+static int __maybe_unused zynq_qspi_resume(struct device *dev)
+{
+	struct platform_device *pdev = container_of(dev,
+			struct platform_device, dev);
+	struct spi_master *master = platform_get_drvdata(pdev);
+	struct zynq_qspi *xqspi = spi_master_get_devdata(master);
+	int ret = 0;
+
+	ret = clk_enable(xqspi->pclk);
+	if (ret) {
+		dev_err(dev, "Cannot enable APB clock.\n");
+		return ret;
+	}
+
+	ret = clk_enable(xqspi->refclk);
+	if (ret) {
+		dev_err(dev, "Cannot enable device clock.\n");
+		clk_disable(xqspi->pclk);
+		return ret;
+	}
+
+	spi_master_resume(master);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(zynq_qspi_dev_pm_ops, zynq_qspi_suspend,
+zynq_qspi_resume);
+
+/**
  * zynq_qspi_probe - Probe method for the QSPI driver
  * @pdev:	Pointer to the platform_device structure
  *
-- 
2.7.4
