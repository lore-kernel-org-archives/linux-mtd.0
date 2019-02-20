Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5B2C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 20:47:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A1F82089F
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 20:47:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NqApfN/7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="tuJBJex9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A1F82089F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bjqe8dsjLJhAzZZPmg6Vy4yvH7GpxRT/0npfVW6tUOI=; b=NqApfN/7a09YFs
	08xfnGMoiFWX+CYfDIfFqqXKLFHczKw+5C4ReiH9iyHgqFTRVfyTE7H4NVNYxbwoRUusAAcPj9P7N
	wqalcVkGKD/P/SoOGCebDOjgZEzqBBWFWwBgGEp1pQvg4gHDKW2ZKl6tf8pSBlEf8PvUsel0SG2/S
	LWulO+Sapz0eVUoQtiJ93PWNzaCOEL1iQPysv88xYgm82QncZFMGAFr9MqOf6ODwZebYQ09rKNfse
	Y8THesEYKVLSuZukua9qc9s7nMZu8nIlA75KCW5lzK1RwbcFzx7MYz0IoFRvel9gsaspez6H6Xo4x
	IoNcnD82ro7VM0Zjpkjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwYmZ-0004SW-U9; Wed, 20 Feb 2019 20:47:55 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwYmW-0004Ry-Sn
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 20:47:54 +0000
X-IronPort-AV: E=Sophos;i="5.58,392,1544511600"; d="scan'208";a="27026910"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 20 Feb 2019 13:44:35 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.108) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Wed, 20 Feb 2019 13:44:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTRFXDZ58hNg53xN+EKHquT1NhOcpnclr7i/U9aK8Zs=;
 b=tuJBJex9lS6pTj2/Xpo+fqScYk4o+zAzkzBijqVP0GEfdthajMlbjG8YYw8u6WUhEl6OSpuCNFZBn4ZDLjZi/92cL8F5ECyd6xdN6pPuHiUqtB++1mfI5pCfCuOX30rFiKT83phYVM8MebI5gHQg1FlgamXkHN3w4WR6K1R9p2E=
Received: from DM5PR11MB1850.namprd11.prod.outlook.com (10.175.92.17) by
 DM5PR11MB2057.namprd11.prod.outlook.com (10.168.107.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.15; Wed, 20 Feb 2019 20:44:33 +0000
Received: from DM5PR11MB1850.namprd11.prod.outlook.com
 ([fe80::4125:8d55:234b:a4a1]) by DM5PR11MB1850.namprd11.prod.outlook.com
 ([fe80::4125:8d55:234b:a4a1%11]) with mapi id 15.20.1622.018; Wed, 20 Feb
 2019 20:44:33 +0000
From: <Tudor.Ambarus@microchip.com>
To: <frieder.schrempf@kontron.de>, <marek.vasut@gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: Add support for EN25Q80A
Thread-Topic: [PATCH v2 1/2] mtd: spi-nor: Add support for EN25Q80A
Thread-Index: AQHUx4IiJS154BEowUOup13mq/gQ7qXpKxqA
Date: Wed, 20 Feb 2019 20:44:32 +0000
Message-ID: <137c7e1a-0cd5-269b-1854-ce8666d7dc50@microchip.com>
References: <20190218120421.5034-1-frieder.schrempf@kontron.de>
In-Reply-To: <20190218120421.5034-1-frieder.schrempf@kontron.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0901CA0101.eurprd09.prod.outlook.com
 (2603:10a6:800:7e::27) To DM5PR11MB1850.namprd11.prod.outlook.com
 (2603:10b6:3:114::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.127.52.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 103539de-f60f-4805-3553-08d6977437aa
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:DM5PR11MB2057; 
x-ms-traffictypediagnostic: DM5PR11MB2057:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtETTVQUjExTUIyMDU3OzIzOnlyQW5EUSs3elJWcjduSkRkU1lXUVlRd2NF?=
 =?utf-8?B?eVhQZy9JdFJ4UFBuejZreXNocXlyV2tLUXBJRWRSYWlhNWZvenJjRERwZUV3?=
 =?utf-8?B?clZ2QlNXWWh0MGNHWFoveDF6MWVzN2lRaVpZMjZNYjlrQ3FRTmpYdk8xVEZ5?=
 =?utf-8?B?TnBuMHE3Um9BcU92NmdGdzV0M083dmh1Y1JjckVVM0thY3lTUVA5emQ5VTlz?=
 =?utf-8?B?L21SaXdsVDNZa2pqV29Lc3lhYWVpTmw5eTEwblQ5WEtmTTZzMzVsVmpVSzJS?=
 =?utf-8?B?d0FiNzZtNHNuVEJZamRLR0R3cGRONnlrcCt1SS9WRFQ2ZWlPdGZSbkZnVzFP?=
 =?utf-8?B?SFZEY29rMXQ3bExwUjg1cUJrTHlNRGNzVEhLMmYxb3RyN01WZ0JXcEZxZ3Q4?=
 =?utf-8?B?MHZPY1cvdXRuK0Q2WG1lbDhLWVhyS3BHZGZJTVlNTlprK05BeUprOEdHSGdj?=
 =?utf-8?B?WHhxSi9BaFNaQi9UTEMyWk9NaDR4aDQxQ1hJZ3dSSzNmZ0NpejZDUUFqbVZQ?=
 =?utf-8?B?enk2dkdIejF6WHNFQ2Y4TTVjc0NzWC9HbW13ZXhFd3B4U1ZiZ3JLZkRKTVN4?=
 =?utf-8?B?cGNlU2VvRGpSVVlJR1hqTEN5T0crZWhydXNZMzh1dFNqVHA1NU1hZVFaMjNX?=
 =?utf-8?B?cHVUK3I0YUVkK1ZTYko4bG4vbVJnd3M3UTZYY1pibUd1bVUzQzdvaG9BQklM?=
 =?utf-8?B?MHd0NzRvUEtoUENDcE9YMVJCTzF2Y1NZODJhdVkrY2Rkb29ZSzBPOXpWNmpp?=
 =?utf-8?B?YjVnTUdrZzFmTnNPWUF6a1hNckszNC9ZcjBSRXJyVnU1V2M1VHVneGR3MzdB?=
 =?utf-8?B?WFAzM1VobUMrdlhHdzVxeGtmRllxWUFqTzBJMnR2c0IrVjhkS1BPeVQzZy9W?=
 =?utf-8?B?YmQrZnZnOVRKckJhV1FQbm8vU1VrdENvSVh0Q1FUZzdlVnNTZjNCVmtHbzRp?=
 =?utf-8?B?Q3ZIU1k5c0Fwd2VOYXFuRFAvRUIwWml1d3BXb3NJdEdsTEFLRmEybVh3TmpK?=
 =?utf-8?B?Vk5lK0hwMTdrMElWKzJ6SHhrczNybjZEVGlzeFFoYURZcEZFRnRMTk51WFpq?=
 =?utf-8?B?OGhmRnMzREJmWTZaL2Q4NzJKWGdxSERlWEQvZ09qZmpDamt5M1lUMGhpNURi?=
 =?utf-8?B?cU0xanBMY1RBNE9SdWhMS1I4RFJMR01ZRlNDNDJmY3UxUER2Q2pzNWRDa3J4?=
 =?utf-8?B?MHNJR1phZG1qL3kvcGpMNERvUW5MMk5BZ1hLLzFhdVVzM2xzUXBWYzBBSGZM?=
 =?utf-8?B?UXF2TVFqVW5uWDZjVGRFdTcrRVlIcFlZQjQ4WXVOR1Eya1BIZWE1MjZZRjJo?=
 =?utf-8?B?VFE4NGRWd2YyVnB4SkpPR3crRjlWYjA4NC91dnlKcE91VGIxd1ZvMWExYnFu?=
 =?utf-8?B?MEhvaXk3YS9OTldtRWZ1TlEwWm5VeDlDTlhNcVB0cytEZGlqVUV3UG1pcVRs?=
 =?utf-8?B?RzA5cDRTOEVrUzFpZjNWTmRIc3RjbDZoTmxxVk5RMHdOOTZDazB1WkI4Wngy?=
 =?utf-8?B?VU5QZG91SDFHTHppdFIxL05ONUZjVDZzZVhDbnV3aU1kREdFTEpqdkh6Vjdm?=
 =?utf-8?B?NWVDaUFVVkl4d0pCcEVtSFY2TFIvdTZyN3p5dElkdDZSQlRZaDljN3Y5bDgr?=
 =?utf-8?B?Ym1PaHAzUThuaG9FeGR6bEJvdElaY295aXFYbnJ5dDdrVG0wWTFEYk5WQ1h0?=
 =?utf-8?B?SGF4QldKYnlUbzdWODc0U29Mb24wRVM2UGVhYzU3UUkrdGNZQ1A3STlnbm1U?=
 =?utf-8?Q?T7nvmUiqodK9P2TyXDTiAzjbv6ZpJHCNTR/2U=3D?=
x-microsoft-antispam-prvs: <DM5PR11MB2057A07B30C681C8ABB2F794F07D0@DM5PR11MB2057.namprd11.prod.outlook.com>
x-forefront-prvs: 0954EE4910
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(396003)(376002)(346002)(366004)(199004)(189003)(31686004)(476003)(66066001)(106356001)(53546011)(14454004)(52116002)(2906002)(11346002)(229853002)(105586002)(186003)(86362001)(446003)(5660300002)(2616005)(6486002)(26005)(6436002)(4326008)(25786009)(31696002)(81156014)(81166006)(8676002)(102836004)(71190400001)(486006)(71200400001)(110136005)(99286004)(68736007)(54906003)(97736004)(386003)(7736002)(6506007)(36756003)(3846002)(8936002)(14444005)(256004)(316002)(478600001)(76176011)(6116002)(6246003)(72206003)(6512007)(305945005)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR11MB2057;
 H:DM5PR11MB1850.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: O6wmkWwjOy3klhUIGgQFuzmTrM4jpLfa5Fs4AsjNHokDa/sgLwBN0pnoKmcMtHFYii0uaFlQI8PGeQyfLJu8bURQxPVVHne+9xZn/i6AJECCVECElL0WTSD0YPQi4NTuGM0+Hm74lYUxixwPu38OwEVjCg9GTsB7pIDNsyzQBuPRjyX6wZkamGIGawEmZDVktDhNh9TOODdP5KyLr0V/MUBW5Mp8g0uGjWVKSQEiQKLolmRn0/Oi02eXGJX6fj/ZpiR+HjJbJ93tGBikbOqw7zZY6pwSAlbbJu2gWy9y0mEM5ZzeYo84XSkD+COuEY3kyLME9i/FcFV2zjwqx/yjxwwY49HLmgw/nFV0tGbP7POGqxFbFRNIhhZSMIZBwK+x4gqlTpyqsdoKTKo8TZrTQbawjUtv/Q9uD/BwL9y7JLI=
Content-ID: <A23BA13920729C4495306135C4FD6B45@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 103539de-f60f-4805-3553-08d6977437aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2019 20:44:30.8411 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2057
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190220_124753_049061_B16EFF45 
X-CRM114-Status: GOOD (  16.27  )
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
Cc: bbrezillon@kernel.org, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 02/18/2019 02:04 PM, Schrempf Frieder wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> This adds support for the EON EN25Q80A, a 8Mb SPI NOR chip.
> It is used on i.MX6 boards by Kontron Electronics GmbH
> (N60xx, N61xx).
> It was only tested with a single data line connected, by writing and
> reading random data with dd.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
> Changes in v2:
> ==============
> * Add information about boards using the chip and testing to the commit
>   message
> * Remove SPI_NOR_QUAD_READ as the chip does not support 1_1_4 read
>   command (0x6b)
> * Move the entry after en25q64 for alphabetical order
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 6e13bbd1aaa5..7d7436facc57 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1740,6 +1740,8 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "en25q32b",   INFO(0x1c3016, 0, 64 * 1024,   64, 0) },
>  	{ "en25p64",    INFO(0x1c2017, 0, 64 * 1024,  128, 0) },
>  	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
> +	{ "en25q80a",   INFO(0x1c3014, 0, 64 * 1024,   16,
> +			SECT_4K | SPI_NOR_DUAL_READ) },
>  	{ "en25qh32",   INFO(0x1c7016, 0, 64 * 1024,   64, 0) },
>  	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256, 0) },
>  	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512, 0) },
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
