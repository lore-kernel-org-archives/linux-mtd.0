Return-Path: <SRS0=Ifuc=SO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F00C10F0E
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2019 14:29:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9BE32084D
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2019 14:29:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IpuME+zn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9BE32084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=83OkH5W84wQzX+7+8HTdp/mBv3ruAvIM5jSX+YT7tII=; b=IpuME+znCMyvyF
	3qrvv5GtqYDYJRRiaI9JhegoC9diMCTKqeLxM3UFBIx/CqkTwWYFk+MGpJr9JaSo/zrdtImB8eFbI
	Vf9lvSFiOIRdhKyjQNlEUinPTotLcXhkgHPW/S9C6W/W4hWeSP0Rar683b3t9pL9NZtPBng0CSasr
	TbnfDBKWHSarYGeVI9QEpStj8x84YPZSZy2On/MHDIodLOT10cZGjYT2uy96QVlLjL1F8Ktg/gGBM
	pXwIi4YKo0Qngs664XXB1Hu1eqhWOfhKxrzqdDwE2i40KrskbolNkhzBkttcL5+Rtuhx08Gmrxo1C
	DoaNj2u3apX1PeY/Ur6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hExBH-0003bR-2o; Fri, 12 Apr 2019 14:29:27 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hExBB-0003Zz-Gy
 for linux-mtd@lists.infradead.org; Fri, 12 Apr 2019 14:29:26 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 04E8C820898F8CC14812;
 Fri, 12 Apr 2019 22:29:03 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.96) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.408.0; Fri, 12 Apr 2019
 22:28:58 +0800
Subject: Re: [PATCH] mtd: nand: Fix build error while
 CONFIG_MTD_NAND_ECC_SW_BCH is set to module
To: Boris Brezillon <boris.brezillon@collabora.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
References: <20190410130747.35692-1-yuehaibing@huawei.com>
 <20190410153920.68267a1a@collabora.com>
 <20190410155856.655122c8@collabora.com>
 <8b020124-4008-6081-c04c-eaefb7875878@huawei.com>
 <20190410162927.17ea678b@collabora.com>
 <41165c39-da0c-0f15-87f9-4fb588b77dcc@huawei.com>
 <20190410181843.489a4e33@xps13> <20190410190328.433a954f@collabora.com>
From: YueHaibing <yuehaibing@huawei.com>
Message-ID: <79bce66d-6bb5-39f9-6f36-0667dede52fd@huawei.com>
Date: Fri, 12 Apr 2019 22:28:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190410190328.433a954f@collabora.com>
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_072924_495529_3D1877CC 
X-CRM114-Status: GOOD (  19.96  )
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
 computersforpeace@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2019/4/11 1:03, Boris Brezillon wrote:
> On Wed, 10 Apr 2019 18:18:43 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
>> Hi YueHaibing,
>>
>> YueHaibing <yuehaibing@huawei.com> wrote on Wed, 10 Apr 2019 23:03:24
>> +0800:
>>
>>> On 2019/4/10 22:29, Boris Brezillon wrote:  
>>>> On Wed, 10 Apr 2019 22:22:16 +0800
>>>> YueHaibing <yuehaibing@huawei.com> wrote:
>>>>     
>>>>> On 2019/4/10 21:58, Boris Brezillon wrote:    
>>>>>> On Wed, 10 Apr 2019 15:39:28 +0200
>>>>>> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>>>>>>       
>>>>>>> On Wed, 10 Apr 2019 21:07:47 +0800
>>>>>>> Yue Haibing <yuehaibing@huawei.com> wrote:
>>>>>>>      
>>>>>>>> From: YueHaibing <yuehaibing@huawei.com>
>>>>>>>>
>>>>>>>> Fix gcc build error while CONFIG_MTD_NAND_ECC_SW_BCH
>>>>>>>> is set to module:
>>>>>>>>
>>>>>>>> drivers/mtd/nand/raw/nand_base.o: In function `nand_cleanup':
>>>>>>>> (.text+0xef6): undefined reference to `nand_bch_free'
>>>>>>>> drivers/mtd/nand/raw/nand_base.o: In function `nand_scan_tail':
>>>>>>>> nand_base.c:(.text+0xa101): undefined reference to `nand_bch_calculate_ecc'
>>>>>>>> nand_base.c:(.text+0xa120): undefined reference to `nand_bch_correct_data'
>>>>>>>> nand_base.c:(.text+0xa269): undefined reference to `nand_bch_init'
>>>>>>>>
>>>>>>>> CONFIG_MTD_NAND_ECC_SW_BCH should not be set to M,
>>>>>>>> because MTD_RAW_NAND need it while linked.
>>>>>>>>
>>>>>>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>>>>>>> Fixes: 193bd4002644 ("mtd: nand: add software BCH ECC support"        
>>>>>>>
>>>>>>> Nope, it's not this one that introduced the regression.
>>>>>>>
>>>>>>>
>>>>>>>      
>>>>>>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>>>>>>> ---
>>>>>>>>  drivers/mtd/nand/raw/Kconfig | 2 +-
>>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
>>>>>>>> index 615d738..0500c42 100644
>>>>>>>> --- a/drivers/mtd/nand/raw/Kconfig
>>>>>>>> +++ b/drivers/mtd/nand/raw/Kconfig
>>>>>>>> @@ -22,7 +22,7 @@ menuconfig MTD_RAW_NAND
>>>>>>>>  if MTD_RAW_NAND
>>>>>>>>  
>>>>>>>>  config MTD_NAND_ECC_SW_BCH
>>>>>>>> -	tristate "Support software BCH ECC"
>>>>>>>> +	bool "Support software BCH ECC"
>>>>>>>>  	select BCH
>>>>>>>>  	default n
>>>>>>>>  	help        
>>>>>>>
>>>>>>> Should be fixed with the following diff squashed into:
>>>>>>>
>>>>>>> 51ef1d0b2095 ("mtd: nand: Clarify Kconfig entry for software BCH ECC algorithm")
>>>>>>>      
>>>>>>> --->8---        
>>>>>>> diff --git a/include/linux/mtd/nand_bch.h b/include/linux/mtd/nand_bch.h
>>>>>>> index b8106651f807..06ce2b655c13 100644
>>>>>>> --- a/include/linux/mtd/nand_bch.h
>>>>>>> +++ b/include/linux/mtd/nand_bch.h
>>>>>>> @@ -15,7 +15,7 @@ struct mtd_info;
>>>>>>>  struct nand_chip;
>>>>>>>  struct nand_bch_control;
>>>>>>>  
>>>>>>> -#if defined(CONFIG_MTD_NAND_ECC_BCH)
>>>>>>> +#if defined(CONFIG_MTD_NAND_ECC_SW_BCH)
>>>>>>>  
>>>>>>>  static inline int mtd_nand_has_bch(void) { return 1; }
>>>>>>>  
>>>>>>> @@ -39,7 +39,7 @@ struct nand_bch_control *nand_bch_init(struct mtd_info *mtd);
>>>>>>>   */
>>>>>>>  void nand_bch_free(struct nand_bch_control *nbc);
>>>>>>>  
>>>>>>> -#else /* !CONFIG_MTD_NAND_ECC_BCH */
>>>>>>> +#else /* !CONFIG_MTD_NAND_ECC_SW_BCH */
>>>>>>>  
>>>>>>>  static inline int mtd_nand_has_bch(void) { return 0; }
>>>>>>>  
>>>>>>> @@ -64,6 +64,6 @@ static inline struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
>>>>>>>  
>>>>>>>  static inline void nand_bch_free(struct nand_bch_control *nbc) {}
>>>>>>>  
>>>>>>> -#endif /* CONFIG_MTD_NAND_ECC_BCH */
>>>>>>> +#endif /* CONFIG_MTD_NAND_ECC_SW_BCH */
>>>>>>>  
>>>>>>>  #endif /* __MTD_NAND_BCH_H__ */      
>>>>>>
>>>>>> Sorry, I didn't look at the right branch, this part of the code was
>>>>>> correct, but we still have a problem to express the RAW_NAND(y) ->
>>>>>> SW_BCH(y) dependency.      
>>>>>
>>>>> It seems this dependency is not always need,
>>>>>
>>>>> case MTD_RAW_NAND set to y works well while CONFIG_MTD_NAND_ECC_SW_BCH is not set.    
>>>>
>>>> Yes, I know, but forcing nand_bch to a be a boolean is not the right
>>>> solution either, hence my suggestion to use 'imply'.    
>>
>> Why exactly? SW BCH is going to be converted to the generic ECC engine
>> abstraction and IIRC you told me that it would not be problematic to
>> turn it into a boolean?
> 
> Yes, I told you we should turn it into a boolean and embed the code in
> the nandcore.o object which can itself be linked as a module or embedded
> in the kernel image (see above for a version adapted for nand.o). That's
> not exactly what Yue proposed.

So is there anothor fix or just to pick my v2 ?

https://patchwork.ozlabs.org/patch/1083480/

> 
> --->8---
> diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
> index 7fcdaf6c279d..f9258d666846 100644
> --- a/drivers/mtd/devices/Kconfig
> +++ b/drivers/mtd/devices/Kconfig
> @@ -207,7 +207,7 @@ comment "Disk-On-Chip Device Drivers"
>  config MTD_DOCG3
>         tristate "M-Systems Disk-On-Chip G3"
>         select BCH
> -       select BCH_CONST_PARAMS if !CONFIG_MTD_NAND_ECC_SW_BCH
> +       select BCH_CONST_PARAMS if !MTD_NAND_ECC_SW_BCH
>         select BITREVERSE
>         help
>           This provides an MTD device driver for the M-Systems DiskOnChip
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index 615d738be411..0500c42f31cb 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -22,7 +22,7 @@ menuconfig MTD_RAW_NAND
>  if MTD_RAW_NAND
>  
>  config MTD_NAND_ECC_SW_BCH
> -       tristate "Support software BCH ECC"
> +       bool "Support software BCH ECC"
>         select BCH
>         default n
>         help
> diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
> index 8bc6faaa3bc7..d644185fa18d 100644
> --- a/drivers/mtd/nand/raw/Makefile
> +++ b/drivers/mtd/nand/raw/Makefile
> @@ -2,7 +2,6 @@
>  
>  obj-$(CONFIG_MTD_RAW_NAND)             += nand.o
>  obj-$(CONFIG_MTD_NAND_ECC_SW_HAMMING)  += nand_ecc.o
> -obj-$(CONFIG_MTD_NAND_ECC_SW_BCH)      += nand_bch.o
>  obj-$(CONFIG_MTD_SM_COMMON)            += sm_common.o
>  
>  obj-$(CONFIG_MTD_NAND_CAFE)            += cafe_nand.o
> @@ -68,3 +67,5 @@ nand-objs += nand_macronix.o
>  nand-objs += nand_micron.o
>  nand-objs += nand_samsung.o
>  nand-objs += nand_toshiba.o
> +nand-objs-$(CONFIG_MTD_NAND_ECC_SW_BCH)        += nand_bch.o
> +nand-objs += $(nand-objs-y)
> 
> 
> 
> .
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
