Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C955BC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jan 2022 17:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zHSY2l4o0+ufuZI9p93wKoRwxda49dQe8f5ECNanU80=; b=K2LRhdS3oJ+xn0
	ZfejxY89HtKmoVCVbFP95Fc8NDpULNG3ThF4HBupGI+SvnBYHUPgcmOQt68ETkHZASqPOz2n1/Xpm
	jc82rvtw/Iy1tQlDvWLvExEUdEQxnaLDxnAUJst8sHLYDNW9bH5CiaxjuJ5dgA3z9LbGspZWsv67P
	uUQALTGq/8wX01Bfl1tnx/neV55t729KzPce6AxfsFZLD6K72bGOj9Y3pMl7WHpC2RgAjul40TGQq
	OcHhl0AtjMo5NXCHc3D2s/jCupdFemiPN2LSd0JTRE9Zf2cbQxD3PGakDEULM2zPwX/HivinH7Pu2
	OnoCiF4gWMeIl0KBdTxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4R4T-009f5O-UR; Mon, 03 Jan 2022 17:24:34 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4R4Q-009f4w-S6
 for linux-mtd@lists.infradead.org; Mon, 03 Jan 2022 17:24:32 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 c9-20020a17090a1d0900b001b2b54bd6c5so16596125pjd.1
 for <linux-mtd@lists.infradead.org>; Mon, 03 Jan 2022 09:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0L/XmYFJf7rrncW5i02VYWysmo3VfvrxIa/jZ7I+BkQ=;
 b=ED4rqF+g9MCRv017zZ8RyDk0oWyweMGo8g7V0buGpzdZ3DhieYnVpLRtullR+zrVBt
 StidQeLg8O47qNCDe7npV4B4k4v9Equw317TeBMu+XVWNMHmKA8vYEywU3X0Lsvom1pb
 J+SyrVFQU3/4aP/PvVpd8Hblb2ey+Kp6FJklpzdkw0WEOKajkqPMGwCVp4jkCqG8qFI5
 nbI14EGtpXWC2bZqNA+pNuHrdcSZnIjeTJCdHY9A394+es//ZBfpbzsMr1Bb565gMon8
 4ogvTHANLrO8vKeEMD5mOuvsf7YUiBUMmGZg+J/zeQ7SkpcCQTP0WU++XaRpe2/B/JvN
 ImbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0L/XmYFJf7rrncW5i02VYWysmo3VfvrxIa/jZ7I+BkQ=;
 b=76gPtMyTWmvKHs0O9WKxN+VxIzX9ouiv9+ORvdUxhVcZ7Ycf11pH6Jrh0BonSBHkrf
 dlGRUbTbUnPJWtsUayy2ZNZHXLnpSX7V4BexDMhimDs2S5KkPbvFb8KxmTPEHs170vr1
 X1tCfdDLF+wsgKtMzt+tCjCLUzRGN2XQRqoG3EydBDQLOaTPbNpXqJl048tHlEBrOXof
 hc4JnIEaCvgZhST4P/BaHOVeroaZ2gMpCGg+EAFCKVQgHcwW96TjG3W0fWa70sfGR+KA
 7ZhgbpE1uM5yUJKbXamRXuB2rGs7l3ToVl1aZNC1D+zpgSKoJU1OsMJrSUacUpoQIFAs
 hSRg==
X-Gm-Message-State: AOAM531prYW6Kla8b5R4fhDGKzY0ZeDLgJwHwF8VkH4LPc2MRy1zNSN1
 yKCmvxKWXD70Z55/XPa/3TQ=
X-Google-Smtp-Source: ABdhPJxU+vdH181ESxpFTV/gZNCfEJtI3PFpJP0OJhjASZvO61OpFsO4xDf9+cjutucymgULxohxJA==
X-Received: by 2002:a17:903:110d:b0:149:a908:16a2 with SMTP id
 n13-20020a170903110d00b00149a90816a2mr16078909plh.77.1641230669038; 
 Mon, 03 Jan 2022 09:24:29 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 f5sm40896020pfc.102.2022.01.03.09.24.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 09:24:28 -0800 (PST)
Message-ID: <299bf6ed-80e6-ad15-8dc7-5ededaca15c5@gmail.com>
Date: Mon, 3 Jan 2022 09:24:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 1/9] mtd: rawnand: brcmnand: Allow SoC to provide I/O
 operations
Content-Language: en-US
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
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220103174953.40d7fa52@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_092430_972202_24C94F28 
X-CRM114-Status: GOOD (  20.68  )
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



On 1/3/2022 8:49 AM, Miquel Raynal wrote:
> Hi Florian,
> 
> f.fainelli@gmail.com wrote on Wed, 22 Dec 2021 16:22:17 -0800:
> 
>> Allow a brcmnand_soc instance to provide a custom set of I/O operations
>> which we will require when using this driver on a BCMA bus which is not
>> directly memory mapped I/O. Update the nand_{read,write}_reg accordingly
>> to use the SoC operations if provided.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>   drivers/mtd/nand/raw/brcmnand/brcmnand.c | 14 ++++++++++++--
>>   drivers/mtd/nand/raw/brcmnand/brcmnand.h | 23 +++++++++++++++++++++++
>>   2 files changed, 35 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> index f75929783b94..7a1673b1b1af 100644
>> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> @@ -594,13 +594,18 @@ enum {
>>   
>>   static inline u32 nand_readreg(struct brcmnand_controller *ctrl, u32 offs)
>>   {
>> +	if (brcmnand_soc_has_ops(ctrl->soc))
>> +		return brcmnand_soc_read(ctrl->soc, offs);
>>   	return brcmnand_readl(ctrl->nand_base + offs);
>>   }
>>   
>>   static inline void nand_writereg(struct brcmnand_controller *ctrl, u32 offs,
>>   				 u32 val)
>>   {
>> -	brcmnand_writel(val, ctrl->nand_base + offs);
>> +	if (brcmnand_soc_has_ops(ctrl->soc))
>> +		brcmnand_soc_write(ctrl->soc, val, offs);
>> +	else
>> +		brcmnand_writel(val, ctrl->nand_base + offs);
>>   }
>>   
>>   static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
>> @@ -766,13 +771,18 @@ static inline void brcmnand_rmw_reg(struct brcmnand_controller *ctrl,
>>   
>>   static inline u32 brcmnand_read_fc(struct brcmnand_controller *ctrl, int word)
>>   {
>> +	if (brcmnand_soc_has_ops(ctrl->soc))
>> +		return brcmnand_soc_read(ctrl->soc, ~0);
>>   	return __raw_readl(ctrl->nand_fc + word * 4);
>>   }
>>   
>>   static inline void brcmnand_write_fc(struct brcmnand_controller *ctrl,
>>   				     int word, u32 val)
>>   {
>> -	__raw_writel(val, ctrl->nand_fc + word * 4);
>> +	if (brcmnand_soc_has_ops(ctrl->soc))
>> +		brcmnand_soc_write(ctrl->soc, val, ~0);
>> +	else
>> +		__raw_writel(val, ctrl->nand_fc + word * 4);
>>   }
>>   
>>   static inline void edu_writel(struct brcmnand_controller *ctrl,
>> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.h b/drivers/mtd/nand/raw/brcmnand/brcmnand.h
>> index eb498fbe505e..a3f2ad5f6572 100644
>> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.h
>> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.h
>> @@ -11,12 +11,19 @@
>>   
>>   struct platform_device;
>>   struct dev_pm_ops;
>> +struct brcmnand_io_ops;
>>   
>>   struct brcmnand_soc {
>>   	bool (*ctlrdy_ack)(struct brcmnand_soc *soc);
>>   	void (*ctlrdy_set_enabled)(struct brcmnand_soc *soc, bool en);
>>   	void (*prepare_data_bus)(struct brcmnand_soc *soc, bool prepare,
>>   				 bool is_param);
>> +	const struct brcmnand_io_ops *ops;
>> +};
>> +
>> +struct brcmnand_io_ops {
>> +	u32 (*read_reg)(struct brcmnand_soc *soc, u32 offset);
>> +	void (*write_reg)(struct brcmnand_soc *soc, u32 val, u32 offset);
>>   };
>>   
>>   static inline void brcmnand_soc_data_bus_prepare(struct brcmnand_soc *soc,
>> @@ -58,6 +65,22 @@ static inline void brcmnand_writel(u32 val, void __iomem *addr)
>>   		writel_relaxed(val, addr);
>>   }
>>   
>> +static inline bool brcmnand_soc_has_ops(struct brcmnand_soc *soc)
>> +{
>> +	return soc && soc->ops && soc->ops->read_reg && soc->ops->write_reg;
>> +}
>> +
>> +static inline u32 brcmnand_soc_read(struct brcmnand_soc *soc, u32 offset)
>> +{
>> +	return soc->ops->read_reg(soc, offset);
>> +}
>> +
>> +static inline void brcmnand_soc_write(struct brcmnand_soc *soc, u32 val,
>> +				      u32 offset)
>> +{
>> +	soc->ops->write_reg(soc, val, offset);
>> +}
>> +
> 
> It might be worth looking into more optimized ways to do these checks,
> in particular the read/write_reg ones because you're checking against
> some static data which cannot be optimized out by the compiler but
> won't change in the lifetime of the kernel.

I suppose I could add an addition if 
IS_ENABLED(CONFIG_MTD_NAND_BRCMNAND_BCMA) at the front of 
brcmnand_soc_has_ops(), would that address your concern or you have 
something else in mind?
--
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
