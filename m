Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDD7C282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 09:44:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BB4D20861
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 09:44:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RKa1SQKV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BB4D20861
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tuPlY2PEgsbXIyPrKpkzlOOj3K/L7/KG9c64R5w7/Gc=; b=RKa1SQKVAWV+4I
	YoVvJ/BMq7uw1efiDdkRU3H4pHe04pAlZFGGlPE5ggYUDPZ1y3AUOSqbee3HSW8wRnLQuSVGvDajy
	6GwiwiAzqMYoUrI4m2NN8kvcsz/1CyC821GTpHSuNEuc9+kvFY8OJW4SxcBzRu136kLTA73zh2IJ3
	Sq7ilMbu56sGxM6j4UN2qyMcA+BmaoEZfrGDWX7jG3ZKpZ4hqNLM/hYYHzHIE8U4OMDdYQBAFAp6A
	WXH6C2J9iNILHCycZ9NDbE2js4YC1RlCtg7t8aP1Gcw3EXKwvcLDJwEISa1wgFQwpmj30XIrDWtgH
	lUMYCCEjPh8P3gnc+20w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmF4u-0006Ss-0T; Wed, 23 Jan 2019 09:44:12 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmF4q-0006SE-Lx
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 09:44:10 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 06CF6FDCA6B3A4A995E3;
 Wed, 23 Jan 2019 17:44:05 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.96) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.408.0; Wed, 23 Jan 2019
 17:43:59 +0800
Subject: Re: [PATCH -next] mtd: docg3: Fix passing zero to 'PTR_ERR' warning
 in doc_probe_device
To: Boris Brezillon <bbrezillon@kernel.org>
References: <20190123065827.16748-1-yuehaibing@huawei.com>
 <20190123101253.243add9d@bbrezillon>
From: YueHaibing <yuehaibing@huawei.com>
Message-ID: <86533285-e800-5cc0-f495-88fff8326b5a@huawei.com>
Date: Wed, 23 Jan 2019 17:43:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190123101253.243add9d@bbrezillon>
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_014408_887747_0A58CF95 
X-CRM114-Status: GOOD (  14.35  )
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
Cc: robert.jarzmik@free.fr, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, richard@nod.at, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 2019/1/23 17:12, Boris Brezillon wrote:
> On Wed, 23 Jan 2019 14:58:27 +0800
> YueHaibing <yuehaibing@huawei.com> wrote:
> 
>> Fix a static code checker warning:
>> drivers/mtd/devices/docg3.c:1875
>>  doc_probe_device() warn: passing zero to 'ERR_PTR'
>>
>> Fixes: ae9d4934b2d7 ("mtd: docg3: add multiple floor support")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>  drivers/mtd/devices/docg3.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
>> index 4c94fc0..60ddc38 100644
>> --- a/drivers/mtd/devices/docg3.c
>> +++ b/drivers/mtd/devices/docg3.c
>> @@ -1872,7 +1872,7 @@ doc_probe_device(struct docg3_cascade *cascade, int floor, struct device *dev)
>>  nomem2:
>>  	kfree(docg3);
>>  nomem1:
>> -	return ERR_PTR(ret);
>> +	return ret ? ERR_PTR(ret) : NULL;
>>  }
>>  
> 
> This is not the right fix, you should instead set ret to -EINVAL:

Thanks , will fix it in v2.

And seems doc_probe_device cannot return NULL. The NULL check of doc_probe_device
in docg3_probe also can been removed, right?

> 
> --->8---
> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
> index 4c94fc096696..6b84db411232 100644
> --- a/drivers/mtd/devices/docg3.c
> +++ b/drivers/mtd/devices/docg3.c
> @@ -1842,7 +1842,7 @@ doc_probe_device(struct docg3_cascade *cascade, int floor, struct device *dev)
>         chip_id = doc_register_readw(docg3, DOC_CHIPID);
>         chip_id_inv = doc_register_readw(docg3, DOC_CHIPID_INV);
>  
> -       ret = 0;
> +       ret = -ENOMEM;
>         if (chip_id != (u16)(~chip_id_inv)) {
>                 goto nomem4;
>         }
> 
> .
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
