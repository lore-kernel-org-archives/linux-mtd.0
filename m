Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C025C77B7A
	for <linux-mtd@archiver.kernel.org>; Tue, 16 May 2023 05:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FiWP7gBBYk5uImS9dm4HlItV8J1mudz5TU7DATda5Z8=; b=FNF6RNNp6yIL3d
	9v5CIBB0qKKJGYDpVRypjKd68hEBpb4/M2pnu39tdxYpjhHoxYphvSe5vCeZIfzD0CZfpeiI9N9TY
	bjz7D1FAndO8EZ7vC6EZUAjhm4e8WIXSQN1qrX7xURFUmukHVsMhOxu0zJoz63EHQ3uqf6hEhNlHG
	miJXon0f036gabkGa+BnuYDN+EvOjAynOUZ/KVrjbtw7AL3/oQPpqQFVu1EKCnoCR1l27qDQwIteJ
	Oa34qowNVWku3wGNR24ZaC1zH142S3J3sthrvlJLSjV26RKR15J9BIwuJaoCXloKr3ik0LQOrMFVV
	rILCPGxIEjpEhVQJbbXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pynWn-004RgE-2t;
	Tue, 16 May 2023 05:47:17 +0000
Received: from mail-mw2nam10on2060a.outbound.protection.outlook.com ([2a01:111:f400:7e89::60a] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pynWi-004Rew-0I;
	Tue, 16 May 2023 05:47:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8szcvltiOic6dqQ1Zmty5u5aHEouHWnNHzvQAVRYUNx4aJ/JC+IiSGzOdIw/6zLp49Bk9R6SIf8V8NCrL9O8NKVgGCUc5kP5CnUywzWGdIAZTl3CTKDlf4rGjpbehfTeClnvPsBcNsS5rGv9o/bprgXEg9WWOxFuBY0vhz436CEnwA6atsoUgKYJyuYZhfLAVmWejidb/exSgTzSyd7yE9ztthikXa1u7fG+09PMOXBQRHRKtYL6y4EArhTn6736dNXWd73Khso5hdzYDacD1hpKYD3JXsHzDVRBzm7KUaIQqR6/afQSmsqfHPEb2/2dix/Z3c+0mXSdS6lCHwvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yaf9imes8KKxZClINs4PZgTT5vcF3pjsZqnSM0ngx5M=;
 b=GYUfftF68LuVW3WKO3r+rBPh+LVdycIktNV1YoqtRT4sWtmzN+D96oNIXyfIJF4Q7l0YprP2OT7yXNcDjijPbJf+ikLuIq/Hj8LTSObhq3hPX4al+kue9uDnda6g54dvKehVbgjFyjsenz8/hM0W6xDyezDLOZJE84rf4Gaz6dp+LKgZIkJogcEjq7XRtZFoCu50sEpW8KyoHLja12HdonQlRiLsRV8QWleoUosPRgwRQr9EPK5XC0/L+ED8+P6Zi+PjS+O6HwbKLr0jqmidJ2OgYiBlg848ei60MvF3Lb/F9SMzl7SywwRRU6tBbIKTHislVRVYj2oe3E2PBLV28A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yaf9imes8KKxZClINs4PZgTT5vcF3pjsZqnSM0ngx5M=;
 b=ybfvkAAQlmbvWyn0MpGJEHK5yPQJN3LjOE3hfJtaPEpVDfoL0A0nZ8N0NTYz2gzuUlGQIQLgUlBCqKaApX8jQqXQtzwRDbXUrp1apavlFY5NY73u7bU4vXFq/8sjkq9pg0ISw66UVLlTThmeLfcXMt7le+NYqmAoynXiDsjpqow=
Received: from BN7PR12MB2802.namprd12.prod.outlook.com (2603:10b6:408:25::33)
 by SA0PR12MB4366.namprd12.prod.outlook.com (2603:10b6:806:72::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 05:47:05 +0000
Received: from BN7PR12MB2802.namprd12.prod.outlook.com
 ([fe80::4db:e158:60d:21e4]) by BN7PR12MB2802.namprd12.prod.outlook.com
 ([fe80::4db:e158:60d:21e4%6]) with mapi id 15.20.6387.033; Tue, 16 May 2023
 05:47:05 +0000
From: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "tudor.ambarus@linaro.org" <tudor.ambarus@linaro.org>,
	"pratyush@kernel.org" <pratyush@kernel.org>, "miquel.raynal@bootlin.com"
	<miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>,
	"vigneshr@ti.com" <vigneshr@ti.com>, "michael@walle.cc" <michael@walle.cc>
CC: "git (AMD-Xilinx)" <git@amd.com>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "nicolas.ferre@microchip.com"
	<nicolas.ferre@microchip.com>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "claudiu.beznea@microchip.com"
	<claudiu.beznea@microchip.com>, "Simek, Michal" <michal.simek@amd.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "amitrkcian2002@gmail.com"
	<amitrkcian2002@gmail.com>
Subject: RE: [PATCH V8 1/7] spi: Add stacked and parallel memories support in
 SPI core
Thread-Topic: [PATCH V8 1/7] spi: Add stacked and parallel memories support in
 SPI core
Thread-Index: AQHZg9qvodZvp17JL06akOelv8vWJ69VSayAgAccZpA=
Date: Tue, 16 May 2023 05:47:05 +0000
Message-ID:  <BN7PR12MB2802B6F1E1EEFE415338C1D9DC799@BN7PR12MB2802.namprd12.prod.outlook.com>
References: <20230511073134.41180-1-amit.kumar-mahapatra@amd.com>
 <20230511073134.41180-2-amit.kumar-mahapatra@amd.com>
 <b9edd6c8-87fa-fa6f-33e4-85809f0430cb@opensource.cirrus.com>
In-Reply-To: <b9edd6c8-87fa-fa6f-33e4-85809f0430cb@opensource.cirrus.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR12MB2802:EE_|SA0PR12MB4366:EE_
x-ms-office365-filtering-correlation-id: 8682c460-9cc3-4dae-a038-08db55d0fae4
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  VNmODxIO81475zSX1hfldGoTJj0f0xMlEsIdZwz5UN4j//fyEY7FAjzSNiACmGxm6Si2aXI+aLlkbILTxsYHYsMHTslyKFqYyNqpa9x/dc1ULIHuHvWFazqCjmteQP4U8urJvpNqIvPGU8Ip3yMManMrarTbwmH5HzJs1Jb3PdHJzykBUMSmtu6YeF3xTppk6yDSt2INFXachtd4I+tlGhPtlfqGzDUjTd7cW8bLbOQesAcR2fQ3lSPb7epv3Br0kuGc+Q8ZG7xVAzhQhiDkE8/gTSV5sUenZ0RPXINyaW0EP2KByMCr5yYt2H7zfzsFGBrkpqC3kasyJltjFH5pADbItX5pnwWS1/kQ4cc/5wV/diAFHioi/Kj//f8HWD9NZw/pPrRTGtMereNIYBK5tsx4HvIg7VmgiIOEAMDphi1ij7Ge4QlQZJEnj8T/LPRFyFIHa70I7xyJXVBq6yrXXS38WOruVCpU1dhSjbKggjvJB2OIbVUG9qjU/XT8uqEO5nLbphE9wotO8N/LCRO4KknczKz9YzJTzI+Tn0Pl9SDfAr9NBX0b9ajfsqPalL/dtqL6AA8MMTq/2TZZQhjyVwm4telXHs8Mj6rQar78sRZGtIX/t4vrlFjV5qyNzbUry8rn5u8+DBH0jzDcO+BTtA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR12MB2802.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(451199021)(55016003)(38070700005)(86362001)(33656002)(2906002)(30864003)(316002)(66556008)(76116006)(66946007)(4326008)(64756008)(66446008)(966005)(38100700002)(7696005)(54906003)(478600001)(110136005)(66476007)(83380400001)(53546011)(122000001)(9686003)(26005)(8936002)(52536014)(186003)(8676002)(7416002)(6506007)(41300700001)(71200400001)(5660300002)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?S0dtUGdWK1JNSmZSa0pkT252ei8xMGZXc05Uei9rdmV1ei9ncWNzTkhhWUNB?=
 =?utf-8?B?NTZNNEJURHlKTjdXdjFzYnVpbTJudzZOZEgvWFVEYVFYNXFhV1lNYUtxS24r?=
 =?utf-8?B?K1VZUVJTaFAwVUpwZ3FlcEdYZVJhQTF0cG04cExMcFljWG5rLzlGNVRETnFI?=
 =?utf-8?B?MElMTmgwUHpsOGdHRFk0elhMMzA3ek90MGpkVWVzUldlb0gxOW1JR0tXN1po?=
 =?utf-8?B?MUNoamRSbm1wMmFsVEpjc0xsSENnSEZId20wY1lmb3BYMkRCbGtYdTk5dE1U?=
 =?utf-8?B?Z094QzV2Sm1JbDZVZTR3WnBRRWlid3lTbTBqK3B1eS9SMkJPUS9ZVFVSTHl2?=
 =?utf-8?B?dGs3NlB0dGt6UDZpYk5KSTFHRjNaNzhzS0Zyb2lzeVY2UUM5cVpIZVJxblFl?=
 =?utf-8?B?WTA5anY5YmNVM3kvR0ZIdUhZY3JmWmRjVUwwZTJGL2pkYktvcVNRWDZKaVRH?=
 =?utf-8?B?YW9RZ0taeU5WOExBTmhzVDdUNEE5SmMzZlJ2VXpKU1FuTFl3a0hubi9YNm1D?=
 =?utf-8?B?MVFBMXZOMm9OM2tlUTdheTU3Mi9qdmZFZEhsKzVUSURWcVlvWm56dTJxUDhm?=
 =?utf-8?B?YW50a1V3dU5mdHZkcWpuRUdPSGxFV0tGV3FkWGhqVXl4eklSaVVHbVc3dkpn?=
 =?utf-8?B?VzJCcHY0eFk1WG1Uc3YzWVI5ZDFRUGoxemxib2JxN2FFdStNaThXVzZxWEV1?=
 =?utf-8?B?ZTV0dFNPeEliVS9valVIZWdMSy9ubkV4L0RwWDRLcUlkelJMZi8zbjJFREFN?=
 =?utf-8?B?dTR3VjJPTlBOL3VYU21iRGtuNnpZbnM4b3RoNHhWMWI2RHo2RDI4ODNNSFMv?=
 =?utf-8?B?LzF4OExnS25xY21rT0l4bkFQcThlaTJ3ekpiREZ2SlVoM2UzUExRTUNkQlIy?=
 =?utf-8?B?cjAzdkZyOVA0ZXB0YmJ0S1ZyblVCTmZNSHgxYlJyLzBFYzhQNDRCdjIzSjBQ?=
 =?utf-8?B?SVQrWW1rQi9NeURqd3pmVWYrQitGVElqRDlDdzNwZTVFRzNrQnpsanhDZFJX?=
 =?utf-8?B?Rk9TbWpKazZDQXl5SVB5eVJpc2F5KzI2MkV2ZmdyRFY4QXBYdWFXeHh1L2s2?=
 =?utf-8?B?UldPR1VpM3R4Vkc2c3BVRlFwcy9TZ1dRVW83RjE0b1Vkakt5UzlKVFdlZEtS?=
 =?utf-8?B?SmVibWJOUUIyMWtVL2xtTjJjVjBOMnlyREFiWUl0NURpem83RmZZUkVuSHJq?=
 =?utf-8?B?SXRXWndVZUtSMXdvcmRaK3M3WnA4OFZ5RkQvMEFRanluYW9sTjJITFRSc0FD?=
 =?utf-8?B?SWtxdytPWHpxVmJXczVUNE5OL0h4RTROV2xnZWZ4TnJ5cHV6SXFqUTl5ckI2?=
 =?utf-8?B?SHQ0SFB4UWt5SFhDcTlveDZGRE1FTEFvZUErYzNPYkcvbjNOZWdrWmxyV0dk?=
 =?utf-8?B?WTlJNS9NTDJpN3N4dWtWMWFwQUdEeHBxSWticzNncUVjN20zemFIbzdWc3c3?=
 =?utf-8?B?UW9JbEJ0U2JyU01lUkxIWXdyT2VUOFF5a1ZEdUp6bUsxbnRCdnpxcmtRQndG?=
 =?utf-8?B?UWdKVVVIOVplYXMwekh5SHlDbmhtQ2c1cGF5dVNhdm5kelYvU21BdDJkL1lE?=
 =?utf-8?B?ZVA2MTIveU1PYllUSkt3UnJCdFhFaEJncWRQajRLYVk4a1MzaS9EcmMySnJ6?=
 =?utf-8?B?UFFBMWRTSUROQWM0aDFPcEJGd1RNb3JCUmpFNDdwS1pCVUtneUJYNGZ5SVMv?=
 =?utf-8?B?ZGpBNHhPVU1zckhrZmNhUnZkMDZ2T3E2T1Y2OTMyNlEyNUZpbWFEVUJzSFM0?=
 =?utf-8?B?TFhaVE1QbUFGckwzYmR2YXBYKys4bDYyblprRFdsZkx1c0dOazF3Y09QeVo3?=
 =?utf-8?B?cElMcElFSlZzSTQrenZYaGxvbzY2U1hDN2hHZUsrdHV2SUJzcEdkYyt0bVBz?=
 =?utf-8?B?MmIvR29rV29wV1NJbDFtUUozd0RacjRQYW5HOWRhVlBrNFhZYkxYSThSZXNZ?=
 =?utf-8?B?RnNFV2V0UTJhaThnSEs4c2pFY2RpMURuOVlPSzNZbmN2dWYyU2FpOHJVbzAw?=
 =?utf-8?B?Q2szTCthYmdYeGxMZlNyeTVqS3Y1UEJuOXJjT0hLRkNvb2V1ZTVvZmlJRDdM?=
 =?utf-8?B?eS80cDUwN2xrL3hwK09lTUdjQTZGbG9XU3Z0WG4rYllxSFJBdGhWQ3VBOW5W?=
 =?utf-8?Q?gwsU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR12MB2802.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8682c460-9cc3-4dae-a038-08db55d0fae4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2023 05:47:05.3300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0QJ85qNb3yoW+Df0HM3fYd29TowfKwI6K2BqtaCduDvjTeDtMi5dJguC9nc0y6e1V3Rogh0wmemvZQxV62esUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4366
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_224712_201992_1619FA01 
X-CRM114-Status: GOOD (  39.41  )
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

Hello Stefan,

> -----Original Message-----
> From: Stefan Binding <sbinding@opensource.cirrus.com>
> Sent: Thursday, May 11, 2023 10:20 PM
> To: Mahapatra, Amit Kumar <amit.kumar-mahapatra@amd.com>;
> broonie@kernel.org; tudor.ambarus@linaro.org; pratyush@kernel.org;
> miquel.raynal@bootlin.com; richard@nod.at; vigneshr@ti.com;
> michael@walle.cc
> Cc: git (AMD-Xilinx) <git@amd.com>; linux-spi@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-mtd@lists.infradead.org;
> nicolas.ferre@microchip.com; alexandre.belloni@bootlin.com;
> claudiu.beznea@microchip.com; Simek, Michal <michal.simek@amd.com>;
> linux-arm-kernel@lists.infradead.org; amitrkcian2002@gmail.com
> Subject: Re: [PATCH V8 1/7] spi: Add stacked and parallel memories support in
> SPI core
> 
> Hi,
> 
> On 11/05/2023 08:31, Amit Kumar Mahapatra wrote:
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
> > SPI_CONTROLLER_MULTI_CS flag bit is added in the spi controntroller
> > flags, through ctlr->flags the spi core will make sure that the
> > controller is capable of handling multiple chip selects at once.
> >
> > For supporting multiple CS via GPIO the cs_gpiod member of the
> > spi_device structure is now an array that holds the gpio descriptor
> > for each chipselect.
> >
> > Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> > ---
> > CS GPIO is not tested on our hardware but it has been tested by
> > @Stefan
> > https://lore.kernel.org/all/3f148a0c-8885-0425-28f4-2a53937a388f@opens
> > ource.cirrus.com/ Stefan, could you please provide your Tested-by tag
> > for this patch
> 
> I tried testing this patch, but I got a build failure in drivers/spi/spi-dw-mmio.c
> when I use this patch on the spi for-next branch.
> 
> (If I disable this driver, the patch works fine)
> 
> Thanks,
> 
> Stefan

Thank you for testing.
https://github.com/torvalds/linux/commit/2c8606040a808aa01d2d9e4f5b9332e87bb66377
this patch is causing build failure. As this patch is using the old interface( i.e., spi->chip_select) 
for accessing the chip_select variable so, build failure is observed on applying my patch series 
on top of this. I have already sent the below patch to fix this issue by replacing the spi->chip_select
references with new set/get APIs & it's been acked as well.
https://lore.kernel.org/all/20230515133553.46mownenmclcauec@mobilestation/

If possible, could please retest by first applying the fix patch 
https://lore.kernel.org/all/20230515133553.46mownenmclcauec@mobilestation/ 
on spi for-next branch followed by this patch series.

If it works fine, then please provide your Tested-by tag for this patch.

Regards,
Amit
> 
> > ---
> >   drivers/spi/spi.c       | 231 ++++++++++++++++++++++++++++------------
> >   include/linux/spi/spi.h |  32 ++++--
> >   2 files changed, 189 insertions(+), 74 deletions(-)
> >
> > diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c index
> > 9291b2a0e887..a793e56f6a21 100644
> > --- a/drivers/spi/spi.c
> > +++ b/drivers/spi/spi.c
> > @@ -612,10 +612,24 @@ static int spi_dev_check(struct device *dev, void
> *data)
> >   {
> >   	struct spi_device *spi = to_spi_device(dev);
> >   	struct spi_device *new_spi = data;
> > +	int idx, nw_idx;
> >
> > -	if (spi->controller == new_spi->controller &&
> > -	    spi_get_chipselect(spi, 0) == spi_get_chipselect(new_spi, 0))
> > -		return -EBUSY;
> > +	if (spi->controller == new_spi->controller) {
> > +		for (idx = 0; idx < SPI_CS_CNT_MAX; idx++) {
> > +			for (nw_idx = 0; nw_idx < SPI_CS_CNT_MAX;
> nw_idx++) {
> > +				if ((idx != 0 && !spi_get_chipselect(spi, idx)) ||
> > +				    (nw_idx != 0 && !spi_get_chipselect(spi,
> nw_idx))) {
> > +					continue;
> > +				} else if (spi_get_chipselect(spi, idx) ==
> > +				    spi_get_chipselect(new_spi, nw_idx)) {
> > +					dev_err(dev,
> > +						"chipselect %d already in
> use\n",
> > +						spi_get_chipselect(new_spi,
> nw_idx));
> > +					return -EBUSY;
> > +				}
> > +			}
> > +		}
> > +	}
> >   	return 0;
> >   }
> >
> > @@ -629,7 +643,7 @@ static int __spi_add_device(struct spi_device *spi)
> >   {
> >   	struct spi_controller *ctlr = spi->controller;
> >   	struct device *dev = ctlr->dev.parent;
> > -	int status;
> > +	int status, idx;
> >
> >   	/*
> >   	 * We need to make sure there's no other device with this @@ -638,8
> > +652,6 @@ static int __spi_add_device(struct spi_device *spi)
> >   	 */
> >   	status = bus_for_each_dev(&spi_bus_type, NULL, spi, spi_dev_check);
> >   	if (status) {
> > -		dev_err(dev, "chipselect %d already in use\n",
> > -				spi_get_chipselect(spi, 0));
> >   		return status;
> >   	}
> >
> > @@ -649,8 +661,13 @@ static int __spi_add_device(struct spi_device *spi)
> >   		return -ENODEV;
> >   	}
> >
> > -	if (ctlr->cs_gpiods)
> > -		spi_set_csgpiod(spi, 0, ctlr->cs_gpiods[spi_get_chipselect(spi,
> 0)]);
> > +	if (ctlr->cs_gpiods) {
> > +		for (idx = 0; idx < SPI_CS_CNT_MAX; idx++) {
> > +			if (!(idx != 0 && !spi_get_chipselect(spi, idx)))
> > +				spi_set_csgpiod(spi, idx,
> > +						ctlr-
> >cs_gpiods[spi_get_chipselect(spi, idx)]);
> > +		}
> > +	}
> >
> >   	/*
> >   	 * Drivers may modify this initial i/o setup, but will @@ -690,13
> > +707,15 @@ int spi_add_device(struct spi_device *spi)
> >   {
> >   	struct spi_controller *ctlr = spi->controller;
> >   	struct device *dev = ctlr->dev.parent;
> > -	int status;
> > +	int status, idx;
> >
> > -	/* Chipselects are numbered 0..max; validate. */
> > -	if (spi_get_chipselect(spi, 0) >= ctlr->num_chipselect) {
> > -		dev_err(dev, "cs%d >= max %d\n", spi_get_chipselect(spi, 0),
> > -			ctlr->num_chipselect);
> > -		return -EINVAL;
> > +	for (idx = 0; idx < SPI_CS_CNT_MAX; idx++) {
> > +		/* Chipselects are numbered 0..max; validate. */
> > +		if (spi_get_chipselect(spi, idx) >= ctlr->num_chipselect) {
> > +			dev_err(dev, "cs%d >= max %d\n",
> spi_get_chipselect(spi, idx),
> > +				ctlr->num_chipselect);
> > +			return -EINVAL;
> > +		}
> >   	}
> >
> >   	/* Set the bus ID string */
> > @@ -713,12 +732,15 @@ static int spi_add_device_locked(struct spi_device
> *spi)
> >   {
> >   	struct spi_controller *ctlr = spi->controller;
> >   	struct device *dev = ctlr->dev.parent;
> > +	int idx;
> >
> > -	/* Chipselects are numbered 0..max; validate. */
> > -	if (spi_get_chipselect(spi, 0) >= ctlr->num_chipselect) {
> > -		dev_err(dev, "cs%d >= max %d\n", spi_get_chipselect(spi, 0),
> > -			ctlr->num_chipselect);
> > -		return -EINVAL;
> > +	for (idx = 0; idx < SPI_CS_CNT_MAX; idx++) {
> > +		/* Chipselects are numbered 0..max; validate. */
> > +		if (spi_get_chipselect(spi, idx) >= ctlr->num_chipselect) {
> > +			dev_err(dev, "cs%d >= max %d\n",
> spi_get_chipselect(spi, idx),
> > +				ctlr->num_chipselect);
> > +			return -EINVAL;
> > +		}
> >   	}
> >
> >   	/* Set the bus ID string */
> > @@ -966,58 +988,122 @@ static void spi_res_release(struct spi_controller
> *ctlr, struct spi_message *mes
> >   static void spi_set_cs(struct spi_device *spi, bool enable, bool force)
> >   {
> >   	bool activate = enable;
> > +	u32 cs_num = 0;
> > +	int idx;
> >
> >   	/*
> > -	 * Avoid calling into the driver (or doing delays) if the chip select
> > -	 * isn't actually changing from the last time this was called.
> > +	 * In parallel mode all the chip selects are asserted/de-asserted
> > +	 * at once
> >   	 */
> > -	if (!force && ((enable && spi->controller->last_cs ==
> spi_get_chipselect(spi, 0)) ||
> > -		       (!enable && spi->controller->last_cs !=
> spi_get_chipselect(spi, 0))) &&
> > -	    (spi->controller->last_cs_mode_high == (spi->mode &
> SPI_CS_HIGH)))
> > -		return;
> > -
> > -	trace_spi_set_cs(spi, activate);
> > +	if ((spi->cs_index_mask & SPI_PARALLEL_CS_MASK) ==
> SPI_PARALLEL_CS_MASK) {
> > +		spi->controller->last_cs_mode_high = spi->mode &
> SPI_CS_HIGH;
> > +
> > +		if ((spi_get_csgpiod(spi, 0) || !spi->controller->set_cs_timing)
> && !activate)
> > +			spi_delay_exec(&spi->cs_hold, NULL);
> > +
> > +		if (spi->mode & SPI_CS_HIGH)
> > +			enable = !enable;
> > +
> > +		if (spi_get_csgpiod(spi, 0) && spi_get_csgpiod(spi, 1)) {
> > +			if (!(spi->mode & SPI_NO_CS)) {
> > +				/*
> > +				 * Historically ACPI has no means of the GPIO
> polarity and
> > +				 * thus the SPISerialBus() resource defines it
> on the per-chip
> > +				 * basis. In order to avoid a chain of
> negations, the GPIO
> > +				 * polarity is considered being Active High.
> Even for the cases
> > +				 * when _DSD() is involved (in the updated
> versions of ACPI)
> > +				 * the GPIO CS polarity must be defined Active
> High to avoid
> > +				 * ambiguity. That's why we use enable, that
> takes SPI_CS_HIGH
> > +				 * into account.
> > +				 */
> > +				if (has_acpi_companion(&spi->dev)) {
> > +					for (idx = 0; idx < SPI_CS_CNT_MAX;
> idx++)
> > +
> 	gpiod_set_value_cansleep(spi_get_csgpiod(spi, idx),
> > +
> !enable);
> > +				} else {
> > +					for (idx = 0; idx < SPI_CS_CNT_MAX;
> idx++)
> > +						/* Polarity handled by GPIO
> library */
> > +
> 	gpiod_set_value_cansleep(spi_get_csgpiod(spi, idx),
> > +
> activate);
> > +				}
> > +			}
> > +			/* Some SPI masters need both GPIO CS &
> slave_select */
> > +			if ((spi->controller->flags & SPI_MASTER_GPIO_SS) &&
> > +			    spi->controller->set_cs)
> > +				spi->controller->set_cs(spi, !enable);
> > +		} else if (spi->controller->set_cs) {
> > +			spi->controller->set_cs(spi, !enable);
> > +		}
> >
> > -	spi->controller->last_cs = enable ? spi_get_chipselect(spi, 0) : -1;
> > -	spi->controller->last_cs_mode_high = spi->mode & SPI_CS_HIGH;
> > +		if (spi_get_csgpiod(spi, 0) || spi_get_csgpiod(spi, 1) ||
> > +		    !spi->controller->set_cs_timing) {
> > +			if (activate)
> > +				spi_delay_exec(&spi->cs_setup, NULL);
> > +			else
> > +				spi_delay_exec(&spi->cs_inactive, NULL);
> > +		}
> > +	} else {
> >
> > -	if ((spi_get_csgpiod(spi, 0) || !spi->controller->set_cs_timing) &&
> !activate)
> > -		spi_delay_exec(&spi->cs_hold, NULL);
> > +		if (spi->cs_index_mask)
> > +			cs_num = ffs(spi->cs_index_mask) - 1;
> >
> > -	if (spi->mode & SPI_CS_HIGH)
> > -		enable = !enable;
> > +		/*
> > +		 * Avoid calling into the driver (or doing delays) if the chip
> select
> > +		 * isn't actually changing from the last time this was called.
> > +		 */
> > +		if (!force && ((enable && spi->controller->last_cs ==
> > +				spi_get_chipselect(spi, cs_num)) ||
> > +				(!enable && spi->controller->last_cs !=
> > +				 spi_get_chipselect(spi, cs_num))) &&
> > +		    (spi->controller->last_cs_mode_high ==
> > +		     (spi->mode & SPI_CS_HIGH)))
> > +			return;
> > +
> > +		trace_spi_set_cs(spi, activate);
> > +
> > +		spi->controller->last_cs = enable ? spi_get_chipselect(spi,
> cs_num) : -1;
> > +		spi->controller->last_cs_mode_high = spi->mode &
> SPI_CS_HIGH;
> > +
> > +		if ((spi_get_csgpiod(spi, cs_num) || !spi->controller-
> >set_cs_timing) && !activate)
> > +			spi_delay_exec(&spi->cs_hold, NULL);
> > +
> > +		if (spi->mode & SPI_CS_HIGH)
> > +			enable = !enable;
> > +
> > +		if (spi_get_csgpiod(spi, cs_num)) {
> > +			if (!(spi->mode & SPI_NO_CS)) {
> > +				/*
> > +				 * Historically ACPI has no means of the GPIO
> polarity and
> > +				 * thus the SPISerialBus() resource defines it
> on the per-chip
> > +				 * basis. In order to avoid a chain of
> negations, the GPIO
> > +				 * polarity is considered being Active High.
> Even for the cases
> > +				 * when _DSD() is involved (in the updated
> versions of ACPI)
> > +				 * the GPIO CS polarity must be defined Active
> High to avoid
> > +				 * ambiguity. That's why we use enable, that
> takes SPI_CS_HIGH
> > +				 * into account.
> > +				 */
> > +				if (has_acpi_companion(&spi->dev))
> > +
> 	gpiod_set_value_cansleep(spi_get_csgpiod(spi, cs_num),
> > +								 !enable);
> > +				else
> > +					/* Polarity handled by GPIO library */
> > +
> 	gpiod_set_value_cansleep(spi_get_csgpiod(spi, cs_num),
> > +								 activate);
> > +			}
> > +			/* Some SPI masters need both GPIO CS &
> slave_select */
> > +			if ((spi->controller->flags & SPI_MASTER_GPIO_SS) &&
> > +			    spi->controller->set_cs)
> > +				spi->controller->set_cs(spi, !enable);
> > +		} else if (spi->controller->set_cs) {
> > +			spi->controller->set_cs(spi, !enable);
> > +		}
> >
> > -	if (spi_get_csgpiod(spi, 0)) {
> > -		if (!(spi->mode & SPI_NO_CS)) {
> > -			/*
> > -			 * Historically ACPI has no means of the GPIO polarity
> and
> > -			 * thus the SPISerialBus() resource defines it on the
> per-chip
> > -			 * basis. In order to avoid a chain of negations, the
> GPIO
> > -			 * polarity is considered being Active High. Even for
> the cases
> > -			 * when _DSD() is involved (in the updated versions of
> ACPI)
> > -			 * the GPIO CS polarity must be defined Active High to
> avoid
> > -			 * ambiguity. That's why we use enable, that takes
> SPI_CS_HIGH
> > -			 * into account.
> > -			 */
> > -			if (has_acpi_companion(&spi->dev))
> > -
> 	gpiod_set_value_cansleep(spi_get_csgpiod(spi, 0), !enable);
> > +		if (spi_get_csgpiod(spi, cs_num) || !spi->controller-
> >set_cs_timing) {
> > +			if (activate)
> > +				spi_delay_exec(&spi->cs_setup, NULL);
> >   			else
> > -				/* Polarity handled by GPIO library */
> > -
> 	gpiod_set_value_cansleep(spi_get_csgpiod(spi, 0), activate);
> > +				spi_delay_exec(&spi->cs_inactive, NULL);
> >   		}
> > -		/* Some SPI masters need both GPIO CS & slave_select */
> > -		if ((spi->controller->flags & SPI_MASTER_GPIO_SS) &&
> > -		    spi->controller->set_cs)
> > -			spi->controller->set_cs(spi, !enable);
> > -	} else if (spi->controller->set_cs) {
> > -		spi->controller->set_cs(spi, !enable);
> > -	}
> > -
> > -	if (spi_get_csgpiod(spi, 0) || !spi->controller->set_cs_timing) {
> > -		if (activate)
> > -			spi_delay_exec(&spi->cs_setup, NULL);
> > -		else
> > -			spi_delay_exec(&spi->cs_inactive, NULL);
> >   	}
> >   }
> >
> > @@ -2246,8 +2332,8 @@ static void of_spi_parse_dt_cs_delay(struct
> device_node *nc,
> >   static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
> >   			   struct device_node *nc)
> >   {
> > -	u32 value;
> > -	int rc;
> > +	u32 value, cs[SPI_CS_CNT_MAX] = {0};
> > +	int rc, idx;
> >
> >   	/* Mode (clock phase/polarity/etc.) */
> >   	if (of_property_read_bool(nc, "spi-cpha")) @@ -2320,13 +2406,21 @@
> > static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
> >   	}
> >
> >   	/* Device address */
> > -	rc = of_property_read_u32(nc, "reg", &value);
> > -	if (rc) {
> > +	rc = of_property_read_variable_u32_array(nc, "reg", &cs[0], 1,
> > +						 SPI_CS_CNT_MAX);
> > +	if (rc < 0 || rc > ctlr->num_chipselect) {
> >   		dev_err(&ctlr->dev, "%pOF has no valid 'reg' property (%d)\n",
> >   			nc, rc);
> >   		return rc;
> > +	} else if ((of_property_read_bool(nc, "parallel-memories")) &&
> > +		   (!(ctlr->flags & SPI_CONTROLLER_MULTI_CS))) {
> > +		dev_err(&ctlr->dev, "SPI controller doesn't support multi
> CS\n");
> > +		return -EINVAL;
> >   	}
> > -	spi_set_chipselect(spi, 0, value);
> > +	for (idx = 0; idx < rc; idx++)
> > +		spi_set_chipselect(spi, idx, cs[idx]);
> > +	/* By default set the spi->cs_index_mask as 1 */
> > +	spi->cs_index_mask = 0x01;
> >
> >   	/* Device speed */
> >   	if (!of_property_read_u32(nc, "spi-max-frequency", &value)) @@
> > -3905,7 +3999,8 @@ static int __spi_validate(struct spi_device *spi, struct
> spi_message *message)
> >   	 * cs_change is set for each transfer.
> >   	 */
> >   	if ((spi->mode & SPI_CS_WORD) && (!(ctlr->mode_bits &
> SPI_CS_WORD) ||
> > -					  spi_get_csgpiod(spi, 0))) {
> > +					  spi_get_csgpiod(spi, 0) ||
> > +					  spi_get_csgpiod(spi, 1))) {
> >   		size_t maxsize;
> >   		int ret;
> >
> > diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h index
> > cfe42f8cd7a4..d0f9a9a8b6d8 100644
> > --- a/include/linux/spi/spi.h
> > +++ b/include/linux/spi/spi.h
> > @@ -19,6 +19,11 @@
> >   #include <linux/acpi.h>
> >   #include <linux/u64_stats_sync.h>
> >
> > +/* Max no. of CS supported per spi device */ #define SPI_CS_CNT_MAX 2
> > +
> > +/* chip select mask */
> > +#define SPI_PARALLEL_CS_MASK	(BIT(0) | BIT(1))
> >   struct dma_chan;
> >   struct software_node;
> >   struct ptp_system_timestamp;
> > @@ -166,6 +171,7 @@ extern void
> spi_transfer_cs_change_delay_exec(struct spi_message *msg,
> >    *	deasserted. If @cs_change_delay is used from @spi_transfer, then the
> >    *	two delays will be added up.
> >    * @pcpu_statistics: statistics for the spi_device
> > + * @cs_index_mask: Bit mask of the active chipselect(s) in the
> > + chipselect array
> >    *
> >    * A @spi_device is used to interchange data between an SPI slave
> >    * (usually a discrete chip) and CPU memory.
> > @@ -181,7 +187,7 @@ struct spi_device {
> >   	struct spi_controller	*controller;
> >   	struct spi_controller	*master;	/* Compatibility layer */
> >   	u32			max_speed_hz;
> > -	u8			chip_select;
> > +	u8			chip_select[SPI_CS_CNT_MAX];
> >   	u8			bits_per_word;
> >   	bool			rt;
> >   #define SPI_NO_TX		BIT(31)		/* No transmit wire */
> > @@ -212,7 +218,7 @@ struct spi_device {
> >   	void			*controller_data;
> >   	char			modalias[SPI_NAME_SIZE];
> >   	const char		*driver_override;
> > -	struct gpio_desc	*cs_gpiod;	/* Chip select gpio desc */
> > +	struct gpio_desc	*cs_gpiod[SPI_CS_CNT_MAX];	/* Chip select
> gpio desc */
> >   	struct spi_delay	word_delay; /* Inter-word delay */
> >   	/* CS delays */
> >   	struct spi_delay	cs_setup;
> > @@ -222,6 +228,13 @@ struct spi_device {
> >   	/* The statistics */
> >   	struct spi_statistics __percpu	*pcpu_statistics;
> >
> > +	/* Bit mask of the chipselect(s) that the driver need to use from
> > +	 * the chipselect array.When the controller is capable to handle
> > +	 * multiple chip selects & memories are connected in parallel
> > +	 * then more than one bit need to be set in cs_index_mask.
> > +	 */
> > +	u32			cs_index_mask : SPI_CS_CNT_MAX;
> > +
> >   	/*
> >   	 * likely need more hooks for more protocol options affecting how
> >   	 * the controller talks to each chip, like:
> > @@ -278,22 +291,22 @@ static inline void *spi_get_drvdata(const struct
> > spi_device *spi)
> >
> >   static inline u8 spi_get_chipselect(const struct spi_device *spi, u8 idx)
> >   {
> > -	return spi->chip_select;
> > +	return spi->chip_select[idx];
> >   }
> >
> >   static inline void spi_set_chipselect(struct spi_device *spi, u8 idx, u8
> chipselect)
> >   {
> > -	spi->chip_select = chipselect;
> > +	spi->chip_select[idx] = chipselect;
> >   }
> >
> >   static inline struct gpio_desc *spi_get_csgpiod(const struct spi_device *spi,
> u8 idx)
> >   {
> > -	return spi->cs_gpiod;
> > +	return spi->cs_gpiod[idx];
> >   }
> >
> >   static inline void spi_set_csgpiod(struct spi_device *spi, u8 idx, struct
> gpio_desc *csgpiod)
> >   {
> > -	spi->cs_gpiod = csgpiod;
> > +	spi->cs_gpiod[idx] = csgpiod;
> >   }
> >
> >   /**
> > @@ -398,6 +411,8 @@ extern struct spi_device
> *spi_new_ancillary_device(struct spi_device *spi, u8 ch
> >    * @bus_lock_spinlock: spinlock for SPI bus locking
> >    * @bus_lock_mutex: mutex for exclusion of multiple callers
> >    * @bus_lock_flag: indicates that the SPI bus is locked for
> > exclusive use
> > + * @multi_cs_cap: indicates that the SPI Controller can assert/de-assert
> > + *	more than one chip select at once.
> >    * @setup: updates the device mode and clocking records used by a
> >    *	device's SPI controller; protocol code may call this.  This
> >    *	must fail if an unrecognized or unsupported mode is requested.
> > @@ -564,6 +579,11 @@ struct spi_controller {
> >   #define SPI_CONTROLLER_MUST_TX		BIT(4)	/* Requires tx */
> >
> >   #define SPI_MASTER_GPIO_SS		BIT(5)	/* GPIO CS must
> select slave */
> > +	/*
> > +	 * The spi-controller has multi chip select capability and can
> > +	 * assert/de-assert more than one chip select at once.
> > +	 */
> > +#define SPI_CONTROLLER_MULTI_CS		BIT(6)
> >
> >   	/* Flag indicating if the allocation of this struct is devres-managed */
> >   	bool			devm_allocated;
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
