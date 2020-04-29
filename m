Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2DFC83007
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 07:52:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50A682076B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 07:52:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OQin/eK3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="CAX1NXVR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50A682076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cZJAALjpr573S635RvDGqiE+a2kbSVzwyysHqaPoOiY=; b=OQin/eK37gTbInn2bErrNRXsAT
	SJeeFJQa/AwukRtkumPPy17AaTLeBTI+M//L82IP8dsF/WL4NDRCENCK7hROgw3H5DdPRcYdGuFJJ
	BnMn9dKwxegUURiZrR+OtTyU7IEiq1hZQnwhCkJssDVWyYg9EAfXiEmg1aTyGbz0IEW+VC50M5Fmz
	zrVYC10XYMHvWn+kYcw+LwrENKa47RjSbZsI2DodTHowN9VsdJVzGjV8vJZU7ozyesbhtiR9DWcts
	tWsT9jO5q1AzRiEd9tqQf5WOciJ8nAyzdsJlzcNLd26fq8uhwvk8Zb91TgN9TpAQKtfkYcUwQC7FF
	Bil6BDow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jThVP-0002HU-Be; Wed, 29 Apr 2020 07:51:43 +0000
Received: from mail-eopbgr80105.outbound.protection.outlook.com
 ([40.107.8.105] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jThVM-0002F7-9W
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 07:51:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KapuTJK7hmyxhvCl6x7OGqiScz9luy5Mc1kT6vHPbmSaU0JOZzSxMKNkIfqF88eJwiiTcxbqXjUh3bQcYEa/oDYWzBnroz+ZalcbhsJTfWB9f7VuoNCPrOQruKfLv6Y/4iXRGsg9yMK24jLQ3XYT5FeuPC9ih5JiWgeX3oQLCRt8kZAzAmFKuOWj8fv69/akxuTnL4spSxdpNNMQSjFBzZ2IwmNquLc/wzLZzH9PBKSvdJ/hzVlZs13Qnc6GvcF0ixxr6Gr6cFqY6IvcsK4C7INk636Jgh/3eKfPDjSN5JyBQQ/68r2LgaLr4yH8IIbOLFmz2KdyrQ/dHiSgeSbPSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBG6kFaXf2P2Ha/LR0/H1UWzgoJQAEtUja1RsoaLd0Y=;
 b=J/23V1bB2jM8n2YJaZJSHrOmgOzKdQQ47qIuAi5mC/yQJKmvlFF5ig+qYO/jHhKoWkblUueW7bZGrL0gjEaRc6PmGHerB7MuVsaXfKqfVAaYn9M1Xg6iqJBtepoC3pvfzFDnAMWy99IAkKNAw4jkHF5OknqqfEnbbzpNWwS8ctRMROCKgnjzcBbb/Asf+TCCzSbAfBetdsMFYqFZhcvcNLWNkUDMYqgUPqu/9iTZuxMrK4JNxA5VVuw6p3V6hz3jOGgxkEFBjt6ZpAs+Le2p3GyyBgISXLHWyBwhNB5P3CYQyMQcRtU289whpH4VM77je9DO/NRL2DVmsxttUaYKBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBG6kFaXf2P2Ha/LR0/H1UWzgoJQAEtUja1RsoaLd0Y=;
 b=CAX1NXVRMNaX2qfk6/MSGVjZYoQtPlLztR4XlVK51pJju2xcnpYkU0wlTCOV61LpTUZfwqOHc5G6IILd0xnL9T9g3/OzYWsJBofDtsY41jcmqMUmwqDJ1QgJU8DDMQTMg9896gbLV2Pw5ZgL+Q9lqeKKIh88fsYpQwEw9uN5Vpg=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nokia.com;
Received: from AM0PR07MB3937.eurprd07.prod.outlook.com (2603:10a6:208:4c::20)
 by AM0PR07MB4755.eurprd07.prod.outlook.com (2603:10a6:208:7b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.9; Wed, 29 Apr
 2020 07:51:32 +0000
Received: from AM0PR07MB3937.eurprd07.prod.outlook.com
 ([fe80::6958:35d6:fc84:49db]) by AM0PR07MB3937.eurprd07.prod.outlook.com
 ([fe80::6958:35d6:fc84:49db%7]) with mapi id 15.20.2958.014; Wed, 29 Apr 2020
 07:51:32 +0000
Subject: Re: [PATCH] mtd: spi-nor: spansion: Differentiate between s25fl256s
 and s25fs256s
To: Tudor.Ambarus@microchip.com, vigneshr@ti.com, linux-mtd@lists.infradead.org
References: <20200429071058.34385-1-tudor.ambarus@microchip.com>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <a7e63f0a-f440-38f6-22ff-2928030181ae@nokia.com>
Date: Wed, 29 Apr 2020 09:51:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
In-Reply-To: <20200429071058.34385-1-tudor.ambarus@microchip.com>
Content-Language: en-US
X-ClientProxiedBy: HE1PR05CA0244.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::20) To AM0PR07MB3937.eurprd07.prod.outlook.com
 (2603:10a6:208:4c::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.167) by
 HE1PR05CA0244.eurprd05.prod.outlook.com (2603:10a6:3:fb::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.19 via Frontend Transport; Wed, 29 Apr 2020 07:51:28 +0000
X-Originating-IP: [131.228.32.167]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c222bcf7-12a8-486f-6b0a-08d7ec1221e7
X-MS-TrafficTypeDiagnostic: AM0PR07MB4755:
X-Microsoft-Antispam-PRVS: <AM0PR07MB4755EA4979CBB990F819B43E88AD0@AM0PR07MB4755.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03883BD916
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6bG5QTZS33b8rhCsDgFVctvsGNGxUNFNib6n1aRx5TDENz1tSfPvsxL3PxQ0Rw159mfTGs53n8A18SjJzlB7Xmgwcsf1CKHrHeEu2VTriAA9NNgO7CkV9sIrQ+pdOeDDhXQ1iGMKzvyWreM8QdXLdil0ucrAyRmdorC1vEE5fThO8o7i8dsYL2CVho4OOJ/DRh+VDhuvnH/T8ziJYlDxdYSw0QBVIsj66K61mQ7jQjJFn4txe+rUu8hQz8t3LZvaEgD119RJd05y/fMZe1OMChG2Kig34jq1bfUvijzteL/svfskPX5ab9QHoO0VHu1RcQAylvbJxbUyTpH8LAOjnOS6ssGgFRZn/G7Se/iK3bAi1NMMnLN3duARBQ9azAWTVESz5mlz2NHL0cTuFkjpoCe7DdzFCSxqT4WKAF9A0HKnx26YrfmQdLPhaUJafjnQ4PGXuQFXogo6Xl1eYfUI9A7ldVQrRT7Nd9P6EZwnSN+5g9zDucXRwwE08b9m/zNw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR07MB3937.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(8936002)(53546011)(6506007)(2616005)(956004)(52116002)(31686004)(8676002)(316002)(16526019)(2906002)(186003)(5660300002)(44832011)(26005)(6666004)(36756003)(6486002)(6512007)(66946007)(66556008)(478600001)(86362001)(66476007)(31696002)(138113003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: jHwnfF29mz7LT8H0PogejsBkOz5VF6p3XA/nP64UihLT4TBrS7VDS/SXCVnAiWaF1bvgw9ayrVqEi+3mVnFpEk7YURePJFzaIdrM01ZleDUEKOJxln7o3wdWsUe7AOClWaURK5F5/ppKxh8UPjQ9wd3j5QnI+EEL2MBU2Tz8wcO7lz9ixqXxV6QO9cbOcN50/DasqRsNudJU8cg+GB4+3Jm/ob4MBHFrbPxx25Qhrcv3JJzZ7xS68FZz2OM8HzM5W9Pf70hLfXksmAG6spXnxU0IINdcjROBNMlJoY6nDonFIcEtPbSlHhO9fDqXm/if7p/7LswZtgsmH7iW7VAeyU9YJqLoCZBeMDlj+Fc1RDNTfjkYn50a9IFXUtOqA5u3j35vMrnoifO5iTvgFKeR7haoLJIseIpkrFdQbLSssxH4OsQD2S0/Th9Mqpa8MFVckXHhv/OSn8Lj8Bek+DVTimMp065S93BoXAGoblviJ9e8ZwvpS0roluqdtq9L8M+lIyROZ+SYXvYKe16EXuf2RKneIckFDGdilBGfoWhn2rQW01lxvsfMEbgQ8Nvh47lvtTqM2SiNbk2nH7Z9lB8z6T+jG9csMLm8jViOkVFVB+UwwfIFYlLvLXR7XpLXePF8TctjZU9djIXohcGXavgHl0TDfcLZLPfFYPmN//l9pbpIsLwbe30W7DMUWWTxIoSM5vxGZRGux+YYmQFk0B1up7XVvEMRg/NIYcp4UaxpJabM/3NqWKkoFh/3omCIreAGozCTS67FULPp1yJbAgfM7Pi3/CBrsULASv2jw4GXzMU=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c222bcf7-12a8-486f-6b0a-08d7ec1221e7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2020 07:51:31.9624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1dUcs/ZWm51GZ+KSmSMDu6MgXPLnb/wGhaD8cp9i6TWp81yQjliP1hGveXPAH4ojtlZ43U+IIOxEDWog5tbqMtzdR0l8nPZDO00hRQd9lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB4755
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_005140_398843_8030A806 
X-CRM114-Status: GOOD (  13.58  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Hi!

On 29/04/2020 09:11, Tudor.Ambarus@microchip.com wrote:
> s25fs256s was identified as s25fl256s. Differentiate between them by
> the Family ID using the INFO6 macro.
> 
> Fixes: b199489d37b2 ("mtd: spi-nor: add the framework for SPI NOR")

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spansion.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 88183eba8ac1..a68975eb5303 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -22,15 +22,21 @@ static const struct flash_info spansion_parts[] = {
>  	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256,
>  			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			      USE_CLSR) },
> -	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128,
> -			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -			     USE_CLSR) },
> -	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512,
> -			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -			     USE_CLSR) },
> +	{ "s25fl256s0", INFO6(0x010219, 0x4d0080, 256 * 1024, 128,
> +			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			      USE_CLSR) },
> +	{ "s25fl256s1", INFO6(0x010219, 0x4d0180, 64 * 1024, 512,
> +			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			      USE_CLSR) },
>  	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
>  			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			      SPI_NOR_HAS_LOCK | USE_CLSR) },
> +	{ "s25fs256s0", INFO6(0x010219, 0x4d0081, 256 * 1024, 128,
> +			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			      USE_CLSR) },
> +	{ "s25fs256s1", INFO6(0x010219, 0x4d0181, 64 * 1024, 512,
> +			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			      USE_CLSR) },
>  	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256,
>  			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			      USE_CLSR) },

-- 
Best regards,
Alexander Sverdlin.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
