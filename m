Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B78C10F14
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 14:22:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CC1F20850
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 14:22:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uKcmk3cd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CC1F20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QOmbxC2w6nLaWZbC36Hf2G9lBzDL5ih2bW1OyDXU6zE=; b=uKcmk3cdY10sU1
	opxHOjaOx0tbMnOchB4sfRTS0qi6ZcLdI8JhHw6irK1RMopXJ9MY/UAYS2QEsnRn0YGyD5QFN3JOS
	NYeuF0WcwuPRZT7vJl8Nbn+rtnvRTnZSkOWYZJEZZR0mNY0s077S46yj7h8uqcOIu5SNKEWW6IE4j
	SOJqJH4Ttmo9jAffj0RaiB1Co3e2RMBgE6NNxpqMaUHj6Ub1215HA3xTwTtytiDr8erm4tkrT4cbO
	vLHfk9xGEbteQLfqTbJ4ZuO3AGEXNXiq7E43+Rg9oNhDMqPSKpuVyxvYT2oeZAhFEUHTdACidLWJc
	kWOqWGIdQifktIYz74og==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEE7S-0002TM-7k; Wed, 10 Apr 2019 14:22:30 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEE7O-0002RE-S5
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2019 14:22:29 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 625F7610C5ADFCE39524;
 Wed, 10 Apr 2019 22:22:20 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.96) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.408.0; Wed, 10 Apr 2019
 22:22:17 +0800
Subject: Re: [PATCH] mtd: nand: Fix build error while
 CONFIG_MTD_NAND_ECC_SW_BCH is set to module
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20190410130747.35692-1-yuehaibing@huawei.com>
 <20190410153920.68267a1a@collabora.com>
 <20190410155856.655122c8@collabora.com>
From: YueHaibing <yuehaibing@huawei.com>
Message-ID: <8b020124-4008-6081-c04c-eaefb7875878@huawei.com>
Date: Wed, 10 Apr 2019 22:22:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190410155856.655122c8@collabora.com>
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_072227_209163_AB4FC5D6 
X-CRM114-Status: GOOD (  14.28  )
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
Cc: bbrezillon@kernel.org, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, paul.burton@mips.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2019/4/10 21:58, Boris Brezillon wrote:
> On Wed, 10 Apr 2019 15:39:28 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
>> On Wed, 10 Apr 2019 21:07:47 +0800
>> Yue Haibing <yuehaibing@huawei.com> wrote:
>>
>>> From: YueHaibing <yuehaibing@huawei.com>
>>>
>>> Fix gcc build error while CONFIG_MTD_NAND_ECC_SW_BCH
>>> is set to module:
>>>
>>> drivers/mtd/nand/raw/nand_base.o: In function `nand_cleanup':
>>> (.text+0xef6): undefined reference to `nand_bch_free'
>>> drivers/mtd/nand/raw/nand_base.o: In function `nand_scan_tail':
>>> nand_base.c:(.text+0xa101): undefined reference to `nand_bch_calculate_ecc'
>>> nand_base.c:(.text+0xa120): undefined reference to `nand_bch_correct_data'
>>> nand_base.c:(.text+0xa269): undefined reference to `nand_bch_init'
>>>
>>> CONFIG_MTD_NAND_ECC_SW_BCH should not be set to M,
>>> because MTD_RAW_NAND need it while linked.
>>>
>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>> Fixes: 193bd4002644 ("mtd: nand: add software BCH ECC support"  
>>
>> Nope, it's not this one that introduced the regression.
>>
>>
>>
>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>> ---
>>>  drivers/mtd/nand/raw/Kconfig | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
>>> index 615d738..0500c42 100644
>>> --- a/drivers/mtd/nand/raw/Kconfig
>>> +++ b/drivers/mtd/nand/raw/Kconfig
>>> @@ -22,7 +22,7 @@ menuconfig MTD_RAW_NAND
>>>  if MTD_RAW_NAND
>>>  
>>>  config MTD_NAND_ECC_SW_BCH
>>> -	tristate "Support software BCH ECC"
>>> +	bool "Support software BCH ECC"
>>>  	select BCH
>>>  	default n
>>>  	help  
>>
>> Should be fixed with the following diff squashed into:
>>
>> 51ef1d0b2095 ("mtd: nand: Clarify Kconfig entry for software BCH ECC algorithm")
>>
>> --->8---  
>> diff --git a/include/linux/mtd/nand_bch.h b/include/linux/mtd/nand_bch.h
>> index b8106651f807..06ce2b655c13 100644
>> --- a/include/linux/mtd/nand_bch.h
>> +++ b/include/linux/mtd/nand_bch.h
>> @@ -15,7 +15,7 @@ struct mtd_info;
>>  struct nand_chip;
>>  struct nand_bch_control;
>>  
>> -#if defined(CONFIG_MTD_NAND_ECC_BCH)
>> +#if defined(CONFIG_MTD_NAND_ECC_SW_BCH)
>>  
>>  static inline int mtd_nand_has_bch(void) { return 1; }
>>  
>> @@ -39,7 +39,7 @@ struct nand_bch_control *nand_bch_init(struct mtd_info *mtd);
>>   */
>>  void nand_bch_free(struct nand_bch_control *nbc);
>>  
>> -#else /* !CONFIG_MTD_NAND_ECC_BCH */
>> +#else /* !CONFIG_MTD_NAND_ECC_SW_BCH */
>>  
>>  static inline int mtd_nand_has_bch(void) { return 0; }
>>  
>> @@ -64,6 +64,6 @@ static inline struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
>>  
>>  static inline void nand_bch_free(struct nand_bch_control *nbc) {}
>>  
>> -#endif /* CONFIG_MTD_NAND_ECC_BCH */
>> +#endif /* CONFIG_MTD_NAND_ECC_SW_BCH */
>>  
>>  #endif /* __MTD_NAND_BCH_H__ */
> 
> Sorry, I didn't look at the right branch, this part of the code was
> correct, but we still have a problem to express the RAW_NAND(y) ->
> SW_BCH(y) dependency.

It seems this dependency is not always need,

case MTD_RAW_NAND set to y works well while CONFIG_MTD_NAND_ECC_SW_BCH is not set.

> 
> .
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
