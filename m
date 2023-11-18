Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7146C5AD4C
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Nov 2023 13:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eT6QB/+mvUVC/VsnAPXYIEMm/Jn74J+eF9abBf5EmLU=; b=OHFha1AOBnV4Lf
	VOgltsVEZtS5Oky6Qq4v4uXvyE560yfmlc3WJAPu9FDtiY3wg/mcTcLbt/VQY8n7zZdJPVJ3VEwnt
	d1EAf2LgHUT2TUVo8gd43JYUQjZ4eACGLFlNSOTv6oIjis7Xx36wJPHmDgMZYZq9qIPWFxXeX56xj
	yGtSzyQBq1TJZceW/uvTZ2IvVPmZBCwaIwqekC9l9gngKJw3Pw5frXvmHPS5oPADTn2yMEuKesNK8
	LThhjonHpPU2uh3SqTooO5x92PDASjISRf11FDWxWcmjfZjqtcozBEGy/FsGMwmfCTmlF8rcEe9g1
	M+pMD1V/kZ6cRFY+em8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4LnR-008b5s-03;
	Sat, 18 Nov 2023 13:55:41 +0000
Received: from mail-mw2nam12on2061e.outbound.protection.outlook.com ([2a01:111:f400:fe5a::61e] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4LnJ-008axb-0o;
	Sat, 18 Nov 2023 13:55:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfTN+UV5Pvniy5S9CB6nTohfoMxr1UhFTITEr26svoAGnJrTq4G95O3tSMCI108RrtvpTIDx7vv5yd2SQ9Fw6QTMTwMOdUpzuaReN36BHm3TE4ZUAungALz8GFpnCu0b3PjVG7mLOdl+j2Xx1RwCKsJwYoaVFUU+WPTfaRPI3K1iwxfPeqIla6T1yeWY1BltKnlmC2kPrahDU9K0LBddoy1peQsNcRaf+3zKMAJxs0k2/6SQ1eAqFb35Fcz2CMOet13sdn2A4/F7h63skfJwiBy7JFKB6nFVcgLE4r0BsOKFIost+cAyNQNUl7CNOdpQueXuMY/6O3ocpA9atuV3mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQa9GPkrCGOp5ad8QlFuAGLTRq4s361ZkeiJ5fBIuRg=;
 b=B77OrZoFiNSo+MWFouSnUlZJofhPi4kvcUIB7+rCxxW86ykpC7cV1Odtgvya8t0HHhBQyt1QC1rLEFcaoH43bzSsPLlRrv5LmfSMTopJfC17viGi329jrwEnWZR/Na+SjzNTCHz4QC/aC57ZjTknaTaa1CyZWS9WJoS03Yd74x9feYfZgfjZA4hNK7BOIIUMaucXyMkN2TgXn+tC+o8IGLhkia8XdRaL6DkJN+1x5lYKvKEkd1Fa1Ec0xaok9eZ0y9SA7N/IeLPVdANvcGpK/SWINXYQOOoUnOX2FzwPqN1GIZHONurW4tX77E3G6WhzJmw4tdxZ74B4gjPurKG9mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQa9GPkrCGOp5ad8QlFuAGLTRq4s361ZkeiJ5fBIuRg=;
 b=GP+oCXFOhGRgPvfH7j6Q6pnO9zKfgpH1wKgASU9F3qiE2ux9E8TAt6/ZgK79icWqrf/cZxAaB5OtEDZ/B8xrcytFwmWV3nB2nty0KZvXgjXq/5J6PrTKUniRySKwgcLZBZHbM95hL7/8vl6nzDETEOAvTpm7qa54ol5IwImWHvw=
Received: from MW4PR03CA0319.namprd03.prod.outlook.com (2603:10b6:303:dd::24)
 by LV8PR12MB9154.namprd12.prod.outlook.com (2603:10b6:408:190::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Sat, 18 Nov
 2023 13:55:23 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:303:dd:cafe::51) by MW4PR03CA0319.outlook.office365.com
 (2603:10b6:303:dd::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.25 via Frontend
 Transport; Sat, 18 Nov 2023 13:55:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.13 via Frontend Transport; Sat, 18 Nov 2023 13:55:23 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sat, 18 Nov
 2023 07:55:22 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sat, 18 Nov
 2023 07:55:22 -0600
Received: from xhdakumarma40u.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Sat, 18 Nov 2023 07:55:17 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <broonie@kernel.org>, <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<sbinding@opensource.cirrus.com>
CC: <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<michael@walle.cc>, <linux-mtd@lists.infradead.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <michal.simek@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <git@amd.com>,
	<amitrkcian2002@gmail.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>
Subject: [PATCH v10 6/8] spi: spi-zynqmp-gqspi: Add stacked memories support in GQSPI driver
Date: Sat, 18 Nov 2023 19:24:44 +0530
Message-ID: <20231118135446.52783-7-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231118135446.52783-1-amit.kumar-mahapatra@amd.com>
References: <20231118135446.52783-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|LV8PR12MB9154:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a9869f-6864-4c58-794d-08dbe83e02c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ufz+c5yHKaFcPC6/vKW9nfeHPZs5r2zP/eiKD9HkYEr9BjYrcjsRQ/hTXLgR1b1NOY1cVcPlhOoaQCSCiB2Q+FBabbKHHMB3BP/gr5vWz7ssp8WRa+PscZ8lfunbB1wNL0LawKm0iZuFUNCsEptD5969tWgD9SIFGhp1w+gkw3z+wwxS+lBtoNWm1wUv/D4eRfk4kochaAR0+IaVlAHmk1NS7l3VRMkrqOmc6lLxzRhlbfxjJnQDRVkCqykbjmaOrRtUZXU+paGvnxB3PmXoTJ7HUtn7U0g85TVdPzUTFLctEEk/ZFjTry1VvgwVQFqXJ/u7CWb84e1P1ORZ5j2a41gRNq0GR1uEqceHprIpufpPqZgL1fn7QW527TXMItz85BCVtlpsBkjJFVoO65/GxCAmwZdPACX5qVmhLyfDEuYnEA7GUcsDTf3GsW/MeeSxJ8vuAHtjc1ckjb1k0Uh4vQwH/bKbhSKg9NoZk1sb8CvyOMiqlKOQAvZwgSnYlQFmt4cWfDsJA4xR5xGthSq26W1GcEqTwo6qz+ir5E7Wj8DglBIdiV4GI6ff1rKJtktv6B2iBcQnx7xsc4LgAxF9rGgKfiGdnAHcsFxb4GIRGfAW0rqrsHiloXrkMQ4s/EkTkmAH5QvGWTP/StXIMRq3benybCoEtFgP6ochCX/HZUnMDdw7jQhTq98YzdyO2ySPdhGvJRJ3wsfDJVNAjO0e+h4P/wzaCT3kzRoNC9h3wbbQK0oLq0yJ41hhsQ2X7pDOUTyo1NlhUPR53xIh5eiMEQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(396003)(136003)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799012)(40470700004)(46966006)(36840700001)(82740400003)(83380400001)(426003)(336012)(36756003)(86362001)(40460700003)(36860700001)(81166007)(47076005)(356005)(70586007)(70206006)(110136005)(54906003)(316002)(8676002)(8936002)(4326008)(41300700001)(7416002)(5660300002)(2906002)(1076003)(40480700001)(2616005)(26005)(478600001)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2023 13:55:23.3279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a9869f-6864-4c58-794d-08dbe83e02c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231118_055533_295339_7DF4C87C 
X-CRM114-Status: GOOD (  11.84  )
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

GQSPI supports two chip select CS0 & CS1. Update the driver to
assert/de-assert the appropriate chip select as per the bits set in
qspi->cs_index_mask.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/spi/spi-zynqmp-gqspi.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index 9a46b2478f4e..c5d12ddd4ab3 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -154,6 +154,9 @@
 #define GQSPI_FREQ_100MHZ	100000000
 #define GQSPI_FREQ_150MHZ	150000000
 
+#define GQSPI_SELECT_LOWER_CS  BIT(0)
+#define GQSPI_SELECT_UPPER_CS  BIT(1)
+
 #define SPI_AUTOSUSPEND_TIMEOUT		3000
 enum mode_type {GQSPI_MODE_IO, GQSPI_MODE_DMA};
 
@@ -465,15 +468,17 @@ static void zynqmp_qspi_chipselect(struct spi_device *qspi, bool is_high)
 
 	genfifoentry |= GQSPI_GENFIFO_MODE_SPI;
 
+	if (qspi->cs_index_mask & GQSPI_SELECT_UPPER_CS) {
+		zynqmp_gqspi_selectslave(xqspi,
+					 GQSPI_SELECT_FLASH_CS_UPPER,
+					 GQSPI_SELECT_FLASH_BUS_LOWER);
+	} else if (qspi->cs_index_mask & GQSPI_SELECT_LOWER_CS) {
+		zynqmp_gqspi_selectslave(xqspi,
+					 GQSPI_SELECT_FLASH_CS_LOWER,
+					 GQSPI_SELECT_FLASH_BUS_LOWER);
+	}
+	genfifoentry |= xqspi->genfifobus;
 	if (!is_high) {
-		if (!spi_get_chipselect(qspi, 0)) {
-			xqspi->genfifobus = GQSPI_GENFIFO_BUS_LOWER;
-			xqspi->genfifocs = GQSPI_GENFIFO_CS_LOWER;
-		} else {
-			xqspi->genfifobus = GQSPI_GENFIFO_BUS_UPPER;
-			xqspi->genfifocs = GQSPI_GENFIFO_CS_UPPER;
-		}
-		genfifoentry |= xqspi->genfifobus;
 		genfifoentry |= xqspi->genfifocs;
 		genfifoentry |= GQSPI_GENFIFO_CS_SETUP;
 	} else {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
