Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298DFC00140
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Aug 2022 08:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5TL0CPd/Kmpg/yy0JJo7g+1xgcHUfpl8i88KNz6qLCI=; b=H6hgwojiyDGeYo
	R5q3R1jH1mE9KhHawUGV0KsKhMkJkvNE09LdEFQw88dZsWogI9IBqaKUuPa6Mic1xOCZnwnGqdTt+
	wob9qV43IsAZsFz4Yfn/6BpNT1nufNyz7ZGSlG0WYzLRHxsPqVGcxWzKzKEFDUYNKw6hNry8seq6h
	0Xob6qB08WqluUxkVaQ88b3kurhccKeBPGAsvZaBMclB0TmwipPq2KSlUSr4HDxRwomQoyzBd5rqg
	fB0aR+X/z7jcP3xhCHScjpE9eoV6+ayfjQdY+mrkAjYHezvJQJGZJ78Kp5xzbwNRg1X7qZoQlJlgp
	LBhkfqCQcGLE8RizYhMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxpu-00CKQo-TF; Mon, 08 Aug 2022 08:10:07 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxpr-00CKO9-KY
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2022 08:10:05 +0000
Received: by mail-pl1-x62a.google.com with SMTP id 13so6444824plo.12
        for <linux-mtd@lists.infradead.org>; Mon, 08 Aug 2022 01:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=DuwDpaL4DhoBxDZACmx1BV9GisG3J+QlMuqmMQ0a3fk=;
        b=MtWXNtHjv03k16EpHsMB7Ve7hBuD+sJgoTOGT+Hr/qqyBBTRseT6jgCJKYxiZ005tQ
         eOfjmLzA/rbZ8KM0a78i45jhaabmmAKR7cUb3EcARSlviV5vQftMZb7VXyglM0vexWDZ
         bxylz6NWQPT2oOl9rEPPhdnu8lueo0rzz7KLc9qFlSiO4ZGHVpzbaoNtgJysO7Y8ReSI
         oky9fcaOsY44dL4lbnTmyqAovYLXlZE9YeRyIYdZU5Q5wEXhINoFEqWpZbBYB7+vmhyz
         5NfPDvow0e7FB2bPI8YjjI47FPenzYH7KeA2nDcLuLKP49TsoedILsho1Ph+0ORdIQma
         5cxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=DuwDpaL4DhoBxDZACmx1BV9GisG3J+QlMuqmMQ0a3fk=;
        b=s4QdgFZuaYTeTPXFJed2pAL+lOskheUpz7POVYOIk/QByqPohtna/kCP/FioWMMFtw
         yUvc+u59Bx3GPkpIeRrMHwcgNUMDFCl+rwlYO1oyQzXQIBYt+aH1Bb5KrpofD5DdZhs/
         lSx1DRQfTex+KvkUZTHVa4jAlK5QO54msibaovpwASMvec85p7jvJi+k7r5WqVAU0z7e
         sf5Pz6zuIctwfwOWfje4uXe5hRdDGHxUKgUSfysmXeq3sSMxJV7UhVuvHOtm931iU0Gt
         lc93wSi941VPxYmCwmsXp0o0DeYMjRb+FvG0NSb4qJoqV3MP3I4+q66Tw5VmutjuO3qG
         9YDQ==
X-Gm-Message-State: ACgBeo1fK9n/jPJbLtITKfaJvv8ktvngXbT4/5nFd70rzwsNEkso3z+R
	wKuaC7OV2yAmlf7WQ9aqekQ=
X-Google-Smtp-Source: AA6agR5Pxnbiq9bm5o7dpPLP6ncAKufYPl2btta8wwJd4co48l26homuCLa5vpsYF+838uosL4rBjA==
X-Received: by 2002:a17:90b:38c6:b0:1f7:35d8:26e2 with SMTP id nn6-20020a17090b38c600b001f735d826e2mr8432330pjb.168.1659946201675;
        Mon, 08 Aug 2022 01:10:01 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id v68-20020a626147000000b0052f39a877d8sm2246072pfb.65.2022.08.08.01.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 01:10:01 -0700 (PDT)
Message-ID: <6ae143ef-5115-280d-52a2-8081c08bddf7@gmail.com>
Date: Mon, 8 Aug 2022 17:09:58 +0900
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
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <43b898eb-cb2a-d905-fba5-cdf707978af7@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_011003_769126_BECEFD22 
X-CRM114-Status: GOOD (  24.00  )
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

On 8/8/2022 4:34 PM, Tudor.Ambarus@microchip.com wrote:
> On 8/8/22 09:41, Takahiro Kuwano wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 8/8/2022 3:08 PM, Tudor.Ambarus@microchip.com wrote:
>>> On 8/8/22 08:42, Takahiro Kuwano wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> On 8/8/2022 1:47 PM, Tudor.Ambarus@microchip.com wrote:
>>>>> On 8/6/22 09:34, tkuw584924@gmail.com wrote:
>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>
>>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>
>>>>> Hi!
>>>>>
>>>>>>
>>>>>> s25hl02gt and s25hs02gt
>>>>>>
>>>>>> Add ID, flags, and fixup for s25hl02gt and s25hs02gt.
>>>>>> These parts are
>>>>>>   - Dual-die package parts
>>>>>>   - Not support chip erase
>>>>>>   - 4-byte addressing mode by default
>>>>>
>>>>> CFR2N[7] CFR2V[7] says that: "For the DDP or QDP devices, if ADRBYT = 0
>>>>> only the first 128 Mb of die 1 can be accessed."
>>>>> So there are flashes of the same family that are by default in 3 byte address
>>>>> mode. You added support just for a subset of them and used a generic name,
>>>>> which is not accurate, right?
>>>>>
>>>> We added model #15 (3-byte address mode by default) to address special
>>>> requirement from a customer who needs to use bootrom with 3-byte addressing.
>>>> Anyway, I overlooked model # difference. Thanks for pointing out this.
>>>>
>>>>> Can we instead make an algorithm to determine the current address mode?
>>>>>
>>>> I have just found that we can distinguish model # via BFPT DWORD16.
>>>> If Hardware reset, Software reset, or Power cycle can exit 4-byte address
>>>> mode, that means the device is 3-byte address mode by default.
>>>
>>> I don't think this will help us. It doesn't matter the default mode if you
>>> have a non volatile register that can be updated and changes the default
>>> mode.
>>>
>>> Are there any registers/data that can be read successively in 3 byte addr mode
>>> and then in 4 byte addr mode? We'll then compare what we receive from the flash
>>> with a known value and determine the mode.
>>>
>> As we discussed before [0], if address mode in the controller and device are
> 
> I remember, yes, but without determining the mode, the driver will work only
> with flashes that come with the factory settings. The driver will be unusable
> if someone changes the address mode in a non volatile way, right?
> 
Yes, right.

>> different, the read data will be undetermined.
>>
>> But if we really want...
>> Compare SR1 data read by RDSR1(05h - No Addr) and RDAR(65h - Addr 0).
>> In most cases (without block protection), SR1=00h. The value of 00h would be
>> awkward to determine if this is 'real' output from Flash or not. So, use> WREN(06h) and WRDI(04h) that flips BIT(1) in SR1.
> 
> Would be good to have more fixed/OPT-like bits, or if we could change more bits
> to increase the chances to not hit just some undetermined data.
>>
>> Therefore, something like:
>> 1) RDSR1
>> 2) RDAR with 3-byte addr (000000h)
>> 3) If #1 == #2
>>         4) WREN
>>         5) RDAR with 3-byte addr (000000h)
>>         6) BIT(1) is SR1==1?
>>         ...
>>
>> Or simply WREN -> RDAR -> WRDI -> RDAR then check if only BIT(1) is toggled.
> 
> Both may work, yes, but making the assumption on only one bit is fragile.
> Can we use the Read Any Register Command with 3 and 4 byte address modes and
> compare the values? Are there any registers with fixed values?
>
Register values can vary because it's register:)

So... let's use Data Integrity Check CRC registers. These registers do not
have fixed values but we can calculate expected values by offline. Read
several bytes (>=4) from Flash array with Read(03h) then calculate CRC by
crc32(). Issue Data integrity Check command (5Bh) followed by start and
end address (4-byte for each), wait till ready. Read calculated CRC by
Read Any Register in 3 and 4 byte address (00800095h~0080098h) then compare
the crc32() result and register read result.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
