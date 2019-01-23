Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B035C282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 08:54:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3355D217F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 08:54:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oVQ88qpT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3355D217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kpNbISTzOyGK9aOgycuE8QqGyw0oP7VvI+FCtuSc9Xw=; b=oVQ88qpTEQMytJ
	o40wFJ36ByL6YSZo61wNfSlZKLF0v4YBV1GrQQM6LsMt5xiSnlgKXD0xYjjsFYlQpYleI0J0gQ8A7
	sOMk/7pLU71KT/Madp13ziyQQdrYQjMK3jW4CqluKSN8FrjRUsqDdQl8EbGyfgKMBmGRJBhk14Cx3
	uOA8UbO9fmj3bNddqR75qJORc7e/CYfK8KRr14Ri7GFp3uHys7zitGPa6HUkJGmyvm0gIfEqm0Bmt
	5dShY4FfrEyzkPoXNauxivCIvao1Y5wUcsDn7qbd4T/4OrztmuH3IwiAawLSwoQWHwaMdY2zzIp2d
	q3oT8ZNPF1XsgqWUBBvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmEIX-0002iW-BJ; Wed, 23 Jan 2019 08:54:13 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmEIU-0002hl-0n
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 08:54:11 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 69830D656A2878CC6A8C;
 Wed, 23 Jan 2019 16:54:06 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.96) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.408.0; Wed, 23 Jan 2019
 16:54:05 +0800
Subject: Re: [PATCH -next] mtd: docg3: Fix a possible memory leak of mtd->name
To: Boris Brezillon <bbrezillon@kernel.org>
References: <20190123065943.5868-1-yuehaibing@huawei.com>
 <20190123094644.23f27c3e@bbrezillon>
From: YueHaibing <yuehaibing@huawei.com>
Message-ID: <ba7a5252-893c-6fb5-84b4-1ab482738afd@huawei.com>
Date: Wed, 23 Jan 2019 16:54:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190123094644.23f27c3e@bbrezillon>
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_005410_225647_473FBB47 
X-CRM114-Status: GOOD (  10.32  )
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

On 2019/1/23 16:46, Boris Brezillon wrote:
> On Wed, 23 Jan 2019 14:59:43 +0800
> YueHaibing <yuehaibing@huawei.com> wrote:
> 
>> In case DOC_CHIPID_G3, mtd->name should be freed in the
>> err handling path, which is alloced by kasprintf.
>>
>> Fixes: ae9d4934b2d7 ("mtd: docg3: add multiple floor support")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>  drivers/mtd/devices/docg3.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
>> index 60ddc38..cbd25f9 100644
>> --- a/drivers/mtd/devices/docg3.c
>> +++ b/drivers/mtd/devices/docg3.c
>> @@ -1867,6 +1867,7 @@ doc_probe_device(struct docg3_cascade *cascade, int floor, struct device *dev)
>>  
>>  nomem4:
>>  	kfree(docg3->bbt);
>> +	kfree(mtd->name);
> 
> Please use devm_kasprintf() instead.

Ok, will do it in v2.

> 
>>  nomem3:
>>  	kfree(mtd);
>>  nomem2:
> 
> 
> .
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
