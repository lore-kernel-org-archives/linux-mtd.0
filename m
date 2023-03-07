Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C0BC678D5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 11:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/UJl6bWhnjzhFFnstmepXE39u8dzUC+OwkxEFwtWf4=; b=DBodELbwIT5lVs
	AxoWLcfdTD/F+nj+kIOXnBnPla0XjCGFOBpVymsY+u/LPS1Vb14zN0vFRCCTbUL1G41WlosuXlQWn
	ATOgjMhjqavU3J9swwXNs5QFz6MvPKY1bguCrGV77Dz956GfUbStzqpJMT1ynXSHhrai+OngzTMbo
	AJ+Qchxp3EEHlfo4w5DisFHYtxYy103UxmWw/H0HS22RXddpkPHsqpGhHn3miervdx3fZ0+OM44SM
	h0lT/Gm0aBLPKYBTALXctBQ3HOVcPAdaUZBTT+vEd82zi8THiH6InFXKMB4aLOz+S4AasFDIhlr7R
	W6XIVSdkPTAGA3d+n3OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZVCb-00HPyC-2g; Tue, 07 Mar 2023 11:09:53 +0000
Received: from mail-mw2nam12on20626.outbound.protection.outlook.com ([2a01:111:f400:fe5a::626] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZVCT-00HPwC-RC; Tue, 07 Mar 2023 11:09:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5d+bSdHFz/WeDt6E9+NDkFLikvRUsXBQvaxH1J/riSWfx7rIgLUZ4u5pBtHM+jccBGdwwi+vCo4tV/u7a/GRHCSp4jnplhyhkRwDzdEYCyfQyJ9NaUEBHhC8MVTovXLRJKFACe0CD4XxkGtzyL8wvNSH2uE7bA1lPjzHvr3SSSz5OqAnsDtxV0kyudgFVOiwljugPaN8ImPlY9bQmj83b8fH/v24xt7JsqP+htX+iCjRfy5pX00+lDIRyeSb2hhT/AhyMbNGxqhDKoyQXT9EPgHqNmMtyGGrkXlLV5huV+mEWBm5gXh3J0YTPV15c1uwtjLMSgH2W4m93D0WBDi1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHD+Vpjd5tNcCRoTDGhd35+SqFCuCTXSYA7mtdan5gM=;
 b=E9mfIoKObSlypkaamGJLOe2KkTaKytl69bloILm9EkroVHyClEGeaBSIe6T2QnoZxGXOua3CunKwblTdIR2awoNBqe+TYVk69Pd/RiB4tXQfD8pkh1s/xvaxaXgFy1AkdCGdt+AvcmIpp+kIhPTjfuGftQl3WKh6Lsl+fymhlKeWLt3s8GirUi/YfhUwTvwyZLLJzygFH+VHr55oInXxmZFgHR5wcvuxysh7iBAHEuozU22oEghAAbHECrideXe4HG/+MBXtb0o15I3IMRR5wbQnOxSzOeO9blTzBQfJOCvEDosoC032JBwepnYKZZ3vrXA4yGuTsqTvxMsT/g6UAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHD+Vpjd5tNcCRoTDGhd35+SqFCuCTXSYA7mtdan5gM=;
 b=joceivhgLnBA0XHPJkEeZ6b/zH/BCTdOVfLYCnVU4U8i6kGUU2fdaYx9yk+FHUnSfPlDCIB6xrq26zkWBHq018BHb2kNNtOtEOlg4SxRq5MCQLLeNR8A2tZovCoMLYIUPNKcB8eC5zDofsgTAOOidXIQEQL4KbXe6NB731cHi58=
Received: from BN7PR12MB2802.namprd12.prod.outlook.com (2603:10b6:408:25::33)
 by DS0PR12MB8318.namprd12.prod.outlook.com (2603:10b6:8:f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 11:09:41 +0000
Received: from BN7PR12MB2802.namprd12.prod.outlook.com
 ([fe80::96c6:f419:e49a:1785]) by BN7PR12MB2802.namprd12.prod.outlook.com
 ([fe80::96c6:f419:e49a:1785%7]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 11:09:41 +0000
From: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
CC: "broonie@kernel.org" <broonie@kernel.org>, "miquel.raynal@bootlin.com"
	<miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>,
	"vigneshr@ti.com" <vigneshr@ti.com>, "jic23@kernel.org" <jic23@kernel.org>,
	"tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
	"pratyush@kernel.org" <pratyush@kernel.org>, "Mehta, Sanju"
	<Sanju.Mehta@amd.com>, "chin-ting_kuo@aspeedtech.com"
	<chin-ting_kuo@aspeedtech.com>, "clg@kaod.org" <clg@kaod.org>,
	"kdasu.kdev@gmail.com" <kdasu.kdev@gmail.com>, "f.fainelli@gmail.com"
	<f.fainelli@gmail.com>, "rjui@broadcom.com" <rjui@broadcom.com>,
	"sbranden@broadcom.com" <sbranden@broadcom.com>, "eajames@linux.ibm.com"
	<eajames@linux.ibm.com>, "olteanv@gmail.com" <olteanv@gmail.com>,
	"han.xu@nxp.com" <han.xu@nxp.com>, "john.garry@huawei.com"
	<john.garry@huawei.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "narmstrong@baylibre.com"
	<narmstrong@baylibre.com>, "khilman@baylibre.com" <khilman@baylibre.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "haibo.chen@nxp.com"
	<haibo.chen@nxp.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"daniel@zonque.org" <daniel@zonque.org>, "haojian.zhuang@gmail.com"
	<haojian.zhuang@gmail.com>, "robert.jarzmik@free.fr"
	<robert.jarzmik@free.fr>, "agross@kernel.org" <agross@kernel.org>,
	"bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "heiko@sntech.de"
	<heiko@sntech.de>, "krzysztof.kozlowski@linaro.org"
	<krzysztof.kozlowski@linaro.org>, "andi@etezian.org" <andi@etezian.org>,
	"mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
	"wens@csie.org" <wens@csie.org>, "jernej.skrabec@gmail.com"
	<jernej.skrabec@gmail.com>, "samuel@sholland.org" <samuel@sholland.org>,
	"masahisa.kojima@linaro.org" <masahisa.kojima@linaro.org>,
	"jaswinder.singh@linaro.org" <jaswinder.singh@linaro.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "mingo@redhat.com"
	<mingo@redhat.com>, "l.stelmach@samsung.com" <l.stelmach@samsung.com>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "alex.aring@gmail.com"
	<alex.aring@gmail.com>, "stefan@datenfreihafen.org"
	<stefan@datenfreihafen.org>, "kvalo@kernel.org" <kvalo@kernel.org>,
	"james.schulman@cirrus.com" <james.schulman@cirrus.com>,
	"david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
	"tanureal@opensource.cirrus.com" <tanureal@opensource.cirrus.com>,
	"rf@opensource.cirrus.com" <rf@opensource.cirrus.com>, "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"oss@buserror.net" <oss@buserror.net>, "windhl@126.com" <windhl@126.com>,
	"yangyingliang@huawei.com" <yangyingliang@huawei.com>,
	"william.zhang@broadcom.com" <william.zhang@broadcom.com>,
	"kursad.oney@broadcom.com" <kursad.oney@broadcom.com>,
	"anand.gore@broadcom.com" <anand.gore@broadcom.com>, "rafal@milecki.pl"
	<rafal@milecki.pl>, "git (AMD-Xilinx)" <git@amd.com>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
	"radu_nicolae.pirea@upb.ro" <radu_nicolae.pirea@upb.ro>,
	"nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"claudiu.beznea@microchip.com" <claudiu.beznea@microchip.com>,
	"bcm-kernel-feedback-list@broadcom.com"
	<bcm-kernel-feedback-list@broadcom.com>, "fancer.lancer@gmail.com"
	<fancer.lancer@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-imx@nxp.com"
	<linux-imx@nxp.com>, "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"avifishman70@gmail.com" <avifishman70@gmail.com>, "tmaimon77@gmail.com"
	<tmaimon77@gmail.com>, "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
	"venture@google.com" <venture@google.com>, "yuenn@google.com"
	<yuenn@google.com>, "benjaminfair@google.com" <benjaminfair@google.com>,
	"yogeshgaur.83@gmail.com" <yogeshgaur.83@gmail.com>,
	"konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "ldewangan@nvidia.com"
	<ldewangan@nvidia.com>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
	"Simek, Michal" <michal.simek@amd.com>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-rpi-kernel@lists.infradead.org"
	<linux-rpi-kernel@lists.infradead.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>, "linux-sunxi@lists.linux.dev"
	<linux-sunxi@lists.linux.dev>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-wpan@vger.kernel.org"
	<linux-wpan@vger.kernel.org>, "libertas-dev@lists.infradead.org"
	<libertas-dev@lists.infradead.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "lars@metafoo.de" <lars@metafoo.de>,
	"Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "michael@walle.cc"
	<michael@walle.cc>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>
Subject: RE: [PATCH V5 09/15] spi: Add stacked and parallel memories support
 in SPI core
Thread-Topic: [PATCH V5 09/15] spi: Add stacked and parallel memories support
 in SPI core
Thread-Index: AQHZUFDgolfpAHzRAEiHg/XQpMwU3q7uLAkAgAD9XyA=
Date: Tue, 7 Mar 2023 11:09:41 +0000
Message-ID:  <BN7PR12MB2802A2E7A193B8BC0073812BDCB79@BN7PR12MB2802.namprd12.prod.outlook.com>
References: <20230306172109.595464-1-amit.kumar-mahapatra@amd.com>
 <20230306172109.595464-10-amit.kumar-mahapatra@amd.com>
 <CAOiHx=nmsAh3ADL3s0eZKpEZJqCB_POi=8YjfxrHYLEbjRfwHg@mail.gmail.com>
In-Reply-To:  <CAOiHx=nmsAh3ADL3s0eZKpEZJqCB_POi=8YjfxrHYLEbjRfwHg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR12MB2802:EE_|DS0PR12MB8318:EE_
x-ms-office365-filtering-correlation-id: 1be36a93-277a-4750-8061-08db1efc72de
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  QQaRLzqTHAb+4iQlNZ/EPpKZwnDn2N5Nqw5yAuQJMozDjX9xxgQOpiqBwwEWAH6+IcPkPi78O/3/ftB/OZkNCRQ2ZPlhSWFwnQq+JhwLLaNobJVJPi7yPbZK0R6JWriRP9vF2kDZvtloJPHWjVWyOm4C2QUfF8d/j50sxw2mHL/YHqaPmD6MmiD17uCTJFcXm3zIW+Px5jk9aw3EgEKVs2mHm1gBbd5/nwRiGdRkTGAVgYACHU3UGJoBQSvGjRibN7AFNSgYocbmc2YP3xiCxMa1Vi6gXVf5l8Fcj0p4aF/FefEsF3Ym7U3Y9cNYElzspdlRncBPgtrii7fjhg+wtH4n9/oLTuYnFAxgHiAyCWGRD3KqKDlUT8fWjVVSR3QdgFvy6L24gSM6RiKS0RvM/1/I5kWBuw2HUlsFbjNBI8JOAx74YRJAAAIhFquxNvS/DtY+5J1LlK5WaAXzAAgBCpYGs5Crhcemazdn5Q2hlntmL9IKYq1oi+/d73ruKf8UBYTvX1eIyhZV3C+nspDSEaRVqTpV+7sCRZ8wWulbU56Y1vsRvjy1NJE33yol/9BIBTOxo0veK3mFt+718G3aGZwaOtJj/19qnxeMLz4UAm1Hqhv+XDVkk+/2sbXHqgRX3Rbf5BIUUoLc/T93pXod4e/6NyPpARdjDPU6pjasB92e9O0Mcub/sM60/OhSfRavInkCmKlr+NeSkG92w3xJP6nGWFY169nkFjIi6xEpk84jFM+J4LpvDfRo99sPPeyyHdUckV0kQYa5MA17KicoAg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR12MB2802.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199018)(7406005)(7366002)(7336002)(8936002)(2906002)(7416002)(7276002)(5660300002)(52536014)(41300700001)(76116006)(83380400001)(4326008)(66476007)(66946007)(6916009)(66446008)(66556008)(8676002)(64756008)(54906003)(33656002)(7696005)(45426003)(71200400001)(53546011)(6506007)(478600001)(55016003)(86362001)(9686003)(316002)(186003)(122000001)(38100700002)(26005)(38070700005)(15866825006)(41080700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QU1oODMvWGhVMEZlY3VzL3czb0M0N0J4aHp5V3FraGlMZUFCSEVRRWVjR25o?=
 =?utf-8?B?ei9EbFdRMDc4WE9oOHBpd3g0aktLNGdtNDdYR1FDYzIrcmJKWVRTWEFmeTlO?=
 =?utf-8?B?UHgyM1F1OXh3eXJpZ0gxL1FFRmlnY2dTSCtCUWYxN3JRSFBnZ0JxekMxOEhX?=
 =?utf-8?B?clRVM3gwQTRoWFpCZWdpUFhGVUdSR3IxNkx2Qi8wSk9zTmJsYnZBK1gwSmYx?=
 =?utf-8?B?MDBSK1I2VDF6Z2ZGOFJpcmQ0N2ovVGNNUFJZS2JyaDZoU0t4T1lWVytUenNT?=
 =?utf-8?B?VUF1ZitJaUIxUW5Md3F6bzg4S2V6MkFTR3dJK1ZrdERNRWF1TTlyUTk0MFJ1?=
 =?utf-8?B?WnYvVnNUSFRNMDdOd3dxT1p1ZDlZRmhNMHpTQjhReERad1U2dTliTUtsbm1C?=
 =?utf-8?B?RmRENys0TmJGaFo5dk9RNzl3c0g3R2UxKzBLQXhZbUROV1FKa0E3ZkRHUEgv?=
 =?utf-8?B?Q0pobFBoWkRyZjZVanp0MzgxM0ZnMGFBQWMrZlY3SENOaE1FWitpZVZQVENI?=
 =?utf-8?B?bW5tdGg0RTRKRG1BK2hVVjFQMnk5NnEzZlRjbUlUdGpoUi9NTDFWTFE4bElu?=
 =?utf-8?B?a2lZL2FTRTFQV0hGSi9lYmUrVGorNHN1U01PbWV6aCsxU0FZajhsWCtzTHdZ?=
 =?utf-8?B?N3NsdytwYjNDNU83L1NicWNrekdQNEV2TldXc3pRM2ZkMUwwUFNxU0gzVnNl?=
 =?utf-8?B?Qm9wSnUzTHJtSUlkZU5tUFVtMEIyWE94Nm80clMrNkZrN3BIK3VLYzZYOEp6?=
 =?utf-8?B?SFMzeE9yNC84UXVVTzJQSXNieW1YZTNxa05ORXZCTWxlZFdlWjRQaWZGWGxS?=
 =?utf-8?B?SzhiWUxqMnIvZXhMcEhhcSt5amJ6cThxNUhhTjV0dlBvK1J6MnhBWXZ6Z3I5?=
 =?utf-8?B?NEd6QXdVQlRQMERJWnU5aGRPZ0JybS83aXpYN3g1aXU3ekhJdkVIbmhLZXRh?=
 =?utf-8?B?c3pQcnFLalYwbWdNV1dBOFB2TE0vQUpidXRQbkg5akZxYllJa2gwQ1g2d1Nh?=
 =?utf-8?B?eEEwYU5qTXc0YzRETEttd3hrUE40cFJKdCtLN0t6STM0YWR5R1BpL2NiMi9q?=
 =?utf-8?B?NDViK3VhVTNxZHFDN2JEVlZnZHBiOUFQRmV0SHllY1pGTE94QmhOeFYzdk5U?=
 =?utf-8?B?MWEwSmhWOGNIa0x3czFDRG9ac1VWOWtMR3JpQSsrbFZjMGZXeEVpbFU4ZHQr?=
 =?utf-8?B?NWNvMFFRTmlJejV2dk00T3V6S0FSc3NMSkNLRW9yODZTaVBEMTRKcGhac3J2?=
 =?utf-8?B?SFNnR3A1Y3hXZUNweit4MEU5WDJNSzRsRG0wVysrZi9pWVRXSGhhTmR2aUNk?=
 =?utf-8?B?ZnJaQ2Y1UWYxL0g2OHFYSDVwclJkakkyOElPUmhXMks0RG9vQXhjQk8xeW16?=
 =?utf-8?B?TFkyTmxscEo0SEE2QUxoa2lEZXhULytQaHV1Zm1iS3VqR1ZTbmQ0NW9laSt6?=
 =?utf-8?B?RzBORUordWNLcEV4cXBkR0dWVDFQRHE3dndhQkRBdU9SUGRWMERCckw5cjAy?=
 =?utf-8?B?OVM0R09jSDYvWlZxSXd0YmdMeURsSTdIdUFycDVQNWdNTGkrMzZtWUVpa2p5?=
 =?utf-8?B?bUxTMnhRby85NXUyNWgrNHdmMnNXeVhFb1JzLzJaMmNBZmorVzNPU25WU1hE?=
 =?utf-8?B?Sk9rNFNQVnlHcnZOUGZkdEpncGJ6M1hBYTJwWThmRlZ1b0RnWHBhTEJMRzVv?=
 =?utf-8?B?eGpldG1ZTlJVMXkySGlwbU9CanpneVcyb1pMOXNmc0o1alZvY295d2JoRngy?=
 =?utf-8?B?YjR2cEtwRnR0Zml2d2E3L3Y1eGp2ZDg5cjg5VkxwaDJIaWJtU0hpbklILzl1?=
 =?utf-8?B?TWhZWnJKQ0RVUGVONW9DdGhvZ1lrM2VGTC9zVVh5RmxBV0VzRXRKVWpBbXVC?=
 =?utf-8?B?ZUNwem9mUEdXSnpCVHphSHU1V1FNMS9OYm94SFAxRVNtR1E2WE1DdlVVMTB3?=
 =?utf-8?B?OGVZb0NITFFON2RZWTlnZThwdlEvVS9BSVdoUUtCcnErL0FFTElMRFJid3BP?=
 =?utf-8?B?SWExWFNNS2VyZ2FVZ0dlUkI5S2VoZUFLdkUxelRCeFNZL2lpQkxlZDJHMm1v?=
 =?utf-8?B?d2gyUldCQ1hJZXlqWkhsYkpkcjIwM25lZTdURmVGc2prMENjZVR1NHJYcTZC?=
 =?utf-8?Q?LF6w=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR12MB2802.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be36a93-277a-4750-8061-08db1efc72de
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2023 11:09:41.0364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YedORTt2l+HqYNCBBqjw4hda4bFuH8pd+9se3nq0kqbenONdmM7e0u/HmesZntBjnGiCvAJphxIrvgbPAmibaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8318
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_030946_250903_E58CF0D5 
X-CRM114-Status: UNSURE (   6.62  )
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

Hello,

> -----Original Message-----
> From: Jonas Gorski <jonas.gorski@gmail.com>
> Sent: Tuesday, March 7, 2023 1:31 AM
> To: Mahapatra, Amit Kumar <amit.kumar-mahapatra@amd.com>
> Cc: broonie@kernel.org; miquel.raynal@bootlin.com; richard@nod.at;
> vigneshr@ti.com; jic23@kernel.org; tudor.ambarus@microchip.com;
> pratyush@kernel.org; Mehta, Sanju <Sanju.Mehta@amd.com>; chin-
> ting_kuo@aspeedtech.com; clg@kaod.org; kdasu.kdev@gmail.com;
> f.fainelli@gmail.com; rjui@broadcom.com; sbranden@broadcom.com;
> eajames@linux.ibm.com; olteanv@gmail.com; han.xu@nxp.com;
> john.garry@huawei.com; shawnguo@kernel.org; s.hauer@pengutronix.de;
> narmstrong@baylibre.com; khilman@baylibre.com;
> matthias.bgg@gmail.com; haibo.chen@nxp.com; linus.walleij@linaro.org;
> daniel@zonque.org; haojian.zhuang@gmail.com; robert.jarzmik@free.fr;
> agross@kernel.org; bjorn.andersson@linaro.org; heiko@sntech.de;
> krzysztof.kozlowski@linaro.org; andi@etezian.org;
> mcoquelin.stm32@gmail.com; alexandre.torgue@foss.st.com;
> wens@csie.org; jernej.skrabec@gmail.com; samuel@sholland.org;
> masahisa.kojima@linaro.org; jaswinder.singh@linaro.org;
> rostedt@goodmis.org; mingo@redhat.com; l.stelmach@samsung.com;
> davem@davemloft.net; edumazet@google.com; kuba@kernel.org;
> pabeni@redhat.com; alex.aring@gmail.com; stefan@datenfreihafen.org;
> kvalo@kernel.org; james.schulman@cirrus.com; david.rhodes@cirrus.com;
> tanureal@opensource.cirrus.com; rf@opensource.cirrus.com;
> perex@perex.cz; tiwai@suse.com; npiggin@gmail.com;
> christophe.leroy@csgroup.eu; mpe@ellerman.id.au; oss@buserror.net;
> windhl@126.com; yangyingliang@huawei.com;
> william.zhang@broadcom.com; kursad.oney@broadcom.com;
> anand.gore@broadcom.com; rafal@milecki.pl; git (AMD-Xilinx)
> <git@amd.com>; linux-spi@vger.kernel.org; linux-kernel@vger.kernel.org;
> joel@jms.id.au; andrew@aj.id.au; radu_nicolae.pirea@upb.ro;
> nicolas.ferre@microchip.com; alexandre.belloni@bootlin.com;
> claudiu.beznea@microchip.com; bcm-kernel-feedback-list@broadcom.com;
> fancer.lancer@gmail.com; kernel@pengutronix.de; festevam@gmail.com;
> linux-imx@nxp.com; jbrunet@baylibre.com;
> martin.blumenstingl@googlemail.com; avifishman70@gmail.com;
> tmaimon77@gmail.com; tali.perry1@gmail.com; venture@google.com;
> yuenn@google.com; benjaminfair@google.com; yogeshgaur.83@gmail.com;
> konrad.dybcio@somainline.org; alim.akhtar@samsung.com;
> ldewangan@nvidia.com; thierry.reding@gmail.com; jonathanh@nvidia.com;
> Simek, Michal <michal.simek@amd.com>; linux-aspeed@lists.ozlabs.org;
> openbmc@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org; linux-rpi-
> kernel@lists.infradead.org; linux-amlogic@lists.infradead.org; linux-
> mediatek@lists.infradead.org; linux-arm-msm@vger.kernel.org; linux-
> rockchip@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> stm32@st-md-mailman.stormreply.com; linux-sunxi@lists.linux.dev; linux-
> tegra@vger.kernel.org; netdev@vger.kernel.org; linux-
> wpan@vger.kernel.org; libertas-dev@lists.infradead.org; linux-
> wireless@vger.kernel.org; linux-mtd@lists.infradead.org; lars@metafoo.de;
> Michael.Hennerich@analog.com; linux-iio@vger.kernel.org;
> michael@walle.cc; palmer@dabbelt.com; linux-riscv@lists.infradead.org;
> alsa-devel@alsa-project.org; patches@opensource.cirrus.com; linuxppc-
> dev@lists.ozlabs.org; amitrkcian2002@gmail.com
> Subject: Re: [PATCH V5 09/15] spi: Add stacked and parallel memories
> support in SPI core
> 
> Hi,
> 
> On Mon, 6 Mar 2023 at 18:26, Amit Kumar Mahapatra <amit.kumar-
> mahapatra@amd.com> wrote:
> >
> > For supporting multiple CS the SPI device need to be aware of all the
> > CS values. So, the "chip_select" member in the spi_device structure is
> > now an array that holds all the CS values.
> >
> > spi_device structure now has a "cs_index_mask" member. This acts as an
> > index to the chip_select array. If nth bit of spi->cs_index_mask is
> > set then the driver would assert spi->chip_select[n].
> >
> > In parallel mode all the chip selects are asserted/de-asserted
> > simultaneously and each byte of data is stored in both devices, the
> > even bits in one, the odd bits in the other. The split is
> > automatically handled by the GQSPI controller. The GQSPI controller
> > supports a maximum of two flashes connected in parallel mode. A
> > "multi-cs-cap" flag is added in the spi controntroller data, through
> > ctlr->multi-cs-cap the spi core will make sure that the controller is
> > capable of handling multiple chip selects at once.
> >
> > For supporting multiple CS via GPIO the cs_gpiod member of the
> > spi_device structure is now an array that holds the gpio descriptor
> > for each chipselect.
> >
> > Multi CS support using GPIO is not tested due to unavailability of
> > necessary hardware setup.
> >
> > Signed-off-by: Amit Kumar Mahapatra <amit.kumar-
> mahapatra@amd.com>
> > ---
> >  drivers/spi/spi.c       | 213 +++++++++++++++++++++++++++-------------
> >  include/linux/spi/spi.h |  34 +++++--
> >  2 files changed, 173 insertions(+), 74 deletions(-)
> >
> > diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c index
> > 5866bf5813a4..8ec7f58fa111 100644
> > --- a/drivers/spi/spi.c
> > +++ b/drivers/spi/spi.c
> > @@ -613,7 +613,8 @@ static int spi_dev_check(struct device *dev, void
> *data)
> >         struct spi_device *new_spi = data;
> >
> >         if (spi->controller == new_spi->controller &&
> > -           spi_get_chipselect(spi, 0) == spi_get_chipselect(new_spi, 0))
> > +           spi_get_chipselect(spi, 0) == spi_get_chipselect(new_spi, 0) &&
> > +           spi_get_chipselect(spi, 1) == spi_get_chipselect(new_spi,
> > + 1))
> >                 return -EBUSY;
> 
> This will only reject new devices if both chip selects are identical, but not if
> they only share one, e.g. CS 1 + 2 vs 1 + 3, or 1 + 2 vs only 2, or if the order is
> different (1 + 2 vs 2 + 1 - haven't read the code too close to know if this is
> allowed/possible).

Agreed,  will add in the next series.

Regards,
Amit
> 
> Regards,
> Jonas
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
