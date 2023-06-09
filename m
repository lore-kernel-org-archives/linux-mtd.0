Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06B1C7EE25
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jun 2023 19:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iRuENoltrIJkW9VeA+kZ5qez+FMkH3D5kBASkNgTiw=; b=vpdUS7thXIAL7YecRCEzV4sT9f
	ybWjapAK0Iy94c96kg8l/gMMWJEyu8Wdv7AOPWM39jzsUK6KlXwSgGRvHPO/lLysdtHQo1/q2yWsW
	Uxj3wjI9sPmjpYqClq98t00vRIhcTyFxk9iR3tds4y/cjfv5dQJwQfo0exE4ZV6eIWEt9Qgk6KEVG
	1CfMzPwL3QWinIaCQI4omb5b3DzzyeSjd84vJ5Rf47jX5LTQJkZHNod0YuCyVDYAKQAqyLGnu6qmo
	tZYMdTV1cVn52QBHhBhnWVTq8ECkdE1eO0U7uyvSABvhnfCplELbvwdxGGJXdW95WHiazEUrI7Vmf
	NrVmtLkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7hbA-00DyWb-1F;
	Fri, 09 Jun 2023 19:16:36 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7hb7-00DyUa-0L
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jun 2023 19:16:35 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-54290603887so859781a12.1
        for <linux-mtd@lists.infradead.org>; Fri, 09 Jun 2023 12:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1686338190; x=1688930190;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:from:to:cc:subject:date:message-id:reply-to;
        bh=GJHrmMGOWVcL3W8236/wHXo3NkpwyqZAea4MgphYylo=;
        b=EituXk9Go0nfuWg9Vpgmm3GyhsIwWzaEnYulVZFcFPCeW+wpaFGkqhgsBYwWCWCJrl
         FEZOzK8FSPsicM3ZeQ0wt3tBl/9j33vPU404zKxh2zV/rGfKS4rhH5hwof2JhYCdtvPL
         6lMx/iKXIMS5PDO7QlJl0bu7+27bCK9eRFJGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686338190; x=1688930190;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJHrmMGOWVcL3W8236/wHXo3NkpwyqZAea4MgphYylo=;
        b=AjgX3hyaAEcuzfzQMOevO/HLLyKZreYMajvr5uPNQ5juPm67JNgAUyVsaB7xeCvDjN
         Y3QYN8IM8KRYtohNtvg915j74BrjjJ6/vd8E60Q1DjdcvGJM9VWlHz5p/8kyuwJ+AFKf
         kSkxJUF8F+BwdECfNIhoKOGEuP8wVSRQkwYddb39PBTLUKnFUmelv6vGt3YU+MVdiTdP
         OsuI52kmu2bomSLeRYfM8N4MJWGriJbyRYUYdnkHGgs8BNoV3p3OZIAPtmHDkfhzPaXT
         6nsWeEE6wfWA5PMxUYfqwBBpUbcKZvMb8T/NQ7NJf7KqOnGUOQNECiGthrpvepb+Qlxu
         rSAA==
X-Gm-Message-State: AC+VfDzrYXUoX2tJj138KHCl78o7ebh8dFe3K1AtIrvySQQYkUc3o9My
	UFNp95ICcdr2d2dMoa8tU9XPAQ==
X-Google-Smtp-Source: ACHHUZ4TqoA7oBozwJMZHo8ruk9FGNowyHRbpkP4gBM2xG4+jQsKgha/VqBkdtIGSf20+/ONyWvL9w==
X-Received: by 2002:a17:902:b685:b0:1b1:a2c1:570e with SMTP id c5-20020a170902b68500b001b1a2c1570emr1331264pls.69.1686338189711;
        Fri, 09 Jun 2023 12:16:29 -0700 (PDT)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id u7-20020a170902e80700b001b25e9a76f4sm3609177plg.274.2023.06.09.12.16.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Jun 2023 12:16:28 -0700 (PDT)
Subject: Re: [PATCH 10/12] mtd: rawnand: brcmnand: Add BCMBCA read data bus
 interface
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
 Linux MTD List <linux-mtd@lists.infradead.org>, f.fainelli@gmail.com,
 rafal@milecki.pl, kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, anand.gore@broadcom.com, dregan@mail.com,
 kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
 dan.beygelman@broadcom.com, linux-kernel@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-arm-kernel@lists.infradead.org
References: <20230606231252.94838-1-william.zhang@broadcom.com>
 <20230606231252.94838-11-william.zhang@broadcom.com>
 <20230607102232.17c4a27b@xps-13>
 <7b393f47-4053-a8c7-f32e-3881d8130d80@broadcom.com>
 <20230608081821.1de5a50b@xps-13>
 <4ab08e3e-3be4-8b8b-6eb8-03a62337f46f@broadcom.com>
 <20230609103544.0f00f799@xps-13>
From: William Zhang <william.zhang@broadcom.com>
Message-ID: <3d3b471b-c555-ee1c-96d6-c04d76979e76@broadcom.com>
Date: Fri, 9 Jun 2023 12:16:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20230609103544.0f00f799@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_121633_147018_11804ECA 
X-CRM114-Status: GOOD (  45.19  )
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
Content-Type: multipart/mixed; boundary="===============8422704161139643113=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8422704161139643113==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000cb75bd05fdb734ee"

--000000000000cb75bd05fdb734ee
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Miquel,

On 06/09/2023 01:35 AM, Miquel Raynal wrote:
> Hi William,
> 
> william.zhang@broadcom.com wrote on Thu, 8 Jun 2023 12:10:06 -0700:
> 
>> On 06/07/2023 11:18 PM, Miquel Raynal wrote:
>>> Hi William,
>>>
>>> william.zhang@broadcom.com wrote on Wed, 7 Jun 2023 13:24:23 -0700:
>>>    
>>>> Hi Miquel,
>>>>
>>>> On 06/07/2023 01:22 AM, Miquel Raynal wrote:
>>>>> Hi William,
>>>>>
>>>>> william.zhang@broadcom.com wrote on Tue,  6 Jun 2023 16:12:50 -0700:
>>>>>     >>>> The BCMBCA broadband SoC integrates the NAND controller differently than
>>>>>> STB, iProc and other SoCs.  It has different endianness for NAND cache
>>>>>> data and ONFI parameter data.
>>>>>>
>>>>>> Add a SoC read data bus shim for BCMBCA to meet the specific SoC need
>>>>>> and performance improvement using the optimized memcpy function on NAND
>>>>>> cache memory.
>>>>>>
>>>>>> Signed-off-by: William Zhang <william.zhang@broadcom.com>
>>>>>> ---
>>>>>>
>>>>>>     drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c | 36 +++++++++++++++++
>>>>>>     drivers/mtd/nand/raw/brcmnand/brcmnand.c    | 44 ++++++++++++++-------
>>>>>>     drivers/mtd/nand/raw/brcmnand/brcmnand.h    |  2 +
>>>>>>     3 files changed, 68 insertions(+), 14 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c b/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c
>>>>>> index 7e48b6a0bfa2..899103a62c98 100644
>>>>>> --- a/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c
>>>>>> +++ b/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c
>>>>>> @@ -26,6 +26,18 @@ enum {
>>>>>>     	BCMBCA_CTLRDY		= BIT(4),
>>>>>>     };
>>>>>>     >> +#if defined(CONFIG_ARM64)
>>>>>> +#define ALIGN_REQ		8
>>>>>> +#else
>>>>>> +#define ALIGN_REQ		4
>>>>>> +#endif
>>>>>> +
>>>>>> +static inline bool bcmbca_nand_is_buf_aligned(void *flash_cache,  void *buffer)
>>>>>> +{
>>>>>> +	return IS_ALIGNED((uintptr_t)buffer, ALIGN_REQ) &&
>>>>>> +				IS_ALIGNED((uintptr_t)flash_cache, ALIGN_REQ);
>>>>>> +}
>>>>>> +
>>>>>>     static bool bcmbca_nand_intc_ack(struct brcmnand_soc *soc)
>>>>>>     {
>>>>>>     	struct bcmbca_nand_soc *priv =
>>>>>> @@ -56,6 +68,29 @@ static void bcmbca_nand_intc_set(struct brcmnand_soc *soc, bool en)
>>>>>>     	brcmnand_writel(val, mmio);
>>>>>>     }
>>>>>>     >> +static void bcmbca_read_data_bus(struct brcmnand_soc *soc,
>>>>>> +				 void __iomem *flash_cache,  u32 *buffer,
>>>>>> +				 int fc_words, bool is_param)
>>>>>> +{
>>>>>> +	int i;
>>>>>> +
>>>>>> +	if (!is_param) {
>>>>>> +		/*
>>>>>> +		 * memcpy can do unaligned aligned access depending on source
>>>>>> +		 * and dest address, which is incompatible with nand cache. Fallback
>>>>>> +		 * to the memcpy for io version
>>>>>> +		 */
>>>>>> +		if (bcmbca_nand_is_buf_aligned(flash_cache, buffer))
>>>>>> +			memcpy((void *)buffer, (void *)flash_cache, fc_words * 4);
>>>>>> +		else
>>>>>> +			memcpy_fromio((void *)buffer, (void *)flash_cache, fc_words * 4);
>>>>>> +	} else {
>>>>>> +		/* Flash cache has same endian as the host for parameter pages */
>>>>>> +		for (i = 0; i < fc_words; i++, buffer++)
>>>>>> +			*buffer = __raw_readl(flash_cache + i * 4);
>>>>>> +	}
>>>>>> +}
>>>>>> +
>>>>>>     static int bcmbca_nand_probe(struct platform_device *pdev)
>>>>>>     {
>>>>>>     	struct device *dev = &pdev->dev;
>>>>>> @@ -75,6 +110,7 @@ static int bcmbca_nand_probe(struct platform_device *pdev)
>>>>>>     >>   	soc->ctlrdy_ack = bcmbca_nand_intc_ack;
>>>>>>     	soc->ctlrdy_set_enabled = bcmbca_nand_intc_set;
>>>>>> +	soc->read_data_bus = bcmbca_read_data_bus;
>>>>>>     >>   	return brcmnand_probe(pdev, soc);
>>>>>>     }
>>>>>> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>>>>> index d920e88c7f5b..656be4d73016 100644
>>>>>> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>>>>> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>>>>> @@ -814,6 +814,30 @@ static inline u32 edu_readl(struct brcmnand_controller *ctrl,
>>>>>>     	return brcmnand_readl(ctrl->edu_base + offs);
>>>>>>     }
>>>>>>     >> +static inline void brcmnand_read_data_bus(struct brcmnand_controller *ctrl,
>>>>>> +					   void __iomem *flash_cache, u32 *buffer,
>>>>>> +					   int fc_words, bool is_param)
>>>>>> +{
>>>>>> +	struct brcmnand_soc *soc = ctrl->soc;
>>>>>> +	int i;
>>>>>> +
>>>>>> +	if (soc->read_data_bus) {
>>>>>> +		soc->read_data_bus(soc, flash_cache, buffer, fc_words, is_param);
>>>>>> +	} else {
>>>>>> +		if (!is_param) {
>>>>>> +			for (i = 0; i < fc_words; i++, buffer++)
>>>>>> +				*buffer = brcmnand_read_fc(ctrl, i);
>>>>>> +		} else {
>>>>>> +			for (i = 0; i < fc_words; i++)
>>>>>> +				/*
>>>>>> +				 * Flash cache is big endian for parameter pages, at
>>>>>> +				 * least on STB SoCs
>>>>>> +				 */
>>>>>> +				buffer[i] = be32_to_cpu(brcmnand_read_fc(ctrl, i));
>>>>>> +		}
>>>>>> +	}
>>>>>
>>>>> Perhaps we could have a single function that is statically assigned at
>>>>> probe time instead of a first helper with two conditions which calls in
>>>>> one case another hook... This can be simplified I guess.
>>>>>     >> Well this will need to be done at the SoC specific implementation level (bcm<xxx>_nand.c) and each SoC will need to have either general data bus read func with is_param option or data_bus_read_page, data_bus_read_param.
>>>
>>> You told me in case we would use exec_op we could avoid the param
>>> cache. If that's true then the whole support can be simplified.
>>>    
>> Correct we may possibly unified the parameter data read but exec_op is long shot and we are not fully ready for that yet. It also depends on if the low level data register has endianess difference for the parameter data between difference SoCs.
>>
>> So I would like to push the current implementation and we can explore the exec_op option late which will be a much big and complete different implementation.
> 
> I am sorry but this series is totally backwards, you're trying to guess
> what comes next with the 'is_param' thing, it's exactly what we are
> fighting against since 2017. There are plenty of ->exec_op()
> conversions out there, I don't believe this one will be harder. You
> need to convert the driver to this new API and get rid of this whole
> endianness non-sense to simplify a lot the driver.
> 
I am not guessing anything but just factor out the existing common nand 
cache read logic into the single default function(or one for page read 
and another for parameter read as I mentioned in another thread) and 
allow SoC to overrides the implementation when needed.

I agree ->exec_op can possibly get rid of the parameter page read 
function and is the way to go. But it won't help on the page read for 
endianess. It's not that I am against exec_op but I want to take one 
step a time and I'd like to get these fixes and support for bcmbca soc 
first and then work on the exec_op API to minimize the change and reduce 
the risk.

>>
>>>>    Not sure how much this can be simplified... Or we have default
>>>> implementation in brcmnand.c but then there is one condition check
>>>> too. Page read is done at 512 bytes burst. One or two conditions
>>>> check outside of the per 512 bytes read loop does not sounds too bad
>>>> if performance is concern.
>>>
>>> It is unreadable. That is my main concern.
>>>    
>>>>   
>>>>>> +}
>>>>>> +
>>>>>>     static void brcmnand_clear_ecc_addr(struct brcmnand_controller *ctrl)
>>>>>>     {
>>>>>>     >> @@ -1811,20 +1835,11 @@ static void brcmnand_cmdfunc(struct nand_chip *chip, unsigned command,
>>>>>>     			native_cmd == CMD_PARAMETER_CHANGE_COL) {
>>>>>>     		/* Copy flash cache word-wise */
>>>>>>     		u32 *flash_cache = (u32 *)ctrl->flash_cache;
>>>>>> -		int i;
>>>>>>     >>   		brcmnand_soc_data_bus_prepare(ctrl->soc, true);
>>>>>>     >> -		/*
>>>>>> -		 * Must cache the FLASH_CACHE now, since changes in
>>>>>> -		 * SECTOR_SIZE_1K may invalidate it
>>>>>> -		 */
>>>>>> -		for (i = 0; i < FC_WORDS; i++)
>>>>>> -			/*
>>>>>> -			 * Flash cache is big endian for parameter pages, at
>>>>>> -			 * least on STB SoCs
>>>>>> -			 */
>>>>>> -			flash_cache[i] = be32_to_cpu(brcmnand_read_fc(ctrl, i));
>>>>>> +		brcmnand_read_data_bus(ctrl, ctrl->nand_fc, flash_cache,
>>>>>> +				   FC_WORDS, true);
>>>>>>     >>   		brcmnand_soc_data_bus_unprepare(ctrl->soc, true);
>>>>>>     >> @@ -2137,7 +2152,7 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
>>>>>>     {
>>>>>>     	struct brcmnand_host *host = nand_get_controller_data(chip);
>>>>>>     	struct brcmnand_controller *ctrl = host->ctrl;
>>>>>> -	int i, j, ret = 0;
>>>>>> +	int i, ret = 0;
>>>>>>     >>   	brcmnand_clear_ecc_addr(ctrl);
>>>>>>     >> @@ -2150,8 +2165,9 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
>>>>>>     		if (likely(buf)) {
>>>>>>     			brcmnand_soc_data_bus_prepare(ctrl->soc, false);
>>>>>>     >> -			for (j = 0; j < FC_WORDS; j++, buf++)
>>>>>> -				*buf = brcmnand_read_fc(ctrl, j);
>>>>>> +			brcmnand_read_data_bus(ctrl, ctrl->nand_fc, buf,
>>>>>> +					FC_WORDS, false);
>>>>>> +			buf += FC_WORDS;
>>>>>>     >>   			brcmnand_soc_data_bus_unprepare(ctrl->soc, false);
>>>>>>     		}
>>>>>> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.h b/drivers/mtd/nand/raw/brcmnand/brcmnand.h
>>>>>> index f1f93d85f50d..88819bc395f8 100644
>>>>>> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.h
>>>>>> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.h
>>>>>> @@ -24,6 +24,8 @@ struct brcmnand_soc {
>>>>>>     	void (*ctlrdy_set_enabled)(struct brcmnand_soc *soc, bool en);
>>>>>>     	void (*prepare_data_bus)(struct brcmnand_soc *soc, bool prepare,
>>>>>>     				 bool is_param);
>>>>>> +	void (*read_data_bus)(struct brcmnand_soc *soc, void __iomem *flash_cache,
>>>>>> +				 u32 *buffer, int fc_words, bool is_param);
>>>>>>     	const struct brcmnand_io_ops *ops;
>>>>>>     };
>>>>>>     > >
>>>>> Thanks,
>>>>> Miquèl
>>>>>     > >
>>> Thanks,
>>> Miquèl
>>>    
> 
> 
> Thanks,
> Miquèl
> 

--000000000000cb75bd05fdb734ee
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
YDZuuBJwnyCzevMoPtVYPharioL5H3BRnQi8YoTXH7/uRo33dewYFm474yFjwwnt82TFtveVZkVq
6h4WIQ4wTcwFfET8zMkELnGzS5SHCl8sPD+lNxxJ1JDZYwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUq65GzwZxydFHjjYEU/9h
xHhPWlwwDQYJKoZIhvcNAQELBQADggEBAA2hGG3JPAdGPH0ZdohGUCIVjKz+U+EFuIDbS6A/5jqX
VhYAxZlzj7tSjUIM7G7IhyfqPC46GKJ/4x+Amz1Z6YxNGy71L68kYD6hIbBcA5AM42QBUufly6Oa
/ppSz3WoflVyFFQ5YXniZ+eU+2/cdnYZg4aVUnFjimOF5o3NfMLzOkhQNxbaDjFUfUYD8hKmU6v4
0vUBj8KZ9Gi1LIagLKUREn8jku0lcLsRbnJ5Ey5ScajC/FESPyYWasOW8j8/1EoJksmhbYGKNS6C
urb/KlmDGfVrIRYDbL0ckhGQIP5c6L+kSQZ2sHnQK0e0WgIaZYxaPYeY5u0GLCOze+3vyRMxggJt
MIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwxuh2XG3FXRL1W
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIB3qD3RctSH5c/4UMl0cYrKiy5Jc
WkphpUuudWZHGEahMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIz
MDYwOTE5MTYzMFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQAXp8gofpm06qzu95gAfJCBm12S35gfHDpet1fQ9qjCWaVQ
9ik7FoK/yu8ekm3YgJ2ra5hEhKf27Lulwd0ZWKAE4mDwx9MTmYn59VYPPQxhYo2CyYnD6JPjXP2l
TBR9WpoCj9TrpQ+g8op0+N7O0wmcU3XKzem1UNGc6CJaKtCbx6v23E6I9Olirl3J+V7uO7agnFjm
hS8iuIfKYoEgLYDioL/TVX+mAXXcY1k77zwQWYxnCXT0Yg38hLBBxdW9M/oI5pIdMtZBzImahPyX
MDdsLsPoRnor1Xc1BKJiLchj0NIZ51gWrKBF93L49HIDngpjiqUK0/8Oo3ab0UXlkbcs
--000000000000cb75bd05fdb734ee--


--===============8422704161139643113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8422704161139643113==--

