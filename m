Return-Path: <SRS0=uNk0=Y4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B365ACA9EB5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Nov 2019 16:56:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81BFB2080F
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Nov 2019 16:56:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dfTUiKDn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81BFB2080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3KOzBP1PdxghSR/nksP8eOLxF5m/foIxMpW1EJJjoc=; b=dfTUiKDnsE7RgC
	H481QZ63OiMueSwZErbiQxNbrAXc+x2Wx9xOTpk43M5/RV+BKImx7AzYNr2sS0vfdA4JrA3oXePH1
	tXbsp6vmdRPGBfQLbAjC6kRLT8WMVlXdoioThUEMrPt3ZKzDvH5cnaFxE6smnIuHDZP0gD3ArZchS
	DJJ32orDu0UQUCXvSwqzuJuekiX8DOSqoEBcjtKxqBnFANyfwATfED+hVp9ZXLWwnGepP+mHJK/wx
	cP3kgcCRhNhOkTBUsR3Ch7GqD7sBCYWgBkoHQmkaZ+fG3eSSNXpyTGGsqozebCfBleV+ftkSL5lVU
	JoKTuIZ6egFE2cHP00FA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRfdv-0000B5-Vv; Mon, 04 Nov 2019 16:55:51 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRfd5-0006h4-7m
 for linux-mtd@lists.infradead.org; Mon, 04 Nov 2019 16:55:02 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 28C19A6F828CBCBEDCB9;
 Tue,  5 Nov 2019 00:54:52 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Tue, 5 Nov 2019 00:54:42 +0800
From: John Garry <john.garry@huawei.com>
To: <broonie@kernel.org>, <marek.vasut@gmail.com>,
 <tudor.ambarus@microchip.com>
Subject: [PATCH 2/3] spi: Add HiSilicon v3xx SPI NOR flash controller driver
Date: Tue, 5 Nov 2019 00:51:36 +0800
Message-ID: <1572886297-45400-3-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1572886297-45400-1-git-send-email-john.garry@huawei.com>
References: <1572886297-45400-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191104_085459_671477_D4FEB227 
X-CRM114-Status: GOOD (  20.68  )
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
Cc: linux-kernel@vger.kernel.org, John Garry <john.garry@huawei.com>,
 linuxarm@huawei.com, fengsheng5@huawei.com, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, xuejiancheng@hisilicon.com
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
 drivers/spi/spi-hisi-sfc-v3xx.c | 287 ++++++++++++++++++++++++++++++++
 3 files changed, 297 insertions(+)
 create mode 100644 drivers/spi/spi-hisi-sfc-v3xx.c

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 6f7fdcbb9151..2df653b06685 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -280,6 +280,15 @@ config SPI_FSL_QUADSPI
 	  This controller does not support generic SPI messages. It only
 	  supports the high-level SPI memory interface.
 
+config SPI_HISI_SFC_V3XX
+	tristate "HiSilicon SPI-NOR Flash Controller for Hi16XX chipsets"
+	depends on ARM64 || COMPILE_TEST
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
index 000000000000..68f06f52950c
--- /dev/null
+++ b/drivers/spi/spi-hisi-sfc-v3xx.c
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * HiSilicon SPI NOR V3XX Flash Controller Driver for hi16xx chipsets
+ *
+ * Copyright (c) 2019 HiSilicon Technologies Co., Ltd.
+ * Author: John Garry <john.garry@huawei.com>
+ */
+//#define DEBUG 1
+
+#include <linux/acpi.h>
+#include <linux/bitops.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/spi-nor.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spi/spi.h>
+#include <linux/spi/spi-mem.h>
+
+#define GLOBAL_CFG (0x100)
+
+#define BUS_CFG1 (0x200)
+#define BUS_CFG2 (0x204)
+#define BUS_FLASH_SIZE (0x210)
+
+#define VERSION (0x1f8)
+
+#define CMD_CONFIG (0x300)
+#define CMD_CONFIG_DATA_CNT_OFF 9
+#define CMD_CONFIG_DATA_CNT_MSK (0xff << CMD_CONFIG_DATA_CNT_OFF)
+#define CMD_CONFIG_CMD_RW_OFF 8
+#define CMD_CONFIG_CMD_RW_MSK BIT(CMD_CONFIG_CMD_RW_OFF)
+#define CMD_CONFIG_CMD_DATA_EN_OFF 7
+#define CMD_CONFIG_CMD_DATA_EN_MSK BIT(CMD_CONFIG_CMD_DATA_EN_OFF)
+#define CMD_CONFIG_CMD_DUMMY_CNT_OFF 4
+#define CMD_CONFIG_CMD_DUMMY_CNT_MSK (0x7 << CMD_CONFIG_CMD_DUMMY_CNT_OFF)
+#define CMD_CONFIG_CMD_ADDR_EN_OFF 3
+#define CMD_CONFIG_CMD_ADDR_EN_MSK BIT(CMD_CONFIG_CMD_ADDR_EN_OFF)
+#define CMD_CONFIG_CMD_CS_SEL_OFF 1
+#define CMD_CONFIG_CMD_CS_SEL_MSK BIT(CMD_CONFIG_CMD_CS_SEL_OFF)
+#define CMD_CONFIG_CMD_START_OFF 0
+#define CMD_CONFIG_CMD_START_MSK BIT(CMD_CONFIG_CMD_START_OFF)
+#define CMD_INS (0x308)
+#define CMD_ADDR (0x30c)
+#define CMD_DATABUF(x) (0x400 + ((x) * 4))
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
+	return readl_poll_timeout(host->regbase + CMD_CONFIG, reg,
+				  !(reg & CMD_CONFIG_CMD_START_MSK),
+				  HISI_SFC_V3XX_WAIT_POLL_INTERVAL_US,
+				  HISI_SFC_V3XX_WAIT_TIMEOUT_US);
+}
+
+/*
+ * memcpy_{to,from}io doesn't gurantee 32b accesses, which we require for the
+ * DATABUF registers, so use __io{read,write}32_copy when possible. For
+ * trailing bytes, copy them byte-by-byte from the DATABUF register, as we
+ * can't clobber outside the source/dest buffer.
+ */
+static void hisi_sfc_v3xx_read_databuf(struct hisi_sfc_v3xx_host *host,
+				       u8 *to, unsigned int len)
+{
+	int i;
+
+	if (IS_ALIGNED((uintptr_t)to, 4)) {
+		int words = len / 4;
+
+		__ioread32_copy(to, host->regbase + CMD_DATABUF(0), words);
+
+		len -= words * 4;
+		if (len) {
+			u32 val;
+
+			val = __raw_readl(host->regbase + CMD_DATABUF(words));
+
+			to += words * 4;
+			for (i = 0; i < len; i++, val >>= 8, to++)
+				*to = (u8)val;
+		}
+	} else {
+		for (i = 0; i < DIV_ROUND_UP(len, 4); i++) {
+			u32 val = __raw_readl(host->regbase + CMD_DATABUF(i));
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
+					const u8 *from, unsigned int len,
+					u64 addr, u8 dummybytes)
+{
+	int i;
+
+	if (IS_ALIGNED((uintptr_t)from, 4)) {
+		int words = len / 4;
+
+		__iowrite32_copy(host->regbase + CMD_DATABUF(0), from, words);
+
+		len -= words * 4;
+		if (len) {
+			u32 val = 0;
+
+			from += words * 4;
+			for (i = 0; i < len; i++, from++)
+				val |= *from << i * 8;
+
+			__raw_writel(val, host->regbase + CMD_DATABUF(words));
+		}
+
+	} else {
+		for (i = 0; i < DIV_ROUND_UP(len, 4); i++) {
+			u32 val = 0;
+			int j;
+
+			for (j = 0; j < 4 && (j + (i * 4) < len); from++, j++)
+				val |= *from << j * 8;
+			__raw_writel(val, host->regbase + CMD_DATABUF(i));
+		}
+	}
+}
+
+static int hisi_sfc_v3xx_adjust_op_size(struct spi_mem *mem,
+					struct spi_mem_op *op)
+{
+	struct spi_device *spi = mem->spi;
+	struct hisi_sfc_v3xx_host *host;
+	int max_byte_count;
+
+	host = spi_controller_get_devdata(spi->master);
+
+	max_byte_count = host->max_cmd_dword * 4;
+
+	if (op->data.nbytes > max_byte_count)
+		op->data.nbytes = max_byte_count;
+
+	return 0;
+}
+
+static int hisi_sfc_v3xx_generic_exec_op(struct hisi_sfc_v3xx_host *host,
+					 const struct spi_mem_op *op,
+					 u8 chip_select)
+{
+	int ret, len = op->data.nbytes;
+	u32 config = 0;
+
+	if (op->data.dir != SPI_MEM_NO_DATA) {
+		config |= (op->data.nbytes - 1) << CMD_CONFIG_DATA_CNT_OFF;
+		config |= CMD_CONFIG_CMD_DATA_EN_MSK;
+	}
+
+	if (op->addr.nbytes)
+		config |= CMD_CONFIG_CMD_ADDR_EN_MSK;
+
+	config |= op->dummy.nbytes << CMD_CONFIG_CMD_DUMMY_CNT_OFF |
+			chip_select << CMD_CONFIG_CMD_CS_SEL_OFF |
+			CMD_CONFIG_CMD_START_MSK;
+
+	if (op->data.dir == SPI_MEM_DATA_OUT)
+		hisi_sfc_v3xx_write_databuf(host, op->data.buf.out, len,
+					    op->addr.val, op->dummy.nbytes);
+	else if (op->data.dir == SPI_MEM_DATA_IN)
+		config |= CMD_CONFIG_CMD_RW_MSK;
+
+	writel(op->addr.val, host->regbase + CMD_ADDR);
+	writel(op->cmd.opcode, host->regbase + CMD_INS);
+
+	writel(config, host->regbase + CMD_CONFIG);
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
+	version = readl(host->regbase + VERSION);
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
