Return-Path: <SRS0=S0OG=Z7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1222AC43603
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 14:12:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D59132073D
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 14:12:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NCByqzaw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D59132073D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9O53j7Jx9/RyjM/qomKSzcn0/L7wOxK+3VbXIdcE8j4=; b=NCByqzawCxyVcR
	rvCF0ds1pMeQ3SDQOoRFi+3jWEHK/YCni7RiG8C83WTqES1EPu1Zt+wAiT/wHffjiq9VwYriBMxGU
	78AgOX96Rx0aqXNqr5pUPGvG0F9ljmRi5SnuArpyzHqEeJYQsK6ypf5HBul1bMowAALT8lcM9p5of
	pKToqXWRW1Jgifg1je0EUVCbVZ2CsVHAubgA5sHMCUIwm2pXVyuFQ1T4SgUS6okrwj0g9G3CwAdc7
	c+ZTV2Q/RN1KP/PDsaScJlMRx1TbtUzOTnQ0Cyx1GhScHGl7/FzEsFJL3mhngF677JJ/B+CVg1a0H
	jlNrpD8PXwjHf5HCWfgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieJlj-0008De-Gx; Mon, 09 Dec 2019 14:12:11 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieJlY-00082n-2u
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2019 14:12:02 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id BB2D8E31A48C72F3A273;
 Mon,  9 Dec 2019 22:11:49 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Mon, 9 Dec 2019 22:11:41 +0800
From: John Garry <john.garry@huawei.com>
To: <broonie@kernel.org>, <marek.vasut@gmail.com>,
 <tudor.ambarus@microchip.com>
Subject: [PATCH v2 2/3] spi: Add HiSilicon v3xx SPI NOR flash controller driver
Date: Mon, 9 Dec 2019 22:08:09 +0800
Message-ID: <1575900490-74467-3-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1575900490-74467-1-git-send-email-john.garry@huawei.com>
References: <1575900490-74467-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_061200_941618_E6D6F415 
X-CRM114-Status: GOOD (  21.03  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: chenxiang66@hisilicon.com, linux-kernel@vger.kernel.org,
 John Garry <john.garry@huawei.com>, linuxarm@huawei.com, fengsheng5@huawei.com,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 xuejiancheng@hisilicon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add the driver for the HiSilicon v3xx SPI NOR flash controller, commonly
found in hi16xx chipsets.

This is a different controller than that in drivers/mtd/spi-nor/hisi-sfc.c;
indeed, the naming for that driver is poor, since it is really known as
FMC, and can support other memory technologies.

The driver module name is "hisi-sfc-v3xx", as recommended by HW designer,
being an attempt to provide a distinct name - v3xx being the unique
controller versioning.

Only ACPI firmware is supported.

DMA is not supported, and we just use polling mode for operation
completion notification.

The driver uses the SPI MEM OPs.

Signed-off-by: John Garry <john.garry@huawei.com>
---
 drivers/spi/Kconfig             |   9 +
 drivers/spi/Makefile            |   1 +
 drivers/spi/spi-hisi-sfc-v3xx.c | 284 ++++++++++++++++++++++++++++++++
 3 files changed, 294 insertions(+)
 create mode 100644 drivers/spi/spi-hisi-sfc-v3xx.c

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 870f7797b56b..d6ed0c355954 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -281,6 +281,15 @@ config SPI_FSL_QUADSPI
 	  This controller does not support generic SPI messages. It only
 	  supports the high-level SPI memory interface.
 
+config SPI_HISI_SFC_V3XX
+	tristate "HiSilicon SPI-NOR Flash Controller for Hi16XX chipsets"
+	depends on (ARM64 && ACPI) || COMPILE_TEST
+	depends on HAS_IOMEM
+	select CONFIG_MTD_SPI_NOR
+	help
+	  This enables support for HiSilicon v3xx SPI-NOR flash controller
+	  found in hi16xx chipsets.
+
 config SPI_NXP_FLEXSPI
 	tristate "NXP Flex SPI controller"
 	depends on ARCH_LAYERSCAPE || HAS_IOMEM
diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
index bb49c9e6d0a0..9b65ec5afc5e 100644
--- a/drivers/spi/Makefile
+++ b/drivers/spi/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_SPI_FSL_LPSPI)		+= spi-fsl-lpspi.o
 obj-$(CONFIG_SPI_FSL_QUADSPI)		+= spi-fsl-qspi.o
 obj-$(CONFIG_SPI_FSL_SPI)		+= spi-fsl-spi.o
 obj-$(CONFIG_SPI_GPIO)			+= spi-gpio.o
+obj-$(CONFIG_SPI_HISI_SFC_V3XX)		+= spi-hisi-sfc-v3xx.o
 obj-$(CONFIG_SPI_IMG_SPFI)		+= spi-img-spfi.o
 obj-$(CONFIG_SPI_IMX)			+= spi-imx.o
 obj-$(CONFIG_SPI_LANTIQ_SSC)		+= spi-lantiq-ssc.o
diff --git a/drivers/spi/spi-hisi-sfc-v3xx.c b/drivers/spi/spi-hisi-sfc-v3xx.c
new file mode 100644
index 000000000000..4cf8fc80a7b7
--- /dev/null
+++ b/drivers/spi/spi-hisi-sfc-v3xx.c
@@ -0,0 +1,284 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// HiSilicon SPI NOR V3XX Flash Controller Driver for hi16xx chipsets
+//
+// Copyright (c) 2019 HiSilicon Technologies Co., Ltd.
+// Author: John Garry <john.garry@huawei.com>
+
+#include <linux/acpi.h>
+#include <linux/bitops.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spi/spi.h>
+#include <linux/spi/spi-mem.h>
+
+#define HISI_SFC_V3XX_VERSION (0x1f8)
+
+#define HISI_SFC_V3XX_CMD_CFG (0x300)
+#define HISI_SFC_V3XX_CMD_CFG_DATA_CNT_OFF 9
+#define HISI_SFC_V3XX_CMD_CFG_RW_MSK BIT(8)
+#define HISI_SFC_V3XX_CMD_CFG_DATA_EN_MSK BIT(7)
+#define HISI_SFC_V3XX_CMD_CFG_DUMMY_CNT_OFF 4
+#define HISI_SFC_V3XX_CMD_CFG_ADDR_EN_MSK BIT(3)
+#define HISI_SFC_V3XX_CMD_CFG_CS_SEL_OFF 1
+#define HISI_SFC_V3XX_CMD_CFG_START_MSK BIT(0)
+#define HISI_SFC_V3XX_CMD_INS (0x308)
+#define HISI_SFC_V3XX_CMD_ADDR (0x30c)
+#define HISI_SFC_V3XX_CMD_DATABUF0 (0x400)
+
+struct hisi_sfc_v3xx_host {
+	struct device *dev;
+	void __iomem *regbase;
+	int max_cmd_dword;
+};
+
+#define HISI_SFC_V3XX_WAIT_TIMEOUT_US		1000000
+#define HISI_SFC_V3XX_WAIT_POLL_INTERVAL_US	10
+
+static int hisi_sfc_v3xx_wait_cmd_idle(struct hisi_sfc_v3xx_host *host)
+{
+	u32 reg;
+
+	return readl_poll_timeout(host->regbase + HISI_SFC_V3XX_CMD_CFG, reg,
+				  !(reg & HISI_SFC_V3XX_CMD_CFG_START_MSK),
+				  HISI_SFC_V3XX_WAIT_POLL_INTERVAL_US,
+				  HISI_SFC_V3XX_WAIT_TIMEOUT_US);
+}
+
+static int hisi_sfc_v3xx_adjust_op_size(struct spi_mem *mem,
+					struct spi_mem_op *op)
+{
+	struct spi_device *spi = mem->spi;
+	struct hisi_sfc_v3xx_host *host;
+	uintptr_t addr = (uintptr_t)op->data.buf.in;
+	int max_byte_count;
+
+	host = spi_controller_get_devdata(spi->master);
+
+	max_byte_count = host->max_cmd_dword * 4;
+
+	if (!IS_ALIGNED(addr, 4) && op->data.nbytes >= 4)
+		op->data.nbytes = 4 - (addr % 4);
+	else if (op->data.nbytes > max_byte_count)
+		op->data.nbytes = max_byte_count;
+
+	return 0;
+}
+
+/*
+ * memcpy_{to,from}io doesn't gurantee 32b accesses - which we require for the
+ * DATABUF registers -so use __io{read,write}32_copy when possible. For
+ * trailing bytes, copy them byte-by-byte from the DATABUF register, as we
+ * can't clobber outside the source/dest buffer.
+ *
+ * For efficient data read/write, we try to put any start 32b unaligned data
+ * into a separate transaction in hisi_sfc_v3xx_adjust_op_size().
+ */
+static void hisi_sfc_v3xx_read_databuf(struct hisi_sfc_v3xx_host *host,
+				       u8 *to, unsigned int len)
+{
+	void __iomem *from;
+	int i;
+
+	from = host->regbase + HISI_SFC_V3XX_CMD_DATABUF0;
+
+	if (IS_ALIGNED((uintptr_t)to, 4)) {
+		int words = len / 4;
+
+		__ioread32_copy(to, from, words);
+
+		len -= words * 4;
+		if (len) {
+			u32 val;
+
+			to += words * 4;
+			from += words * 4;
+
+			val = __raw_readl(from);
+
+			for (i = 0; i < len; i++, val >>= 8, to++)
+				*to = (u8)val;
+		}
+	} else {
+		for (i = 0; i < DIV_ROUND_UP(len, 4); i++, from += 4) {
+			u32 val = __raw_readl(from);
+			int j;
+
+			for (j = 0; j < 4 && (j + (i * 4) < len);
+			     to++, val >>= 8, j++)
+				*to = (u8)val;
+		}
+	}
+}
+
+static void hisi_sfc_v3xx_write_databuf(struct hisi_sfc_v3xx_host *host,
+					const u8 *from, unsigned int len)
+{
+	void __iomem *to;
+	int i;
+
+	to = host->regbase + HISI_SFC_V3XX_CMD_DATABUF0;
+
+	if (IS_ALIGNED((uintptr_t)from, 4)) {
+		int words = len / 4;
+
+		__iowrite32_copy(to, from, words);
+
+		len -= words * 4;
+		if (len) {
+			u32 val = 0;
+
+			to += words * 4;
+			from += words * 4;
+
+			for (i = 0; i < len; i++, from++)
+				val |= *from << i * 8;
+			__raw_writel(val, to);
+		}
+
+	} else {
+		for (i = 0; i < DIV_ROUND_UP(len, 4); i++, to += 4) {
+			u32 val = 0;
+			int j;
+
+			for (j = 0; j < 4 && (j + (i * 4) < len);
+			     from++, j++)
+				val |= *from << j * 8;
+			__raw_writel(val, to);
+		}
+	}
+}
+
+static int hisi_sfc_v3xx_generic_exec_op(struct hisi_sfc_v3xx_host *host,
+					 const struct spi_mem_op *op,
+					 u8 chip_select)
+{
+	int ret, len = op->data.nbytes;
+	u32 config = 0;
+
+	if (op->addr.nbytes)
+		config |= HISI_SFC_V3XX_CMD_CFG_ADDR_EN_MSK;
+
+	if (op->data.dir != SPI_MEM_NO_DATA) {
+		config |= (len - 1) << HISI_SFC_V3XX_CMD_CFG_DATA_CNT_OFF;
+		config |= HISI_SFC_V3XX_CMD_CFG_DATA_EN_MSK;
+	}
+
+	if (op->data.dir == SPI_MEM_DATA_OUT)
+		hisi_sfc_v3xx_write_databuf(host, op->data.buf.out, len);
+	else if (op->data.dir == SPI_MEM_DATA_IN)
+		config |= HISI_SFC_V3XX_CMD_CFG_RW_MSK;
+
+	config |= op->dummy.nbytes << HISI_SFC_V3XX_CMD_CFG_DUMMY_CNT_OFF |
+		  chip_select << HISI_SFC_V3XX_CMD_CFG_CS_SEL_OFF |
+		  HISI_SFC_V3XX_CMD_CFG_START_MSK;
+
+	writel(op->addr.val, host->regbase + HISI_SFC_V3XX_CMD_ADDR);
+	writel(op->cmd.opcode, host->regbase + HISI_SFC_V3XX_CMD_INS);
+
+	writel(config, host->regbase + HISI_SFC_V3XX_CMD_CFG);
+
+	ret = hisi_sfc_v3xx_wait_cmd_idle(host);
+	if (ret)
+		return ret;
+
+	if (op->data.dir == SPI_MEM_DATA_IN)
+		hisi_sfc_v3xx_read_databuf(host, op->data.buf.in, len);
+
+	return 0;
+}
+
+static int hisi_sfc_v3xx_exec_op(struct spi_mem *mem,
+				 const struct spi_mem_op *op)
+{
+	struct hisi_sfc_v3xx_host *host;
+	struct spi_device *spi = mem->spi;
+	u8 chip_select = spi->chip_select;
+
+	host = spi_controller_get_devdata(spi->master);
+
+	return hisi_sfc_v3xx_generic_exec_op(host, op, chip_select);
+}
+
+static const struct spi_controller_mem_ops hisi_sfc_v3xx_mem_ops = {
+	.adjust_op_size = hisi_sfc_v3xx_adjust_op_size,
+	.exec_op = hisi_sfc_v3xx_exec_op,
+};
+
+static int hisi_sfc_v3xx_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct hisi_sfc_v3xx_host *host;
+	struct spi_controller *ctlr;
+	u32 version;
+	int ret;
+
+	ctlr = spi_alloc_master(&pdev->dev, sizeof(*host));
+	if (!ctlr)
+		return -ENOMEM;
+
+	ctlr->mode_bits = SPI_RX_DUAL | SPI_RX_QUAD |
+			  SPI_TX_DUAL | SPI_TX_QUAD;
+
+	host = spi_controller_get_devdata(ctlr);
+	host->dev = dev;
+
+	platform_set_drvdata(pdev, host);
+
+	host->regbase = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(host->regbase)) {
+		ret = PTR_ERR(host->regbase);
+		goto err_put_master;
+	}
+
+	ctlr->bus_num = -1;
+	ctlr->num_chipselect = 1;
+	ctlr->mem_ops = &hisi_sfc_v3xx_mem_ops;
+
+	version = readl(host->regbase + HISI_SFC_V3XX_VERSION);
+
+	switch (version) {
+	case 0x351:
+		host->max_cmd_dword = 64;
+		break;
+	default:
+		host->max_cmd_dword = 16;
+		break;
+	}
+
+	ret = devm_spi_register_controller(dev, ctlr);
+	if (ret)
+		goto err_put_master;
+
+	dev_info(&pdev->dev, "hw version 0x%x\n", version);
+
+	return 0;
+
+err_put_master:
+	spi_master_put(ctlr);
+	return ret;
+}
+
+#if IS_ENABLED(CONFIG_ACPI)
+static const struct acpi_device_id hisi_sfc_v3xx_acpi_ids[] = {
+	{"HISI0341", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, hisi_sfc_v3xx_acpi_ids);
+#endif
+
+static struct platform_driver hisi_sfc_v3xx_spi_driver = {
+	.driver = {
+		.name	= "hisi-sfc-v3xx",
+		.acpi_match_table = ACPI_PTR(hisi_sfc_v3xx_acpi_ids),
+	},
+	.probe	= hisi_sfc_v3xx_probe,
+};
+
+module_platform_driver(hisi_sfc_v3xx_spi_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("John Garry <john.garry@huawei.com>");
+MODULE_DESCRIPTION("HiSilicon SPI NOR V3XX Flash Controller Driver for hi16xx chipsets");
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
