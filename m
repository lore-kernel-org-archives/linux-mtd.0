Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186F5C43334
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jul 2022 23:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f/d5FFq+hz/1IsfrFntu+KKaBSVD3EfUNfj9MoAYk5A=; b=x/QzP3d+70gDvZ
	jK73ZM/KmeDsgJaxCG0kxMo19dgdVxEHYL5dQxUIZrWdrwIdx8ADiy9x8hSv7QtiEBzz+eOkqk8oH
	e6D2AKjezjc3mN5Ht/ETdiiSIL+QQx/4F6zdlvHouVcf6UwQwYXnesOPqRAJ76WoO+ZcjFDWdeHFA
	4cypJooVGRxFthZJr54g/SbIP4mApUJsci4cpyUVkzGioEzQX1bcvcN+e9+MNfT3/8SNcrQWsY9wr
	KAOk+/3QcbbGbosOJC3mLoCWq7oYKPqz+mkSr/2jNnvH5VA1Bxqp+Lt2kOZVGOcYos7ZS+17BzaHX
	k7R9BogJ6rGLY/MHMgvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8rcz-003RAJ-Bt; Tue, 05 Jul 2022 23:06:45 +0000
Received: from mail-db8eur05on2069.outbound.protection.outlook.com ([40.107.20.69] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8rcw-003R8Y-U8; Tue, 05 Jul 2022 23:06:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfwLb9AS5IqePl8koDcyZ0fcGYpiP3VAZrMJNt+mPWZmvIwWfzfGBEnP/Q9XyA3lh4HviNG7DojV0iUWIrxpWsyvAQi1mTb8w6FgKwidFK6zaQPCTJXqxZe45NcpkdeHmwYMujAYAKb3kGoxshGQLVA+g7oo5hzqeMx/q3jhyXWrQCkyKATNy7kRQ3abk+S90mnF9V5c00tmNOX3kmCC1oAgE9WAZQfsF3ox/f3VJQCgtyrmKyXCITi06uqqdp1+nROBEojiyGvdlDiP93RaEaOjY5tn2cKhzwJEnbdaH6YhGYIDts1b1FLquGvoVlnzmS8JpJrcZDWuUBQ+dTx5AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99vo1FGUOy0ujbWNN9LFge38gzp6jEy0C8fqjerdyWE=;
 b=S4NQBDzPfzTYakeauyTWrCb+JbUCf+im3QAu5gkaMtoJAW5Ck3dVSIuvOS1sMT3z0eQEcWhfXBmUkdJdh++1jJpb2LyXdJyQvkfgWt5zau63SeVffRrUqHlnMvGznHPoYGuT+cCKNnQ1aH/XdfbR1giCgYA75g7vZBclsf6hAWLhTqPCG+9cmEMA2ikw077q9ZA2hqvkW0TD5g+Vkp9xILV0gxaZjnnODm/LWdt7XzXSKPgIqTTJ5Al+9Q5991lLEwR4CCXLyQx9GJOql0V+d07HXUPEfmIQlZTyzFyB/0yzCdJRhC1hLkKmYlbKYca8fidBMjdj6svUIzAx47rq5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99vo1FGUOy0ujbWNN9LFge38gzp6jEy0C8fqjerdyWE=;
 b=OBxDW+mcFvZepeHqrECeTxV15y6ym5EptQmfQVIJQC60pbVqfQWpwxxUXCYYOw4/OeVDZHYWmmxZ+wbbVbN8NZu+TfDRV1cJDTkmSRSGqvB9KmX0M1K564SxKUvFYik/JaKf+UbSrmAhqy+yc8MGvdOWNWaxAYFs9fcDiteKQ1M=
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by HE1PR0401MB2507.eurprd04.prod.outlook.com (2603:10a6:3:7d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 23:06:39 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::5c49:dd85:a8d0:2907]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::5c49:dd85:a8d0:2907%3]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 23:06:38 +0000
From: Han Xu <han.xu@nxp.com>
To: Michael Walle <michael@walle.cc>, Bough Chen <haibo.chen@nxp.com>
CC: "ashish.kumar@nxp.com" <ashish.kumar@nxp.com>, "yogeshgaur.83@gmail.com"
	<yogeshgaur.83@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"singh.kuldeep87k@gmail.com" <singh.kuldeep87k@gmail.com>,
	"tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>, "p.yadav@ti.com"
	<p.yadav@ti.com>, "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "zhengxunli@mxic.com.tw"
	<zhengxunli@mxic.com.tw>
Subject: RE: [PATCH 01/11] spi: spi-nxp-fspi: enable runtime pm for fspi
Thread-Topic: [PATCH 01/11] spi: spi-nxp-fspi: enable runtime pm for fspi
Thread-Index: AQHYkFFaXsuE3sXxZE+Y+3ew2lJKla1vzrsAgACYUAA=
Date: Tue, 5 Jul 2022 23:06:38 +0000
Message-ID:  <DU2PR04MB8774221296350C7E424DCA8197819@DU2PR04MB8774.eurprd04.prod.outlook.com>
References: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
 <fc7d7ffe775feb1d9fde19a5dadbca1f@walle.cc>
In-Reply-To: <fc7d7ffe775feb1d9fde19a5dadbca1f@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50e7e960-7a1f-45b9-a339-08da5edb0429
x-ms-traffictypediagnostic: HE1PR0401MB2507:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  5KdDRIjzf/EncSbLUNnfxsG6brmDqffxI8ZZg7jIUx9tiHs/eC4IWVIN8MQyYVqMOVShn45Uu/bQeTDXzVmiQdb1FMgXWWO9MFgjnlK5VYw5FtSdfcDjq50cDC3DM+OnjzvSUfGGo8geKiKtCBSw52jibLKMkfsUN42kf8MM3iVHe14NsYPaybAc4AmXp1EsxBgB9RFe2byVE4O7JeSUT7Y0E4q5y7s1+ffmyjaMoDjXM2fHVmvfOAXLH5GGJjQSg+aDhgAW2Oul0y6YN2J8rbgsVTFP7GtTxPGmouTXXGr+L2xuOQWuYgCtz/fyxG+zKrtbvR6lT5RPCxhG11W+EfrwW1f6hO3PANeniZh/tFZ6rRpVoEa7Hm1eJarIUqzUapz51ocAYtfRB9u6auZ87242d0WP141KPVDzVkviqSzxRQw8NQTz+ugzp7lcZBKNilUJWQlXRfWHA/9wy1KZwXKbNabZhphf5/yhl24gnIHQ8Nbkl864B01VXBIXT6tSKA0myp4CiX/lw8IxIMDErK024vrwck1aBXAoxhPup46IfOPj5eiDrAolMSgXQbtTYV+XdNedEUGFxGMPVfkCv4/0ne7jdyAr5w86r2Zl6YfgxHu18CyZFfNKlgXtnKpa3pqgQkpO5NFzCf5RzD4hcixge4WIujfpGgNwGtXxu9BK2brjYCV0ec93YlivUi2QT0UOX2r8ai8dWdoRTOlAMPYyRqDL05nbTTqinYF1OeDvrKN90MstA4zNlasCAE0IG1+tcS5+mb4apIUa25x1RQ8xL4qQ466pjBXFeXRnsjyGej7ovaesY62jIsg7Mqn8
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(8936002)(52536014)(38100700002)(86362001)(44832011)(33656002)(478600001)(122000001)(66946007)(76116006)(4326008)(8676002)(9686003)(64756008)(66446008)(66476007)(66556008)(5660300002)(71200400001)(26005)(55016003)(186003)(7416002)(55236004)(316002)(7696005)(6636002)(54906003)(2906002)(41300700001)(6506007)(83380400001)(110136005)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?lHyh3Z/vl8vCwUP1iivkQoQRQMTgm8BbXMsa3CT+FaI1LMbMZ3c4ESv3ojLf?=
 =?us-ascii?Q?kndWtCDtUVS56IuN06AQ2ajKYOMlQIoyqYCnogSbDhpzcy82XcxN9xROBYZf?=
 =?us-ascii?Q?7imV9XIEYLIzkxKq7ZpjhmnOjUvvwCI7R7l8LUJnyQw+4nHixGn+ZMJcUErt?=
 =?us-ascii?Q?z00gwv3w9dLocX1LtunGK9PwLY8FE5c0/z/sR+wGlWWLtVZUG9QlBtOVZu+5?=
 =?us-ascii?Q?zpJHzxnJcfUt9pb5lEZTjf6P6PQ9JKhpGEZTJj09FJC3Lxouwwx0atMYybP1?=
 =?us-ascii?Q?+pGWnuU5kfZobPn7nePryNA8Va3FT4uTcPgKoO/0DaPqKnjuPOdziUzyAUDA?=
 =?us-ascii?Q?7R2eInjg3pxv7dg9s3C/Uut3Y7CxzOoGRH4t8KqyKn5y+Lkwt+yVQm3bkzO+?=
 =?us-ascii?Q?K+LZhPx3G3XltUmXioPWvSfPw2hr8UX8qnRGKebb9/aGQbxyj4ywGJqoWsaH?=
 =?us-ascii?Q?iZnaAhgAepFndvlLCk6H0NQubA/ZBxcjtcqB8b4EKmyk3UF2uZKSaLkIR0bl?=
 =?us-ascii?Q?z1NEaRETEzwv4oV9RW7effwBfcr9iuijPPChKnvMZafVxYe1jtjIOML73BeQ?=
 =?us-ascii?Q?6+7RpIcjNCVDEfG+nO7ABgS6A5QtQ2+DyWk6tSvUYvWLRC6piULzgoKUPMgU?=
 =?us-ascii?Q?DzAYDRkUnJHwLzArVAVqw6Y7P85Zpkb8oAjD/KzXwuyMkbacv5WqhI5s/9kC?=
 =?us-ascii?Q?7s1vAWxP+cvLhQDMA+MXhSIFBT1i2SpdVAmKJI5lBASCffFjFR01P2y5nwpN?=
 =?us-ascii?Q?qYoPnEMgmLlOIGqohg0XBnd7X+DScFTiwW2gNPv2CxTOsYGX2eOfL7lpMFhF?=
 =?us-ascii?Q?ODUL9csZ37ZoGwRX1B6PVXNRNFRfnZMLmG+C6NE5ImT7ZBO1pbZfVI2OLP0C?=
 =?us-ascii?Q?waPPkNljKfEsKW21LBY+qRdfVXZlzYzFh2ajufp2a86+5wonu1fGmsw35epn?=
 =?us-ascii?Q?Nwwg2vGrmk9APcIWqiiXZeQ9T3RvnwH7H6kILIXZuh363eCKa4TDtuZbQKtr?=
 =?us-ascii?Q?oinyNj/eO7rKNVWl9s5A23HBphA0P3k82X9O4YM8FL1vEgwj3tWmNTrO0Uju?=
 =?us-ascii?Q?YbcIc4F2g7veXIVMc69ge+B4r/yjTQ6PRLzFSh1kYyr/s0FkgBGW7g0pA/wp?=
 =?us-ascii?Q?Ndag0M3WAKaYHn57JojXeoalB2mqtvZmxYmOhLETP94fT2qCJjOYnQddns59?=
 =?us-ascii?Q?n4NIqnZgIW4g6PeWgZjJPj1cmjjqb84WpTdhTIfvW/1D9d6b2S48drHSEgDw?=
 =?us-ascii?Q?JGFcpHQqBJIRmf/xH/cemnaKd6p9lLWdvNJORG+ibAM9Np47rDuxsvb6yV3C?=
 =?us-ascii?Q?ZT2h8piLBtwbBLvNLCI5cj1u2ZslIQFgpbmCii8h523THrUtX8YA++JFEhKE?=
 =?us-ascii?Q?dDxni0E0qeKdo29OqT6nrkop/4U85JDLzH/C23fWj0bQidzh6f9D5Rfrhr1l?=
 =?us-ascii?Q?yRApXlCGBV/vVYQrSapUKykar04CrjkQpept/7Ak3veg/0vwImDOoIXyi1kx?=
 =?us-ascii?Q?qeEcFcjP/95fpHWYcyVUZtyaEe3KuBF8jCSz6WHiGs/QOj4560n/hOQDM+68?=
 =?us-ascii?Q?jd5WaZ0lD9j0ibeq6d8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e7e960-7a1f-45b9-a339-08da5edb0429
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 23:06:38.6719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TUyKB5YnmaCJXiP3liQkb6KkSN9CU8gSkLJkcNI8UctR/YnPFE3yRyGMytMUEo3I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2507
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_160643_200991_D232FAAA 
X-CRM114-Status: GOOD (  10.23  )
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



>-----Original Message-----
>From: Michael Walle <michael@walle.cc>
>Sent: Tuesday, July 5, 2022 9:01 AM
>To: Bough Chen <haibo.chen@nxp.com>
>Cc: ashish.kumar@nxp.com; yogeshgaur.83@gmail.com; broonie@kernel.org;
>robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; Han Xu
><han.xu@nxp.com>; singh.kuldeep87k@gmail.com;
>tudor.ambarus@microchip.com; p.yadav@ti.com; miquel.raynal@bootlin.com;
>richard@nod.at; vigneshr@ti.com; shawnguo@kernel.org;
>s.hauer@pengutronix.de; kernel@pengutronix.de; linux-spi@vger.kernel.org;
>linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-
>mtd@lists.infradead.org; festevam@gmail.com; dl-linux-imx <linux-
>imx@nxp.com>; linux-arm-kernel@lists.infradead.org; zhengxunli@mxic.com.tw
>Subject: Re: [PATCH 01/11] spi: spi-nxp-fspi: enable runtime pm for fspi
>
>Am 2022-07-05 11:11, schrieb haibo.chen@nxp.com:
>> From: Haibo Chen <haibo.chen@nxp.com>
>>
>> Enable the runtime PM in fspi driver.
>> Also for system PM, On some board like i.MX8ULP-EVK board, after
>> system suspend, IOMUX module will lost power, so all the pinctrl
>> setting will lost when system resume back, need driver to save/restore
>> the pinctrl setting.
>
>On a side note: The mails to Ashish Kumar bounces. He is currently listed as the
>maintainer for the FlexSPI driver. Will someone from NXP take over?

I will take it over.

>
>-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
