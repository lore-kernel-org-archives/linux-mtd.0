Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6B3C27C53
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Jun 2024 18:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D4ssgyoV4VnI/aERDKT63J2LbqaDdM7/3ps36cmAYHg=; b=oVCKUIjpV4Eg+Y
	fH3k9oMsoftNLk8UsSpOGaH6yBMw8oKEh64YIV1q6BgrK5ZXGi/e1zO13bkdWhIOHV8ZHsUw6Iv5t
	efjpxtozpU6fOznNBN8MWKKsbctBSgDTuW+ak5VkBZ38MO5q5OcCcwG7HjShXvCGcPOLU3AXw46b7
	yoXUsLBJRcsW93x3fRQzz7kFh4fEiO9hkSTbdnAK9wP73uNY/CGMCn6nYdal4txih/VJpaJ9QI3F1
	o1IexQ1rGVF3dPOURedSMLQf9El7ATjG1/769hOWVhOEJjqcSOGULi8rv1GWsSQJVIoJIg1n/WQzz
	NHwchUw8yp1FY1JdCHzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGNFD-0000000325o-04mA;
	Sun, 09 Jun 2024 18:26:19 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGNF7-00000003245-2ZYF
	for linux-mtd@lists.infradead.org;
	Sun, 09 Jun 2024 18:26:16 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2eaa89464a3so41306661fa.3
        for <linux-mtd@lists.infradead.org>; Sun, 09 Jun 2024 11:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717957569; x=1718562369; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6jYXHIl4X/fFrcwE1E22PKz6tJ3f1kNfe1DYhxjLu4Y=;
        b=EmYdnf39WeBieFaFeIZ20yABVwjJG8jY2NVL12qde8SVxl0SWf14VPsbSgwZaXzLSp
         6Uaxs4+AU1jO4rfb9A/fz2vMapXs+hQJSBtjLUH1O68+1C5SzDJlpMc57riNzdsmbxnP
         msCqdS2JcGtaNxzJn5OuRNgK+0Y2wK3JYLzfUWTGl/vPqSO/USi40HpCBQ4oaeRh/jHI
         Dyj3+DHkz4otfZt6UFZFzumjyQqebQSCtaEs6n4GU1tXntO/txZ4yk4RxUWqUkYPDyAW
         tYHT/XHCFPFft/H1eS7vj/C0zN/5OqF3UeyCPu+hJlDr3L73X5J076vB2bLuRrnbuXp8
         68qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717957569; x=1718562369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6jYXHIl4X/fFrcwE1E22PKz6tJ3f1kNfe1DYhxjLu4Y=;
        b=iUPo28C4OvGk8UEP3EEtbBunaqtXPErwm0YwJ5RvttEO2dbr6yTMKiz1IwsbNIM9IN
         xgRPhcN3DPJmetrKMchNo9k2xJgBps3pfv2p+/aDKPK3Wvzf3lXzkE5Edp4VG3Xb5qIO
         WGgq8IDFAINXygIxr27ks3v3ghBqV8l+6ivXH/fIP9ZaBeQ2/JzeLnI2/JE3zPIBnpg6
         oogsGCbwpuR6p+YRVPLPdjmS/Wwhv2t0PgpT+ySskKGBxjyKfMUWM2jwEQilxBMKrHdg
         TzqltAFEpCNEoy/7BcVbchmFLq+PMTeJS1zaMYASGAjN0aH8Wx9/5UBfCjH6m+rhRnHP
         ix+w==
X-Gm-Message-State: AOJu0Ywf/34j/yPOiN78rVD6X01OR5qYCtDEtjggSLlBzfxFeKWepSrm
	q5VEuyEFin81QO1hAL6R8hs5TRtu7cD/KPkciSvVdxi7E/67cuGUqQJ5BMz0
X-Google-Smtp-Source: AGHT+IFs3etRxtn7UNFzqHKwFfwjEj02oU9dIOA7o97HWu/Mq/LHwprGybTgEye23Kai4DMV07ZBDQ==
X-Received: by 2002:a2e:8753:0:b0:2eb:dbc9:6464 with SMTP id 38308e7fff4ca-2ebdbc96512mr18959331fa.13.1717957568897;
        Sun, 09 Jun 2024 11:26:08 -0700 (PDT)
Received: from localhost (p200300f667069eacf4db0784c08de476.dip0.t-ipconnect.de. [2003:f6:6706:9eac:f4db:784:c08d:e476])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ead41db5basm12330291fa.129.2024.06.09.11.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jun 2024 11:26:08 -0700 (PDT)
Message-ID: <194d6f02-bd70-489d-b883-d7677b6f87b3@gmail.com>
Date: Sun, 9 Jun 2024 20:26:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Definition for flash w25q128 is wrong
To: Esben Haabendal <esben@geanix.com>, Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
References: <CALxbwRo_-9CaJmt7r7ELgu+vOcgk=xZcGHobnKf=oT2=u4d4aA@mail.gmail.com>
 <D1TNAMAIIHAF.1QD3BI5DZTZBF@walle.cc> <87y17h0ygd.fsf@geanix.com>
Content-Language: en-GB, de-DE
From: e9hack <e9hack@gmail.com>
In-Reply-To: <87y17h0ygd.fsf@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240609_112613_693398_8BC41286 
X-CRM114-Status: GOOD (  26.27  )
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

Am 07.06.2024 um 13:44 schrieb Esben Haabendal:
> "Michael Walle" <michael@walle.cc> writes:
> 
>> On Thu Jun 6, 2024 at 9:50 PM CEST, e9hack wrote:
>>> I'm using a TP-LINK WDR3600 with a bigger flash. Since some time the
>>> router hangs in an endless boot loop. I see the following message:
>>>
>>> ...
>>> [    0.402716] spi-nor spi0.0: BFPT parsing failed. Please consider
>>> using SPI_NOR_SKIP_SFDP when declaring the flash
>>
>> Looks like your flash doesn't support SFDP. Relevant threads are:
>> https://lore.kernel.org/r/d99d87e7-47ba-d6fe-735f-16de2a2ec280@linaro.org/
>> https://lore.kernel.org/r/20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com/
>>
>>> [    0.413217] spi-nor: probe of spi0.0 failed with error -22
>>> ...
>>> [    0.926180] /dev/root: Can't open blockdev
>>> [    0.930427] VFS: Cannot open root device "(null)" or
>>> unknown-block(0,0): error -6
>>> [    0.938037] Please append a correct "root=" boot option; here are
>>> the available partitions:
>>> [    0.946520] Kernel panic - not syncing: VFS: Unable to mount root
>>> fs on unknown-block(0,0)
>>> [    0.954914] Rebooting in 1 seconds..
>>>
>>> It looks like the definition for the flash is wrong:
>>>
>>> --- a/drivers/mtd/spi-nor/winbond.
>>> c     2024-03-15 19:27:50.000000000 +0100
>>> +++ b/drivers/mtd/spi-nor/winbond.c     2024-04-01 05:59:17.166780732 +0200
>>> @@ -120,8 +120,8 @@ static const struct flash_info winbond_n
>>>                  NO_SFDP_FLAGS(SECT_4K) },
>>>          { "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16)
>>>                  NO_SFDP_FLAGS(SECT_4K) },
>>> -       { "w25q128", INFO(0xef4018, 0, 0, 0)
>>> -               PARSE_SFDP
>>> +       { "w25q128", INFO(0xef4018, 0, 64 * 1024, 256)
>>> +               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>>>                  FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>>>          { "w25q256", INFO(0xef4019, 0, 64 * 1024, 512)
>>>                  NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>>>
>>> With these changes, the flash will be detected properly. The chip is
>>> marked with:
>>> The chip (SOIC8) is marked with:
>>> winbond
>>> 25Q128FVSG
>>> 1327
>>>
>>> I use another TP-LINK router. This is an Archer C7 v2. It has the same
>>> flash chip with date code 1528. This router doesn't have this issue.
>>
>> Looks like some of these flashes support SFDP and some don't :/

Related to the spec
	https://www.winbond.com/hq/support/documentation/levelOne.jsp?__locale=en&DocNo=DA00-W25Q128FV
chapter 8.2.30, older flashes don't support SFDP. Newer flashes may support SFDP. From my two versions, one doesn't support SFDP, the other does support it.

> 
> Which means that for those (old) flashes without SFDP was broken by
> 83e824a4a595 ("mtd: spi-nor: Correct flags for Winbond w25q128").
> 
> During patch review, the following was said:
> 
>>>> while here try, using INFO with INFO(0xef4018, 0, 0, 0), those
>>>> parameters shall be discovered at run-time, so we prepare to get rid of
>>>> explicitly setting them sooner or later.
>>>
>>> This is an entry matching various flash families from Winbond, see my
>>> reply in v1. I'm not sure we should remove these as we could break the
>>> older ones, which might or might not have SFDP tables. We don't know.
>>
>> I'd take the risk and break the older ones if there are some that don't
>> define SFDP indeed, just to handle the conflict properly. We can't
>> encourage code based on assumptions otherwise we'll get back to the
>> knotted spi-nor code that we tried to untie in the last years.
> 
> I guess it is not an assumption anymore. There are flashes out there
> with this jedec id which does not have SFDP tables.
> 
> So while parsing SFDP is good, keeping a fallback to some known "good"
> values are needed. Something similar to what we are discussing in
> https://lore.kernel.org/all/20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com/
> 
> /Esben


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
