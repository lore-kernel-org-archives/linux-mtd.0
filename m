Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241B9C4725D
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 08:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QV2w8XnwYxmNwfwTVrP7ra2Cg3CBTlNIq4Cug3bpJSU=; b=Coxhc1qx+8hrtu
	LoCU0z1iDf+XPxLygqHomdSiMkx9TonA8eWv7f0AVXwv0AAkp57WCf3p5KAx3engfAcP13K/Me3EP
	5GRT+MrsbzX9pXNfb1LwfT8yDPHaIrJkT24AzQ+aHDyI6t/vJfOE9HEs7pOQM1mSU1pf7y7Lfk6m8
	sgRbUkEB5mgWLovHYtMyabC8pKL1vsKN16p1tjRrVwjRNT6QhyAAGT2p+x7U+BBEVQsKMi9zoW2yI
	ju1gZZ34a2H1W1jjSKW6nJSF04LMgbC9qhPQp26iomSQJCTr40wFMxvaGODEcTtc8fBQ3EAF9qk4v
	bxMKOJG4oBPK7e9h1Vnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpRR-00Azrg-0j;
	Mon, 22 Jan 2024 08:14:01 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpRM-00AzqQ-0Q
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 08:14:00 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-33921b8988fso2514101f8f.3
        for <linux-mtd@lists.infradead.org>; Mon, 22 Jan 2024 00:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705911233; x=1706516033; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5bETPM8oCthIJxvtz9/EW/JDG11DvuEOvRmdYkisMXk=;
        b=tbGM/HGBrGLhtn8eHwb4E2sawe0Nnvl8lbMYFvW95A9RINVAgDgxhZ/x+DRhoTuxE+
         jfP4GD1ddCmmEy0nQfaq/20hA4ogkugGvQV/IcGOtata2OrkOQwYdHCKkLvboAUyas5o
         vutUqypCTu+Q1L/1l5a9q4Pkmx8BFEJihHb8l87Fr1vClaIAQNxbu76mr7ZSaUsF6xuS
         QRjqWRCs2DAzToFGZGO9ozD9TeQU39oOhQwqMlOcI+YlF4mMLLyiG3vjXdglFPuBXytP
         TdKDELMXCMaPHbeq1RJDpXzwVU4K5xaWP9ZEBAhxI9CUNyTcZ3X6eh3kzajaqy7AF8Sa
         YzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705911233; x=1706516033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5bETPM8oCthIJxvtz9/EW/JDG11DvuEOvRmdYkisMXk=;
        b=D7pteMDb5zE7ii9M7TrJOBbwvbCPsgbp5R9u72oMEva2IQ52wUh0+68hj8sW3Di2p/
         +6A7y4JKmKBXDZxOa9rW3bgKva3CgJXsLpfTAdcFNuLvBBsbDsk5oDcE7LudYk+AEzUT
         t8DnMgFzlI9Cb0yNMYJ0lPlb7ANjFD5a+r41Sr6ab/QGDkGozcvkXxeOZcuVdttefBQC
         vjm6Xy0c0pNgugOPQWhqMBH1XkvPbW9xZ7GaPdari/nlTAzqnT+4jeXK7eBPTQF8aGZ/
         DF9BPk1Dv13bFkY75pEvboWlMX5VCuWCMGyQ9xvHmCsKoSbJ6l7b5Cr3Q8RBNARL7TXG
         HXLQ==
X-Gm-Message-State: AOJu0YwC93y9yE1SKsHdppBdFnNS/rNDUglSTS5YPFKSIm2neHLdQAnd
	zA8CUn6svOUSKNKpu7jrCdddhp1FtwwVMdVbprr8lkKCmXh5gOEDxfie1GzIG0I=
X-Google-Smtp-Source: AGHT+IEv81t2Cirbph1WSpZmMPNn9zT/tADSV0WIaGjAKOec1NK91Mm5MQPNd9pObJr69GaIhuvgWQ==
X-Received: by 2002:adf:f6cb:0:b0:337:bfe8:5bfd with SMTP id y11-20020adff6cb000000b00337bfe85bfdmr2263974wrp.50.1705911233429;
        Mon, 22 Jan 2024 00:13:53 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id l8-20020a5d5608000000b003392bcd6c48sm4780856wrv.79.2024.01.22.00.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 00:13:52 -0800 (PST)
Message-ID: <508196d4-a533-47c9-bf6e-5718364c8d54@linaro.org>
Date: Mon, 22 Jan 2024 08:13:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mtd: hyperbus: Add support for Infineon S26Hx-T
To: "Raghavendra, Vignesh" <vigneshr@ti.com>, tkuw584924@gmail.com,
 linux-mtd@lists.infradead.org, sergei.shtylyov@cogentembedded.com,
 geert+renesas@glider.be, Mark Brown <broonie@kernel.org>
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
References: <cover.1680663252.git.Takahiro.Kuwano@infineon.com>
 <d94273b2-9516-2b80-308f-9fd1fdd2b4d5@linaro.org>
 <158830c6-d492-4967-a543-c0f5f8428d8b@linaro.org>
 <2bcf6646-b7ce-48c9-8a9b-0634c3fb40e9@ti.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <2bcf6646-b7ce-48c9-8a9b-0634c3fb40e9@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_001356_172426_84D249E8 
X-CRM114-Status: GOOD (  20.61  )
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



On 1/22/24 06:25, Raghavendra, Vignesh wrote:
> 
> 
> On 1/22/2024 11:41 AM, Tudor Ambarus wrote:
>> + Sergei, Geert, Mark & linux-spi
>>
>> Hi, Sergei,
>>
>> On 23.05.2023 07:22, Tudor Ambarus wrote:
>>> Hi, Takahiro, Vignesh,
>>>
>>>
>>> On 07.04.2023 09:11, tkuw584924@gmail.com wrote:
>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>
>>>> This sereis adds support for Infineon S26HL-T/S26HS-T flash family.
>>>> https://www.infineon.com/dgdl/Infineon-S26HS01GTGABHM020-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c7f2a768a017f52f2f5182c91
>>>>
>>>> This family supports two interface modes, SPI mode and Hyperbus mode. The mode
>>>> can be switched at rutime. The default mode is selected by ordering option
>>>> and non-volatile user configuration. In hyperbus mode, the device is compatible
>>>> with S26KL-S/S26KS-S hyperflash family that supports hyperbus only so one of
>>>> use cases of S26Hx-T is replacement of (or migration from) S26Kx-S. This patch
>>>> set focuses on particular usage that the device is pre-configured as hyperbus
>>>> mode for compatibility with S26Kx-S.
>>>
>>> I'm questioning the overall hyperbus software architecture, not your
>>> patches per se. IMO hyperbus framework should have been written on top
>>> of SPIMEM and the controllers be placed in drivers/spi/. So I'd first
>>> address the SPIMEM adoption before adding/accepting new support. Would
>>> love to hear more from Vignesh.
>>>
>>
>> RPC is the only multi IO SPI controller that's upstreamed and capable of
>> dealing with hyperflashes, but there are others which are not upstreamed
>> yet (microchip).
>>
>> Struct ``struct rpcif_op`` [1] duplicates the contents of ``struct
>> spi_mem_op`` [2] which could have been avoided if hyperflash driver was
>> extended with SPI MEM support. This way the RPC hyperbus driver, which
>> is an SPI controller, could have been moved to drivers/spi.
>>
>> Sergei, do you remember why we haven't used SPI MEM for hyberbus since
>> the beginning? Was it something that we aimed for in a future patch set?
>>
>> Thanks,
>> ta
>>
>> [1]
>> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/include/memory/renesas-rpc-if.h?h=mtd/for-6.8#n22
>>
>> [2]
>> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/include/linux/spi/spi-mem.h?h=mtd/for-6.8#n99
>>
> 
> The initial hyperflash predates opening up of HyperBus protocol and
> inclusion of it in xSPI spec. First gen Flashes followed CFI specification
> and hence made sense to make use of cfi_cmdset_0002.c
> 
> We did have a discussion on extending spi_mem to support xSPI profile 
> 2.0 during the RPC_IF [3] [4].
> 
> Overall, both Controllers and Flashes have moved away from CFI parallel 
> flash protocol over to xSPI / SPI NOR flash protocol (profile 2.0), so I 
> agree with Tudor's assessment that we need to move towards spi_mem in 
> longer term. So
> 

Good, thanks Vignesh! I'll study a bit more and let you know about the
progress on this topic.

Cheers,
ta

> a) Extend spi_mem_op to support xSPI profile 2.0 transaction template
> b) HyperBus layer can then either be a adapter from CFI to spi_mem for CFI
> compliant devices. And  be subsumed completely within SPI NOR for SFDP
> compliant devices.
> c) Move the existing controllers over to new framework.
> 
> 
> [3] https://lore.kernel.org/all/b8224f46-fc2e-de35-0a90-a2a86cacb489@ti.com/
> [4] https://lore.kernel.org/all/20200220084927.7a411d40@collabora.com/
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
