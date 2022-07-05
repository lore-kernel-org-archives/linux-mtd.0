Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CC6C43334
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jul 2022 09:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6jc4Kt8uiMPjZyk/yhxAIJAMVx/dxGVGQ9sh1PReWsk=; b=VpUG09H7pVuLSb
	tBW9FHjKv9QkwIpSRbSKakFHw2gLQ5vIGzE+uMhpZmRvrpZB/xB8ciOWLcsGNZckrbm3wZzQL2q1V
	P0XyFPs00abwDT8xMeltMMox43vb3LzPxaLhwGd2rBAg87gEMw/QJ12yvj/177w75xwmF4cI1x9ll
	75MlYEPspJSXsMl/mc92199jRzRYCSH/7FipLMgkdINmTJyZnKivrwwCi30iXt7LxK7wJQr4r22SQ
	Ia39T9KLrqbPWi5BQUCJOq+x3KEcX1msYj5SL0okk8hSoAsR51NpDfJOLo4PL3XlcypDSRGYvC7Vi
	ZVAmrSeEfSYCoso28h1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8esa-00GiPO-C2; Tue, 05 Jul 2022 09:30:00 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8epd-00GgVE-U4; Tue, 05 Jul 2022 09:27:00 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A587A200CA7;
	Tue,  5 Jul 2022 11:26:56 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 442E6200E2B;
	Tue,  5 Jul 2022 11:26:56 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id D8BFF180222D;
	Tue,  5 Jul 2022 17:26:53 +0800 (+08)
From: haibo.chen@nxp.com
To: ashish.kumar@nxp.com,
	yogeshgaur.83@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	han.xu@nxp.com,
	singh.kuldeep87k@gmail.com,
	tudor.ambarus@microchip.com,
	p.yadav@ti.com,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	festevam@gmail.com,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	haibo.chen@nxp.com,
	zhengxunli@mxic.com.tw
Subject: [PATCH 06/11] spi: spi-nxp-fspi: enable octal ddr for iMX8QM/QXP/DXL
Date: Tue,  5 Jul 2022 17:11:38 +0800
Message-Id: <1657012303-6464-6-git-send-email-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
References: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_022658_150490_A5BAA2ED 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Han Xu <han.xu@nxp.com>

To enable the octal ddr for iMX8QM/QXP/DXL, need to set the proper
slave line delay to get the correct sample points. So add one entry
in dts to set it.

Signed-off-by: Han Xu <han.xu@nxp.com>
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/spi/spi-nxp-fspi.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
index 61cf1b82c0d7..cfc2600e3b6d 100644
--- a/drivers/spi/spi-nxp-fspi.c
+++ b/drivers/spi/spi-nxp-fspi.c
@@ -218,9 +218,13 @@
 
 #define FSPI_DLLACR			0xC0
 #define FSPI_DLLACR_OVRDEN		BIT(8)
+#define FSPI_DLLACR_SLVDLY(x)          ((x) << 3)
+#define FSPI_DLLACR_DLLEN              BIT(0)
 
 #define FSPI_DLLBCR			0xC4
 #define FSPI_DLLBCR_OVRDEN		BIT(8)
+#define FSPI_DLLBCR_SLVDLY(x)          ((x) << 3)
+#define FSPI_DLLBCR_DLLEN              BIT(0)
 
 #define FSPI_STS0			0xE0
 #define FSPI_STS0_DLPHB(x)		((x) << 8)
@@ -375,6 +379,7 @@ struct nxp_fspi {
 	u32 memmap_phy_size;
 	u32 memmap_start;
 	u32 memmap_len;
+	u32 dll_slvdly;
 	struct clk *clk, *clk_en;
 	struct device *dev;
 	struct completion c;
@@ -1081,6 +1086,13 @@ static int nxp_fspi_default_setup(struct nxp_fspi *f)
 	fspi_writel(f, FSPI_DLLACR_OVRDEN, base + FSPI_DLLACR);
 	fspi_writel(f, FSPI_DLLBCR_OVRDEN, base + FSPI_DLLBCR);
 
+	if (f->dll_slvdly) {
+		fspi_writel(f, FSPI_DLLACR_DLLEN | FSPI_DLLACR_SLVDLY(f->dll_slvdly),
+			    base + FSPI_DLLACR);
+		fspi_writel(f, FSPI_DLLBCR_DLLEN | FSPI_DLLBCR_SLVDLY(f->dll_slvdly),
+			    base + FSPI_DLLBCR);
+	}
+
 	/* enable module */
 	fspi_writel(f, FSPI_MCR0_AHB_TIMEOUT(0xFF) |
 		    FSPI_MCR0_IP_TIMEOUT(0xFF) | (u32) FSPI_MCR0_OCTCOMB_EN,
@@ -1259,6 +1271,9 @@ static int nxp_fspi_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
+	/* check if need to set the slave delay line */
+	of_property_read_u32(np, "nxp,fspi-dll-slvdly", &f->dll_slvdly);
+
 	mutex_init(&f->lock);
 
 	ctlr->bus_num = -1;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
