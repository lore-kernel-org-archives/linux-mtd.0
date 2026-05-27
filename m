Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57D7CD4F54
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 17:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gcq8w5gjppkRc/Ab/HBDkpAqypIwn3JLRUaQ4wFQqVQ=; b=jRFNrb+qwU2M+M
	NZNx2hkm3I0OSZngoZL4u9XEy0hguvdpKXkgrf0/w62XO7eWm/2y6eBczrAZ2z3/yvAf+gVAsVoP/
	+7WxD1nVGa4ax9GJY9KkBL9PEjB7tk5giaern2Fg5J41HbO2R4c90DnBbklhkNX4OMI8E1vJK3TdM
	G6+WMdmmfI1UlwZfBdSWmGt9bpy8CHHvK61qOd6xkjSonJaxvNQsz57dYP+Sk7tM2Et6Rf+JDz8fx
	tNnGXRwHHYtaLWI+cy605QDZxu/7IJRbYB1EdL+YPJfzFgT1JRGlgy0XZN5SqlZnmpaQeAjCKNuMf
	8bA/uzVDRZRlV76kBGog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIUN-00000004bdl-2FEX;
	Wed, 27 May 2026 17:56:19 +0000
Received: from mail-westus2azon11010035.outbound.protection.outlook.com ([52.101.46.35] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIUK-00000004bbM-3td9
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 17:56:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBw+jqDx63Kz0atSSIgc3BJvzKt38WPVDmvZI8PXD7OZO7ZrLoHxwiIGIgZ9gKMFmQpiRx+AAgn5hRdCXj5MXZFmHpbhKCFdgjE06xgJhtl6S4JxgevpiRb4NVkL+1NfS6X9wWDyFTeJyA7aSRknpNP7/OkodhIz2TQ1X6R1JA9kep0vvrSrD+IDYFKt2/GyOQO1aLUv8QYhWHaUPTQ5JBQjfg/Zl0+LRYOlNHdqK4YcUjnV6GRQI9iBjlmtzspRgM9ehLzrHGhh/pe2q0G48aFY/PxtilFmD6A34Ebk241MPXRABjuXSYJZFVz1v4C2OZsuItkLVDk6yeaWr4TgyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWYfQJUfKbZZJ9k0BCHgnlW6JIDDm6EOLXaVsX8Kde4=;
 b=jSsKqsZMpYRAR3EARLseomaEwBuBRz7D7GuaYTuKGuLaqNK1eVZCSCtLFixFJ6xco5/Vf9/LSHxIWaYYyJLgJOj+ZG17JHAax4UtoEaQj1/FgfmKQd5xCvGME24Vtn5RojiPoUHLFP1aOxa2wHmHzNQ/kORNrfpd6g0qZ9c3YFQNFtu5cv/ePnGn93sP7shSgQQEop9sBdGq0RKJ4NYVQcidzikvV8tTZmNaYBA9DNOX08haUY9aFagyXuXV+rA1pUufO0G2HMcGnaxsYTGU03cK0Mb3KvHZXPlbRf+Wv9VPaNAT35J2obdiZE7vzC6CsqYD1EenqaVY4Yd9FLkXdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWYfQJUfKbZZJ9k0BCHgnlW6JIDDm6EOLXaVsX8Kde4=;
 b=L/zmP6Li77sWBsL/IqyLbsmEfjM0ot/N2nYl57IwuMe9savxShZOt7PQedHHDP4mUSicxoHxKxzrVXG599EziNbxazcS0XAeYjT7akJoB0B9Jjkvrxi5wA2SyjamW62+FxUWDTX2k6IbOyDwyBfemPk0wbxJtFM8wuCj0o5HhCg=
Received: from SJ0PR05CA0061.namprd05.prod.outlook.com (2603:10b6:a03:332::6)
 by BLAPR10MB5202.namprd10.prod.outlook.com (2603:10b6:208:306::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 27 May
 2026 17:56:13 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::31) by SJ0PR05CA0061.outlook.office365.com
 (2603:10b6:a03:332::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.4 via Frontend Transport; Wed, 27
 May 2026 17:56:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 17:56:10 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 27 May
 2026 12:56:10 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 27 May
 2026 12:56:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 27 May 2026 12:56:09 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64RHtYpi4052476;
	Wed, 27 May 2026 12:56:05 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <a-dutta@ti.com>, <s-k6@ti.com>
Subject: [PATCH v3 06/13] spi: cadence-quadspi: move cqspi_readdata_capture earlier
Date: Wed, 27 May 2026 23:25:20 +0530
Message-ID: <20260527175527.2247679-7-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527175527.2247679-1-s-k6@ti.com>
References: <20260527175527.2247679-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|BLAPR10MB5202:EE_
X-MS-Office365-Filtering-Correlation-Id: 07a07fcf-92de-495e-a3e9-08debc193c98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|7416014|921020|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Qx1TEEvu+qjQQxfwBPqZmwoVcZVtc2BqQlJVbTppBYsydKGGMsMOePBhjv7dCAVuCVY5Myvr2i4pxDiYj0TapUtEvvKO9W6kRgU9JcpRxECtVtzQPgHE8tAIInA9g5StCT0+FLSlTRzfgxJzJXlPYHLjDgC09iaAvCtLRep88tyR8oSaOuJDBfnvPT1gCTPB2mhubEQdjSG5fc5Eh0o4WQKzbdqvyJF2ZQG5HELbZOPkNMqXMfIZ96omVD7E8Zl24NL3UgkJJKSSkHuLwuuLjJYxDRFR1SHfIp3l6QJLKyqwdgyH1cEyquulO9Bsv9AD332sKsiamc2ypFobcHDlFE54bFsSojs0dIWvWdznOSVJUHX5Qrgu01E9aoQFhYPwDUiGiwRRIjFhJheJN1gT50UgDbs4h1SVfFZspxlGF8jAe5WcgyNTfOoOVBRpXTobwek0HwlX0MLLKbHUL/bEWr4M+OteweJCUOOzJgTGPm8Oy9nLTSLIJrxrRVAiRx5DzDKk+BMB4sQ+R72aGqoIUh7r6ov1jkPZX6kMrrNmPmiKMxMRRWqKBgb9KPfkHJfDrV+8zuFFikdW1//9jLvyx2TKhMLtHLnru+48PNOmFbvgOXjR7UoUOQDx/lHzAeMFNTV56USkmY9KynINXBV32L2XSGzv0B9sBxWL8sOUZmZr/eKXWi8wyhSNYZDRi9S0GUS6mDOmS2fCuW6SPfJSV1h+p2GYSZnbCkR99Cij9T3fkJLwsPmcH3wsZv/LQeWv72vwuif0Q88XQzLInJ+MIw==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(7416014)(921020)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ooxmCpSg+/LaJUFxMrxS7+EYBsW8ZiiagxzZsR5avvZ1McwgfOa2DpkK+1EJftZ0yZD/lgZx8yPiu8Zeb/8laQlSXK3y6gnwmQWiE6SFMoBAi33cSLXp9AnSOOaprd5+KIRbpAh1dvzJQ3R5kIIcBz+YruKL3tDz4PX3kITyf/jzC2URYyKWNb01OtjgeJciyr2DqQjCmSrbcP/x1LWrE1g5AWQ/Ju09IcwHs1xL2nVp3AaxahEIvKKTw9xlJb6j0bT3Le/9jegSAWTkyfSEkmoOKW1aGNFhs/PDpyk25On8TKWi1eyvwnbf9EK18bjkspGx7nxHwgC0m1WEkmCGGTpT4w/qfDQUEvmAATYRL/OCKK7NatQ6pt7ZllkxAZ0RcUZiKItSWFM0wfo8vZhzInWF/zgZJMNiYjTCGp54Tf7xut/zN6UG2wOYLXAam7lX
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 17:56:10.8670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a07fcf-92de-495e-a3e9-08debc193c98
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_105616_979580_044F2098 
X-CRM114-Status: GOOD (  10.46  )
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

Move cqspi_readdata_capture() function earlier in the file. This is
preparatory refactoring for upcoming PHY tuning support for read and
write operations.

No functional changes.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/spi/spi-cadence-quadspi.c | 45 +++++++++++++++----------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index aaba1a3ad577..54fd7b591e06 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -453,6 +453,28 @@ static int cqspi_wait_idle(struct cqspi_st *cqspi)
 	}
 }
 
+static void cqspi_readdata_capture(struct cqspi_st *cqspi, const bool bypass,
+				   const unsigned int delay)
+{
+	void __iomem *reg_base = cqspi->iobase;
+	unsigned int reg;
+
+	reg = readl(reg_base + CQSPI_REG_READCAPTURE);
+
+	if (bypass)
+		reg |= BIT(CQSPI_REG_READCAPTURE_BYPASS_LSB);
+	else
+		reg &= ~BIT(CQSPI_REG_READCAPTURE_BYPASS_LSB);
+
+	reg &= ~(CQSPI_REG_READCAPTURE_DELAY_MASK
+		 << CQSPI_REG_READCAPTURE_DELAY_LSB);
+
+	reg |= (delay & CQSPI_REG_READCAPTURE_DELAY_MASK)
+	       << CQSPI_REG_READCAPTURE_DELAY_LSB;
+
+	writel(reg, reg_base + CQSPI_REG_READCAPTURE);
+}
+
 static int cqspi_exec_flash_cmd(struct cqspi_st *cqspi, unsigned int reg)
 {
 	void __iomem *reg_base = cqspi->iobase;
@@ -1270,29 +1292,6 @@ static void cqspi_config_baudrate_div(struct cqspi_st *cqspi)
 	writel(reg, reg_base + CQSPI_REG_CONFIG);
 }
 
-static void cqspi_readdata_capture(struct cqspi_st *cqspi,
-				   const bool bypass,
-				   const unsigned int delay)
-{
-	void __iomem *reg_base = cqspi->iobase;
-	unsigned int reg;
-
-	reg = readl(reg_base + CQSPI_REG_READCAPTURE);
-
-	if (bypass)
-		reg |= BIT(CQSPI_REG_READCAPTURE_BYPASS_LSB);
-	else
-		reg &= ~BIT(CQSPI_REG_READCAPTURE_BYPASS_LSB);
-
-	reg &= ~(CQSPI_REG_READCAPTURE_DELAY_MASK
-		 << CQSPI_REG_READCAPTURE_DELAY_LSB);
-
-	reg |= (delay & CQSPI_REG_READCAPTURE_DELAY_MASK)
-		<< CQSPI_REG_READCAPTURE_DELAY_LSB;
-
-	writel(reg, reg_base + CQSPI_REG_READCAPTURE);
-}
-
 static void cqspi_configure(struct cqspi_flash_pdata *f_pdata,
 			    unsigned long sclk)
 {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
