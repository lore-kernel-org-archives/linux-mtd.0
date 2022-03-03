Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8B7C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Mar 2022 21:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDOhL9YM+KLPggSoLMJOJ7Ow2ObQ70vGwWlqVPRNIQg=; b=B9gAurfvVM7M2Z
	sz0+XU+2zdpdKDHGqPwxIn7bHmsGeSSSYduVWfbI4ZFn+ciV21bg4uXOb/2PljqeodxnWxMIlnwMi
	idD4KqPg9ReIqu/WYvlFBz4L54qiwdVBUxxIcg/BwdNvMdmI7y7eO+uUjUwyqYPejW88uISiNrTKd
	kLcpu00ScWjZdpsWFyZK8/1hPnm8n1IGQ25K/f9NQ6y8v3gqm7VRdUcoDgbZQpEIh0EZNnieK1Yd9
	zSfVVFavuLaJHLC0UwDh9SKf5JrpZ402QDb3WkWvAGI/7UzqGp+Re4o30pg9xSnfCnelQwkSycu3H
	R21f52JGBp5Bzx2tivsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPssA-007naU-O3; Thu, 03 Mar 2022 21:20:30 +0000
Received: from mail-mw2nam10olkn2081d.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::81d]
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPss8-007na4-3k; Thu, 03 Mar 2022 21:20:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZN4yqQkk/zOByekw22rXwglss+xgZ2br7yEjVh3giGV7wNNpuqyEZ6xbiRJsSiQv8MdEJioZm+N5JvXuey50n/RjB71R3pdlAsApO1Ni46adbCYf7DnDSI4jwGCCUGCMvc5idNp+R7NCdeLPMRjY1hil5/nf3M8iaUTQWaSNM/L09cOueiyYtwCzWSZAu6mAklTQgfA/F1B5E1Op49bDetX16e5rvQxOkmt1BYJRO1CSXIDYcqbzVtoVwT1TW95ToMQsnXfaB4I3u4xic3mZ2L0pwB02oRxPC9cNVF0pF/DOlsgFJVNsbQB90HfooHpBWYDbg+cZpRVY1slRdbkLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdm51Bgigst6fi1icmZ+BcqRwi0T9VfJFhrPbkup/3U=;
 b=d8smpX8KK0lqdr50lZ2VJSR1UOIhGa+v982cewnEFUIwTLA5xxs4FiWpbASA370eA3RBFY8ToOVLQ1VFmQQLQyPMn/v4xOKMmnqyfdcBE4jBfyP6ZtuB/rs7BCD7BnVSyBDOUlTv+KBt+foOJPWV1csRwxzSID0LSKihWt0sCyTpPq2l4YvnwgReggPlnt52Sqn78d8OjYRQzV+QSbkfqBKq7+ycAfoHJmQp7+oP77Yl0N/UrtRc0nNP+JcwxWK01HXOFxkdfyCuthRjU0f9fSuvx0hXEtqNGoqHPyGljV7TSUmk0awt8OmB11M7GgsrMsmRgR/XdP99ZH9hq/rX4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdm51Bgigst6fi1icmZ+BcqRwi0T9VfJFhrPbkup/3U=;
 b=Td6itxWejCblvhGk52TewVlIQxbyljRe2WYrjVT/UZLNp6gZ3nngMie72t5cpGh4NrCOG2Ts9XQ55hiS4HQoIdhpiNTIkILen/sRXI8puZXr9+oXjZxxmw0+C7WWgaLcLH/8yHZap/Si2XwWIgA+I68F/Md3jtfjRpA3ndpgkjISjDuWy0GUzkxJcLm/IinGZ6dNwv4Rua+EdvRm0hn8ZFP6pl/jsPPyx75zE0RZH9mP0gcJroKVK8XRalwAHtZMyDaujdcZ3lTdxHusfAyb/XdlX4vLPPG4dZeE7lxSdV6B4AStxqir5np9CsPaNZom1rjk4eIeGuZUciyRiT0teA==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by MW4PR06MB8923.namprd06.prod.outlook.com (2603:10b6:303:1ba::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 3 Mar
 2022 21:05:00 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc4d:1caf:5746:df98]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc4d:1caf:5746:df98%6]) with mapi id 15.20.5017.027; Thu, 3 Mar 2022
 21:05:00 +0000
Date: Thu, 3 Mar 2022 15:04:58 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v4 6/6] mtd: spi-nor: manuf-id-collisions: Add support
 for xt25f128b
Message-ID: <SN6PR06MB53428C8EB83C2DAFACFDBE70A5049@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-7-tudor.ambarus@microchip.com>
 <1a05176e6e2457c1b86035522c3f691b@walle.cc>
Content-Disposition: inline
In-Reply-To: <1a05176e6e2457c1b86035522c3f691b@walle.cc>
X-TMN: [v7QFbws67XtCW/Jzrr9KHe1PY+KICYGK]
X-ClientProxiedBy: SA0PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:806:130::20) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20220303210458.GA5071@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad73c0a1-d99c-464e-6b4a-08d9fd597a57
X-MS-TrafficTypeDiagnostic: MW4PR06MB8923:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DBGJh74CjePG/pyYtYgAul0RbBTo5YM+7OxgSsC50BvOFk6nrtD7/rm/BHVU13WEcBafhANyJtRnBWZ8uvi8skB9UF3zodSyySfaZHGme90s7JUrvXm/WbfR+NwiDP18TCw8jpNNLaH8r0ZeHX41GJlZ1bjfDCOjqN5EnewD8Mv0hP7o92ISv1QPXGacBrfoPi0tGK9djlaDK7tacBsfyNMkrQuLGYuD3amGX8vgSx/tzcUpwWaRXrXSy3OF7Y/3U+kkdegkwib/sd8U6A6l4bMrIcGWUp7y1FLs3lURv1xdz+DY2nN6LLGMTiTa0a/vsnXhiZd8bwxaoMZvQDFKA/QPUqd3Klh4glUHuKXuMSxNwNJquypqkVRumJb4gDT5qlakCF61gXAn7kmsZxKa+fmKeMBluWqZFdemfznabCCVMvny73C7MVZruhCKPauOa98aHRhtzl+P7w8HeNJCTL0KQWHb1SVQL1Hjy8YMp1MKDz2ES/Fbrf1rSnyEq/pm9pyPYCbjOmfG/DY+HQ5eW7U4WZUYiBfIpmOXpnQMRdukEZxpsxo6wui+GpiOYJSfaqL5dxWq8I2yEnFcpvLgsw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Eriyv5hJw5gI+kzsjfR2oMEXxtj5y0jKoepUmnbcF8xA6I9hKYKIBkdCU46G?=
 =?us-ascii?Q?3XCDEbL/aqXO7olxYOxK8qTJFQggb4QHvsQBYJUkWIk0OVQJpuGXI2E/YheL?=
 =?us-ascii?Q?ovOlhytgEVNt6q3bfZKoAsQXBY60K+r17i5IHkFe0//BNRZlWhY0KYt+fHqZ?=
 =?us-ascii?Q?SfyU3DlCroflIBsNC76FtJVqxGCeSaPNXTaAnha333To4Kd2dst/0g8yfnbQ?=
 =?us-ascii?Q?wkkgSleRCKJFlzJbeFmhTOforkGbbuVlx+1rlD11SEXtx7OwTRQ2cRvyB+Dh?=
 =?us-ascii?Q?ydEThjmO6NUKM1VSrN8G2U6AaZNgBsRMqJKvTiDAGBMsDD0oSpfB82swvikn?=
 =?us-ascii?Q?USOvEDNa9Qa+cb7z40lRCv9EWbW1c6HQXss3r3aWl5IqjivSAQmQWq3/NK5q?=
 =?us-ascii?Q?8YE7ZB2Zccsuj/BvR7QqBQJuQZqMDizZ/H5UaRkV9hKD6O2QvJW8mq8n2xyc?=
 =?us-ascii?Q?ToehaX1kQn1I8r/lySC2fMGzFz3xiBi4T775dUUh4/ywCiiDG31qnihoiy8b?=
 =?us-ascii?Q?pUEeoPbwJwH73nXKk5wsYgCGlsRgeVnYcaMUaQhy0JORzHvWH7C10kGjVhXO?=
 =?us-ascii?Q?Cq4IxdQJTTQG9pjcK82c8Ydl6c03dKNieYFuVcdxgZozqYNPUWBRO2UPrN6m?=
 =?us-ascii?Q?N7AAeYUbDyXo1yvgqxgFdtbNwBrNP4pNJU1uw9jM7dUa4waFWSWgGb8/uUku?=
 =?us-ascii?Q?R24eO7HvJ5NytOZ70G1/2Bjg7HjpInsICDXTZ4+YACp+r5wUhlKLTx/o0HyL?=
 =?us-ascii?Q?J8agXgOaYNAdIg8/878tUGdvo8oOWC/gsZ5rJCbFDalBm04+zwqS4OMJ69m1?=
 =?us-ascii?Q?B6bEVZVG70KNz/XjmkEFSi3TI2biZ3vNcM3FZZXE++SVIPxhwbUd7V1YVfOV?=
 =?us-ascii?Q?90fU2ljp2bVAgHQppqA8WNoF2fjNDVBbs6a/Kp81cB9Unqs76sJcLptTDy8O?=
 =?us-ascii?Q?ixMWwPwT9vfbo3pll61BQw=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ad73c0a1-d99c-464e-6b4a-08d9fd597a57
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 21:05:00.3288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR06MB8923
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_132028_176558_4D5AC381 
X-CRM114-Status: GOOD (  21.39  )
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
Cc: vigneshr@ti.com, Tudor Ambarus <tudor.ambarus@microchip.com>,
 jaimeliao@mxic.com.tw, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Mar 01, 2022 at 11:23:24PM +0100, Michael Walle wrote:
> Am 2022-02-28 14:45, schrieb Tudor Ambarus:
> > Flash does not support continuation codes and may collide with a flash
> > of other manufacturer, Intersil being an example. Add support for
> > xt25f128b.
> > 
> > Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> > ---
> > 0000000 4653 5044 0100 ff01 0000 0901 0030 ff00
> > 0000010 000b 0301 0060 ff00 ffff ffff ffff ffff
> > 0000020 ffff ffff ffff ffff ffff ffff ffff ffff
> > 0000030 20e5 fff1 ffff 07ff eb44 6b08 3b08 bb42
> > 0000040 ffee ffff ffff ff00 ffff ff00 200c 520f
> > 0000050 d810 ff00 ffff ffff ffff ffff ffff ffff
> > 0000060 3600 2700 f99f 6477 e8d9 ffff
> 
> You don't have this flash no? because the md5sum is
> missing.

I have this flash, what do you need from me?

I haven't had a chance to test this just yet, but I'm about to. I'll
report back with my status.

Chris

> 
> > 
> >  drivers/mtd/spi-nor/manuf-id-collisions.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/manuf-id-collisions.c
> > b/drivers/mtd/spi-nor/manuf-id-collisions.c
> > index 75c5ad6480ee..0447e245f4b1 100644
> > --- a/drivers/mtd/spi-nor/manuf-id-collisions.c
> > +++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
> > @@ -17,6 +17,15 @@ static const struct spi_nor_fixups boya_nor_fixups =
> > {
> >  	.late_init = boya_nor_late_init,
> >  };
> > 
> > +static void xtx_nor_late_init(struct spi_nor *nor)
> > +{
> > +	nor->manufacturer_name = "xtx";
> > +}
> > +
> > +static const struct spi_nor_fixups xtx_nor_fixups = {
> > +	.late_init = xtx_nor_late_init,
> > +};
> > +
> >  static const struct flash_info id_collision_parts[] = {
> >  	/* Boya */
> >  	{ "by25q128as", INFO(0x684018, 0, 64 * 1024, 256)
> > @@ -24,6 +33,11 @@ static const struct flash_info id_collision_parts[] =
> > {
> >  		NO_SFDP_FLAGS(SPI_NOR_SKIP_SFDP | SECT_4K | SPI_NOR_DUAL_READ |
> >  			      SPI_NOR_QUAD_READ)
> >  		.fixups = &boya_nor_fixups },
> > +
> > +	/* XTX (XTX Technology Limited) */
> > +	{ "xt25f128b", INFO(0x0b4018, 0, 64 * 1024, 256)
> > +		PARSE_SFDP
> > +		.fixups = &xtx_nor_fixups },
> 
> I'd suggest to order the entries by the id to make it
> easier to spot collisions.
> 
> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
