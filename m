Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE36C00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:30:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 135B62242F
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:30:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AADIVjIZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="WDSbdGUH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 135B62242F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ucp3TdR/8OFhTCN4w1gfx8A/HhSRNk+A4BVknAU4A/Q=; b=AADIVjIZvcz8hOQ2UZ3ioC10f
	F6aRoSkQT8EvteLm1apyzNPxrJMn7iJ1wlOKOsW/13kH5q0mKz3sMOajDg7zcCjS4sEB487W2qGGM
	HB0Q7En55yApiB+hhTSL79uVoYTFKXcs6kdcl8ZYAXZMBKhwP9FVNbaD1IcdVfGmLXLaVw5zEH/fx
	SGozvAdOaqjkNR5Xq++beL4/AVG+I5OTeq5K6+Xg53qxYf3ii8UW2m0B8FPekRVu89vt/Yc8ewNA2
	rwAZedEZdOywCghWE7yshGc+bJo2oRKSQVNAJL6V5T1jCFp9yGSXPsg8huVVRhpMdGrXT58m1O4CM
	U86+BVSrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYy0-0007Dw-4h; Mon, 02 Nov 2020 12:29:44 +0000
Received: from mail-am6eur05on2124.outbound.protection.outlook.com
 ([40.107.22.124] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYxx-0007D0-6K
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 12:29:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAeMUMJELGVt/m0puaa0PwHN0w+eKg4lUqGnVAxB5Lax19POKXoiAUoUKFHxVtajqXtr1KXcPRnzgN0XFGJ/E0/t90KWLcYJlzGBvs1Wkt14COcETgZ5K6CRIUDbpztKqUKQSyTRQ43rrTyF4z7zxiUC91wZRxQma9Qk4IcMr06MAfaxelKTOoInSeaIyWzPJOz8Tj+sEGFg+4Vy26n9MPcmVT+WZ4gCFRjMFD7uAxpYKrrVFi4GJZphWmAtvEvOUwIkg1K+MIEJ45tv/y5HJsTgYDXtUwCwUnKNIjWOKDNOX5K/c+4Pex/IhAjsRurYZJmZkEeBGM4aK26hfNBuiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqPuy6Ubtif3GEpFO1TXkX2zETx0hXOSrwv0uiFg0Kw=;
 b=FcEzplw4FWLmO3EZ3lvjF0TPS3LZcOy715ZxNDNpDhDs9+Y1WWQh+ySHvNJNCGT8i6hs0MyL4wgrXcOERV1nOQ+nL/GRafBoyOktu+mHSRKa8Kd6Cve85zt/9Di0Hldw8rK9lvx97yO6RpTBgB4ULL5vuAB9t3J94uWCvbya1vlBLLKLlrwL7yTh+HVbliAxx+yX1ACnmIlwohEjg2zhXvrsT0G1L+hT55JwwH3vKgtSqQ0JLI10wOX0Ta/FKzd7j02sc+tFPs7GOse8XQXCxIYtaOw1TBDb3o+r8GS6zxngeny6psjlTubjiDg+Icjr0k6XH7qSNrqMkDsDjruXPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqPuy6Ubtif3GEpFO1TXkX2zETx0hXOSrwv0uiFg0Kw=;
 b=WDSbdGUHdEe38qUmysCPXuz2zRJ+B5UCXhidSFVWy0QkA6nqsOxouNGGZgFhj1awRXgkee3xnBYFy9E7Clqf67ecuskMNKiv1Hnf7ZshLfY+2IFK2pnVPp7tpXS7pUEAs9SuvH9PngXk8dqXTgspefMfIUeVCE7wZuNreOYqNm4=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB2115.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:4f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 12:29:35 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a0df:b996:7029:318a]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a0df:b996:7029:318a%7]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 12:29:35 +0000
Subject: Re: [PATCH 09/23] mtd: nand: spi: toshiba: Demote non-conformant
 kernel-doc header
To: Lee Jones <lee.jones@linaro.org>, vigneshr@ti.com
References: <20201102115406.1074327-1-lee.jones@linaro.org>
 <20201102115406.1074327-10-lee.jones@linaro.org>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <62865037-1f64-2515-2457-06767c232677@kontron.de>
Date: Mon, 2 Nov 2020 13:29:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201102115406.1074327-10-lee.jones@linaro.org>
Content-Language: en-US
X-Originating-IP: [89.247.37.117]
X-ClientProxiedBy: AM6PR10CA0022.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::35) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.17] (89.247.37.117) by
 AM6PR10CA0022.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Mon, 2 Nov 2020 12:29:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aec41ebf-50d8-47ff-e7ec-08d87f2af524
X-MS-TrafficTypeDiagnostic: AM0PR10MB2115:
X-Microsoft-Antispam-PRVS: <AM0PR10MB2115FE1B2D7F25FEB418513DE9100@AM0PR10MB2115.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 93TPab/ksaotilPiseJ2OPw8ti7e67G2VdTyIa48QAZl1CZtm2M9T47anLkz7IAKRsMsJt6wpRPknEm9bGHVTvcyo7UzYhScWoapoftUsDEVXODQNDq+DJGYQvx4f2dVvEASVWhoO4FElptKPieqPpgzldxLgdIqiY6u5QwBuj6ANVMJDMKiPogpdXIDxhE7Kdzf0eUlGpRj3px2vwKWL7KXS5FcqI2wkefx8kr7CKRUGUs+1ymQv+7D9v5ioUMn26aEfSLapN9LzwMtpu1ntZeMqrl1syig3bnx9MbwFpq3nV2i4gAxJ4XesLyBI8ORFO6De+lnmASgT9yr4G/2qssQJL42dRocBjlKNu+hLz7tIuBOcTXw7N2dbgGy4o2c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(4326008)(26005)(44832011)(66556008)(66476007)(66946007)(16576012)(86362001)(6486002)(31696002)(8936002)(83380400001)(36756003)(8676002)(54906003)(956004)(478600001)(186003)(31686004)(316002)(53546011)(2616005)(5660300002)(16526019)(2906002)(52116002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: W2VUd6NMYfPJfbHEwxMm7wEmnfRBY780mhsWWBVIeu31YpbcksKgym5q/PGrvlvPyfj9W+79Bkrj4Y1urdYp2DAUIp77SE32Gb4YABItX+v9O+WctA76Txn7UmtK7MxbcoKmKsJAWVJENz5Gvk8H51jWWq1Qd45s/nOOybRunwcUNnAC4sVzBVKvqgatI0geHQ4vKHYW7EsiHjQHfyyRVwi5SUZR2aAFs+1C3aUcXwCNYyCy5+VaEnApLbxuCGo4MmPGQuCJQcS7u4jixLP6YCAkJbS5Ld80DumXGZHFkZ64yzoFPNw8cUwy5ctG497Q8YUv/12m68qM1PIRUuFYYEPDVc6/RGRACWv3J7ghqvi+yfojbD9Agtew+Rmr4izRzxvgA0h/d0oE5YpnAflCQURxLB8BZRsr1DPjmWARx2fCpV76AeAJzf6/M2p2MfHPuDPPuMHJ28MXyIkYhDyliw64r7Z7VP3PHiCoZtsniNIGAUoq9rugmDxy/J3GmS1EP2f/c5qFqdbXBQfi3YAqtf9rUnQWNBIB1MBZ6xuPeNuvnpxAA07w3gfWNHP2QYEc/w8N6mIMqTTTNz8bYzGlOZHKHxyYa9fnMFumW8uLcK57bYpQQ1Inze9lkN3CUbmqfv5HlGrw1dQ86bcKgB68fg==
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: aec41ebf-50d8-47ff-e7ec-08d87f2af524
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 12:29:35.2494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iG1qALq8lcoh+VX4bvQHYwNN6/RLWFkTOv7y9FaJ+AdoI7C6R563voTFeQQBa2xn8UYQn0V/WsdM4mnRZK0vk50Xpj4Z59Gg7x5xPaVo//Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_072941_261949_C60568F1 
X-CRM114-Status: GOOD (  16.42  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 02.11.20 12:53, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/mtd/nand/spi/toshiba.c:36: warning: Function parameter or member 'write_cache_variants' not described in 'SPINAND_OP_VARIANTS'
>   drivers/mtd/nand/spi/toshiba.c:36: warning: Function parameter or member '0' not described in 'SPINAND_OP_VARIANTS'
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
> Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
>   drivers/mtd/nand/spi/toshiba.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
> index 21fde28756742..7380b1ebaccd5 100644
> --- a/drivers/mtd/nand/spi/toshiba.c
> +++ b/drivers/mtd/nand/spi/toshiba.c
> @@ -28,7 +28,7 @@ static SPINAND_OP_VARIANTS(update_cache_x4_variants,
>   		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
>   		SPINAND_PROG_LOAD(false, 0, NULL, 0));
>   
> -/**
> +/*
>    * Backward compatibility for 1st generation Serial NAND devices
>    * which don't support Quad Program Load operation.
>    */
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
