Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FORGED_HOTMAIL_RCVD2,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E62CC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 15:54:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D294961B70
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 15:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D294961B70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3GEsmfr4Hmgr6GjlbCTp5BZQ7VAnU0rm6gwuGDk7LnE=; b=DiQcYXIXimvGFP
	oshrPv/FJvAReK+GvyPZQG5Ohv9Oa9VLdb+9ZnjavdbuZGb7cg0kQT8fqC7nB4HtybiXcM6NKjft3
	KkmF99eG/gAi8ojmipSjwSJxHR5I4UAxo3MWo+ZyHmz4uS4mgSZ0l3VUdY11JahxibCtVnWeIA0RW
	x2GKcctOi0DcQ+dIfjM109q7XX9f6IHrGWuskWB2lGlqMiysPX+49ULj8UhmuZoL6TBX6ivCOeeUu
	Y6wUUcQRgpCipUtJynVo8SdpkDtcNhzUORrecCnkxBTKmpisHMBW/Ximn1WTK4N2r2Lg1gZY4Bdh6
	Y+QJ7LJhpCq518xaOLEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8POD-00FEmi-EB; Tue, 27 Jul 2021 15:53:05 +0000
Received: from mail-bn7nam10olkn2089.outbound.protection.outlook.com
 ([40.92.40.89] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8POA-00FEli-1q; Tue, 27 Jul 2021 15:53:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LqVw/S/9WLKOsiZxWs1ZYvWOomNKgS8ZwwMgBbckdw9QTmAdJOnmTwDtdFlaRpus5QAplmMpieYeZ2q/J9BfnsQIxZGYOnUeNwp1yQ8daDAf8843EYutTIpzBYOrkiTwP0wNur6tfAL5IETnv+SttqPXzJHFvQBWTzXRpGUcxVRBpWKVXngKPhFuos+syuxkUVwkdIGV0jdCdGIWzpAMwiBn46318gDh6wzajRxQUyGXz0LhYv0bExfVHycfxIUKdnA05rj3OWhYNcPuVBZd/lIAnQB6EXMGGLioeoCMmVJH1pVlS2e1Z6Y/LAGn1EtDBdYIiDMKmlpMP2lcJAUqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGuGgy5VJsED06qKBdoMj+2td9Co9cu/aiQEXz+SEyM=;
 b=QiawufgZzgJZ32sOuNXpLVG7Lw8f7OXBzYzeVVGAjklc0LW55FB4qxAL9Okd/dc7hj8oAeKW5ujxO6zgCPFVyacje1Zou9TjYlh6iOawqcvKVcrqjskKK7Zc6+KlrGFGmjcwGsWQzkmOaJewokiDj0A8hM91shDkJxSgbAgAyYDEWjIQxMPfp5pjx7ldPAioGqxkyg9QndEr6/Tg54pGiUvPWhOFndcV+juU665R8iga8A3a95iz3bwfSdRsM9fqnG3O3PI6EQikicqVtoIxOTvzra28XuI4M9QrRBy/a4NNXgZR7jxz1N7C1ARki0sW8FvCZmGehrE9BSWMW9A0Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGuGgy5VJsED06qKBdoMj+2td9Co9cu/aiQEXz+SEyM=;
 b=AzjGcI25C4vkr3y3S/xUhedCmfsJj9PSzA2q7Hdb78sM6O7kAimyaEU++OmLaO/frxqLUzOYDdxgZdd9GPojK898Li4aF7XGq77ROu+msBu3w1/cK0FGnLuIMJUwJqUOd/D0H7g/Li3qdmhBxvToOrZT3qL2h+8QaadYHUlLXYl2ZC4/oRPlwPQ3BpniVhxIKRpKKpC1nw/wr5znIkax4FAdFlZfkgJV1gg1yB4wHBev38ROMJL/FKEeW0xBYD/WCg9RLO2+L/6MHaDt7BW1zjmHtHbeDVMxKxYBiKDsn9nZVt3B/+ZNF/bJD99FmxwkPcGf7mNMcx4FoHOwSm0KMw==
Received: from BN7NAM10FT050.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e8f::51) by
 BN7NAM10HT090.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e8f::190)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Tue, 27 Jul
 2021 15:52:58 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:7e8f::4a) by BN7NAM10FT050.mail.protection.outlook.com
 (2a01:111:e400:7e8f::284) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Tue, 27 Jul 2021 15:52:58 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:45F11C5524C0607ED71479DAF3AE91FF3A03C9AC7DA9091167CF11957BC4F650;
 UpperCasedChecksum:E5703FEEE07D3D127AD36076E5E87C23B4CE10061D9C1AC9FB194ACB6E931666;
 SizeAsReceived:7902; Count:46
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::e1f4:5eb1:d552:af43]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::e1f4:5eb1:d552:af43%7]) with mapi id 15.20.4352.032; Tue, 27 Jul 2021
 15:52:58 +0000
Date: Tue, 27 Jul 2021 10:52:57 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: michael@walle.cc, vigneshr@ti.com, p.yadav@ti.com, figgyc@figgyc.uk,
 mail@david-bauer.net, linux@rasmusvillemoes.dk, esben@geanix.com,
 knaerzche@gmail.com, code@reto-schneider.ch, zhengxunli@mxic.com.tw,
 jaimeliao@mxic.com.tw, heiko.thiery@gmail.com, sr@denx.de,
 miquel.raynal@bootlin.com, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 nicolas.ferre@microchip.com
Subject: Re: [PATCH v2 06/35] mtd: spi-nor: manuf-id-collisions: Add support
 for xt25f128b
Message-ID: <SN6PR06MB534253FF244275974E04E2EBA5E99@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-7-tudor.ambarus@microchip.com>
Content-Disposition: inline
In-Reply-To: <20210727045222.905056-7-tudor.ambarus@microchip.com>
X-TMN: [uihjfFp65LrFuMWk4krM4G0pCiQSVHOQ]
X-ClientProxiedBy: SA9PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:806:21::28) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210727155257.GA31417@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SA9PR13CA0023.namprd13.prod.outlook.com (2603:10b6:806:21::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.7 via Frontend Transport; Tue, 27 Jul 2021 15:52:57 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: c7fa7a04-fff3-472f-247c-08d951169ac1
X-MS-TrafficTypeDiagnostic: BN7NAM10HT090:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lCVjN4vNb8ueT9eYlDBvUIP/sQgWwtl7g/pcLC5zAc2OTBtvlARMxaQXj18oei9c8Yl2P72CD73RzytsIioaejIRaYiqsKeYcJzY7BKUyVn5vx3bdgQa9dSQrOWE/dkhZeSCDL2y7P5CkeNUC4kRD7nuFqywbwoFNboupP5j4dozUenifOXIagApiTdqb4OZnRBPIYfjD99IvBGAKV/6g5Rdsa7+yBLdxutaLmKlYrPaa48jwbk58LM2m9s/j3DGLORiuwo0STHxi739Hr1gHEbBZHQOljFEALtHFc07tBQS6jpq2mKzPv8GxFlmiLy4UlssZ4bDNm7LSaponX8bARdqQcarRCoEDuDJq0P4eW94m+WIF8lSUuMrzgMr3be7TFS/XLrulAdavJUg0EBSR0zaMKII8AP+4aX+dBHKccqsveyULA1LTgKtWZDg12RyEzcNVpla1KQztbB65WHghkdevJI4ixW3JxaTpdbM6EI=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0n6BAdvjw1g7CIioZcS3M5TtYAv5N9E2KZ4/uULOHCOX4eXqzT44UT/0faqd62+HBPQkr9aO5s3waFlZzrIHRde/mp40nSiUGgq1DVu9alBwFpIawBMddBUfcGJh/T2kwEjM7MMieXHlR6wC7+ixgQ==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fa7a04-fff3-472f-247c-08d951169ac1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 15:52:58.1462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT050.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7NAM10HT090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_085302_342673_07321BF8 
X-CRM114-Status: GOOD (  22.85  )
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

On Tue, Jul 27, 2021 at 07:51:53AM +0300, Tudor Ambarus wrote:
> Flash does not support continuation codes and may collide with a flash
> of other manufacturer, Intersil being an example .
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> 0000000 4653 5044 0100 ff01 0000 0901 0030 ff00
> 0000010 000b 0301 0060 ff00 ffff ffff ffff ffff
> 0000020 ffff ffff ffff ffff ffff ffff ffff ffff
> 0000030 20e5 fff1 ffff 07ff eb44 6b08 3b08 bb42
> 0000040 ffee ffff ffff ff00 ffff ff00 200c 520f
> 0000050 d810 ff00 ffff ffff ffff ffff ffff ffff
> 0000060 3600 2700 f99f 6477 e8d9 ffff
> 
>  drivers/mtd/spi-nor/manuf-id-collisions.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/manuf-id-collisions.c b/drivers/mtd/spi-nor/manuf-id-collisions.c
> index bf7dba34f018..db31470ebf6a 100644
> --- a/drivers/mtd/spi-nor/manuf-id-collisions.c
> +++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
> @@ -13,6 +13,10 @@ static const struct flash_info id_collision_parts[] = {
>  	{ "by25q128as", INFO(0x684018, 0, 64 * 1024, 256, SPI_NOR_SKIP_SFDP |
>  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> +
> +	/* XTX (XTX Technology Limited) */
> +	{ "xt25f128b", INFO(0x0b4018, 0, 64 * 1024, 256, SPI_NOR_PARSE_SFDP |
> +			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },

My apologies for being ignorant of this, but I'm not 100% sure of these
two values (SPI_NOR_HAS_LOCK and SPI_NOR_HAS_TB), even though I
included them in my original commit. Looking at the datasheet for this
I can see that there are 5 block protect bits (BP0 - BP4) corresponding
to status registers SR2 through SR6. Status register bits SR7 and SR8
correspond to "status register protect 0 and status register protect 1"
bits as well. The Rockchip engineer I was testing the SFC with did
not have these flags as well on their driver they were using for this
chip too. I have tested with and without, and they seem to work
regardless. Is there a way to know for sure if these should or should
not be here?

Here is a link to the datasheet I was working off of:
https://datasheet.lcsc.com/szlcsc/2005251034_XTX-XT25F128BSSIGT_C558844.pdf

When this is confirmed I'll be glad to provide my "Tested-by" line.

Thank you.

>  };
>  
>  const struct spi_nor_manufacturer spi_nor_manuf_id_collisions = {
> -- 
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
