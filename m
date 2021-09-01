Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64049C432BE
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 11:13:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2001060F4B
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 11:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2001060F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHpiJ4fTeCbUZmwEVtkikFYnA0WAtd+idtXphGl2UM4=; b=pLkoig8pXIC7lW/o7AxZLRYljg
	xdtYLeRlQKpRhNY7vBFG9GfU/8Jd+qtJHKW6ff+2qc1bqpF4EQW1KTkzDt0Ey7X/+c+SWpmENFIvz
	1LM+oatfig7Ulds83Ogik3YZPJFRqeG133GBEpYapLXnCWomdZuqNIp/LAeo3Opy71TSsyxBSIzR2
	UW7ezYCNnWUoKSG8iYTVz3GMdcMBjgQqW2weLX+JNDcK7ZwEvceT7SyWacRF+rmqrhJUzWrgVNkAU
	PQpn8ZEKek/HT02wFFUSEhsLnnJbYhgPQwcFZ3KTUrOJtTgy0945N5+ce6UVdM6XFllTZAIe/K3sk
	3oPe43Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLO9s-005UhF-NJ; Wed, 01 Sep 2021 11:11:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLMuU-0051HF-N0; Wed, 01 Sep 2021 09:52:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1630489918; x=1662025918;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=CT+UDxn6as6xh9A8sRKHCVHW8lQ6e8ercxAnl+msfa4=;
 b=eA2DkHGWAdUrgdtGIlHGq8Hc5LUol0cO+qk89BDG0IrGmmT0NOwebu16
 MDvlKB2BqNPaN9uiH/kXABjGSrxmNZpl+Tf/88jMIlNaDJW60MVjHWLPW
 oD9RQuIJfliq1KeFqMclKXjCLfnR5piyUPCqNlsmeE0rwT+3dsuScCFHR
 2YxM+Xtjx2EcwwZCfpTWlzNyPzM5c5NpseaWR7rKBShJz9I+DDUYS3/cC
 U+IRjs1lLDnMWXxp0S7ZxAbc9Qnb7tNyqncd2kBUtlMxchZk8HrNs1o3e
 YORebQNGpdDm0uFf2L9G6t1JKwkOat8yn20AMBKcBL86VfMFYCSjnxLaE Q==;
IronPort-SDR: vn4D+YekV0Fiv6VB5tu6Q4vZrImudio67aI8no935WoRuMOzTfSaBQCobDKRVb40CRWiq8uwZw
 Dgv+nmF3XqcTz823/pnc8R7mHlljvXjGma6SWiQsqAoad8AVAkmmrPC7tAQ0q42jJsN0I4Ma0G
 SLdL1mg//CwwT1/NSa6yyLezkjTvnlnw5tHAPjLZggKUfp4PCD1d+gszQIWXHNJrLAXIQh7+ee
 shHlDYpva3KPgIKSQo1Cf/bysA88C6zH/sUKwMr5P05aCEmBrGpjSoqAUeThP1QmAX+/i28A/T
 JiftHf6uz+cmuwWiP0O1UiOI
X-IronPort-AV: E=Sophos;i="5.84,368,1620716400"; d="scan'208";a="142389275"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Sep 2021 02:51:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Sep 2021 02:51:49 -0700
Received: from [10.12.72.234] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Wed, 1 Sep 2021 02:51:47 -0700
Subject: Re: [PATCH] mtd: rawnand: atmel: Make use of the helper function
 devm_platform_ioremap_resource()
To: Cai Huoqing <caihuoqing@baidu.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20210901074031.8883-1-caihuoqing@baidu.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <3ac919ad-be84-f050-a7d1-c15c8c06217e@microchip.com>
Date: Wed, 1 Sep 2021 11:51:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901074031.8883-1-caihuoqing@baidu.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_025158_836670_B8C0E62C 
X-CRM114-Status: GOOD (  17.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 01/09/2021 at 09:40, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>   drivers/mtd/nand/raw/atmel/pmecc.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/atmel/pmecc.c b/drivers/mtd/nand/raw/atmel/pmecc.c
> index cbb023bf00f7..498e41ccabbd 100644
> --- a/drivers/mtd/nand/raw/atmel/pmecc.c
> +++ b/drivers/mtd/nand/raw/atmel/pmecc.c
> @@ -834,7 +834,6 @@ static struct atmel_pmecc *atmel_pmecc_create(struct platform_device *pdev,
>   {
>          struct device *dev = &pdev->dev;
>          struct atmel_pmecc *pmecc;
> -       struct resource *res;
> 
>          pmecc = devm_kzalloc(dev, sizeof(*pmecc), GFP_KERNEL);
>          if (!pmecc)
> @@ -844,13 +843,11 @@ static struct atmel_pmecc *atmel_pmecc_create(struct platform_device *pdev,
>          pmecc->dev = dev;
>          mutex_init(&pmecc->lock);
> 
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, pmecc_res_idx);
> -       pmecc->regs.base = devm_ioremap_resource(dev, res);
> +       pmecc->regs.base = devm_platform_ioremap_resource(pdev, pmecc_res_idx);
>          if (IS_ERR(pmecc->regs.base))
>                  return ERR_CAST(pmecc->regs.base);
> 
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, errloc_res_idx);
> -       pmecc->regs.errloc = devm_ioremap_resource(dev, res);
> +       pmecc->regs.errloc = devm_platform_ioremap_resource(pdev, errloc_res_idx);
>          if (IS_ERR(pmecc->regs.errloc))
>                  return ERR_CAST(pmecc->regs.errloc);
> 
> --
> 2.25.1
> 


-- 
Nicolas Ferre

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
