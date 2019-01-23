Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC85C282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 09:09:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2220720861
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 09:09:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hPOLOKZb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2220720861
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N59H3saMQFAVuX1aDYAZPk7EtREhbdqZ3nVHRF/i+Qg=; b=hPOLOKZbcvSrL0
	yOaj3tRsYsFyTbrYM8hKc3U0CtczTEwYAmdjuyZ6TMBH5zlGcLCD0uOz42BWRVK+gZ6vwy9uTKz1S
	mOnrTtqXKftTCFRpF5vZOiO8VF34LnVN8LIvrDKfpGM/sJiqSUzZSoCj5PM2TKzPaD7lxPIZkAJ7b
	yCSQ7f38ApWa2i4njNAs5XViV2bFujtGfW+vehaUYNQIMC1PUPgEF8NscJdVHWU+52X1mppIxIi5b
	4vld8/5mBwvDNHNQS7tYMfp2zEMT39AIBVeS7YrtgTeUieAUGv4lNLa2ktwqS7IvHeeDXnLAHX99q
	0BdXRb4vHvGEiSF6Oqog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmEXK-0000uw-G1; Wed, 23 Jan 2019 09:09:30 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmEXH-0000uP-8G
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 09:09:28 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8AAFD93972791ECB80D6;
 Wed, 23 Jan 2019 17:09:23 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.96) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.408.0; Wed, 23 Jan 2019
 17:09:20 +0800
Subject: Re: [PATCH v2 -next] mtd: docg3: Fix a possible memory leak of
 mtd->name
To: <robert.jarzmik@free.fr>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <bbrezillon@kernel.org>,
 <marek.vasut@gmail.com>, <richard@nod.at>
References: <20190123090741.14612-1-yuehaibing@huawei.com>
From: YueHaibing <yuehaibing@huawei.com>
Message-ID: <b720e309-2f51-d08b-1713-8afd438be6d9@huawei.com>
Date: Wed, 23 Jan 2019 17:09:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190123090741.14612-1-yuehaibing@huawei.com>
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_010927_467627_892FAFD1 
X-CRM114-Status: GOOD (  11.75  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Pls ignore this err patch.

On 2019/1/23 17:07, YueHaibing wrote:
> In case DOC_CHIPID_G3, mtd->name is not freed in err handling path,
> which is alloced by kasprintf(). Fix this by using devm_kasprintf().
> 
> Fixes: ae9d4934b2d7 ("mtd: docg3: add multiple floor support")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v2: use devm_kasprintf
> ---
>  drivers/mtd/devices/docg3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
> index 4c94fc0..af824d3 100644
> --- a/drivers/mtd/devices/docg3.c
> +++ b/drivers/mtd/devices/docg3.c
> @@ -1767,8 +1767,8 @@ static int __init doc_set_driver_info(int chip_id, struct mtd_info *mtd)
>  
>  	switch (chip_id) {
>  	case DOC_CHIPID_G3:
> -		mtd->name = kasprintf(GFP_KERNEL, "docg3.%d",
> -				      docg3->device_id);
> +		mtd->name = devm_kasprintf(GFP_KERNEL, "docg3.%d",
> +					   docg3->device_id);
>  		if (!mtd->name)
>  			return -ENOMEM;
>  		docg3->max_block = 2047;
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
