Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200B5C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 17:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MR1Slqeq+OxoPcT79FMnbXtn72Vu5bEVl1wjBZosn64=; b=Hs8YQDiqtDC9nS
	18fOO27dgCM4E+3jJeRr0jRc5CCH11+YsBRV1gohnJsJFTG25P4e0PHP3K8Nvn4Om5bIUei48/cMa
	aMlDttb5YPrhW6LZfz3L/Ct/42PX1FBXA8CmYKs29gLt8NWJSsw3kfr8wqp3QVvfTKhVbGMv9FmIP
	uMof4RTJBF8TV2U1KcXckWoQ+EC1CCkWKH01o8L1PLVzdS/9paljRS0FadyGG1XV07+ECtJ5D+/UQ
	yitrahQzmEjoERl9OShwfAVtbS2xYlNeu9XV18M66d3cbJwz5ZyHvSYKOTj3YtlMSqSte8dfKtk/Z
	g96S6GEf6OwqAKAiPTng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myH2G-00BTqF-L6; Fri, 17 Dec 2021 17:28:48 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myFvO-00B7k2-6H
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 16:17:40 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id A947A200009;
 Fri, 17 Dec 2021 16:17:34 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v7 14/14] spi: mxic: Add support for pipelined ECC operations
Date: Fri, 17 Dec 2021 17:16:54 +0100
Message-Id: <20211217161654.367782-15-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211217161654.367782-1-miquel.raynal@bootlin.com>
References: <20211217161654.367782-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_081738_586620_54262366 
X-CRM114-Status: GOOD (  17.59  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some SPI-NAND chips do not have a proper on-die ECC engine providing
error correction/detection. This is particularly an issue on embedded
devices with limited resources because all the computations must
happen in software, unless an external hardware engine is provided.

These external engines are new and can be of two categories: external
or pipelined. Macronix is providing both, the former being already
supported. The second, however, is very SoC implementation dependent
and must be instantiated by the SPI host controller directly.

An entire subsystem has been contributed to support these engines which
makes the insertion into another subsystem such as SPI quite
straightforward without the need for a lot of specific functions.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/Kconfig    |   2 +-
 drivers/spi/spi-mxic.c | 113 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 112 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 83e352b0c8f9..bff75629e872 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -856,7 +856,7 @@ config SPI_SYNQUACER
 
 config SPI_MXIC
 	tristate "Macronix MX25F0A SPI controller"
-	depends on SPI_MASTER
+	depends on SPI_MASTER && MTD_NAND_ECC
 	help
 	  This selects the Macronix MX25F0A SPI controller driver.
 
diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index 97de058d2f80..7fc57e94b8b4 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -12,6 +12,8 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/nand-ecc-mxic.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/spi/spi.h>
@@ -167,6 +169,7 @@
 #define HW_TEST(x)		(0xe0 + ((x) * 4))
 
 struct mxic_spi {
+	struct device *dev;
 	struct clk *ps_clk;
 	struct clk *send_clk;
 	struct clk *send_dly_clk;
@@ -177,6 +180,12 @@ struct mxic_spi {
 		dma_addr_t dma;
 		size_t size;
 	} linear;
+
+	struct {
+		bool use_pipelined_conf;
+		struct nand_ecc_engine *pipelined_engine;
+		void *ctx;
+	} ecc;
 };
 
 static int mxic_spi_clk_enable(struct mxic_spi *mxic)
@@ -400,7 +409,15 @@ static ssize_t mxic_spi_mem_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	       LMODE_EN,
 	       mxic->regs + LRD_CTRL);
 
-	memcpy_fromio(buf, mxic->linear.map, len);
+	if (mxic->ecc.use_pipelined_conf && desc->info.op_tmpl.ecc_en) {
+		ret = mxic_ecc_process_data_pipelined(mxic->ecc.pipelined_engine,
+						      NAND_PAGE_READ,
+						      mxic->linear.dma + offs);
+		if (ret)
+			return ret;
+	} else {
+		memcpy_fromio(buf, mxic->linear.map, len);
+	}
 
 	writel(INT_LRD_DIS, mxic->regs + INT_STS);
 	writel(0, mxic->regs + LRD_CTRL);
@@ -436,7 +453,15 @@ static ssize_t mxic_spi_mem_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	       LMODE_EN,
 	       mxic->regs + LWR_CTRL);
 
-	memcpy_toio(mxic->linear.map, buf, len);
+	if (mxic->ecc.use_pipelined_conf && desc->info.op_tmpl.ecc_en) {
+		ret = mxic_ecc_process_data_pipelined(mxic->ecc.pipelined_engine,
+						      NAND_PAGE_WRITE,
+						      mxic->linear.dma + offs);
+		if (ret)
+			return ret;
+	} else {
+		memcpy_toio(mxic->linear.map, buf, len);
+	}
 
 	writel(INT_LWR_DIS, mxic->regs + INT_STS);
 	writel(0, mxic->regs + LWR_CTRL);
@@ -539,6 +564,7 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 
 static const struct spi_controller_mem_caps mxic_spi_mem_caps = {
 	.dtr = true,
+	.ecc = true,
 };
 
 static const struct spi_controller_mem_ops mxic_spi_mem_ops = {
@@ -612,6 +638,80 @@ static int mxic_spi_transfer_one(struct spi_master *master,
 	return 0;
 }
 
+/* ECC wrapper */
+static int mxic_spi_mem_ecc_init_ctx(struct nand_device *nand)
+{
+	struct nand_ecc_engine_ops *ops = mxic_ecc_get_pipelined_ops();
+	struct mxic_spi *mxic = nand->ecc.engine->priv;
+
+	mxic->ecc.use_pipelined_conf = true;
+
+	return ops->init_ctx(nand);
+}
+
+static void mxic_spi_mem_ecc_cleanup_ctx(struct nand_device *nand)
+{
+	struct nand_ecc_engine_ops *ops = mxic_ecc_get_pipelined_ops();
+	struct mxic_spi *mxic = nand->ecc.engine->priv;
+
+	mxic->ecc.use_pipelined_conf = false;
+
+	ops->cleanup_ctx(nand);
+}
+
+static int mxic_spi_mem_ecc_prepare_io_req(struct nand_device *nand,
+					   struct nand_page_io_req *req)
+{
+	struct nand_ecc_engine_ops *ops = mxic_ecc_get_pipelined_ops();
+
+	return ops->prepare_io_req(nand, req);
+}
+
+static int mxic_spi_mem_ecc_finish_io_req(struct nand_device *nand,
+					  struct nand_page_io_req *req)
+{
+	struct nand_ecc_engine_ops *ops = mxic_ecc_get_pipelined_ops();
+
+	return ops->finish_io_req(nand, req);
+}
+
+static struct nand_ecc_engine_ops mxic_spi_mem_ecc_engine_pipelined_ops = {
+	.init_ctx = mxic_spi_mem_ecc_init_ctx,
+	.cleanup_ctx = mxic_spi_mem_ecc_cleanup_ctx,
+	.prepare_io_req = mxic_spi_mem_ecc_prepare_io_req,
+	.finish_io_req = mxic_spi_mem_ecc_finish_io_req,
+};
+
+static void mxic_spi_mem_ecc_remove(struct mxic_spi *mxic)
+{
+	if (mxic->ecc.pipelined_engine) {
+		mxic_ecc_put_pipelined_engine(mxic->ecc.pipelined_engine);
+		nand_ecc_unregister_on_host_hw_engine(mxic->ecc.pipelined_engine);
+	}
+}
+
+static int mxic_spi_mem_ecc_probe(struct platform_device *pdev,
+				  struct mxic_spi *mxic)
+{
+	struct nand_ecc_engine *eng;
+
+	if (!mxic_ecc_get_pipelined_ops())
+		return -EOPNOTSUPP;
+
+	eng = mxic_ecc_get_pipelined_engine(pdev);
+	if (IS_ERR(eng))
+		return PTR_ERR(eng);
+
+	eng->dev = &pdev->dev;
+	eng->integration = NAND_ECC_ENGINE_INTEGRATION_PIPELINED;
+	eng->ops = &mxic_spi_mem_ecc_engine_pipelined_ops;
+	eng->priv = mxic;
+	mxic->ecc.pipelined_engine = eng;
+	nand_ecc_register_on_host_hw_engine(eng);
+
+	return 0;
+}
+
 static int __maybe_unused mxic_spi_runtime_suspend(struct device *dev)
 {
 	struct spi_master *master = dev_get_drvdata(dev);
@@ -657,6 +757,7 @@ static int mxic_spi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, master);
 
 	mxic = spi_master_get_devdata(master);
+	mxic->dev = &pdev->dev;
 
 	master->dev.of_node = pdev->dev.of_node;
 
@@ -702,6 +803,12 @@ static int mxic_spi_probe(struct platform_device *pdev)
 
 	mxic_spi_hw_init(mxic);
 
+	ret = mxic_spi_mem_ecc_probe(pdev, mxic);
+	if (ret == -EPROBE_DEFER) {
+		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
+
 	ret = spi_register_master(master);
 	if (ret) {
 		dev_err(&pdev->dev, "spi_register_master failed\n");
@@ -714,8 +821,10 @@ static int mxic_spi_probe(struct platform_device *pdev)
 static int mxic_spi_remove(struct platform_device *pdev)
 {
 	struct spi_master *master = platform_get_drvdata(pdev);
+	struct mxic_spi *mxic = spi_master_get_devdata(master);
 
 	pm_runtime_disable(&pdev->dev);
+	mxic_spi_mem_ecc_remove(mxic);
 	spi_unregister_master(master);
 
 	return 0;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
