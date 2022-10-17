Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FD6C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Oct 2022 12:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pWjQMlzMaiktME/9Eqf2nva0uU6yTDzYLHzAyl3o6H8=; b=yxVcWjxSeX4Ky3
	GjVe5lMRQXGgOR5gmhsEtlauHvraRqAfubrfKJ37eQ50IGq1Vwjwu1QR2SC8U2QwoDGjMZ1yUhL8s
	dXf+THdSdqIVYj9msziij15HpFDvzuIufK9mthzgyh0q9MHgLR2M9Ozj/RwXhmGkjQT3f4i2Jo0yR
	sW8T3qvpnlhN1bMaz9X3ARnRf9AYqBXBbRoIUTRtMnc7Ii1TX1OpMc/T+/vvOHPGmERSPNBYey6SD
	Zv1EvthNo2yJxO8iCmNQW5Ms0o5JnaN9fMfiWOd13sXG83rwT4aUkPvpbC9q3Zt/oECN1QS6vueYK
	tFuU/FxuR7CKcOO3pmQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okP7j-00BUus-GW; Mon, 17 Oct 2022 12:21:39 +0000
Received: from mail-dm6nam10on2084.outbound.protection.outlook.com ([40.107.93.84] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okP2r-00BSXv-A6; Mon, 17 Oct 2022 12:16:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SlIzRhQhRmClGJYHouZ/SNC5bF5wr4RLESezwoc0i0XIOaUHe29rc4vDK4k4kncjdeH6nUHaK64XR4NNtjgNp1VdPVL9+fmlnUlaNMCCPcAfbu1LHLbXLdNkPereSKDOTEzqTXyF01q99/zK3DUdfo0DIHTMZ3MFdtqbx0stmDRvyThYTp1KO3XkGmNVQcO9mH/f7+bLRnKW6dZf5HG6Z7u3C9tURquL5MyJVsp+9hrcJ0rYTB1krxa+ROl+PFGmwZHR/t3RZq8ok0fNW8HOzo9L7FnL28tHx2FiXnWpLhCC+wPNkFTdjpX4HMIWmhdyaCddQ58O+ljW7iyxtjjk/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+1vrMZ2gMoivhsR47gAAc0dSbHW3CssL8j85wfULFA=;
 b=jI5qkrz7pnGFV4s+3UJYPJN9jgrFW1vlzWt1ln5Lc3pXWvDdo4h6zxj78dFISJCb4scjy76Ej2DrpyQ0k2pRxGmLVP8N96zk0Mavqe+4bfB3ECijWfoSG5qK1u2DaH1A4VymocOCo1/sy5Gk3mgqObsZ0v9Oqn8NYkkzse77OPmEQV3g1KJ0ELjX5dmToRWmrl4VHPBjWSeCQj4kxH1cGpYQq2OFlFFk+Fj//gcmly7UjU+O1BU/N6WMRwXVHLA10DRGbstBHJGX3oVEaRVDclLywEWFGGMDZtPiE5BwsJrU5j55bpnfoR8UmTnz7CxBYZ7+pb3E+oOXV52GMctu6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+1vrMZ2gMoivhsR47gAAc0dSbHW3CssL8j85wfULFA=;
 b=fBDeOWHCgat6qOpfxl9C60wtXPq5pxfCxenUViOrEmmUA8x4UifK/fj3/WuhjdIEbsodX512a2r1tmIjPbnhj3Xyz360N+alGcDtinvWRFHrpOwNS4lcT27bDihmJ26IEAIjMSqFLtIddP720miV4Zx5hVYkm5y/xcGhB9BENA8=
Received: from BN0PR04CA0186.namprd04.prod.outlook.com (2603:10b6:408:e9::11)
 by BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 12:16:32 +0000
Received: from BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::b6) by BN0PR04CA0186.outlook.office365.com
 (2603:10b6:408:e9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32 via Frontend
 Transport; Mon, 17 Oct 2022 12:16:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT018.mail.protection.outlook.com (10.13.176.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 12:16:32 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 07:16:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 05:16:31 -0700
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Mon, 17 Oct 2022 07:16:06 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <broonie@kernel.org>, <sanju.mehta@amd.com>,
	<chin-ting_kuo@aspeedtech.com>, <clg@kaod.org>, <kdasu.kdev@gmail.com>,
	<f.fainelli@gmail.com>, <rjui@broadcom.com>, <sbranden@broadcom.com>,
	<eajames@linux.ibm.com>, <olteanv@gmail.com>, <han.xu@nxp.com>,
	<john.garry@huawei.com>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
	<narmstrong@baylibre.com>, <khilman@baylibre.com>, <matthias.bgg@gmail.com>,
	<haibo.chen@nxp.com>, <linus.walleij@linaro.org>, <daniel@zonque.org>,
	<haojian.zhuang@gmail.com>, <robert.jarzmik@free.fr>, <agross@kernel.org>,
	<bjorn.andersson@linaro.org>, <heiko@sntech.de>,
	<krzysztof.kozlowski@linaro.org>, <andi@etezian.org>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<masahisa.kojima@linaro.org>, <jaswinder.singh@linaro.org>,
	<rostedt@goodmis.org>, <mingo@redhat.com>, <l.stelmach@samsung.com>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <alex.aring@gmail.com>, <stefan@datenfreihafen.org>,
	<kvalo@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <jic23@kernel.org>, <tudor.ambarus@microchip.com>,
	<pratyush@kernel.org>
CC: <git@amd.com>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
	<radu_nicolae.pirea@upb.ro>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>,
	<bcm-kernel-feedback-list@broadcom.com>, <fancer.lancer@gmail.com>,
	<kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<avifishman70@gmail.com>, <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
	<venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
	<yogeshgaur.83@gmail.com>, <konrad.dybcio@somainline.org>,
	<alim.akhtar@samsung.com>, <ldewangan@nvidia.com>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <michal.simek@amd.com>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-rockchip@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-wpan@vger.kernel.org>, <libertas-dev@lists.infradead.org>,
	<linux-wireless@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<lars@metafoo.de>, <Michael.Hennerich@analog.com>,
	<linux-iio@vger.kernel.org>, <michael@walle.cc>, <akumarma@amd.com>,
	<amitrkcian2002@gmail.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>
Subject: [PATCH 08/10] spi: Add parallel memories support in SPI core
Date: Mon, 17 Oct 2022 17:42:47 +0530
Message-ID: <20221017121249.19061-9-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221017121249.19061-1-amit.kumar-mahapatra@amd.com>
References: <20221017121249.19061-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT018:EE_|BL1PR12MB5144:EE_
X-MS-Office365-Filtering-Correlation-Id: f89bad28-d941-4730-02e9-08dab0396dc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+iarXMTHyBVR/YlZYFzar/w3XBqzOQZZx33ZCNOr2j5nSytORjih/htp0cQSYv4Tn2V6ECqeBs5tAf/kyTsnUAE/aQSsImu97hTVHDZQwG8ydjKjkKpOZeRQ9UsyqbVe8nYXLmv70eObIliehMBm4MJB4eqfe4QrMZqCAwlouyoPgthMe7D9Aznl0BsTGBnI2Govb0tCjJhTbct1ou5WM6WBGtMsh3Z8//Ss2FdlQ+LAh18Jf2mHvo5EYWx/zY58ko6viOSYupQphemjAX6TpXoKK/nZ5cLCFv1WiY7IIUxEEI9shHYrLem52y2/hO3JM34afaoDFtBe7sWCPFDJJBpLAXRWcv6qwof0kblMjNqvBwvJzrVXblsNMCX5wAmxIPpdjVmMLZShjFnVbBqX9rMz58u6tVAwOFc2VIH0SHJYjNXuyjc0WXiB12ix/5uEolaUE8B5BdEG3ki+h0fiU7L3Nea4/zIwJv01m+g8yY9FTrPdUpCWcTLR8E+T3dcBbn8gt3WgIBXbF+QnBUWPywDZVD72Ua6fovQJZa9GoPg8ouH6DX8MCrfGRwfmT6K25BkNMYR8M6+r/jzXkO+6nmFtP7NTOFfCP/EDxoPGVOmVGvNyq+yrEsB1Y4vUOP8yoplvvkwDfv1IM+2mnP3axpYS/Ple2gEf3vWm/6hyol4FRLMRGlPFrlYLCGpcH9NxsOgPdzgBDOO4IMllTWUaeCmgjXgK4AF8K5sfoY1wY5b+PXgwYoP2Ts+3sRPT+EkzEMn7D9eFCAG37Tus4Cyn2a5EtmmV6Hhl42zP1ECFbrggKLFbp3sWvefOwymua21OC6LvUVf+HudHfVhyoyk+9HHGZ7PUZF80BNSC62MmsZ7ULTyp2wpvSyVc2/QvWbIzJZ5aLFIhtX2R+Jp9jCJ1lw==
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199015)(36840700001)(40470700004)(46966006)(2616005)(336012)(186003)(47076005)(1076003)(426003)(83380400001)(921005)(356005)(81166007)(86362001)(36860700001)(82740400003)(7406005)(5660300002)(7416002)(7336002)(2906002)(7366002)(41300700001)(8936002)(4326008)(82310400005)(40480700001)(8676002)(40460700003)(6666004)(26005)(478600001)(316002)(70206006)(70586007)(54906003)(110136005)(36756003)(36900700001)(83996005)(41080700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 12:16:32.6348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f89bad28-d941-4730-02e9-08dab0396dc5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_051637_482658_B99DB695 
X-CRM114-Status: GOOD (  21.35  )
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

In parallel mode all the chip selects are asserted/de-asserted
simultaneously and each byte of data is stored in both devices, the even
bits in one, the odd bits in the other. The split is automatically handled
by the GQSPI controller. The GQSPI controller supports a maximum of two
flashes connected in parallel mode. A "multi-cs-cap" flag is added in the
spi controntroller data, through ctlr->multi-cs-cap the spi core will make
sure that the controller is capable of handling multiple chip selects at
once.

Parallel memories support via GPIO is also added in spi core, but not
tested due to unavailability of necessary hardware setup.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/spi/spi.c       | 153 ++++++++++++++++++++++++++++------------
 include/linux/spi/spi.h |  12 ++++
 2 files changed, 118 insertions(+), 47 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 1b1a891f4ccc..2721db3b95e1 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -965,58 +965,113 @@ static void spi_set_cs(struct spi_device *spi, bool enable, bool force)
 	int idx;
 
 	/*
-	 * Avoid calling into the driver (or doing delays) if the chip select
-	 * isn't actually changing from the last time this was called.
+	 * In parallel mode all the chip selects are asserted/de-asserted
+	 * at once
 	 */
-	if (!force && ((enable &&
-			spi->controller->last_cs == spi->chip_select[cs_num]) ||
-		       (!enable &&
-			spi->controller->last_cs != spi->chip_select[cs_num])) &&
-	    (spi->controller->last_cs_mode_high == (spi->mode & SPI_CS_HIGH)))
-		return;
-
-	trace_spi_set_cs(spi, activate);
-
-	spi->controller->last_cs = enable ? spi->chip_select[cs_num] : -1;
-	spi->controller->last_cs_mode_high = spi->mode & SPI_CS_HIGH;
-
-	if ((spi->cs_gpiod[cs_num] || !spi->controller->set_cs_timing) && !activate)
-		spi_delay_exec(&spi->cs_hold, NULL);
-
-	if (spi->mode & SPI_CS_HIGH)
-		enable = !enable;
+	if ((spi->cs_index_mask & SPI_PARALLEL_CS_MASK) == SPI_PARALLEL_CS_MASK) {
+		spi->controller->last_cs_mode_high = spi->mode & SPI_CS_HIGH;
+
+		if ((spi->cs_gpiod[0] || !spi->controller->set_cs_timing) && !activate)
+			spi_delay_exec(&spi->cs_hold, NULL);
+
+		if (spi->mode & SPI_CS_HIGH)
+			enable = !enable;
+
+		if (spi->cs_gpiod[0] && spi->cs_gpiod[1]) {
+			if (!(spi->mode & SPI_NO_CS)) {
+				/*
+				 * Historically ACPI has no means of the GPIO polarity and
+				 * thus the SPISerialBus() resource defines it on the per-chip
+				 * basis. In order to avoid a chain of negations, the GPIO
+				 * polarity is considered being Active High. Even for the cases
+				 * when _DSD() is involved (in the updated versions of ACPI)
+				 * the GPIO CS polarity must be defined Active High to avoid
+				 * ambiguity. That's why we use enable, that takes SPI_CS_HIGH
+				 * into account.
+				 */
+				if (has_acpi_companion(&spi->dev)) {
+					for (idx = 0; idx < SPI_CS_CNT_MAX; idx++)
+						gpiod_set_value_cansleep(spi->cs_gpiod[idx],
+									 !enable);
+				} else {
+					for (idx = 0; idx < SPI_CS_CNT_MAX; idx++)
+						/* Polarity handled by GPIO library */
+						gpiod_set_value_cansleep(spi->cs_gpiod[idx],
+									 activate);
+				}
+			}
+			/* Some SPI masters need both GPIO CS & slave_select */
+			if ((spi->controller->flags & SPI_MASTER_GPIO_SS) &&
+			    spi->controller->set_cs)
+				spi->controller->set_cs(spi, !enable);
+			else if (spi->controller->set_cs)
+				spi->controller->set_cs(spi, !enable);
+		}
 
-	if (spi->cs_gpiod[cs_num]) {
-		if (!(spi->mode & SPI_NO_CS)) {
-			/*
-			 * Historically ACPI has no means of the GPIO polarity and
-			 * thus the SPISerialBus() resource defines it on the per-chip
-			 * basis. In order to avoid a chain of negations, the GPIO
-			 * polarity is considered being Active High. Even for the cases
-			 * when _DSD() is involved (in the updated versions of ACPI)
-			 * the GPIO CS polarity must be defined Active High to avoid
-			 * ambiguity. That's why we use enable, that takes SPI_CS_HIGH
-			 * into account.
-			 */
-			if (has_acpi_companion(&spi->dev))
-				gpiod_set_value_cansleep(spi->cs_gpiod[cs_num], !enable);
-			else
-				/* Polarity handled by GPIO library */
-				gpiod_set_value_cansleep(spi->cs_gpiod[cs_num], activate);
+		for (idx = 0; idx < SPI_CS_CNT_MAX; idx++) {
+			if (spi->cs_gpiod[idx] || !spi->controller->set_cs_timing) {
+				if (activate)
+					spi_delay_exec(&spi->cs_setup, NULL);
+				else
+					spi_delay_exec(&spi->cs_inactive, NULL);
+			}
 		}
-		/* Some SPI masters need both GPIO CS & slave_select */
-		if ((spi->controller->flags & SPI_MASTER_GPIO_SS) &&
-		    spi->controller->set_cs)
+	} else {
+		/*
+		 * Avoid calling into the driver (or doing delays) if the chip select
+		 * isn't actually changing from the last time this was called.
+		 */
+		if (!force && ((enable && spi->controller->last_cs ==
+				spi->chip_select[cs_num]) ||
+				(!enable && spi->controller->last_cs !=
+				 spi->chip_select[cs_num])) &&
+		    (spi->controller->last_cs_mode_high ==
+		     (spi->mode & SPI_CS_HIGH)))
+			return;
+
+		trace_spi_set_cs(spi, activate);
+
+		spi->controller->last_cs = enable ? spi->chip_select[cs_num] : -1;
+		spi->controller->last_cs_mode_high = spi->mode & SPI_CS_HIGH;
+
+		if ((spi->cs_gpiod[cs_num] || !spi->controller->set_cs_timing) && !activate)
+			spi_delay_exec(&spi->cs_hold, NULL);
+
+		if (spi->mode & SPI_CS_HIGH)
+			enable = !enable;
+
+		if (spi->cs_gpiod[cs_num]) {
+			if (!(spi->mode & SPI_NO_CS)) {
+				/*
+				 * Historically ACPI has no means of the GPIO polarity and
+				 * thus the SPISerialBus() resource defines it on the per-chip
+				 * basis. In order to avoid a chain of negations, the GPIO
+				 * polarity is considered being Active High. Even for the cases
+				 * when _DSD() is involved (in the updated versions of ACPI)
+				 * the GPIO CS polarity must be defined Active High to avoid
+				 * ambiguity. That's why we use enable, that takes SPI_CS_HIGH
+				 * into account.
+				 */
+				if (has_acpi_companion(&spi->dev))
+					gpiod_set_value_cansleep(spi->cs_gpiod[cs_num], !enable);
+				else
+					/* Polarity handled by GPIO library */
+					gpiod_set_value_cansleep(spi->cs_gpiod[cs_num], activate);
+			}
+			/* Some SPI masters need both GPIO CS & slave_select */
+			if ((spi->controller->flags & SPI_MASTER_GPIO_SS) &&
+			    spi->controller->set_cs)
+				spi->controller->set_cs(spi, !enable);
+		} else if (spi->controller->set_cs) {
 			spi->controller->set_cs(spi, !enable);
-	} else if (spi->controller->set_cs) {
-		spi->controller->set_cs(spi, !enable);
-	}
+		}
 
-	if (spi->cs_gpiod[cs_num] || !spi->controller->set_cs_timing) {
-		if (activate)
-			spi_delay_exec(&spi->cs_setup, NULL);
-		else
-			spi_delay_exec(&spi->cs_inactive, NULL);
+		if (spi->cs_gpiod[cs_num] || !spi->controller->set_cs_timing) {
+			if (activate)
+				spi_delay_exec(&spi->cs_setup, NULL);
+			else
+				spi_delay_exec(&spi->cs_inactive, NULL);
+		}
 	}
 }
 
@@ -2230,6 +2285,10 @@ static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
 		dev_err(&ctlr->dev, "%pOF has no valid 'reg' property (%d)\n",
 			nc, rc);
 		return rc;
+	} else if ((of_property_read_bool(nc, "parallel-memories")) &&
+		   (!ctlr->multi_cs_cap)) {
+		dev_err(&ctlr->dev, "SPI controller doesn't support multi CS\n");
+		return -EINVAL;
 	}
 	for (idx = 0; idx < rc; idx++)
 		spi->chip_select[idx] = cs[idx];
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index a7c2efedcc4c..64070277cd6e 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -22,6 +22,9 @@
 /* Max no. of CS supported per spi device */
 #define SPI_CS_CNT_MAX 2
 
+/* chip select mask */
+#define SPI_PARALLEL_CS_MASK	(BIT(0) | BIT(1))
+
 struct dma_chan;
 struct software_node;
 struct ptp_system_timestamp;
@@ -378,6 +381,8 @@ extern struct spi_device *spi_new_ancillary_device(struct spi_device *spi, u8 ch
  * @bus_lock_spinlock: spinlock for SPI bus locking
  * @bus_lock_mutex: mutex for exclusion of multiple callers
  * @bus_lock_flag: indicates that the SPI bus is locked for exclusive use
+ * @multi_cs_cap: indicates that the SPI Controller can assert/de-assert
+ *	more than one chip select at once.
  * @setup: updates the device mode and clocking records used by a
  *	device's SPI controller; protocol code may call this.  This
  *	must fail if an unrecognized or unsupported mode is requested.
@@ -567,6 +572,13 @@ struct spi_controller {
 	/* Flag indicating that the SPI bus is locked for exclusive use */
 	bool			bus_lock_flag;
 
+	/*
+	 * Flag indicating that the spi-controller has multi chip select
+	 * capability and can assert/de-assert more than one chip select
+	 * at once.
+	 */
+	bool			multi_cs_cap;
+
 	/* Setup mode and clock, etc (spi driver may call many times).
 	 *
 	 * IMPORTANT:  this may be called when transfers to another
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
