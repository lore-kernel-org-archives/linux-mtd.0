Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3660EC64EC4
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Mar 2023 17:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fNvnamyfeSxisCNIaf7/WnQx9vaAZ7ZUtGuKxwq6W4o=; b=OqdKPNxQsj/tAF
	7bITp+hIO2ovMKUXxbS5dpHhUJlPpbHi2fgFFU4YxZ+X8y0Boz+W3VItMNvUOguR7fLxF41ByM3E4
	zu5mE7TjVzRKr8+m3MML+JVhZXaNYhzSkfeqTvsmYEw9PIL0HooqEDK7A9auQN3pFv+q2Y3UkYtgo
	ULlxnAwZDtTnMmrxnbPYadJk5HmzPaSRgjkZcEmzKqzZfVBNxQhxWAhZRgu66k5FiGc3hA8jFp8nd
	HPLQiH5EtXoYbxqSHc9l7fNcG+661tY3MlNs6XxSBbanq28jjiDX3jBWLskHrb5rK+B31ecwa24lZ
	TSyeS3SJjB04g2EA3hTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZEd9-00E8KF-AM; Mon, 06 Mar 2023 17:28:11 +0000
Received: from mail-mw2nam12on2060f.outbound.protection.outlook.com ([2a01:111:f400:fe5a::60f] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZEZV-00E6W0-Q7; Mon, 06 Mar 2023 17:24:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgrGUvyhJbFcj5MzUD/66qXHmhtJhcU8FmT41WKUTGTJdy0pgrmSANNN6FwxGaEniwzg6LRvMBdavYfM6w/iy9WsYN8dsH9AI9MD4RxlYlHEV2UwEKjwwwVXG/5yB4/h6ymg9dAr12gaS1hCl4vxRNkO6CtPjrHK55+8glzZ+QQV08XoqtS+8u5V7i5Odq+gY/vTVbjTZdj2coyyaxrsOE/nDWAdNU83Z6KIvHnhX0PgKzPXkAu1zmr2mjZUzy13D0Fe3ypwvEhSfd+rNCHfO4r/U+Dls6ZBnr0vEwBWSWTLZgH4sFXZtCk+4xNo4oSEy3BU3rQ50MUO9rPUGMl29w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrN+S0no9tJJWOPy0MesAGh9gOiwa6v7pOuBcPHrftY=;
 b=MdudOHzdJ8vp9nBrJJCRoVVaTeL849iAzAyxRmMLb+q/X5rlJYEJj1f9MvaDMj8yRSfUpVn4Ri9Lm+QImIrC4jjEQRpPoPKkB1vq/j9U0JMtJazCks8s6zdgJRn+aIocsp8KT28Ez/Q1QAfCP0KDp5KgiYWjgnGlM6bxsDERGkTB4ttRSBcvH4hhOP6rIib09JRYN5Jj6dtMymtXOuHw/mSlC1h6N3JDyvGdlkdXZGAKF7PgU8AMBLe9DupdPZXg9aDS/tAi3H3LxdysM8sJcgmv7eZYvxPHIhqM8KeszhfrhDsP/mb2T2T34MDc7ZMGtnNAnpZBeK4ce907qtg3fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrN+S0no9tJJWOPy0MesAGh9gOiwa6v7pOuBcPHrftY=;
 b=RFaekxbvmDB+9KP4yuK13kMPh2S1/2y5uzJ34uumuc2UdKAJlozc/GoKDQjszWM1YH3LZWG3beBVwlfCItQnKK7uSGGN2goj0cDXapxowwyDI8X2rNSFL8WoKs8nSFs9kPBNh5imqgnZMnOojbAKBB6vcnjqa6bBTgK5G6MNaJY=
Received: from DM6PR12CA0011.namprd12.prod.outlook.com (2603:10b6:5:1c0::24)
 by PH7PR12MB6881.namprd12.prod.outlook.com (2603:10b6:510:1b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 17:24:19 +0000
Received: from DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::c) by DM6PR12CA0011.outlook.office365.com
 (2603:10b6:5:1c0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28 via Frontend
 Transport; Mon, 6 Mar 2023 17:24:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT047.mail.protection.outlook.com (10.13.172.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.21 via Frontend Transport; Mon, 6 Mar 2023 17:24:18 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 6 Mar
 2023 11:24:18 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 6 Mar
 2023 11:24:17 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 6 Mar 2023 11:23:50 -0600
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
	<amitrkcian2002@gmail.com>, <amit.kumar-mahapatra@amd.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [PATCH V5 05/15] staging: Replace all spi->chip_select and spi->cs_gpiod references with function call
Date: Mon, 6 Mar 2023 22:50:59 +0530
Message-ID: <20230306172109.595464-6-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230306172109.595464-1-amit.kumar-mahapatra@amd.com>
References: <20230306172109.595464-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT047:EE_|PH7PR12MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: dfa8d561-d899-415d-e0da-08db1e679e4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fw6WCUPPqJQqlCLuiUrp7L90PuzUF61/koSWI6LXiBIFKVkTA3cT8Z2iZcajGYZN7+bGA0zc31vRDMAD8Euo9gB2ZxCe3MFFA8T7n20BLCjQXRU1IflYiDXwuCIneLLjlcEzAtdN113AGbAcYDPHBpZuy3VjZ9EioY21FaFOcn7S/RHd9qDN+Es7qoftg0rhjID8m59mgadSqzXxpTyyEEpKd3fwu5DEnQOV5BoDAsx01EvYlZ2oPpHLqeATqigIHlJhPFOKLWHPfNh53N3e5WyiZO6gaQ5XQTlCOYQXZVoGllpBe+GdJoKdfjaxmPi2T7BbZ0Zo3foyS2Lh58C+0OL6WAt0l5NHG674GFpbBcrRbXMCqfyUgrtmrUgCfJMj4ZjV9OHkryMoQBEy/QiPrpTjNBpBieWoRTsX1oHYfi6MQLUNqgsRKLtmpISOsLA4FujhpP4GKja4CgRT4DmDU/cPLTCbOsL1tzC0ZkyjVSyayH7+Ceje6e69IHoJcNLWt+V4lc3UaRRmI+jBCW8nFkaJ3x1HK0VkNz7Q+0XmOMe/TickbLWRWU/k5ceeukOCk3N/LdPv6nC0FILokCo5+10zkdVFEWVjJXm3bKea0g5bf1zsk9rqT8Rv03InmFlZxep91wLjFGEUox+T5HOLgM+dERi7S0kdiVSz/KlvlbX+8On5ub/7FBTehJr0efE5m9AJwhd2k2y8l7sTxalr8rX/IGDzHZD5vdlZRypAN6lWceWMgTMD0KWwcdOtwBnguMR/jWlrFNaxq/3MuMUtl8bimBf9MB2rL+01HGVJpyOiPFilT8AoGiMSemU5MD+gEMSii3qqP6oxeJnekL+MDx2cSnk0YzOAd5FGP3Ar+b4=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199018)(40470700004)(46966006)(36840700001)(40460700003)(70206006)(8676002)(54906003)(83380400001)(4326008)(70586007)(110136005)(316002)(8936002)(5660300002)(36860700001)(41300700001)(26005)(1076003)(2616005)(426003)(478600001)(47076005)(186003)(336012)(40480700001)(36756003)(82310400005)(1191002)(7406005)(82740400003)(2906002)(81166007)(7366002)(7336002)(7276002)(356005)(921005)(86362001)(7416002)(36900700001)(41080700001)(84006005)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 17:24:18.7419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa8d561-d899-415d-e0da-08db1e679e4b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6881
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_092438_533272_65A0A650 
X-CRM114-Status: GOOD (  12.65  )
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
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Michal Simek <michal.simek@amd.com>
---
 drivers/staging/fbtft/fbtft-core.c | 2 +-
 drivers/staging/greybus/spilib.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index afaba94d1d1c..3a4abf3bae40 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -840,7 +840,7 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 		sprintf(text1, ", %zu KiB buffer memory", par->txbuf.len >> 10);
 	if (spi)
 		sprintf(text2, ", spi%d.%d at %d MHz", spi->master->bus_num,
-			spi->chip_select, spi->max_speed_hz / 1000000);
+			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
 	dev_info(fb_info->dev,
 		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
 		 fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
index ad0700a0bb81..efb3bec58e15 100644
--- a/drivers/staging/greybus/spilib.c
+++ b/drivers/staging/greybus/spilib.c
@@ -237,7 +237,7 @@ static struct gb_operation *gb_spi_operation_create(struct gb_spilib *spi,
 	request = operation->request->payload;
 	request->count = cpu_to_le16(count);
 	request->mode = dev->mode;
-	request->chip_select = dev->chip_select;
+	request->chip_select = spi_get_chipselect(dev, 0);
 
 	gb_xfer = &request->transfers[0];
 	tx_data = gb_xfer + count;	/* place tx data after last gb_xfer */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
