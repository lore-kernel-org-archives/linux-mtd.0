Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C67C00140
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Aug 2022 08:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SlHIPWiYVGS7Wsy8BC5KDe4VTvs5w783gPqwI/RbOM8=; b=KNuRHv5mfj5MoY
	ckWGiA8FCtWiwUd9u3qyDSv9MsSsOlKpMYcBrp0T4wr7AZqosFHYXxnsh9eKPI1WXM/FllF/i8gHm
	6CQndpRdaAtHSwVJhxbEDlfs1UPJ6UT8QZGXo7s7wZNpG4+2o+Uhopb4Tqaq5UAq+IH6vkuI1KuRb
	JzIVH1AGcTulmjpwgFXzoyzWSgIfeoeqTu7ePq5lB5nS4tO2w5y4G1gvCYuyWXoxOy52eGxfr/SOn
	ABxrK2CasUQ170nW0k23znRRg0XrEzsu3YH1LacNpWnFSBMQtCfEwXXhfl04XiOIrKraCH4fYaPRV
	oA5LekL0OBe+WWvWSSOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKyAr-00CQJQ-TQ; Mon, 08 Aug 2022 08:31:45 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKyAp-00CQI8-FP
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2022 08:31:45 +0000
Received: by mail-pl1-x629.google.com with SMTP id 17so7894932plj.10
        for <linux-mtd@lists.infradead.org>; Mon, 08 Aug 2022 01:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=c8gAl6Eww26c5r0M/LtxOgCbhskgjvSEwNozOedtd8g=;
        b=GDmB3wTfIIrvCk3VtSdtF//Dk/ZRUJvJfIF9pj3jYC6Gj3RmHPxM6C+/NLMYvkOSwg
         Ye8A9lSRa865iJ21VZKRNZeV/uTHQNqRn/Bi0z5dOes51Sgo0lVEz2iQ7N2Qb+kuO53v
         WXNWImsWKfZGe+toGChJnr3qZqq86M8nPUnaiU1VYR/3erdQZU+1BBSJKwNuF9fQyvm7
         mhB/eZf1eTGu1mJlmQ38wTEloulU9FC5GUpgLAe+42bgYwyaL2evpt/VqbzMRjZ7dF/7
         I6yYDPp11/R9PerqnoEmoRycaSDfg48a3H6P4Wd6R/mGrQTjp4XTuaroeybIuw1DjTKB
         FYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=c8gAl6Eww26c5r0M/LtxOgCbhskgjvSEwNozOedtd8g=;
        b=QUnszmpYIW1NS8ufetw8bcH8H39fXm8YnzL3vWqJnhWfMH/eD4cnJg4hb0dWyz6OT/
         0/crafpHUGdxYNr1NqYidJwxqZ4DA21hWOeF+NzW6aoMkWsjXqtwKuzL+OD952O68ruW
         7f9xcyCXCU3eHhXmEtBigMiK48F6NktVjwJafiuI7tpqJWyuPuV/45Soli2eE8SVKpCH
         77imzNu4tw3gCHWM8HPD5dkkzvOiiolSiORXmiS3j86gPWar0d2ibIM13Yx1mHEafttt
         W07dDxTW1wklIZqfu72hWz4Ull73gaKMe9q23o5mYrZqP9VmYg4cHzgIGfMrOwWog1B4
         oyMw==
X-Gm-Message-State: ACgBeo0gnslycoO6ZuenqjTBJCewN1Sl/szd2Syw0ElAT5WCsSxoGbpJ
	08vS5q23oatIZbTZp4CZ/2U=
X-Google-Smtp-Source: AA6agR6S34kkRtyS/vib9NxRpJu/9OnrSPnAg5PdZtzLx2jCjLUrALyZV9pWAaS+w8FDAfvLObfD4w==
X-Received: by 2002:a17:90a:a416:b0:1f7:3b5f:1cd1 with SMTP id y22-20020a17090aa41600b001f73b5f1cd1mr7531303pjp.216.1659947502402;
        Mon, 08 Aug 2022 01:31:42 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id l37-20020a635b65000000b0041bcd8f3958sm5785484pgm.44.2022.08.08.01.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 01:31:42 -0700 (PDT)
Message-ID: <aa5ac961-7943-2a56-2994-b45de983d55e@gmail.com>
Date: Mon, 8 Aug 2022 17:31:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 8/8] mtd: spi-nor: spansion: Add support for Infineon
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro.Kuwano@infineon.com
References: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
 <e47ed0aa3e1a6fdca7689434ce7dea99ff4826e7.1659764848.git.Takahiro.Kuwano@infineon.com>
 <d470b67d-00bb-7065-ec18-ee00616c5b7e@microchip.com>
 <ecf3906e-a3c4-328e-09b8-1e801896ce81@gmail.com>
 <80b5e707-23b3-e357-c7ae-f78b6c75f2f6@microchip.com>
 <4a182200-cff3-94e7-12a3-379638a52560@gmail.com>
 <43b898eb-cb2a-d905-fba5-cdf707978af7@microchip.com>
 <6ae143ef-5115-280d-52a2-8081c08bddf7@gmail.com>
 <7c67ed6d-584f-61fd-a532-b7ff00a6a39f@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <7c67ed6d-584f-61fd-a532-b7ff00a6a39f@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_013143_567328_EF0C1835 
X-CRM114-Status: GOOD (  20.43  )
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

On 8/8/2022 5:26 PM, Tudor.Ambarus@microchip.com wrote:
> On 8/8/22 11:09, Takahiro Kuwano wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 8/8/2022 4:34 PM, Tudor.Ambarus@microchip.com wrote:
>>> On 8/8/22 09:41, Takahiro Kuwano wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> On 8/8/2022 3:08 PM, Tudor.Ambarus@microchip.com wrote:
>>>>> On 8/8/22 08:42, Takahiro Kuwano wrote:
>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>
>>>>>> On 8/8/2022 1:47 PM, Tudor.Ambarus@microchip.com wrote:
>>>>>>> On 8/6/22 09:34, tkuw584924@gmail.com wrote:
>>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>>>
>>>>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>>>
>>>>>>> Hi!
>>>>>>>
>>>>>>>>
>>>>>>>> s25hl02gt and s25hs02gt
>>>>>>>>
>>>>>>>> Add ID, flags, and fixup for s25hl02gt and s25hs02gt.
>>>>>>>> These parts are
>>>>>>>>   - Dual-die package parts
>>>>>>>>   - Not support chip erase
>>>>>>>>   - 4-byte addressing mode by default
>>>>>>>
>>>>>>> CFR2N[7] CFR2V[7] says that: "For the DDP or QDP devices, if ADRBYT = 0
>>>>>>> only the first 128 Mb of die 1 can be accessed."
>>>>>>> So there are flashes of the same family that are by default in 3 byte address
>>>>>>> mode. You added support just for a subset of them and used a generic name,
>>>>>>> which is not accurate, right?
>>>>>>>
>>>>>> We added model #15 (3-byte address mode by default) to address special
>>>>>> requirement from a customer who needs to use bootrom with 3-byte addressing.
>>>>>> Anyway, I overlooked model # difference. Thanks for pointing out this.
>>>>>>
>>>>>>> Can we instead make an algorithm to determine the current address mode?
>>>>>>>
>>>>>> I have just found that we can distinguish model # via BFPT DWORD16.
>>>>>> If Hardware reset, Software reset, or Power cycle can exit 4-byte address
>>>>>> mode, that means the device is 3-byte address mode by default.
>>>>>
>>>>> I don't think this will help us. It doesn't matter the default mode if you
>>>>> have a non volatile register that can be updated and changes the default
>>>>> mode.
>>>>>
>>>>> Are there any registers/data that can be read successively in 3 byte addr mode
>>>>> and then in 4 byte addr mode? We'll then compare what we receive from the flash
>>>>> with a known value and determine the mode.
>>>>>
>>>> As we discussed before [0], if address mode in the controller and device are
>>>
>>> I remember, yes, but without determining the mode, the driver will work only
>>> with flashes that come with the factory settings. The driver will be unusable
>>> if someone changes the address mode in a non volatile way, right?
>>>
>> Yes, right.
>>
>>>> different, the read data will be undetermined.
>>>>
>>>> But if we really want...
>>>> Compare SR1 data read by RDSR1(05h - No Addr) and RDAR(65h - Addr 0).
>>>> In most cases (without block protection), SR1=00h. The value of 00h would be
>>>> awkward to determine if this is 'real' output from Flash or not. So, use> WREN(06h) and WRDI(04h) that flips BIT(1) in SR1.
>>>
>>> Would be good to have more fixed/OPT-like bits, or if we could change more bits
>>> to increase the chances to not hit just some undetermined data.
>>>>
>>>> Therefore, something like:
>>>> 1) RDSR1
>>>> 2) RDAR with 3-byte addr (000000h)
>>>> 3) If #1 == #2
>>>>         4) WREN
>>>>         5) RDAR with 3-byte addr (000000h)
>>>>         6) BIT(1) is SR1==1?
>>>>         ...
>>>>
>>>> Or simply WREN -> RDAR -> WRDI -> RDAR then check if only BIT(1) is toggled.
>>>
>>> Both may work, yes, but making the assumption on only one bit is fragile.
>>> Can we use the Read Any Register Command with 3 and 4 byte address modes and
>>> compare the values? Are there any registers with fixed values?
>>>
>> Register values can vary because it's register:)
>>
>> So... let's use Data Integrity Check CRC registers. These registers do not
>> have fixed values but we can calculate expected values by offline. Read
>> several bytes (>=4) from Flash array with Read(03h) then calculate CRC by
>> crc32(). Issue Data integrity Check command (5Bh) followed by start and
>> end address (4-byte for each), wait till ready. Read calculated CRC by
>> Read Any Register in 3 and 4 byte address (00800095h~0080098h) then compare
>> the crc32() result and register read result.
> 
> Much better, yes. I think it is worth it. What's your opinion, Takahiro?
> Others, Michael, Pratyush?
> 
OK, I will prototype and test it.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
