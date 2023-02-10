Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACDEC636D4
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Feb 2023 19:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3MxROPgWj3+mZeor704z5+zC3VF9XDqhlwmDhyC2ICQ=; b=qS61+cwCrCGl49
	YJWu8uG6Wk5WINThrCtx8Z0OHs2MQnytc3a3s7YIheqxAXumKXS64VVLGN4KVGi2uKtn9uShe/wIv
	8TY+O/yqDmXsjIxLarjw4dAfDLVL42PiWaWN9WaJjNxUqNM6FiSN0Tmzo5xx1e5r5a8LUUtWEU12k
	3LvBN6jH5T2Pp8W5ZcFrHfVmPqzEiRz7DxgAMZrLqtslKxjXG5Q1uwk2It3dupcgJPZdAreBtEOCe
	UorTCyoCzTaxMthSsJHOt5pQMq2YLmtBUuLac9n3P9FI1FfDWq1bQVcixhOPBOVrRgm3/RRgXOwpD
	sRWd+fLmc0LAezARnPKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQZET-0078dv-KZ; Fri, 10 Feb 2023 19:38:53 +0000
Received: from mail-sn1nam02on20614.outbound.protection.outlook.com ([2a01:111:f400:7ea9::614] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQZEJ-0078YD-Jc; Fri, 10 Feb 2023 19:38:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7A9GBOocMudz/1u+fjQKs0aoWBThpqZul6CJdAVSrAMxVePQWsddDAyIqJrNt3agdPJVTFgS8eUTRkQiCH2tIQcq90nt0I8g8gkEmz9pybE6tWR1+jXGRltM2D3la+XYf6wWVqla5jqsyX/RSNEKXl0DNk8WgVk4JYscJTa2udgEyCKbis5c5mBDeuyQPoErm+XzMgUpNQ0bZs6bsqUlW10GVlkMkSN3n7CNxPdgZxY01f3pY6JlX0IolQfrYhWOI/4s+uXzmDPC/3c+H1kTyXOHfuConPZRXJuNsC2CLVAwUri1weYQnYQTJaN3MY3EeIfOlfEf1z1uB4siLoajA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGTDv9j62eqAAUbZYCqOwhh6o6pzCwATcSrO/Vzqvog=;
 b=LUbqSnjj/F7OUBvNJ51k8rLbpXN/1W0t3ruefHFvIqW26l07mdI99klh/Q5JwA1GDOYtP+NjTFeL+NNuryWI3DV+wCfPdwqBV9CuKQkV4OUFFxVJWSVSvEB3iZO4mkp7OXlzcUhyluZH5deF3EWYAnBN91zrJ9paYKuniAIb/o+hZYlt5mx3PynmjiyKnRLWmVxmsZzIIPlRjlFlvJtIn42LHXJtRq2U+jwwuA8PWzctibzpT0Tt7iYpvDc6jYwCBBtTGqE/MxeDd21YVanVeFjmybS/cdZQTlKQKVki3AaWfjnSCvDQMOnXracBWwn0OHJj0adOQPo6dtc8IGUaYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGTDv9j62eqAAUbZYCqOwhh6o6pzCwATcSrO/Vzqvog=;
 b=3gqq/KsoZQpDizQE1oIAqvVi4TR5LUXFqFILRyZPZfYwRLC0dzNfWhVrl82QvNuKX+jABKvZ5dzfyoW7fVdQBSbcTyIgAgovbl9SOk5ecgEnahSPDvZsEQgJRuc/z/gr7Nt+M36Psp9hDPS/z4SjCyYWGwK16TB3dm8ZeVwqTVc=
Received: from MW4PR04CA0184.namprd04.prod.outlook.com (2603:10b6:303:86::9)
 by IA1PR12MB8537.namprd12.prod.outlook.com (2603:10b6:208:453::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Fri, 10 Feb
 2023 19:38:39 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::ec) by MW4PR04CA0184.outlook.office365.com
 (2603:10b6:303:86::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19 via Frontend
 Transport; Fri, 10 Feb 2023 19:38:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.21 via Frontend Transport; Fri, 10 Feb 2023 19:38:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Feb
 2023 13:38:36 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 10 Feb 2023 13:38:10 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <broonie@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <jic23@kernel.org>, <tudor.ambarus@microchip.com>,
	<pratyush@kernel.org>, <sanju.mehta@amd.com>, <chin-ting_kuo@aspeedtech.com>,
	<clg@kaod.org>, <kdasu.kdev@gmail.com>, <f.fainelli@gmail.com>,
	<rjui@broadcom.com>, <sbranden@broadcom.com>, <eajames@linux.ibm.com>,
	<olteanv@gmail.com>, <han.xu@nxp.com>, <john.garry@huawei.com>,
	<shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <narmstrong@baylibre.com>,
	<khilman@baylibre.com>, <matthias.bgg@gmail.com>, <haibo.chen@nxp.com>,
	<linus.walleij@linaro.org>, <daniel@zonque.org>, <haojian.zhuang@gmail.com>,
	<robert.jarzmik@free.fr>, <agross@kernel.org>, <bjorn.andersson@linaro.org>,
	<heiko@sntech.de>, <krzysztof.kozlowski@linaro.org>, <andi@etezian.org>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<masahisa.kojima@linaro.org>, <jaswinder.singh@linaro.org>,
	<rostedt@goodmis.org>, <mingo@redhat.com>, <l.stelmach@samsung.com>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <alex.aring@gmail.com>, <stefan@datenfreihafen.org>,
	<kvalo@kernel.org>, <james.schulman@cirrus.com>, <david.rhodes@cirrus.com>,
	<tanureal@opensource.cirrus.com>, <rf@opensource.cirrus.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <mpe@ellerman.id.au>, <oss@buserror.net>,
	<windhl@126.com>, <yangyingliang@huawei.com>
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
	<linux-iio@vger.kernel.org>, <michael@walle.cc>, <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <alsa-devel@alsa-project.org>,
	<patches@opensource.cirrus.com>, <linuxppc-dev@lists.ozlabs.org>,
	<amitrkcian2002@gmail.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>, Jonathan Cameron
	<Jonathan.Cameron@huawei.com>
Subject: [PATCH v4 03/15] iio: imu: Replace all spi->chip_select and spi->cs_gpiod references with function call
Date: Sat, 11 Feb 2023 01:06:34 +0530
Message-ID: <20230210193647.4159467-4-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230210193647.4159467-1-amit.kumar-mahapatra@amd.com>
References: <20230210193647.4159467-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT038:EE_|IA1PR12MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: 73299ece-7630-442b-f782-08db0b9e6836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	PHHK3WMrmy+DVD5iL7Seu1BlQJBbX5m32CtO2eBNw33k+TcdAWYQBIsHFphT/YPSXQch3csXjmxWlKNe9riNZ548aAiaIbapH4dau763C2nJX22mDzsKNcA65ShobKhJ4ABV6KiBg+qUmJz2XvhmA/KZsBLL7Tj0faoNaVWXH/lf5ApDUiR/gL5HLpT9QWCR/P+z3V/RFoxVP7ZT4nQN87FQG9jrewXIiPnDzGUBg2CpBJn+xk0vAZehYKsUcutsTAGYroDMk+/tDdiMnRtb5pJV7qc8MUC8hoxkTpFW2pQms9HSJvx6omXTS6ZRp6fkEyaM7EYWqJ/zmSQ/A8jtrnVpdPcWOvj9o0Awj+IWkxqJOTeCdrewh914aE/EPEtC9uhbh2wynEcaXXshr7IWFhWf9IeSAd4M2PGAD1VfJtAaWMWYvqo4pu3JFH8EraUUn64/oUYqBhudoJeJAofxQ+KZ9T5Ds2XMRnmAS7ntVFhjTC9+8o02x6m7AE0RkY5VAEsY0f1SIzbcWUgnEtzFYBoo2WODhjkV23pX6bW1zySOVWEVs4DknXtGzVAXbSRdcNN5xwYvOA8F+/cmHg1DurVJheihDjdWnKezslzhEPLFjADiNd0S0opJGDmRPHe/XhTS+vX5JFcAGlHOPk0oPJ9rFs1xCATBmzAC9MassniW0qOgXp7rOwnNzO7fcZ0a1V6p3MMl9iuF1sThH+aNNgCwBlAnFbTZs2SOWawkoIPHL3QQZuidByKMf9ji6zP3oY5rNagGzGbVO+89cl2CgC1bw3lRKWba3YadgxnYYgiINhWBbYggWS0vW4B9skbVRlPG+GUHWy91Ln1gg2F5e0szdfKtbt6ts9MdeDE41AA=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199018)(40470700004)(46966006)(36840700001)(2906002)(186003)(7276002)(7416002)(7406005)(336012)(40460700003)(86362001)(426003)(1191002)(47076005)(2616005)(81166007)(8936002)(7336002)(5660300002)(26005)(1076003)(478600001)(6666004)(36756003)(82310400005)(7366002)(83380400001)(316002)(4326008)(356005)(8676002)(82740400003)(70586007)(54906003)(41300700001)(36860700001)(40480700001)(70206006)(110136005)(921005)(83996005)(84006005)(41080700001)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 19:38:38.2353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73299ece-7630-442b-f782-08db0b9e6836
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8537
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_113843_748169_E4A52959 
X-CRM114-Status: GOOD (  13.06  )
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

Supporting multi-cs in spi drivers would require the chip_select & cs_gpiod
members of struct spi_device to be an array. But changing the type of these
members to array would break the spi driver functionality. To make the
transition smoother introduced four new APIs to get/set the
spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and
spi->cs_gpiod references with get or set API calls.
While adding multi-cs support in further patches the chip_select & cs_gpiod
members of the spi_device structure would be converted to arrays & the
"idx" parameter of the APIs would be used as array index i.e.,
spi->chip_select[idx] & spi->cs_gpiod[idx] respectively.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Michal Simek <michal.simek@amd.com>
---
 drivers/iio/imu/adis16400.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/imu/adis16400.c b/drivers/iio/imu/adis16400.c
index c02fc35dceb4..3eda32e12a53 100644
--- a/drivers/iio/imu/adis16400.c
+++ b/drivers/iio/imu/adis16400.c
@@ -466,7 +466,7 @@ static int adis16400_initial_setup(struct iio_dev *indio_dev)
 
 		dev_info(&indio_dev->dev, "%s: prod_id 0x%04x at CS%d (irq %d)\n",
 			indio_dev->name, prod_id,
-			st->adis.spi->chip_select, st->adis.spi->irq);
+			spi_get_chipselect(st->adis.spi, 0), st->adis.spi->irq);
 	}
 	/* use high spi speed if possible */
 	if (st->variant->flags & ADIS16400_HAS_SLOW_MODE) {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
