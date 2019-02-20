Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D31C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 20:31:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C4B620880
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 20:31:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GtKzoq3l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="2q3aslAl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C4B620880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JkJ0CW+BETTwUs+0JvMtsYOHxLLzkm3ZN11YpcjdmWA=; b=GtKzoq3l1xL59w
	NG4APtaDX3oWnOI60V29u/oao/eCcR6pqx3Z8c4M60pLwwEByRRp4eddFHsclCtf4+c+PW7tw/Wy5
	j8Ij7Ef/rF6X1GlSJf4PGNZN3W9b4VVCLoGky2cKWPLXT/oeZEVYOH8kYXu1WVU6Pi1vIjTIMMa+d
	h1Kxc3gFs6IVbdR/3VCIp3njEK3SkuJwKPy76IEupjDgLyrq4TY5Ot048/dT7F5ahXBBMCOC5j1/y
	j1JvlkiYdz8ARDTA7p70xQdEwq3oDBia7lKbWB8+Mfx8SU9En0Uf3S8qDaccDyVWBHMtZEmXPhgF7
	MV/y3okJ+RgnwemjLx8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwYWs-0006uk-Pt; Wed, 20 Feb 2019 20:31:42 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwYWo-0006tb-8J
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 20:31:40 +0000
X-IronPort-AV: E=Sophos;i="5.58,392,1544511600"; d="scan'208";a="24976088"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 20 Feb 2019 13:29:15 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.106) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Wed, 20 Feb 2019 13:29:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfRU53lpMO7ckD7SCwoOvgjFqf+enkMa76z4tzacGmE=;
 b=2q3aslAlhj+NodUKFR7rBkuaKfc2lnlPXYaVGOolyVPU2P7I1TH+YwVFUaaWLUnsyd2z2Sy+rEpC22OL82gIscbNEy7a+kRZN2M92idIM5l8taXiAAebDtagCY5mw1IFUMyKYEUj5hYd3syeaUVUS98QrCgcnPQ1DiLLr7N1rVw=
Received: from DM5PR11MB1850.namprd11.prod.outlook.com (10.175.92.17) by
 DM5PR11MB0075.namprd11.prod.outlook.com (10.164.155.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.19; Wed, 20 Feb 2019 20:29:07 +0000
Received: from DM5PR11MB1850.namprd11.prod.outlook.com
 ([fe80::4125:8d55:234b:a4a1]) by DM5PR11MB1850.namprd11.prod.outlook.com
 ([fe80::4125:8d55:234b:a4a1%11]) with mapi id 15.20.1622.018; Wed, 20 Feb
 2019 20:29:07 +0000
From: <Tudor.Ambarus@microchip.com>
To: <robimarko@gmail.com>, <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <bbrezillon@kernel.org>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <bbrezillon@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Add Winbond w25q16jv support
Thread-Topic: [PATCH] mtd: spi-nor: Add Winbond w25q16jv support
Thread-Index: AQHUxKf5P1ZBDcn1LEmHy4bSCo3uraXpLIAA
Date: Wed, 20 Feb 2019 20:29:07 +0000
Message-ID: <97e48e85-9700-53e3-0f7a-eeac6f93f721@microchip.com>
References: <20190214205723.9011-1-robimarko@gmail.com>
In-Reply-To: <20190214205723.9011-1-robimarko@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0302CA0011.eurprd03.prod.outlook.com
 (2603:10a6:800:e9::21) To DM5PR11MB1850.namprd11.prod.outlook.com
 (2603:10b6:3:114::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.127.52.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f06c2109-b14c-4875-f25c-08d697720fde
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:DM5PR11MB0075; 
x-ms-traffictypediagnostic: DM5PR11MB0075:
x-ms-exchange-purlcount: 1
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtETTVQUjExTUIwMDc1OzIzOnhTMHptNFNCTWFyRldrVHRtalA0aXZISDgx?=
 =?utf-8?B?RHd4UDllUUQ1TmhFaVg1U051SEVZT3kwd2lOamo5TDF2OUIyT2UwUVNZWFVI?=
 =?utf-8?B?VTcrakY2VisrNmFTaHdGSm8zSnVFZ0laR0R2MXhISUtQajgxcmZXZzhxRDlW?=
 =?utf-8?B?Z0llcXJyc0ZBY1JoY1ZFWVB0WDQvTHpFR0lTaUE3T0xIQ0lYOXF2K1YvRUh0?=
 =?utf-8?B?Ukc0bXcxUm5zejhkMXc3OU95UFRtcWVOVUhuWFVMZTRnVmV5ZGc4NlV5M1VQ?=
 =?utf-8?B?bGM4c0JQbmtrSXNQOWtsUUd0Q0dBVFhMS3lhRC9OTVIzWGpnWDRTTG52bW1x?=
 =?utf-8?B?b01ZeURvMjZLaVlwTjA0OW4rWUovZjJFMkhGUW1KZTlPWFMzMWdUQTNIL3d2?=
 =?utf-8?B?SlFWNGw4OVh4R1QySEg0UWhnZUtYaEUzekM2d1VmbmdUb0pTd2MvZHd4SE9H?=
 =?utf-8?B?c1FLMG5mMHQ2RUQvSmNvUHF2MDR6d0tJS215ZlFYeVFkSjBtd01QeXBwa0NV?=
 =?utf-8?B?WFJWL2I0SmtrM3BpcjJhSXVEdXNLeUh3UzQxajUrNkhQWHBMN21TdHdDWWpz?=
 =?utf-8?B?M3d6cE1SYXY2SVM2QUJzNld5ckdwQkJFMUFrY3RmcEZhYUxDUldxM2x3L1gy?=
 =?utf-8?B?UTlNS1JzTFhGNVJRcGFmVzI0TEdXdW1LbEVtbzl3YmVKeEE0TWFpSmhySmt5?=
 =?utf-8?B?VUNxeGkvcjVQTDIyWXdsWFhNLzQwSnVFdWNrRk5TVXdYY0dwOC9YUmQwUHFF?=
 =?utf-8?B?UGVqbGlTTkpscVZpeTJZYUhJRjMyV2JkUm5iQzcyeTNXVzc0TEt4dnpCQlNK?=
 =?utf-8?B?MUVDbTZFL0ZNbFptUEEwaExDU0ZkWllzTjlHcXdvMXYvMURndXV4STQ2S0FB?=
 =?utf-8?B?NnlCN2dtSHlCSWI5ZUlHUEdUdTRTUGRwaDd3elpNYmRSV2FlZExHc3E2ZGJj?=
 =?utf-8?B?UCtxTGVtVkpLbDBlbFVCSm9UY0h1cWFIa3prK0NyWXM2Q2dPZDlZZDIxN1JD?=
 =?utf-8?B?L3ZFb3E2bUdkbUhVNFhPcHpRNkU5ei9HV01UTjNLZEUvN2NSR0JqVFVVS2Jq?=
 =?utf-8?B?UEFCVzZiL1FUNlZmekI3cER1L0hncS90d3ZoTjByVElQaE5qUTBrMHJwK2tU?=
 =?utf-8?B?YU9FbElTWnRBK1lCMUNOSmVRODg0VG9aOGZhbzA0RmZ2OGJPOU96TU5lN0dN?=
 =?utf-8?B?ajFTUVlmK0JtU0dGMmtlaWdVSmxaZEpGSU1qTU8wK0ZJcndUR2FYUTc3aU1v?=
 =?utf-8?B?cjlmcktva1pLbDgxSHIvOFdla0RUcWlEd3BuSGNVaFFrbkpodFpiREZXU0hF?=
 =?utf-8?B?RzJuUHlxMEVrU2pXWWNaWWJia2gza1hNWEIrZFN5VUpHUUhDQUVBRE9vY2lp?=
 =?utf-8?B?b0JKZHRpVUh2SG45eThmN2VhVy9ZaXIvdWlMc3RrVzE2MFZFSmhXcmZ3b3Ar?=
 =?utf-8?B?eFFzOElscldnVjVHQVR3anJLY0JJakx6TlE5SE5lRUhocHRGNEkzU2E5aXlq?=
 =?utf-8?B?VFdDcWpyenYxdks0dlBaTHlzSWJDQVVyOE5YRGd1VzlUK21lQnUwQWpxazFY?=
 =?utf-8?B?L1pzb3NSQW96L1d2Y0VVSlJOcHFTTGFTZlptNTdPSWp6Z1lyY3NOVzhjcUFI?=
 =?utf-8?B?NXZOWlI3RC9yNm1uNUtUU2MvTHlCMkl1Ykh6UlovVnZDVGoyRVUxbTZPd0VC?=
 =?utf-8?B?cVhMd252UWlsVlNkSTUwRlVST1A4UXNvUnlWdlduRUNIejVmRlFFQm1NZW8y?=
 =?utf-8?B?THN3bGF6bzRka2tNc3dKYXNjSjQ3eVRpZWRldXNHWERBUTIySThhTUlUcUx6?=
 =?utf-8?Q?54FBaiCFoWzLp?=
x-microsoft-antispam-prvs: <DM5PR11MB00756472E365EA99C8D455A6F07D0@DM5PR11MB0075.namprd11.prod.outlook.com>
x-forefront-prvs: 0954EE4910
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(136003)(39860400002)(376002)(396003)(199004)(189003)(53546011)(25786009)(102836004)(316002)(26005)(2906002)(105586002)(386003)(6506007)(110136005)(8936002)(52116002)(186003)(7736002)(31686004)(106356001)(76176011)(5660300002)(14454004)(6436002)(36756003)(66066001)(6486002)(2616005)(6306002)(2201001)(966005)(8676002)(71200400001)(71190400001)(476003)(53936002)(486006)(31696002)(305945005)(2501003)(256004)(14444005)(229853002)(68736007)(6512007)(99286004)(81156014)(6246003)(97736004)(6116002)(3846002)(81166006)(86362001)(11346002)(478600001)(72206003)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR11MB0075;
 H:DM5PR11MB1850.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: N58pyBurLdYgibwOUL2+z+nw7fp1UCyWC+loBEogm8qGcoGewMUBPuUv4WbdXjcOac1h8iSIZaAFpJVlwgpqUt8HX2+xAXU96bdZ4MX3Btnv2NSQEoLt3O7KfVJWRgUSgBL+nmExuH7lyFYLBiL3vxU0nNfIf/xekpQbn5RHuQkN30E3VL0FabxMjeIqCpOnGuInUG8s/M+3Yh5B7dAd6lqAysB8FSga3LGMkGY+TfHba83QOazvDmCd8Mj2VCOMrrB55uM6gz3f+akVkaxIlMAKwBNdqZfAxH4e0CCHmbTu4iIF5L33CODg3GFgkCjRGwVj4jiQME3OIfYzMPwgC6HkTf8+P3Z5kN/gYfazKCnJLKr64ztQdGshvfVnBIPgAZfUb1Om6jU9O/UowB/48m8JH2NB+9pRZaQpdNL69EE=
Content-ID: <DDE3322BD4CD994FB02BF8EA54F2D97B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f06c2109-b14c-4875-f25c-08d697720fde
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2019 20:29:04.8563 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0075
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190220_123138_405522_1670C342 
X-CRM114-Status: GOOD (  14.84  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

Hi, Robert,

On 02/14/2019 10:57 PM, Robert Marko wrote:
> Datasheet: https://www.winbond.com/resource-files/w25q16jv%20spi%20revg%2003222018%20plus.pdf
> 
> Testing done on Mikrotik Routerboard RB450Gx4 board under 4.19.19 kernel.

It is preferable to do the test on spi-nor/next
> 
> Test board does not support Dual or Quad modes.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 6e13bbd1aaa5..0e958f48db1b 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1975,6 +1975,11 @@ static const struct flash_info spi_nor_ids[] = {
>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>  	},
> +	{
> +		"w25q16jv", INFO(0xef7015, 0, 64 * 1024,  32,
> +			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)

You'll need a way to differentiate between W25Q16JV-IQ/JQ and W25Q16JV-IM/JM.

And I would prefer to have the new entries ordered alphabetically as much as
possible. This one should fit just before w25q20cl. Manufacturers are naming
flashes based on a product identification system. The flashes are presented in
alphabetical order, we should do the same.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
