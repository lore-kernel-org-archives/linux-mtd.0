Return-Path: <SRS0=odZH=R7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0FFC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 10:07:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DB9121773
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 10:07:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RLr3m1uI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DB9121773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mNHlH5G36ftfBTvXskD/Pi/kYpNJM1Bkv9pZWmfaPpU=; b=RLr3m1uIE27NnPnF3CMPfg07um
	h+xQMjho1tkct4YKRYJdwHMgSnWET21xs3x9T/gd0hW1rOKXHuPKNsqjtEmuZXn7n5h6jTwYr0zAj
	tJO36WOx9nDgUpdAREmn3tP4mbH/Iwg8j+UvqwfhxvZ1GKl6aQMEX3QZJ89wihHbMbznvJRlyIZun
	NqIYuFN7zM612phq8yKCycb3XBJwN3NyQdnVVwuMb9E+zzx8V/OSKgpzikPT2AR9M5vMHVDQ7MEbP
	TziJ/6oH7KnNOhZTEXU5Hj5dJK3YITLET5vizBKidxDF9f03kszETgTcif6Ff2Ye7RWQs07Q2xvay
	+wi/7pww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9RwV-00010b-6B; Thu, 28 Mar 2019 10:07:27 +0000
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9RpD-0002bm-Ok
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2019 10:00:26 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG3.macronix.com with ESMTP id x2S9wlJM052359;
 Thu, 28 Mar 2019 17:58:50 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: broonie@kernel.org, marek.vasut@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, bbrezillon@kernel.org, dwmw2@infradead.org,
 lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 computersforpeace@gmal.com, paul.burton@mips.com, stefan@agner.ch,
 christophe.kerello@st.com, liang.yang@amlogic.com,
 geert@linux-m68k.org, devicetree@vger.kernel.org,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org,
 richard@nod.at, miquel.raynal@bootlin.com
Subject: [PATCH 3/7] spi: Patch Macronix MX25F0A SPI controller driver
Date: Thu, 28 Mar 2019 18:18:34 +0800
Message-Id: <1553768318-23149-4-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553768318-23149-1-git-send-email-masonccyang@mxic.com.tw>
References: <1553768318-23149-1-git-send-email-masonccyang@mxic.com.tw>
X-MAIL: TWHMLLG3.macronix.com x2S9wlJM052359
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_025956_461014_B482AA95 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: juliensu@mxic.com.tw, Mason Yang <masonccyang@mxic.com.tw>,
 zhengxunli@mxic.com.tw
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Patch a MFD driver for Macronix MX25F0A SPI controller.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 drivers/spi/spi-mxic.c | 159 +------------------------------------------------
 1 file changed, 3 insertions(+), 156 deletions(-)

diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index e41ae6e..fbebf89 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -9,163 +9,11 @@
 //
 
 #include <linux/clk.h>
-#include <linux/io.h>
-#include <linux/iopoll.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
+#include <linux/mfd/mxic-mx25f0a.h>
 #include <linux/pm_runtime.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
 
-#define HC_CFG			0x0
-#define HC_CFG_IF_CFG(x)	((x) << 27)
-#define HC_CFG_DUAL_SLAVE	BIT(31)
-#define HC_CFG_INDIVIDUAL	BIT(30)
-#define HC_CFG_NIO(x)		(((x) / 4) << 27)
-#define HC_CFG_TYPE(s, t)	((t) << (23 + ((s) * 2)))
-#define HC_CFG_TYPE_SPI_NOR	0
-#define HC_CFG_TYPE_SPI_NAND	1
-#define HC_CFG_TYPE_SPI_RAM	2
-#define HC_CFG_TYPE_RAW_NAND	3
-#define HC_CFG_SLV_ACT(x)	((x) << 21)
-#define HC_CFG_CLK_PH_EN	BIT(20)
-#define HC_CFG_CLK_POL_INV	BIT(19)
-#define HC_CFG_BIG_ENDIAN	BIT(18)
-#define HC_CFG_DATA_PASS	BIT(17)
-#define HC_CFG_IDLE_SIO_LVL(x)	((x) << 16)
-#define HC_CFG_MAN_START_EN	BIT(3)
-#define HC_CFG_MAN_START	BIT(2)
-#define HC_CFG_MAN_CS_EN	BIT(1)
-#define HC_CFG_MAN_CS_ASSERT	BIT(0)
-
-#define INT_STS			0x4
-#define INT_STS_EN		0x8
-#define INT_SIG_EN		0xc
-#define INT_STS_ALL		GENMASK(31, 0)
-#define INT_RDY_PIN		BIT(26)
-#define INT_RDY_SR		BIT(25)
-#define INT_LNR_SUSP		BIT(24)
-#define INT_ECC_ERR		BIT(17)
-#define INT_CRC_ERR		BIT(16)
-#define INT_LWR_DIS		BIT(12)
-#define INT_LRD_DIS		BIT(11)
-#define INT_SDMA_INT		BIT(10)
-#define INT_DMA_FINISH		BIT(9)
-#define INT_RX_NOT_FULL		BIT(3)
-#define INT_RX_NOT_EMPTY	BIT(2)
-#define INT_TX_NOT_FULL		BIT(1)
-#define INT_TX_EMPTY		BIT(0)
-
-#define HC_EN			0x10
-#define HC_EN_BIT		BIT(0)
-
-#define TXD(x)			(0x14 + ((x) * 4))
-#define RXD			0x24
-
-#define SS_CTRL(s)		(0x30 + ((s) * 4))
-#define LRD_CFG			0x44
-#define LWR_CFG			0x80
-#define RWW_CFG			0x70
-#define OP_READ			BIT(23)
-#define OP_DUMMY_CYC(x)		((x) << 17)
-#define OP_ADDR_BYTES(x)	((x) << 14)
-#define OP_CMD_BYTES(x)		(((x) - 1) << 13)
-#define OP_OCTA_CRC_EN		BIT(12)
-#define OP_DQS_EN		BIT(11)
-#define OP_ENHC_EN		BIT(10)
-#define OP_PREAMBLE_EN		BIT(9)
-#define OP_DATA_DDR		BIT(8)
-#define OP_DATA_BUSW(x)		((x) << 6)
-#define OP_ADDR_DDR		BIT(5)
-#define OP_ADDR_BUSW(x)		((x) << 3)
-#define OP_CMD_DDR		BIT(2)
-#define OP_CMD_BUSW(x)		(x)
-#define OP_BUSW_1		0
-#define OP_BUSW_2		1
-#define OP_BUSW_4		2
-#define OP_BUSW_8		3
-
-#define OCTA_CRC		0x38
-#define OCTA_CRC_IN_EN(s)	BIT(3 + ((s) * 16))
-#define OCTA_CRC_CHUNK(s, x)	((fls((x) / 32)) << (1 + ((s) * 16)))
-#define OCTA_CRC_OUT_EN(s)	BIT(0 + ((s) * 16))
-
-#define ONFI_DIN_CNT(s)		(0x3c + (s))
-
-#define LRD_CTRL		0x48
-#define RWW_CTRL		0x74
-#define LWR_CTRL		0x84
-#define LMODE_EN		BIT(31)
-#define LMODE_SLV_ACT(x)	((x) << 21)
-#define LMODE_CMD1(x)		((x) << 8)
-#define LMODE_CMD0(x)		(x)
-
-#define LRD_ADDR		0x4c
-#define LWR_ADDR		0x88
-#define LRD_RANGE		0x50
-#define LWR_RANGE		0x8c
-
-#define AXI_SLV_ADDR		0x54
-
-#define DMAC_RD_CFG		0x58
-#define DMAC_WR_CFG		0x94
-#define DMAC_CFG_PERIPH_EN	BIT(31)
-#define DMAC_CFG_ALLFLUSH_EN	BIT(30)
-#define DMAC_CFG_LASTFLUSH_EN	BIT(29)
-#define DMAC_CFG_QE(x)		(((x) + 1) << 16)
-#define DMAC_CFG_BURST_LEN(x)	(((x) + 1) << 12)
-#define DMAC_CFG_BURST_SZ(x)	((x) << 8)
-#define DMAC_CFG_DIR_READ	BIT(1)
-#define DMAC_CFG_START		BIT(0)
-
-#define DMAC_RD_CNT		0x5c
-#define DMAC_WR_CNT		0x98
-
-#define SDMA_ADDR		0x60
-
-#define DMAM_CFG		0x64
-#define DMAM_CFG_START		BIT(31)
-#define DMAM_CFG_CONT		BIT(30)
-#define DMAM_CFG_SDMA_GAP(x)	(fls((x) / 8192) << 2)
-#define DMAM_CFG_DIR_READ	BIT(1)
-#define DMAM_CFG_EN		BIT(0)
-
-#define DMAM_CNT		0x68
-
-#define LNR_TIMER_TH		0x6c
-
-#define RDM_CFG0		0x78
-#define RDM_CFG0_POLY(x)	(x)
-
-#define RDM_CFG1		0x7c
-#define RDM_CFG1_RDM_EN		BIT(31)
-#define RDM_CFG1_SEED(x)	(x)
-
-#define LWR_SUSP_CTRL		0x90
-#define LWR_SUSP_CTRL_EN	BIT(31)
-
-#define DMAS_CTRL		0x9c
-#define DMAS_CTRL_DIR_READ	BIT(31)
-#define DMAS_CTRL_EN		BIT(30)
-
-#define DATA_STROB		0xa0
-#define DATA_STROB_EDO_EN	BIT(2)
-#define DATA_STROB_INV_POL	BIT(1)
-#define DATA_STROB_DELAY_2CYC	BIT(0)
-
-#define IDLY_CODE(x)		(0xa4 + ((x) * 4))
-#define IDLY_CODE_VAL(x, v)	((v) << (((x) % 4) * 8))
-
-#define GPIO			0xc4
-#define GPIO_PT(x)		BIT(3 + ((x) * 16))
-#define GPIO_RESET(x)		BIT(2 + ((x) * 16))
-#define GPIO_HOLDB(x)		BIT(1 + ((x) * 16))
-#define GPIO_WPB(x)		BIT((x) * 16)
-
-#define HC_VER			0xd0
-
-#define HW_TEST(x)		(0xe0 + ((x) * 4))
-
 struct mxic_spi {
 	struct clk *ps_clk;
 	struct clk *send_clk;
@@ -525,8 +373,8 @@ static int __maybe_unused mxic_spi_runtime_resume(struct device *dev)
 
 static int mxic_spi_probe(struct platform_device *pdev)
 {
+	struct mx25f0a_mfd *mxic_mfd = dev_get_drvdata(pdev->dev.parent);
 	struct spi_master *master;
-	struct resource *res;
 	struct mxic_spi *mxic;
 	int ret;
 
@@ -552,8 +400,7 @@ static int mxic_spi_probe(struct platform_device *pdev)
 	if (IS_ERR(mxic->send_dly_clk))
 		return PTR_ERR(mxic->send_dly_clk);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
-	mxic->regs = devm_ioremap_resource(&pdev->dev, res);
+	mxic->regs = mxic_mfd->base;
 	if (IS_ERR(mxic->regs))
 		return PTR_ERR(mxic->regs);
 
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
