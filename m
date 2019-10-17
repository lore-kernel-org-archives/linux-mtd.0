Return-Path: <SRS0=Q04P=YK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518F9FA372B
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Oct 2019 07:20:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ECEF20820
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Oct 2019 07:20:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QdEwX9NE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1ECEF20820
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nrixZpMAwNIlchVQUiWcFYTSQU7QyhM8R9uEf4PlMPo=; b=QdEwX9NEvG9L8waGhjABo5PfGB
	q3JUw9asYG13VFC1vGw0KAVUTGYlOk4sWsgb4Qqurnjzf5bLEltR3Bqcs3Ol0fyIZkYR8CGo2/UiF
	daPGixe5/F1gnhFxIu4KznNxf2YvU1eF219msxHsECVBaMzsTgmE6mPlnPvz3m2op/nvUSBM6uHNh
	LX1SUcsVPtb4zznu9hdaPWH4EJCS54sORd3DJNau6m71r09YUSAY9S6ssr7gtRtnevtoIIZWH2XYw
	O/U3hHIlwXKXD8vW7lYdK/ZT9e4w2GyD4TYm06rwzDqww5O1hY0JJpjYCNI/QyKDNenhqV/BVOS4T
	i5R3+rHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL05Q-0004mA-20; Thu, 17 Oct 2019 07:20:40 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL055-0004M8-Hl
 for linux-mtd@lists.infradead.org; Thu, 17 Oct 2019 07:20:21 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 00:20:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,306,1566889200"; d="scan'208";a="186404307"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
 by orsmga007.jf.intel.com with ESMTP; 17 Oct 2019 00:20:13 -0700
From: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v4 2/2] mtd: spi-nor: cadence-quadspi: Disable the auto-poll
 for Intel LGM SoC
Date: Thu, 17 Oct 2019 15:20:00 +0800
Message-Id: <20191017072000.48860-3-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191017072000.48860-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20191017072000.48860-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_002019_665369_C415A96E 
X-CRM114-Status: GOOD (  11.00  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 tudor.ambarus@gmail.com, vigneshr@ti.com, boris.brezillon@free-electrons.com,
 richard@nod.at, qi-ming.wu@intel.com, linux-kernel@vger.kernel.org,
 david.oberhollenzer@sigma-star.at,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 miquel.raynal@bootlin.com, jwboyer@gmail.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, cyrille.pitchen@atmel.com, andriy.shevchenko@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>

On Intel Lightning Mountain SoCs QSPI controller do not use auto-poll.
This patch disables auto polling when direct access mode is disabled

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 0ad076eaa81b..c2333f0473e3 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -88,6 +88,7 @@ struct cqspi_st {
 	bool			rclk_en;
 	u32			trigger_address;
 	u32			wr_delay;
+	bool			auto_poll;
 	struct cqspi_flash_pdata f_pdata[CQSPI_MAX_CHIPSELECT];
 };
 
@@ -136,6 +137,8 @@ struct cqspi_driver_platdata {
 #define CQSPI_REG_RD_INSTR_TYPE_DATA_MASK	0x3
 #define CQSPI_REG_RD_INSTR_DUMMY_MASK		0x1F
 
+#define CQSPI_REG_WR_COMPLETION_CTRL			0x38
+#define CQSPI_REG_WR_COMPLETION_DISABLE_AUTO_POLL	BIT(14)
 #define CQSPI_REG_WR_INSTR			0x08
 #define CQSPI_REG_WR_INSTR_OPCODE_LSB		0
 #define CQSPI_REG_WR_INSTR_TYPE_ADDR_LSB	12
@@ -1175,6 +1178,18 @@ static int cqspi_of_get_pdata(struct platform_device *pdev)
 	return 0;
 }
 
+static int cqspi_disable_auto_poll(struct cqspi_st *cqspi)
+{
+	void __iomem *reg_base = cqspi->iobase;
+	unsigned int reg;
+
+	reg = readl(reg_base + CQSPI_REG_WR_COMPLETION_CTRL);
+	reg |= CQSPI_REG_WR_COMPLETION_DISABLE_AUTO_POLL;
+	writel(reg, reg_base + CQSPI_REG_WR_COMPLETION_CTRL);
+
+	return 0;
+}
+
 static void cqspi_controller_init(struct cqspi_st *cqspi)
 {
 	u32 reg;
@@ -1206,6 +1221,10 @@ static void cqspi_controller_init(struct cqspi_st *cqspi)
 	reg |= CQSPI_REG_CONFIG_ENB_DIR_ACC_CTRL;
 	writel(reg, cqspi->iobase + CQSPI_REG_CONFIG);
 
+	/* Disable auto-polling */
+	if (!cqspi->auto_poll)
+		cqspi_disable_auto_poll(cqspi);
+
 	cqspi_controller_enable(cqspi, 1);
 }
 
@@ -1421,6 +1440,9 @@ static int cqspi_probe(struct platform_device *pdev)
 		cqspi->wr_delay = 5 * DIV_ROUND_UP(NSEC_PER_SEC,
 						   cqspi->master_ref_clk_hz);
 
+	if (ddata && (ddata->quirks & CQSPI_DISABLE_DAC_MODE))
+		cqspi->auto_poll = false;
+
 	ret = devm_request_irq(dev, irq, cqspi_irq_handler, 0,
 			       pdev->name, cqspi);
 	if (ret) {
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
