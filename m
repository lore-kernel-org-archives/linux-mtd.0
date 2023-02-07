Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19631C636CC
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Feb 2023 06:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=smeouqTUyTFhLQqG44ZKmOtN2fwCt2K2avzh0gkf8Iw=; b=BgqrLvHTTPqbo7
	LGI7N6uQ8tlst4mvp1qm8pqv78wEThVytsw+SVrDEtVf6giy5eweQqTxD0CHvskGB09y5KCZxdxj2
	Q6uMxxZTsq4b/ylylr3z8DWrpVqVzoPcM62lByHa+PcXXR2ztDapEcIz3+CQF1MA+nHPmtqHG0J02
	a46LiqWNqK+uaCFlA1Jat92SSWHyARIXtGo5AY1QadA7/PRHFeFJIRGnQwhA++o7SqNu2Knr1TVLF
	umQkbxXFBoxOGF7RRlB3Z5vgSa923mps8biuu8qPp6tsVhlOaZo7fqNwvsb7hRtLq8jM6rGHQEKz1
	pDmdoEsZfVBk/n0RCSIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHAv-00AvZi-Aq; Tue, 07 Feb 2023 06:09:53 +0000
Received: from mail-mw2nam12on2061a.outbound.protection.outlook.com ([2a01:111:f400:fe5a::61a] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHAp-00AvXf-OI
	for linux-mtd@lists.infradead.org; Tue, 07 Feb 2023 06:09:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h66DGzSByZNSQBJ7Jfn78OcuGcl8nkiKM8/G99tOxhjCvLzUC+tzCkQCaC5Hm+fX5rnHrTVepr8qMWrfKt+UtX9mrmfFX7ECESqa8XOWuymW9g4yUxdM5IIocXON17akgf0ro5+oAUHM3qdGzgh8WX2RWi1uDyYWXkdtS8zR/tQFfQGys0WEm4knoZfWdoVUCxQieygxpxt3jGwiNYsHmB6VDN9ZhW+v5CFsCOjZ2fgRUeLG58ds1wY/W6dPIJMF4t8Tdxk6Ik6DMIuBXhUpQxv0KDGkVyHDpM6r4JocAaH+Wj+rkahBRzBAJeMC7b1qK+B0QCE9Wqt/li3m/UmJcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s014qIdrVIxPpZVloQ7M/vCeKFR+q5a6fzI9mp/0hjY=;
 b=LAhhNTBnWSXIiUke5degSfDC/kPUw48f+WGmxK/UH64Uf0ZFBxv566w87gyMxEGt7p5Jtq1lDodAS6ox51BMnJUpGPdISGzcU/nUeJdsFfcp+ePMWI0NiHLwcs0RhFlVO369tPBv2JRiEhfIm8xxErzdxmrbnpyM9Ckjb9mlQPOUSaTBDrIvNsqzT8pygBa4ZZpAD1U6REwS3STj77mL+bqStgFY0Vz1sQhD8soorZQJ9ON+jC4W2yp4V1b9h+ck+onmandvUMC5CaKx1/NtCa+94y4d4p93fhGmvYX49s6FNqOk1us7AhZqrvTqFlcYPqHwwhYIivm3YbPPGL/9gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s014qIdrVIxPpZVloQ7M/vCeKFR+q5a6fzI9mp/0hjY=;
 b=mNi6ZrWTJ/yUI5quFgiKC9OpvC8fbmma3QZ+pMz7+Aa6NWo8oeAEEFYyW6ZVGCjMdCCOvnSPiId77y/HhLOq7p8ruYdCDeChI/gbvQPcNjMFwL/F8fZTUVF2zQereqVeA0xLByVawU+4dJHf7kk9RwgZ15RvxgF+tTViIx+R5D4=
Received: from DM6PR02CA0123.namprd02.prod.outlook.com (2603:10b6:5:1b4::25)
 by CH3PR12MB8511.namprd12.prod.outlook.com (2603:10b6:610:15c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Tue, 7 Feb
 2023 06:09:42 +0000
Received: from DM6NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::83) by DM6PR02CA0123.outlook.office365.com
 (2603:10b6:5:1b4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34 via Frontend
 Transport; Tue, 7 Feb 2023 06:09:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT109.mail.protection.outlook.com (10.13.173.178) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.34 via Frontend Transport; Tue, 7 Feb 2023 06:09:42 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Feb
 2023 00:09:41 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Feb
 2023 00:09:41 -0600
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Feb 2023 00:09:38 -0600
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Mark Brown <broonie@kernel.org>, Tudor Ambarus
	<tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, "Michael
 Walle" <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <saikrishna12468@gmail.com>, <git@amd.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: [PATCH 1/3] spi: cadence-quadspi: Add support for PHY module and DQS
Date: Tue, 7 Feb 2023 11:39:22 +0530
Message-ID: <20230207060924.265789-2-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207060924.265789-1-sai.krishna.potthuri@amd.com>
References: <20230207060924.265789-1-sai.krishna.potthuri@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT109:EE_|CH3PR12MB8511:EE_
X-MS-Office365-Filtering-Correlation-Id: 137dce3e-ba54-47a4-de56-08db08d1e755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	6hNLwCv6XahYBN4zJQKjil9IamUld/t2uljBcE3ppCKjo/n1zsD/oLxuUvklOJOXnVtV3sjgrq0Fe/rNozT2VMpxbcZiZ71hzzcpIFYfvwOKmUJpD7cKAZbMv+DskwM5dFm5dp0m9IuEz5/qGh/NiERH3Jk8wQMmdDm9qx1D7sIme/FSFd2fcbQS41F5Oi5BegFPurOmZ9hhR3XSSvzZOGNYcv1oY+STnhQSRLtSQtz9fumw+GyYpz3CcfI2gR0zCgeLCXFOyFHTD3wlp9P4qMNRatBzcpGYu+3D0ojr1gyqLbVp8C33prt3De5L++/WOE4uGzD5Z91AFSKZn94/KiM589D4DO4xae+ScrHhPrIhvK0TUOihPIY6LJkOYihJgasPJ9N73bPCHt375P6PEO1PC7aT4bK5p4egoQonhUuSudOKz4yihcdckET1vgHM83qVjmSkmOTWHJHs6z+0mtUJRVEfSbKqYV8IbCn0Bfu3VC88OqqCglnhZC6C4oRsO/bv+rKsSdh/rhDSnZP7XrGrj/HUkH8neJZuVCnMZjFZlJrQkU67r7zX5CSqUmhQftuLy8iuIeyBdn19cwWfj7mSVo9z8sLhWiwpmPuSU0m8nM29lzTTTH/VXYSonOqCZq7d6KjLDhrZmkhdPN+b6TJz1ZILl6BZZSYgv/pvUrChFGcr5yjrkO8uCI+BTMmnTRfI+ub4tKpanBkQvMQ9vq4WCTlPylSDFVRPqFNBXyU=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199018)(40470700004)(46966006)(36840700001)(81166007)(356005)(47076005)(82740400003)(82310400005)(1076003)(6666004)(186003)(26005)(36756003)(40460700003)(86362001)(70206006)(2616005)(8676002)(336012)(426003)(4326008)(83380400001)(70586007)(54906003)(316002)(36860700001)(7416002)(103116003)(478600001)(110136005)(2906002)(5660300002)(41300700001)(8936002)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 06:09:42.3689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 137dce3e-ba54-47a4-de56-08db08d1e755
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DM6NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8511
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_220947_811153_3AA088D0 
X-CRM114-Status: GOOD (  17.84  )
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

Cadence Octal SPI Flash Controller has PHY module, which is used for
handling SPI transactions when there is a requirement for high
performance. Also, this controller supports DQS(data strobe) used for
data capturing in PHY mode rather than internally generated ref_clk.
Xilinx Versal Octal SPI use PHY module and DQS signal when operating in
DTR protocol.

Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
---
 drivers/spi/spi-cadence-quadspi.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 676313e1bdad..b55b763003f0 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -40,6 +40,8 @@
 #define CQSPI_SUPPORT_EXTERNAL_DMA	BIT(2)
 #define CQSPI_NO_SUPPORT_WR_COMPLETION	BIT(3)
 #define CQSPI_SLOW_SRAM		BIT(4)
+#define CQSPI_HAS_PHY			BIT(5)
+#define CQSPI_HAS_DQS			BIT(6)
 
 /* Capabilities */
 #define CQSPI_SUPPORTS_OCTAL		BIT(0)
@@ -89,6 +91,8 @@ struct cqspi_st {
 	u32			pd_dev_id;
 	bool			wr_completion;
 	bool			slow_sram;
+	bool			use_phy;
+	bool			use_dqs;
 };
 
 struct cqspi_driver_platdata {
@@ -112,6 +116,7 @@ struct cqspi_driver_platdata {
 /* Register map */
 #define CQSPI_REG_CONFIG			0x00
 #define CQSPI_REG_CONFIG_ENABLE_MASK		BIT(0)
+#define CQSPI_REG_CONFIG_PHY_MODE		BIT(3)
 #define CQSPI_REG_CONFIG_ENB_DIR_ACC_CTRL	BIT(7)
 #define CQSPI_REG_CONFIG_DECODE_MASK		BIT(9)
 #define CQSPI_REG_CONFIG_CHIPSELECT_LSB		10
@@ -151,6 +156,7 @@ struct cqspi_driver_platdata {
 #define CQSPI_REG_DELAY_TSHSL_MASK		0xFF
 
 #define CQSPI_REG_READCAPTURE			0x10
+#define CQSPI_REG_READCAPTURE_DQS		BIT(8)
 #define CQSPI_REG_READCAPTURE_BYPASS_LSB	0
 #define CQSPI_REG_READCAPTURE_DELAY_LSB		1
 #define CQSPI_REG_READCAPTURE_DELAY_MASK	0xF
@@ -468,6 +474,8 @@ static int cqspi_enable_dtr(struct cqspi_flash_pdata *f_pdata,
 	if (op->cmd.dtr) {
 		reg |= CQSPI_REG_CONFIG_DTR_PROTO;
 		reg |= CQSPI_REG_CONFIG_DUAL_OPCODE;
+		if (cqspi->use_phy)
+			reg |= CQSPI_REG_CONFIG_PHY_MODE;
 
 		/* Set up command opcode extension. */
 		ret = cqspi_setup_opcode_ext(f_pdata, op, shift);
@@ -476,10 +484,20 @@ static int cqspi_enable_dtr(struct cqspi_flash_pdata *f_pdata,
 	} else {
 		reg &= ~CQSPI_REG_CONFIG_DTR_PROTO;
 		reg &= ~CQSPI_REG_CONFIG_DUAL_OPCODE;
+		reg &= ~CQSPI_REG_CONFIG_PHY_MODE;
 	}
 
 	writel(reg, reg_base + CQSPI_REG_CONFIG);
 
+	reg = readl(reg_base + CQSPI_REG_READCAPTURE);
+
+	if (op->cmd.dtr)
+		reg |= CQSPI_REG_READCAPTURE_DQS;
+	else
+		reg &= ~CQSPI_REG_READCAPTURE_DQS;
+
+	writel(reg, reg_base + CQSPI_REG_READCAPTURE);
+
 	return cqspi_wait_idle(cqspi);
 }
 
@@ -1700,6 +1718,10 @@ static int cqspi_probe(struct platform_device *pdev)
 			cqspi->wr_completion = false;
 		if (ddata->quirks & CQSPI_SLOW_SRAM)
 			cqspi->slow_sram = true;
+		if (ddata->quirks & CQSPI_HAS_PHY)
+			cqspi->use_phy = true;
+		if (ddata->quirks & CQSPI_HAS_DQS)
+			cqspi->use_dqs = true;
 
 		if (of_device_is_compatible(pdev->dev.of_node,
 					    "xlnx,versal-ospi-1.0"))
@@ -1820,7 +1842,8 @@ static const struct cqspi_driver_platdata socfpga_qspi = {
 
 static const struct cqspi_driver_platdata versal_ospi = {
 	.hwcaps_mask = CQSPI_SUPPORTS_OCTAL,
-	.quirks = CQSPI_DISABLE_DAC_MODE | CQSPI_SUPPORT_EXTERNAL_DMA,
+	.quirks = CQSPI_DISABLE_DAC_MODE | CQSPI_SUPPORT_EXTERNAL_DMA
+			| CQSPI_HAS_PHY | CQSPI_HAS_DQS,
 	.indirect_read_dma = cqspi_versal_indirect_read_dma,
 	.get_dma_status = cqspi_get_versal_dma_status,
 };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
