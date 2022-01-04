Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CBCC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 18:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AsEuqCp7kWw0hRMoSmsVgxNJf/ZSphScacFSl78aPhg=; b=FqewuuR3+PV4E3oz3rojzsHdit
	mdOeieeYmTjKQTvXgO8j7/T4wyM/Ci5TJuxPxuVVJSAcpJ8ZRE/2DbDhLETiMCKxlcGEtguGT6Gpr
	qewYuF1t0FV4fg6AKdvFPNW5RnucRBkW6pDeRaAqNuUCPDo6TJu/IOfUuSelpn6xhbIcF1jjMi7Hu
	W2PwrP0c7mJE1VP8xEbirl1NUJ/USzR4ySwT29WHIJblWVnIdsAZ+UNJpdnvo84R4Rj6bXw5gyv0A
	tAg6C9NWWiYd31+/98QsRByOYYiB5eW/x+amm79GSwOzvTYMCmhvav132O5x3lZTHBadRs/oMyXFy
	pO/k3RQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4odu-00CW5r-Vo; Tue, 04 Jan 2022 18:34:43 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4ods-00CW5D-Kv
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 18:34:42 +0000
Received: by mail-pl1-x62c.google.com with SMTP id n16so27681084plc.2
 for <linux-mtd@lists.infradead.org>; Tue, 04 Jan 2022 10:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CKSNn00/BiOS0SvuNfkaTCGRzG8dHHnuc8meOiDvCjY=;
 b=Sme33SArj00KckuaM6P6MvrxNlbsZq2U4eEN5/tSEx0x6I6PDS9QLX4224ak9BiQai
 G5QnIZ0XpF5bPTl9uwu/dhMbp9qA+lp8wFiXAxY1ZvQ451xY0jQNVkl9BwRqwBCQi3dR
 PJv4pVKP9iiQeyq09YBtdyaSjPeFdhEk3QOy1gmGrzHfBT/U7ptWJ6mt22b9Vl4USj3M
 EkkWj4gixfDuQ1A+sTef+KQ9tRQ+UKAVlXKz3pHW/DE6YZ1Xbden5OMuFf6k9gOM2ecY
 kzlFArg3DX6N3d7S+U4SZ+J88ZUwDJpH9ypTASU1oQT+w1iH3tSDlQzG52Zl4A+mDntb
 CL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CKSNn00/BiOS0SvuNfkaTCGRzG8dHHnuc8meOiDvCjY=;
 b=Mnqmdk5sAOD5VPa4MTpFgpO8AdC+jj8sOwayMPqD28lR/Zw/bMQk0W9koIeQvvPkAR
 JMirYTfkvY/fsKpVNC4zsUB1JQszdm7eD0ekRdAFVqfzauqTAfYKWsc5h7I747qpbB22
 XvqHTP1KCIzLXEmJISjs1rdX2CAAYVvNOAp0pXzDnLOnl82gyWhrwF4iy0DXlBnbDIpn
 RKa/cyWUEikaN4vpmQLPhdc65ylEOzmUUEbzcoJzXL+qh/aUWhkYrwQuP3dHEbOIaoRc
 +Ki12z15gKlsB991uz/zuH1F0ftcoXMu62pBGIU/7Gu3Pcxx8D6cP3FZVcTjJfUihxPe
 nShQ==
X-Gm-Message-State: AOAM5307trsSU7ZaetdzE9wL/yHZQj6AokE/a15atU0CP6KR2d/U5NFb
 fxLHFYh+Q7k9nuM/clTmZBs=
X-Google-Smtp-Source: ABdhPJz0IALYrhxCC7GbFZQ3jRKow5GPCrXVfzfIJ08+IhYJNyghSRA8FNfU0+UC4fCqsBkm3Y594A==
X-Received: by 2002:a17:90a:bc8c:: with SMTP id
 x12mr55083541pjr.168.1641321278754; 
 Tue, 04 Jan 2022 10:34:38 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id p10sm42152336pfw.87.2022.01.04.10.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 10:34:38 -0800 (PST)
Subject: Re: [PATCH 1/9] mtd: rawnand: brcmnand: Allow SoC to provide I/O
 operations
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Cai Huoqing <caihuoqing@baidu.com>, Colin Ian King <colin.king@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM SPECIFIC AMBA DRIVER (BCMA)"
 <linux-wireless@vger.kernel.org>,
 "open list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>
References: <20211223002225.3738385-1-f.fainelli@gmail.com>
 <20211223002225.3738385-2-f.fainelli@gmail.com>
 <20220103174953.40d7fa52@xps13>
 <299bf6ed-80e6-ad15-8dc7-5ededaca15c5@gmail.com>
 <20220104093221.6414aab9@xps13> <20220104095755.46858287@xps13>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <9e4c0120-e088-fca0-0194-c45fcf9181cb@gmail.com>
Date: Tue, 4 Jan 2022 10:34:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220104095755.46858287@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_103440_729032_A3A624C7 
X-CRM114-Status: GOOD (  26.87  )
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

On 1/4/22 12:57 AM, Miquel Raynal wrote:
> Hi Miquel,
> 
> miquel.raynal@bootlin.com wrote on Tue, 4 Jan 2022 09:32:21 +0100:
> 
>> Hi Florian,
>>
>> f.fainelli@gmail.com wrote on Mon, 3 Jan 2022 09:24:26 -0800:
>>
>>> On 1/3/2022 8:49 AM, Miquel Raynal wrote:  
>>>> Hi Florian,
>>>>
>>>> f.fainelli@gmail.com wrote on Wed, 22 Dec 2021 16:22:17 -0800:
>>>>     
>>>>> Allow a brcmnand_soc instance to provide a custom set of I/O operations
>>>>> which we will require when using this driver on a BCMA bus which is not
>>>>> directly memory mapped I/O. Update the nand_{read,write}_reg accordingly
>>>>> to use the SoC operations if provided.
>>>>>
>>>>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>>>>> ---
>>>>>   drivers/mtd/nand/raw/brcmnand/brcmnand.c | 14 ++++++++++++--
>>>>>   drivers/mtd/nand/raw/brcmnand/brcmnand.h | 23 +++++++++++++++++++++++
>>>>>   2 files changed, 35 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>>>> index f75929783b94..7a1673b1b1af 100644
>>>>> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>>>> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>>>> @@ -594,13 +594,18 @@ enum {    
>>>>>   >>   static inline u32 nand_readreg(struct brcmnand_controller *ctrl, u32 offs)    
>>>>>   {
>>>>> +	if (brcmnand_soc_has_ops(ctrl->soc))
>>>>> +		return brcmnand_soc_read(ctrl->soc, offs);
>>>>>   	return brcmnand_readl(ctrl->nand_base + offs);
>>>>>   }    
>>>>>   >>   static inline void nand_writereg(struct brcmnand_controller *ctrl, u32 offs,    
>>>>>   				 u32 val)
>>>>>   {
>>>>> -	brcmnand_writel(val, ctrl->nand_base + offs);
>>>>> +	if (brcmnand_soc_has_ops(ctrl->soc))
>>>>> +		brcmnand_soc_write(ctrl->soc, val, offs);
>>>>> +	else
>>>>> +		brcmnand_writel(val, ctrl->nand_base + offs);
>>>>>   }    
>>>>>   >>   static int brcmnand_revision_init(struct brcmnand_controller *ctrl)    
>>>>> @@ -766,13 +771,18 @@ static inline void brcmnand_rmw_reg(struct brcmnand_controller *ctrl,    
>>>>>   >>   static inline u32 brcmnand_read_fc(struct brcmnand_controller *ctrl, int word)    
>>>>>   {
>>>>> +	if (brcmnand_soc_has_ops(ctrl->soc))
>>>>> +		return brcmnand_soc_read(ctrl->soc, ~0);
>>>>>   	return __raw_readl(ctrl->nand_fc + word * 4);
>>>>>   }    
>>>>>   >>   static inline void brcmnand_write_fc(struct brcmnand_controller *ctrl,    
>>>>>   				     int word, u32 val)
>>>>>   {
>>>>> -	__raw_writel(val, ctrl->nand_fc + word * 4);
>>>>> +	if (brcmnand_soc_has_ops(ctrl->soc))
>>>>> +		brcmnand_soc_write(ctrl->soc, val, ~0);
>>>>> +	else
>>>>> +		__raw_writel(val, ctrl->nand_fc + word * 4);
>>>>>   }    
>>>>>   >>   static inline void edu_writel(struct brcmnand_controller *ctrl,    
>>>>> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.h b/drivers/mtd/nand/raw/brcmnand/brcmnand.h
>>>>> index eb498fbe505e..a3f2ad5f6572 100644
>>>>> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.h
>>>>> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.h
>>>>> @@ -11,12 +11,19 @@    
>>>>>   >>   struct platform_device;    
>>>>>   struct dev_pm_ops;
>>>>> +struct brcmnand_io_ops;    
>>>>>   >>   struct brcmnand_soc {    
>>>>>   	bool (*ctlrdy_ack)(struct brcmnand_soc *soc);
>>>>>   	void (*ctlrdy_set_enabled)(struct brcmnand_soc *soc, bool en);
>>>>>   	void (*prepare_data_bus)(struct brcmnand_soc *soc, bool prepare,
>>>>>   				 bool is_param);
>>>>> +	const struct brcmnand_io_ops *ops;
>>>>> +};
>>>>> +
>>>>> +struct brcmnand_io_ops {
>>>>> +	u32 (*read_reg)(struct brcmnand_soc *soc, u32 offset);
>>>>> +	void (*write_reg)(struct brcmnand_soc *soc, u32 val, u32 offset);
>>>>>   };    
>>>>>   >>   static inline void brcmnand_soc_data_bus_prepare(struct brcmnand_soc *soc,    
>>>>> @@ -58,6 +65,22 @@ static inline void brcmnand_writel(u32 val, void __iomem *addr)
>>>>>   		writel_relaxed(val, addr);
>>>>>   }    
>>>>>   >> +static inline bool brcmnand_soc_has_ops(struct brcmnand_soc *soc)    
>>>>> +{
>>>>> +	return soc && soc->ops && soc->ops->read_reg && soc->ops->write_reg;
>>>>> +}
>>>>> +
>>>>> +static inline u32 brcmnand_soc_read(struct brcmnand_soc *soc, u32 offset)
>>>>> +{
>>>>> +	return soc->ops->read_reg(soc, offset);
>>>>> +}
>>>>> +
>>>>> +static inline void brcmnand_soc_write(struct brcmnand_soc *soc, u32 val,
>>>>> +				      u32 offset)
>>>>> +{
>>>>> +	soc->ops->write_reg(soc, val, offset);
>>>>> +}
>>>>> +    
>>>>
>>>> It might be worth looking into more optimized ways to do these checks,
>>>> in particular the read/write_reg ones because you're checking against
>>>> some static data which cannot be optimized out by the compiler but
>>>> won't change in the lifetime of the kernel.    
>>>
>>> I suppose I could add an addition if IS_ENABLED(CONFIG_MTD_NAND_BRCMNAND_BCMA) at the front of brcmnand_soc_has_ops(), would that address your concern or you have something else in mind?  
>>
>> I don't like much the #ifdef solution, instead you might think of
>> static keys, or even better using a regmap. Regmap implementation is
>> free, you can use either one way or the other and for almost no
>> overhead compared to the bunch of functions you have here.
> 
> Maybe regmaps will actually be slower than these regular if's. Perhaps
> static keys are the best option?

OK static keys would probably work. I am not sure that the additional
branches for each register access would actually be causing a noticeable
performance impact. Pretty much any chip where this controller is used
has a DMA interface that you program and kick, the PIO is already
assumed to be slow, and each register access is about 200ns on STB chips
at least.
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
