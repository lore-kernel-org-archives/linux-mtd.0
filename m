Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3665DC61DA4
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Feb 2023 15:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fNvnamyfeSxisCNIaf7/WnQx9vaAZ7ZUtGuKxwq6W4o=; b=xZq9TNOWkK1QEH
	Y6eNbB+AZAURjuJfpjXcWcg9GZ3czxntmW9Izn4bunWs82VHrnyP57bHw+ZO6ARDAaNkouogpKMn2
	u/SHV36EUSxFtpYkh7XkftTg84DFaZqk0E8NL4FgvVdho9gDzPXuDQDH6YyYLJqJ1xWWSzdwjR11C
	Z9DuG8Zmmy1klNH4z+r53PzJM7MmB9521CAEmkzzGY7YtVbhrfocdqGJQD7l9n7SAi2gcySCbqC/F
	TP4NzT6xgj7qKWXtOTE8B5zc79EHgsQY5uYkXef8/R5KTbno5tMmTVQfn3hMwnwc8PhQZjH3100NH
	TobAKyQUTidRh2LAEX/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNbSw-00GLV4-Fi; Thu, 02 Feb 2023 15:25:34 +0000
Received: from mail-bn8nam11on20600.outbound.protection.outlook.com ([2a01:111:f400:7eae::600] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNbSr-00GLPA-03; Thu, 02 Feb 2023 15:25:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdSThlvzQGwVDk7Gntwvqqah6HFG+pduxQeW85hkI1dMOy+fuw8xriE9DOElJielv01JPUIoyqbfxs9freMlrGWeOt8uiGDO9S66keE8SC7/sJKV0FDPj9Smu1XLDcOPiUDzuUmTui4c8S1MiHLsCNZpa3ptpdEJ3e/ysbOzHH1m09L5Qp/vwZ6ddLetTEtN73diLw5nFveYZFE2cYeaFfm+hILTd1g3xeiW/NrruZPyUvrDlgA7iT08EFX01PxJKUfA0cpQVPqUV8N9dnv7ZxgSRtOtVym741sEmvEETE9rpzmFuiKOesQyAtA1qFK7FKkiO/VQX6VqwN+NjR/3hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrN+S0no9tJJWOPy0MesAGh9gOiwa6v7pOuBcPHrftY=;
 b=X0mek7sYEcwn3EHTn0hjiJiEOQxj6ZU+lxeDuC9yHoBqGFDl/4RXnMY/KkIw3xA3gcPB3LoMXKA4jXeOw+ncPoqWhtEJUvTouR/a2k/+L/sWu+/MY+PKcb0XNGliI1ysuz0WnyAWsBFMeMWdTYLkJx+zv5esFcTYY/yZVgBElnw7N4stmLr92J/TkyGeMNWViv/yAAxk+CkRzv+0SxmjqvrYmy1NqYlFqhMkORFFW+bvQ6pxjNIkOQ/QzEYoMJ/QXuXXE5Te9rFVVjF79gAtopa2hCKEZiFTgS7GuLMrXKr+rnlOed0pBYGiOpnrO7dJgQB7+BgV72irplOXgJLaGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrN+S0no9tJJWOPy0MesAGh9gOiwa6v7pOuBcPHrftY=;
 b=GqDQPuJjw0geLo+5XK3XQqDnAyydAS/Uwwym855nnx+PnSDokdWhSadppDJF+t/uJyA4C/XElL2jc0YdPj9TRa9w+HqPjlN6dgkFtWfX9No+cm0vDRLrU0OIiwD/ayeZB3eJGTpQfZI6cFmdwhBMsNmWExXurmA5YAiUqAcOhkk=
Received: from BN9PR03CA0680.namprd03.prod.outlook.com (2603:10b6:408:10e::25)
 by DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Thu, 2 Feb
 2023 15:25:22 +0000
Received: from BL02EPF000108EA.namprd05.prod.outlook.com
 (2603:10b6:408:10e::4) by BN9PR03CA0680.outlook.office365.com
 (2603:10b6:408:10e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27 via Frontend
 Transport; Thu, 2 Feb 2023 15:25:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000108EA.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.21 via Frontend Transport; Thu, 2 Feb 2023 15:25:22 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Feb
 2023 09:25:22 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Feb
 2023 09:25:21 -0600
Received: from xhdsgoud40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 2 Feb 2023 09:24:58 -0600
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
	<kvalo@kernel.org>
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
	<linux-riscv@lists.infradead.org>, <amitrkcian2002@gmail.com>, "Amit Kumar
 Mahapatra" <amit.kumar-mahapatra@amd.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
Subject: [PATCH v3 05/13] staging: Replace all spi->chip_select and spi->cs_gpiod references with function call
Date: Thu, 2 Feb 2023 20:52:50 +0530
Message-ID: <20230202152258.512973-6-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230202152258.512973-1-amit.kumar-mahapatra@amd.com>
References: <20230202152258.512973-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108EA:EE_|DM4PR12MB5311:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d202d06-f835-42d7-cff7-08db0531b38f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	G3yVV2eUeeaSFcpMMavWKG3bPVDfeZKn/uHfnSPGICVs0W24rRMHUOvlpsd5tVlfZeVO2CK4nsWrx58uqhufzfoK4rPNl2qvOFaH2wTZMtreD4eOs4XJH8fUvqDInGfy1o9+Hr366DwF4GTMMJpQl2tkwurkN924on2UkphxS/MmjKv5gGAtnPophTyyOeFP1dZEckruvd9tbgNHlQdJixEatI2KzdRYOkyQCYe9EgJflEaFMQGxdkM88qDd8rxWN40IHXuxu3r9WrqswHzD+8ES8eZDwuPq1didT9ki8qOqiDyOBKBKJisoMuWHAG4z9K9QIRwJzhvBhhNR5WXTJInKWYF1UoINCq6qhKPWIgSg3gDrIJW2+LL+j+zVfnYRUrWZUcI4llBNYFJg+cotkVAJGN+9dXPALuqXCH7tnIq6C+M6sVE4WgSu4U+TgLRnaVp/ACqYmu+cn1KwYQH4LzJZzWIilrJaCCj5RvSnVFwh6PW8pzNrCJjQougos7BN/AViQ9aMMloCz/wvxX/t94Sh14ocIZipZdYEWufQHfLSrk+sGOKRVBH4RayBgbCxhexm57jjtO+HPwdae7I6pjlyBzttthQfnezdm5IW0fm5k5HZfiqbxiyiV0YnXtbTYz4rwFCjp3je6QZjMGP/iQ2ru3YnjkBTRLeICGlDb2YZXtcMs/CF6Vg0as3Gyw5HfZOSubFjQ1kUaLJCRnn76JrQT+dqYGiPJ6syT9u6+5taED+tSum4mSxLZywTsHnFTbeFl3/7n99UvLIIq4Bu47ft5j/NBGxxni0PQlVz5g7LblDUdITtmvhweGpysQZlTws7ZgO+ZE/INleVcaxgWw==
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199018)(36840700001)(40470700004)(46966006)(70206006)(478600001)(86362001)(8936002)(4326008)(41300700001)(47076005)(8676002)(36860700001)(70586007)(83380400001)(336012)(426003)(2906002)(26005)(186003)(356005)(6666004)(82740400003)(921005)(81166007)(7406005)(7276002)(7366002)(7416002)(7336002)(5660300002)(40460700003)(36756003)(1076003)(40480700001)(2616005)(54906003)(110136005)(82310400005)(316002)(83996005)(2101003)(41080700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 15:25:22.5577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d202d06-f835-42d7-cff7-08db0531b38f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BL02EPF000108EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5311
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_072529_105466_B4A2B870 
X-CRM114-Status: GOOD (  14.63  )
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
