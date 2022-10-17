Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243B5C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Oct 2022 12:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2cWPvkANCrN0gguLH9rgYlOqLKkOpqkmVPMkVzmpnA=; b=ByJpTcnoeiD8lB
	bRmRqQ21gm6W+UdYhViX+TOYtIme5FFPD6mm+nyMaRpO2ac3pbOhnhjmKrvqnRccrtw1arfIwCFKV
	O2Gv9a9mhqC4tJz0CvFvqywtaN5zNdMKsaZdCgS7X7ZUrJMh/LuTCRI9p0du/phS+KBzsDW2svBhp
	3LLTXzFhHPgU624VaMzpsycT811hJsM+RUgsYaJcRZpewWu7U3KRMkboG4e7xrdZkjuZTjRHORXeR
	HMDrzC2doQz3OeIaSvCr+5r1jY54oVojZRkGtAtEAIEnxX+btAnoxXR7o2WCD/Ca5uO0VLikkkw4J
	wP0xaqbbnl50+Vof2L4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okP5R-00BTlJ-EE; Mon, 17 Oct 2022 12:19:18 +0000
Received: from mail-bn8nam11on2041.outbound.protection.outlook.com ([40.107.236.41] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okP1i-00BRxE-TK; Mon, 17 Oct 2022 12:15:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7iOX1mgCWJUdTzscSMS17mPnkG6wNU1ZuhrEBABiaRuXqIirl2lmxeGrZtkZr+4TGFeIPCyEUzJkD770hF184YUBbZSgWqyLuG90jbRXA6D9pS3u55jZxc/F9eM5UgtjQlJHCeFyKzVD1EgzYt7Zy7m2g4tAMe+tuqbFBo1pTVlHaVGhZKoef7YHGH0u1JLF3nyI3wzyYSK5zU8EiSv34MWvYa/1Df/ieu4xd3kVn9BRABQpG1dzmaB/K6TWxGmDmBudI5ESC/Ww9OuImr0MdSrLqYkO8EAg77R0eJ2AFWEY7FH/dR/8N2KLNvKbUyCDcDm9zzXdpDe0SpavtB1Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GR4ZrZBMZwZtiMXie34UcHhYI++CQN66d821m5/RpFI=;
 b=avexfhBMY9HBJhGZSkDfHZ1H7+rLUbXhpeysbcbVPFQ2StFfcv7ruH3a4Gpgx/eBlEBhNxWTyvh2MD5UcUbPdn3UIg6hkD/WpuJzQxqicmFr2bQX7NrUcCzeMjosC4463lH79YrPdRAjiR1wk4tw7U8lbXMzl3gjkl3l1vLXJ3LPwIIf5w4rnUcPlT9+BFDrgw3sCUfL/8aQlSMGcfMCwXaLkt8/iUzc2/81VEPsoaKc3LLj3QWb0IuUJUMtdg15rf20QeE4OarHe0rk5Hg7pg5a94fDvZIqWElMzWb7e2dNjKCYEcNRP8Hu08yipKtfoQNY5AqWWcKoKm+tDDcXSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GR4ZrZBMZwZtiMXie34UcHhYI++CQN66d821m5/RpFI=;
 b=A5S7w6HOI+c6OHe3jjmJSTpsMaEKoxK7li9cozjJbgs1h5pkYNFXOA+fMc/qQ0WyE0POzQ5zQCYtGZio2CjrH7z33salmwKinf+WZYNBgXddLGxE7ych+OKtKKubjmHQkAdvirIeREZKaMnsubhtmluv0V7noWb7faO32Kx2lbs=
Received: from MW2PR2101CA0016.namprd21.prod.outlook.com (2603:10b6:302:1::29)
 by DM4PR12MB7645.namprd12.prod.outlook.com (2603:10b6:8:107::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Mon, 17 Oct
 2022 12:15:22 +0000
Received: from CO1NAM11FT077.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::22) by MW2PR2101CA0016.outlook.office365.com
 (2603:10b6:302:1::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.6 via Frontend
 Transport; Mon, 17 Oct 2022 12:15:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT077.mail.protection.outlook.com (10.13.175.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 12:15:22 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 07:15:21 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 05:15:20 -0700
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Mon, 17 Oct 2022 07:14:57 -0500
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
Subject: [PATCH 05/10] iio: imu: Replace spi->chip_select references to spi->chip_select[0]
Date: Mon, 17 Oct 2022 17:42:44 +0530
Message-ID: <20221017121249.19061-6-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221017121249.19061-1-amit.kumar-mahapatra@amd.com>
References: <20221017121249.19061-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT077:EE_|DM4PR12MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: b78af9a2-92fa-491c-4040-08dab03943c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	gbNqnHIcDYOOSq/MVqFPrP1dtnh4ViEz8Y9E9eUYz98wpW90hXSIBBe4FjvCQCeNKOiRS0YK0KRFkIqqe+tCuQO+rF/Pt8YkUAIBOZYOdcRLMVQoLkxoNCzauEqvkVmv/g4oykyk8o5m04NRnwHWDeIXHoCKUNULes1mXWCg4E4eiOKknc+s3wjS0G5TeEjQPbFn/B3YZcWJQ3ROlmm9DVPrzv/pDbU7ueKlz7wyaonV1gozBgpTnYJmxS+oPzgAqfmo3SDESSqDLW8G969TUVhDVOTfyiFJVSuxwu84GuwdIbwtEwidnr79qwUDhf9ip43ufPsoqyNsKIsqvr1K2Qc+gSeJy7Fm+VMxVRifM0qfXQ9csKE3B5WwCkzE7m+CaCZN8nDlexUdxTZ+U57X0cLHQhx5TEPWFYmnkX7B+rAgN9bWPQpbM/relH33/ddPbudC3TtciCEntb0XUb+Nra4/qQGR1W1R3HhkErofiZNPXnUBhSYsTFOyoqS/hugpoQugVHKIrElIoM9FbTiSLoF4W+pE5aS7fZ5mMYde5mUqcUvQJZk6b6ZZNBJ/wK11PB1SyUyMggP7rXIKuAM9H7IJmeCZhsuhe3zDIatzRkU70aS2hYDwjtSb1qSsydph3x2LzGtODhqiykyL0Un/TIoza8mHo8Hm4EackjcBScbHkU/xwwPgz56oTNnQDaeJ0PqQCaLunC8gek6UMRxfTZ8VYqwrB5CA8FXgDCz53XX0Z+MuCdMkyQkxwNP/zvS9e6XL/BoF081G/qgnbyA6pq8u7eBgTalWBI/aWu/5EwiDyxgZFqzQlBZags2izOAtfbkAtM814Rqv2lsohEF3My+Ppf3POgKVBlvMn3nKlgVGBSsnDEwyVNKkBQbmp4VpqWYcIz31apdQJAvyA4fuUA==
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(5660300002)(7416002)(7366002)(8936002)(7406005)(2906002)(4744005)(7336002)(70586007)(4326008)(8676002)(70206006)(41300700001)(86362001)(36756003)(186003)(356005)(81166007)(82740400003)(40460700003)(921005)(6666004)(2616005)(1076003)(336012)(426003)(47076005)(478600001)(26005)(110136005)(83380400001)(316002)(36860700001)(54906003)(40480700001)(82310400005)(41080700001)(83996005)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 12:15:22.0834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b78af9a2-92fa-491c-4040-08dab03943c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CO1NAM11FT077.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7645
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_051526_996021_B82BFEC1 
X-CRM114-Status: UNSURE (   9.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

For adding multi CS support & to prevent any existing driver from
breaking, replaced all spi->chip_select references to spi->chip_slect[0].

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/iio/imu/adis16400.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/imu/adis16400.c b/drivers/iio/imu/adis16400.c
index 17bb0c40a149..aa7bfcee3510 100644
--- a/drivers/iio/imu/adis16400.c
+++ b/drivers/iio/imu/adis16400.c
@@ -466,7 +466,7 @@ static int adis16400_initial_setup(struct iio_dev *indio_dev)
 
 		dev_info(&indio_dev->dev, "%s: prod_id 0x%04x at CS%d (irq %d)\n",
 			indio_dev->name, prod_id,
-			st->adis.spi->chip_select, st->adis.spi->irq);
+			st->adis.spi->chip_select[0], st->adis.spi->irq);
 	}
 	/* use high spi speed if possible */
 	if (st->variant->flags & ADIS16400_HAS_SLOW_MODE) {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
