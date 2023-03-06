Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A4DC64EC4
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Mar 2023 17:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9xHT4yh8xq0nchnCYY1Dl++/0wo7Dr9AoiUJ5cIS/8o=; b=DwzDmN26M9KSWs
	sPEIOhTBcO6w38dQgCGX6CKJ1T4jsOOfRJ9tFLaGm9oLr8xyEYNevZnmDT0wSjehABHvIVhBtQzXO
	xPK7QUiwmzq2Il73+PMi6MJdbE/zH/frzs2kVE2RXT9AuL1koE27Mp2FyfBe7pzjL9xkN3yArbf1e
	PGEbg8jV3pRUlYwpFHks8tLVR2CWmn9BYalxwycqRQT4OB5pVAOLguM3kpo6UHw5+k4dYLYDvYMXk
	5owyZzyDBmcguHgySSSwmN6YlftO+aLEHrYdbPzsQVjyCCs5EqlLbJlNmOAUE20h3g9Cl4DOpKzOc
	dwo0aoN+pccYqy1Lid4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZEd0-00E8Ep-EB; Mon, 06 Mar 2023 17:28:02 +0000
Received: from mail-bn7nam10on2060f.outbound.protection.outlook.com ([2a01:111:f400:7e8a::60f] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZEZ1-00E6FN-OE; Mon, 06 Mar 2023 17:23:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8bA6ZosL7Qrsm3FBjRIYYrOWzfMKJbHJupOJu/7XypxViuGZedICGfB80cWBrLvF9KlY06WADhULSTqQiGsz3qxrwbLf3Wewt97yeUQO22NAxD0SR45Jz5fOfoOi7WxCfi5CllZR3FjBz7rw48xSUxrFoeZ1I3387QCM5dkjdVsOy+9Iw/kcta5zMWYMbZvDg/4df5mAwZNiTYF0Ad+7Khuyij199Bve9IZym1NvFP4t18YB8IBZKzDQvfgJQ5kfHn0iThhyUUPz87pRuuYbOSA1SUFUyu3Q5A47Wi6VpiUTMCIHQebq4zG+jW48jZSfWIMMrZkBTv/7LDf7nAgFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/Yet+5rsiDfnRUIoBGZ5uihYT2ozvs6P0wK1Jad2Yk=;
 b=COePP2rSJvZEAnA7SUpAtk2qNBBYQynRdj1iy6C0D66bRi5qhs5TIvL353ML3hN0noV8aA4lhAQoBe9zzlmy3+GFeX+NmnmZ9S3Q+VTvo6ECyyKxL463Or+7Xc25Otkg13AHhUaElt462QqjinZpdq02h42JH/czX+t3Tq4CcmDeZoMEcgcKrE4wcGa7XUzvEQY9vXwQol4ihAIFWvsWRh+U09epHMp0oswlBRxZ1YgG53ONa1O66GeWt0YQWP1CVbLS/9moEHakEZs0cKcOmDNSHlGqjq/nLqEUKnW95yPydFR+HcRrb76ML/j0fqONVUjpBATK7PjgTe8GdqsSHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/Yet+5rsiDfnRUIoBGZ5uihYT2ozvs6P0wK1Jad2Yk=;
 b=NMVbCvT2ImjI6/nvHTOPJLmpkMxwRxa3ZjA2EIszdNtShgbkab1CnKZBs8nIH7s7vAQFO4eCGi5hCpT1GcE4ftzscsSBXHabUpTh2lVO1T7KQUsy6/PpWGJs1co5Mz9LpVjjfT0gsvrlnPerU/hu3Z104jlh06p+ibPa5Fep2QY=
Received: from DM6PR17CA0013.namprd17.prod.outlook.com (2603:10b6:5:1b3::26)
 by IA1PR12MB6113.namprd12.prod.outlook.com (2603:10b6:208:3eb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Mon, 6 Mar
 2023 17:23:51 +0000
Received: from DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::a1) by DM6PR17CA0013.outlook.office365.com
 (2603:10b6:5:1b3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28 via Frontend
 Transport; Mon, 6 Mar 2023 17:23:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT052.mail.protection.outlook.com (10.13.172.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.15 via Frontend Transport; Mon, 6 Mar 2023 17:23:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 6 Mar
 2023 11:23:49 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 6 Mar 2023 11:23:22 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <broonie@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <jic23@kernel.org>, <tudor.ambarus@microchip.com>,
	<pratyush@kernel.org>, <Sanju.Mehta@amd.com>, <chin-ting_kuo@aspeedtech.com>,
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
	<windhl@126.com>, <yangyingliang@huawei.com>, <william.zhang@broadcom.com>,
	<kursad.oney@broadcom.com>, <jonas.gorski@gmail.com>,
	<anand.gore@broadcom.com>, <rafal@milecki.pl>
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
	<amitrkcian2002@gmail.com>, <amit.kumar-mahapatra@amd.com>
Subject: [PATCH V5 04/15] mtd: devices: Replace all spi->chip_select and spi->cs_gpiod references with function call
Date: Mon, 6 Mar 2023 22:50:58 +0530
Message-ID: <20230306172109.595464-5-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230306172109.595464-1-amit.kumar-mahapatra@amd.com>
References: <20230306172109.595464-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT052:EE_|IA1PR12MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 89d477de-1e4f-4c1b-304e-08db1e678d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	GNUlIYo5lzyrXRmU+5KFUSFPwz0KD4QSfbFfN1tjKkxbFuUOMIXEU28XmWMdMJGHWTajT5OmqLu2k0R8iVQzUfr+eQuLC8fHiYT5Os5aLiaRCBBKOuGpwpXPoalWiogSxVv8qPGLAVnGhJ4ZNAdTBcDP8Isq3NwGBSE0yDKDLGXjPjV//0ulsj9dUkvcEMncrNch87xZw9jeNyqOumupRzeEJnxGwIlgBcEsx9vzDVha57QfEF09JOjXLq+KyQytRN40GBh0nnLv+kqHJ/RnKx3MMzBchwvXiclkLLkknbt/H4zeqlSE2S9uw1kiZNn2hrrsmWU9+IoOdHsri44UZycXmMxCx/MKGuCTteKfN158ooWJ/HJmStuymZamPTSB9XStX7hff8IvWPUY1csurUFE82OQtP7mIX1j5IEIz6S1UWAOIgExhbfhELGop3uoIeZrL6XJ42BK8Zb26f/8FofW9T8MsU3tfMKN/OvVDJNirYm7+emDkLp3OMH9oIcofqWexkTdvuDVEpOD9xK5Aiz/TCAu4+v0HKY8q4W4X0Py+ydPhPN1H4hyGGdRDf37z8IgHvNSkEpF8JbzwWbInMNfrPckB4IEo+zdC5j8zE41DVDtwzuZ17/rdl2NhG8/vSsyg3Uk+S1WibMwS0IpUVSIiwykdKc10Vav3/Tgg51S9PLk1gCXflOsZkKUVte0mKU9x75Jf62VM8x93kFYjw+KvHCL3HF+ohpxxwJ79CEnO7LFRKMdPtaFktzUMET1XGSHxSf/6gHt2RoM5aUjqZbzlESOorvc/0ao+UgB8ld3r+rGbIADJhTqjWIhX+8Zqebs55B+Mdi1O96ZzcdmbjaMYBO5We9QONssJV9/0ro=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(8936002)(7276002)(7416002)(7406005)(7336002)(7366002)(5660300002)(70206006)(70586007)(41300700001)(2906002)(4326008)(8676002)(54906003)(110136005)(316002)(478600001)(82310400005)(36860700001)(36756003)(426003)(47076005)(6666004)(26005)(1076003)(336012)(2616005)(40480700001)(82740400003)(86362001)(83380400001)(356005)(1191002)(40460700003)(186003)(921005)(81166007)(41080700001)(2101003)(84006005)(83996005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 17:23:50.7389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d477de-1e4f-4c1b-304e-08db1e678d96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_092356_286251_95801744 
X-CRM114-Status: GOOD (  12.23  )
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
Reviewed-by: Michal Simek <michal.simek@amd.com>
---
 drivers/mtd/devices/mtd_dataflash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 25bad4318305..34d7a0c4807b 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -646,7 +646,7 @@ static int add_dataflash_otp(struct spi_device *spi, char *name, int nr_pages,
 
 	/* name must be usable with cmdlinepart */
 	sprintf(priv->name, "spi%d.%d-%s",
-			spi->master->bus_num, spi->chip_select,
+			spi->master->bus_num, spi_get_chipselect(spi, 0),
 			name);
 
 	device = &priv->mtd;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
