Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98715C282C3
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 01:40:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68607218CD
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 01:40:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mlkjh8Mm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68607218CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jec6L8DIdZuRV8TALnZ6JfGfT3x9vUzgBk1aboLHdl0=; b=Mlkjh8MmPsGOBh
	j8DZ7NU0hh7Rxd3r72XDmX35zxExTWHG+HdPykhqeicZJIyFRda/9n15/MNJGBQYC/EXseKA2lbXi
	ELr0l6ksqeRCq/m2q+ylnc19kesj8ZTI3xFQJCb7JWor8WiFK3ybUVF0la4eUVX0PIA3clqrb/CF3
	JpsZgs4+4kAh+LyJzPdVDv1+MkglaFkrlWbF/o83fHZjOscIH66ljxaBEBGSAgHj4eZy81Qc/NyfY
	rglF+KKfc/tWa/jl8LkTqUy6NK/9Ek5BXNSSF4VdFI6KiZdkBAtWVpnpoyFxO9uXTSgny8brDwpFn
	pjEd5t/mKdUPnnPLR3Eg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmqUE-0006cq-D7; Fri, 25 Jan 2019 01:40:50 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmqUB-0006cC-FK
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 01:40:49 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 27B51122F7A6A8AEA996;
 Fri, 25 Jan 2019 09:40:41 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.96) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.408.0; Fri, 25 Jan 2019
 09:40:38 +0800
Subject: Re: [PATCH v3 -next] mtd: docg3: Fix a possible memory leak of
 mtd->name
To: Boris Brezillon <bbrezillon@kernel.org>
References: <20190123092819.5020-1-yuehaibing@huawei.com>
 <20190124160047.6091b3e3@bbrezillon>
From: YueHaibing <yuehaibing@huawei.com>
Message-ID: <abf8dafe-f8c5-265f-ff25-a743965ff65a@huawei.com>
Date: Fri, 25 Jan 2019 09:40:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190124160047.6091b3e3@bbrezillon>
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_174047_683969_E962B50A 
X-CRM114-Status: GOOD (  11.54  )
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

On 2019/1/24 23:00, Boris Brezillon wrote:
> On Wed, 23 Jan 2019 17:28:19 +0800
> YueHaibing <yuehaibing@huawei.com> wrote:
> 
>> In case DOC_CHIPID_G3, mtd->name is not freed in err handling path,
>> which is alloced by kasprintf(). Fix this by using devm_kasprintf().
>>
>> Fixes: ae9d4934b2d7 ("mtd: docg3: add multiple floor support")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>> v3: use devm_kasprintf
>> ---
>>  drivers/mtd/devices/docg3.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
>> index 4c94fc0..59ca4f5 100644
>> --- a/drivers/mtd/devices/docg3.c
>> +++ b/drivers/mtd/devices/docg3.c
>> @@ -1767,8 +1767,8 @@ static int __init doc_set_driver_info(int chip_id, struct mtd_info *mtd)
>>  
>>  	switch (chip_id) {
>>  	case DOC_CHIPID_G3:
>> -		mtd->name = kasprintf(GFP_KERNEL, "docg3.%d",
>> -				      docg3->device_id);
>> +		mtd->name = devm_kasprintf(docg3->dev, GFP_KERNEL, "docg3.%d",
>> +					   docg3->device_id);
> 
> You forgot to remove the kfree() in the ->remove() path.

Oops..., I will fix this.

Thanks a lot!

> 
>>  		if (!mtd->name)
>>  			return -ENOMEM;
>>  		docg3->max_block = 2047;
> 
> 
> .
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
