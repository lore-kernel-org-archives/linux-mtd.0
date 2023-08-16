Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FB1C001DF
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Aug 2023 07:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SEJQI3Upt6pEkoPJBfnuYy0kbTCrhbqHBGo8p2LMZZo=; b=i8ZfnPI+TIhiH4EXIhCo8MAXIX
	vejzruuhF2qGBsBVn9ny9KXca9mp8xNbclhCLpP66BJxnmcmrcYsSLbFPZI57Xy0NJ8mfKc1YLlqy
	37VlZUcZ9HlcnaHR9Bs8TMpg33M3ay116i50AK77Gn9h6HKRe/5l544prMbkLgdKufEPcIPEwfOeX
	Stutgp/W7YDD4+vct6xYSjb7sru+QnEoLHr6Rr/IjNiWy2xYlKJD7IhFdKqXpozO8wNsIA0HSi4lc
	Yp6KeqJ8XT0t7DGeJYK+pGrolh4QtlfLczkHmJDFm80lWjlZ5wKWMzoJFh7XTJhzUKoEZjs4pUZxN
	gyXqAzfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWAqr-003Oge-2g;
	Wed, 16 Aug 2023 07:21:57 +0000
Received: from mail-db8eur05on2072f.outbound.protection.outlook.com ([2a01:111:f400:7e1a::72f] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWAqo-003Og0-0F
	for linux-mtd@lists.infradead.org;
	Wed, 16 Aug 2023 07:21:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPoautpJrAsuZEDwGtW9hW1331mqJIqTF/42tutuHfTKBKwNTW5eb3uQfSZ+zAHts8fli0kpSlVyxPpdgN0U2y3towamYJUCEaqPB3uzEPtaZSvwMuAT3wKy4rzPr7bwm75Z1m2yRACDqRya44zX05pk2reVsU18jVTnrF/BG0w71lbxkjVEg6Tn+ppG3ruMQaM4ZrxeLSOcVVpDV0xkbRVRu+WqDPugpOpbvshYuS8CqvspjElpkaSINUasDtW/FjLyGtOWSbL4WQUR8elGK1zXvsh9NvBPobYlvuFkhEsH6NqxfEJ/OCnA37EYN9ZbpFEljVyBMR31+fwdze1tEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Rv4Iw1QBspBZGKTS+Oc+qxbbovpOodND+JTHgakke0=;
 b=G8vNurQcmtmc9dofO4L0SfXj6m7B7hNHh8QfZ7Tyl89V4ODJqkMP+DtNQ7tEbcDyli+fS1+p7+DW+si1TNoB09dcTvmf3/YWa3jDBGUqSnNQEgN/vhgyuLt4w7xQLDM0p/hryJRMXo2B0Cx1/LoDN3lmOruX+Xd0DGF5XwZIsxQkRF/givTxohXokjuyK3BuoHOuR2Ob+6Oe3gJjFtDv1PrWMVEPAsy1yvRCOfRfqQjX5FGYg39rivgYlcVHz3nvz7BenMLo2ghgLOhXLG+O1Uhe7FkN5gzu2xHQ9dixtV/XQ2j2+ksGzxeaegvFYwnqNb5ADcHJkYwB1VLxf4SR8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Rv4Iw1QBspBZGKTS+Oc+qxbbovpOodND+JTHgakke0=;
 b=ot5bN2fh/jXZ5+K7a7K/sVwgK97A96VznsoCqHaNh3p3sGUk/liFcfbu5KaopyasidRyFphdW5Pt2UeXSfrEiYx8t4inPsQbiQHUSje0WWsld/v1kiuAXPVPDWUK0OKWcX/tBktSNlI4T7/p9zZ5YNxDIA4cSvfvyaQmLo1Wlrw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AM7PR10MB3810.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:14f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 07:21:43 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95ae:6cb:e93:cce0]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95ae:6cb:e93:cce0%6]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 07:21:43 +0000
Message-ID: <0f54b3dd-1fce-4f81-8652-d50fe1bb3873@kontron.de>
Date: Wed, 16 Aug 2023 09:21:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mtd: spinand: micron: correct parameters
Content-Language: en-US, de-DE
To: Martin Kurbanov <mmkurbanov@sberdevices.ru>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 kernel@sberdevices.ru
References: <20230815161024.810729-1-mmkurbanov@sberdevices.ru>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20230815161024.810729-1-mmkurbanov@sberdevices.ru>
X-ClientProxiedBy: BE1P281CA0367.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::18) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AM7PR10MB3810:EE_
X-MS-Office365-Filtering-Correlation-Id: 00fea50e-d888-4def-cb8b-08db9e2970e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ROq9YMfV+8c5ksjWUBlFewY+aq+azOU1KrLBmy4YlCOMojBvVMUoQ3RrMZAa0jQnyfbNQXvAbfyLRC+mG5n9kEaBtiMW5c8r3I9q/Lu0MgEVAjDn4qiFz6ozRYckwW9gYFJ5Iy6I2vjzfZJydIE0JsrRvyA12UtmI70eS8asPP7Mdtw4ZOIGaL+8fJfku8SyXZcORdXX5uO/Wl+igOZhJTiGvd3O8ThjF85ktg1rh1cVCi4DygUPTtAR6ouf/l8Vj7XUjLOYKpLPt11U1sNPX57OqGdQIkzRKIikKRSO3bpb+VsYmP20Lizvseu/GfS5GS23YJ0Fp9I8DFmHatmdfcKcwowQFCGfmCulvxsTuRyJ3v1G09bynZXBJtjsVJ4UHuPM4DJhQneh4QV3wTFnHMz/4jTbACM1i7LBZ0n5IByd8yRyNdjlZmW+s9unUqssT4i+NcpBh4S6eJN0c4BOWUWF5bFfXyrePiTsQnU4LhFPX7ZWqz5lmXhywehcO9OMgmFAfcnhDoLRF/3q5k7HCUbO+1KXS7D3nhcA3J71M98vHmRemr6BNiqOFfa/KA1amCV2F8Bay10CF3DiHlFC/sIjiJo6GMKPfZA6qvYZm4hGjgZeDj9PZmq/7p0+qv96qzaU73BttIWNlpJfee2Sbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39850400004)(376002)(346002)(396003)(451199024)(186009)(1800799009)(110136005)(478600001)(83380400001)(53546011)(6506007)(26005)(6666004)(6486002)(6512007)(31696002)(2616005)(86362001)(41300700001)(5660300002)(2906002)(8676002)(8936002)(44832011)(38100700002)(31686004)(66476007)(66556008)(66946007)(36756003)(4326008)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0tQSG9XTCtYNkJDbmlBV0lhMjdPaURDS2oxdFUyUDhDb2pMQ0prYUxqbVdk?=
 =?utf-8?B?bjQyNmI4Ty8zYnVmd24rS3ludkFzTDRSVmpiNG9iUmNKaVc5RnkrTTMzMFp2?=
 =?utf-8?B?QUUwbU92bXlPaUVMNnVBN1ZaYi83aGNLVUdZNFljUytKL2Y1eXc3K1ZCaldV?=
 =?utf-8?B?VnlML1lMYiszbmVrRnU1ZlBoWnBtRkxOd1Yvd0ZzY3RJOUZPUzVqUHJyK09B?=
 =?utf-8?B?OTNmOEQvenl2OGZrTzAzbHBaUG1YaHJJTmtmUXd0NzAyNGJEczBvWnE5UElw?=
 =?utf-8?B?Y1hCdkJldkg5RHRYNmFzbDZKeit1Y3JVdVhudEhMeDlFQ3R3TG1SQ2FzM0xm?=
 =?utf-8?B?bS9yNVFVM2phYlc4bWxwVkZ6dC9xUkE1Qy9PNmxBSFJidkxVSVNtR2huM2xh?=
 =?utf-8?B?TU94WTFjL2tnaCtJd245STlORnloNE02V2NaeitnR2R2ZithZ245NXVIcDZJ?=
 =?utf-8?B?TVlSamFzM2FKMXpLWVJiWTdGdHNibUk1ODE4L3JCd0k3TGlVUVlWVE5vQ2l3?=
 =?utf-8?B?RDJ2bktlWUtrUEZmSWdpR3pBKzdGYlJHRGh6SFd5ZE52MkZjaFVNY21qZitZ?=
 =?utf-8?B?Y3NEYWxlc0Y3QVJyRkFmQ0E5NUlVb0lQMWljbi80SGZHUTczTnRLNHhveXVs?=
 =?utf-8?B?Q3hORmpRckNtWGNCVmdFaGVBR3VnblBQMkdkTERTOTQ2WGlvZGlmclMrVUxs?=
 =?utf-8?B?Nk4rVHJsT25FRnRvWi9SOFAyRkVDOTZQYldOYkhOMzYvOXphalY2SmxSMzVr?=
 =?utf-8?B?K0tJd20wVXZKdnpIU0FzbDlZOVY5cDNtNU5lSHJjcXYzR09sWktvcDB3eCtS?=
 =?utf-8?B?Ri9GYkhXdCt6dVdRS3ZXZ2NXWmJSbUJ3ZGtpZU9ZanJ2bU5OYUhRZ29FaTkv?=
 =?utf-8?B?aDMvOEZmaW92WSswNVA4b1dHZjVJSTk0RThXTlVhZ25UTENTdGV3OXY4clpi?=
 =?utf-8?B?ZzVDeCs0TURiUmo2WDBkK0ozTVVac2ExWElOa21velRGaEFMTDJvaktvZ1Vm?=
 =?utf-8?B?TVVPZ01iQVViN3l0ZlZ5YVcyeDVubHZVTFNBRDNlL2hNekd0Zk9NOTROK2hP?=
 =?utf-8?B?YVQ0NEhuQU1uNWxxM0pQbDlWOEhaZk5ud3VaQm5RNHpIYTRHdmlVTUcyRVFK?=
 =?utf-8?B?RUNUVFR1OE4ra3djTnE2dnNBZTcrT2NSZGdwcmF6emRQVEJwUnFjYlAvYXdY?=
 =?utf-8?B?MmlDUGdVWVEybk1rOXNGcEMvbFQ5UGZFSCt0bVZKYllKK1Q0L1pUZjV5Z2J1?=
 =?utf-8?B?QkwrSjZ6SDRoS2FISDMvd09oZnlPbk85L2xCRlF0cGcxWFU1WVJUME5GOXYx?=
 =?utf-8?B?R3ptV1JCcDhBT2hsUWh6bnlzTlZkKzdQQ2tyUGErNU52RDM4SStDZ2kxaS82?=
 =?utf-8?B?NTZWaTQwc3YzZGFrVXY1aEFKYk5Bblp5em9ycXVueDZva25KcjF1WkZQYTlQ?=
 =?utf-8?B?c0lxUnpqWEJZOWhTb0Jma29wU2ZvQXlESnh5WUFrNU1RYVd5SVljdVJpY29p?=
 =?utf-8?B?bWkvZGpTUUs2bXNpVDdxcTVNQXdhWG16dm5lMUVHelRzQmYreEV0NllvUStk?=
 =?utf-8?B?Mk5wTHRsUkZqYWw3K0JmRk5pVnpSSThtTmg0RlNLNXQ0ZHNyTkFKOGc3K3dy?=
 =?utf-8?B?L0JzU1VYbnhoeFRzZFVTdzJiWFN2QU1VL2l0d0tyMkVUZmNSdnBGNU56ZHY1?=
 =?utf-8?B?UlV3cndaWjBySFhFOWVpcHpGUkluTVRieE8ybGw3SkM3YmhFSFF2UlJ1OEw0?=
 =?utf-8?B?RXU1SFFhM1FFNTk3ZjJSVS9KOXZReXZ4ZjBTYjVmSXY4WXEwR0RmRTZMaHov?=
 =?utf-8?B?aHFvenBqN2QzKzRrd1d4dlR4WmRQeEF4TnlkRDFXeVVpeUg2TVZqbG96cUw3?=
 =?utf-8?B?Zy9QcXlYM2NnbEJTUSs3Qk9XV1Njd01ma0hiaW42RVFqOXFlVmdrM2tQdSsw?=
 =?utf-8?B?cTVDWWVIRkM3N1dUNHd2R2FXd1E5TzdwWkY5aXJMOUdqMFdsREFXeHlrcnhn?=
 =?utf-8?B?cEtpL2RKUWRXa29IMXEwbHpjaHZVRHo0QW5lenFnQmdxRkJDTk56YUNOcmR0?=
 =?utf-8?B?N2tRYjFqZ3lycWdyU2JmUllSb2lWK2hvL1F6aXE4RmYzMHZCUUNZK2NpcWdS?=
 =?utf-8?B?ZVJxSGMzNW9zV1JHV1pYSksybXlPcnE1MEoxRkVuTm1VYUdPU3ZMSUpXaHl1?=
 =?utf-8?B?RlE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 00fea50e-d888-4def-cb8b-08db9e2970e6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 07:21:43.0068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oqur8abeQi28YGQLbV6OwAGlNcXuwjs7tUD7kJq7cQD37huflvwXz+OhmuCjIv5S4jKoZmi1inR2yNdpeKNMpmpYk68Vdo6luArPlcofX/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3810
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_002154_176594_04C3029A 
X-CRM114-Status: GOOD (  24.28  )
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

Hi Martin,

On 15.08.23 18:10, Martin Kurbanov wrote:
> This patch includes following fixes:
>   1. Correct bitmask for ecc status. Valid bitmask is 0x70 in the
>       status register.
>   2. Fix oob layout:
>         - The first 4 bytes are reserved for bad block data.
>         - Use only non-protected ECC bytes for free data:
>           OOB ECC protected Area is not used due to partial
>           programming from some filesystems (like JFFS2 with
>           cleanmarkers).

Can you please move 1. and 2. into separate patches? Maybe even
separating the OOB layout change into "fixing the offset" and "reducing
the free area size".

I'm okay with 1. and with adjusting region->offset to 4. But I don't
really get why we want to restrict the free oob data to the
non-ECC-protected area only. Is this specific to Micron? Other SPI NAND
drivers also spread the free area over both, the ECC-protected and the
non-protected bytes. Why do it differently here?

Thanks
Frieder

> 
> Signed-off-by: Martin Kurbanov <mmkurbanov@sberdevices.ru>
> ---
>  drivers/mtd/nand/spi/micron.c | 28 ++++++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
> index 50b7295bc922..897e70913ed0 100644
> --- a/drivers/mtd/nand/spi/micron.c
> +++ b/drivers/mtd/nand/spi/micron.c
> @@ -12,7 +12,7 @@
>  
>  #define SPINAND_MFR_MICRON		0x2c
>  
> -#define MICRON_STATUS_ECC_MASK		GENMASK(7, 4)
> +#define MICRON_STATUS_ECC_MASK		GENMASK(6, 4)
>  #define MICRON_STATUS_ECC_NO_BITFLIPS	(0 << 4)
>  #define MICRON_STATUS_ECC_1TO3_BITFLIPS	(1 << 4)
>  #define MICRON_STATUS_ECC_4TO6_BITFLIPS	(3 << 4)
> @@ -57,6 +57,20 @@ static SPINAND_OP_VARIANTS(x1_write_cache_variants,
>  static SPINAND_OP_VARIANTS(x1_update_cache_variants,
>  			   SPINAND_PROG_LOAD(false, 0, NULL, 0));
>  
> +/*
> + * OOB spare area map (128 and 256 bytes)
> + *
> + *           +-----+-----------------+-------------------+---------------------+
> + *           | BBM |     Non ECC     |   ECC protected   |      ECC Area       |
> + *           |     | protected Area  |       Area        |                     |
> + * ----------+-----+-----------------+-------------------+---------------------+
> + *  oobsize  | 0:3 | 4:31 (28 bytes) | 32:63 (32 bytes)  | 64:127 (64 bytes)   |
> + * 128 bytes |     |                 |                   |                     |
> + * ----------+-----+-----------------+-------------------+---------------------+
> + *  oobsize  | 0:3 | 4:63 (60 bytes) | 64:127 (64 bytes) | 127:255 (128 bytes) |
> + * 256 bytes |     |                 |                   |                     |
> + * ----------+-----+-----------------+-------------------+---------------------+
> + */
>  static int micron_8_ooblayout_ecc(struct mtd_info *mtd, int section,
>  				  struct mtd_oob_region *region)
>  {
> @@ -75,9 +89,15 @@ static int micron_8_ooblayout_free(struct mtd_info *mtd, int section,
>  	if (section)
>  		return -ERANGE;
>  
> -	/* Reserve 2 bytes for the BBM. */
> -	region->offset = 2;
> -	region->length = (mtd->oobsize / 2) - 2;
> +	/* Reserve 4 bytes for the BBM. */
> +	region->offset = 4;
> +
> +	/* The OOB Free (User) area is divided into two equal parts:
> +	 *   the first part is not protected by ECC;
> +	 *   the second part is protected by ECC.
> +	 * Use only non-protected ECC bytes.
> +	 */
> +	region->length = (mtd->oobsize / 2) / 2 - 4;
>  
>  	return 0;
>  }

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
