Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8158FC47DDF
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 12:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ff+86FpfrelHNMcy75qmtXnetU0eXYQaZrUb39c1iAE=; b=x/PO+r/5lF0Rtv
	+AvpX2dHiGSExF6WbR+khfJvTMcaIHfTE5hz8F0Q3ndmePuVyQtHyRdsrcfTvt71mcOjfJeeOx33h
	0/I/MBlOtb++GX9IoDqLCob5qOL7r/BHPi+0qeQ7gOlwCeD8KJXNHHtiXUBSRd/coF4+Bm9mIyiQk
	Sf4/ojhMixbGbZ7A89szW8sinIYX4SoTjOumU3gZ0fYghvCpPyTLdhEsn99hNWSAOCsKqV+zjG00J
	WbzFJaNCyavHVVX5qgLGwl+dyr89aUlzI8f+bSwrJ8yC36t7H8QJM2X/mk+8N7/2r/rc911qoDmPM
	/O4vJJFeObkeyk0IPHQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVVmc-00000007ezW-3UWJ;
	Thu, 01 Feb 2024 12:03:06 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVVma-00000007eyY-3kg9
	for linux-mtd@lists.infradead.org;
	Thu, 01 Feb 2024 12:03:06 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-55f0367b15fso1090985a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 01 Feb 2024 04:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706788982; x=1707393782; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BRvnHveVZ1Az/l6vbFOJUdq9O7cxAFSAEDNUgmlrpLg=;
        b=TMHJkZfQk1gFh60O0377FyfzNgiz/iJ7vtKVLiuNY5iLsQBH+2yc7gkeD91fGMsRj+
         VA5RZIJLYIzbPw9uP9KirTFnFAmev11dJV/+ysxLvqaB0wfbZ8V2CBSIedHYU/Q4YQj8
         O+UzZ4Kmt36Hwuq/iEqdXNZ/m5C6aQf8WSbQICPAIkme4Z+CitFeWwlRBxDj+c/ZsJcK
         U0FsZaN2KUpodGUI3nadEAiYue0m4CG6gCJ0dz5B/49HU0kDuS3le4EAp4+h+9BXIlDO
         0CwUyFubzqfB1wjtvKBiewSMyKVHlPLUz/GObWlPamo4qWGgENsYzJpWG2xyoxzeoVFd
         gCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706788982; x=1707393782;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BRvnHveVZ1Az/l6vbFOJUdq9O7cxAFSAEDNUgmlrpLg=;
        b=iPHRPLDrwdQe1DGZHvyOQIWWjbAko9ASUyUGYEoGUqzcZ4FiwqZWGylFFYFo5rcOq1
         cYUQfXEUotorIpeZvor9Pr7OTl17IEgq3BuK/0Vvb5Z13y/jpNNHY1J34zwFzm7t8P54
         8wQT9BQcSW2e4GYmKhgS4y/iWnUaWocuPvo3kKQjGUJo9NmC2HmIBdDjsIf2T6d+Q9So
         BMMhZO0ofGb6ThfRizen/WB+OiU+FsDnQquJGJzbRqqpJfr8M8N06axfOKpirMBIBFMx
         EME1uXL459eE3b8QZmYSUkl2BWWYmRIW0JcaeazW2477ImBvUofQptuvErtzfMflgWjN
         8M6Q==
X-Gm-Message-State: AOJu0YzqoaVQNpLbTn4FmYyWtZOQ2d7aTU2WZVstIYfIv91tFfHuS7zN
	EItWJka23vHI5LBqvVGlUVrAw8EKNVsNb3dfZGPBQSHgK1h0FrzOcQ8Bl5VBp6U=
X-Google-Smtp-Source: AGHT+IHzmirGSZwk7eF5IYHac1w6eYWR/iLdsie89rjXgKwtbKLBtgIkMS7H+CYX1Oklvx1IlWWrZw==
X-Received: by 2002:a05:6402:1602:b0:55f:c3c1:34e with SMTP id f2-20020a056402160200b0055fc3c1034emr679915edv.15.1706788981786;
        Thu, 01 Feb 2024 04:03:01 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWVNol4pV3Y/qLWUIfhsIVIX9uyU12YeJgjplq9+R0EJPBGsHkzCA/c588Vp3dluHz1aaUa+q5U0d0l3Vb0SDCR+iKcUZlSbR9VYSsTd9Ah+p0WQ4VihdWiaNw1d+Ux4hymqvMmZPHpTbhM/HyPLGYZjqMwHH6pRcRLilRIPTlbgs4nIV0I5ZhKr0huXBHl10DErFtaoIU5SYM2Q7MqAG1w1HSmVEG4u5nrdT/Gm2T5DKmiQiLHZejzQRCErnx8Crm8nh/F0KCD3daO9jm+yc8dkgdCDGUhrUBJWFX77YjQQntGW8DliJhFN7uqiehXZMaTJgrQm03ah9NI8XFMwytK/JAqyptgrJOGKGFDC0h/OC5sq38Adj0XUDI2JJMa7+OCXQL1va5gF4RzXirWVAMGfRW6ztYkvQOnn0GVozeTe8q/zP3eFEnRCpAM8Uw2CdxR+nGjQoBgOG0GMOnyOyjF65ejONEJLTYpQmEBJeVZJ6m3K9E3PXWWsu/koEhndL0TDrZsicvx1sTHCKWLc+qNeyW1RA7F/HS1lzBaRQ0tsll8JLY=
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id ba8-20020a0564021ac800b0055f2af9b01bsm2989175edb.17.2024.02.01.04.03.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 04:03:01 -0800 (PST)
Message-ID: <09b1e193-8a87-4f29-a1d5-8dfd370b03a1@linaro.org>
Date: Thu, 1 Feb 2024 12:02:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mtd: hyperbus: Add support for Infineon S26Hx-T
Content-Language: en-US
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 "Raghavendra, Vignesh" <vigneshr@ti.com>, tkuw584924@gmail.com,
 linux-mtd@lists.infradead.org, sergei.shtylyov@cogentembedded.com,
 geert+renesas@glider.be, Mark Brown <broonie@kernel.org>,
 Christophe KERELLO <christophe.kerello@foss.st.com>
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
References: <cover.1680663252.git.Takahiro.Kuwano@infineon.com>
 <d94273b2-9516-2b80-308f-9fd1fdd2b4d5@linaro.org>
 <158830c6-d492-4967-a543-c0f5f8428d8b@linaro.org>
 <2bcf6646-b7ce-48c9-8a9b-0634c3fb40e9@ti.com>
 <508196d4-a533-47c9-bf6e-5718364c8d54@linaro.org>
 <c75f33ce-d7a8-46db-aeab-f4406f3d9cf9@foss.st.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <c75f33ce-d7a8-46db-aeab-f4406f3d9cf9@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_040304_967590_1C31925A 
X-CRM114-Status: GOOD (  23.89  )
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



On 2/1/24 10:46, Patrice CHOTARD wrote:
> 
> 
> On 1/22/24 09:13, Tudor Ambarus wrote:
>>
>>
>> On 1/22/24 06:25, Raghavendra, Vignesh wrote:
>>>
>>>
>>> On 1/22/2024 11:41 AM, Tudor Ambarus wrote:
>>>> + Sergei, Geert, Mark & linux-spi
>>>>
>>>> Hi, Sergei,
>>>>
>>>> On 23.05.2023 07:22, Tudor Ambarus wrote:
>>>>> Hi, Takahiro, Vignesh,
>>>>>
>>>>>
>>>>> On 07.04.2023 09:11, tkuw584924@gmail.com wrote:
>>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>>
>>>>>> This sereis adds support for Infineon S26HL-T/S26HS-T flash family.
>>>>>> https://www.infineon.com/dgdl/Infineon-S26HS01GTGABHM020-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c7f2a768a017f52f2f5182c91
>>>>>>
>>>>>> This family supports two interface modes, SPI mode and Hyperbus mode. The mode
>>>>>> can be switched at rutime. The default mode is selected by ordering option
>>>>>> and non-volatile user configuration. In hyperbus mode, the device is compatible
>>>>>> with S26KL-S/S26KS-S hyperflash family that supports hyperbus only so one of
>>>>>> use cases of S26Hx-T is replacement of (or migration from) S26Kx-S. This patch
>>>>>> set focuses on particular usage that the device is pre-configured as hyperbus
>>>>>> mode for compatibility with S26Kx-S.
>>>>>
>>>>> I'm questioning the overall hyperbus software architecture, not your
>>>>> patches per se. IMO hyperbus framework should have been written on top
>>>>> of SPIMEM and the controllers be placed in drivers/spi/. So I'd first
>>>>> address the SPIMEM adoption before adding/accepting new support. Would
>>>>> love to hear more from Vignesh.
>>>>>
>>>>
>>>> RPC is the only multi IO SPI controller that's upstreamed and capable of
>>>> dealing with hyperflashes, but there are others which are not upstreamed
>>>> yet (microchip).
>>>>
>>>> Struct ``struct rpcif_op`` [1] duplicates the contents of ``struct
>>>> spi_mem_op`` [2] which could have been avoided if hyperflash driver was
>>>> extended with SPI MEM support. This way the RPC hyperbus driver, which
>>>> is an SPI controller, could have been moved to drivers/spi.
>>>>
>>>> Sergei, do you remember why we haven't used SPI MEM for hyberbus since
>>>> the beginning? Was it something that we aimed for in a future patch set?
>>>>
>>>> Thanks,
>>>> ta
>>>>
>>>> [1]
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/include/memory/renesas-rpc-if.h?h=mtd/for-6.8#n22
>>>>
>>>> [2]
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/include/linux/spi/spi-mem.h?h=mtd/for-6.8#n99
>>>>
>>>
>>> The initial hyperflash predates opening up of HyperBus protocol and
>>> inclusion of it in xSPI spec. First gen Flashes followed CFI specification
>>> and hence made sense to make use of cfi_cmdset_0002.c
>>>
>>> We did have a discussion on extending spi_mem to support xSPI profile 
>>> 2.0 during the RPC_IF [3] [4].
>>>
>>> Overall, both Controllers and Flashes have moved away from CFI parallel 
>>> flash protocol over to xSPI / SPI NOR flash protocol (profile 2.0), so I 
>>> agree with Tudor's assessment that we need to move towards spi_mem in 
>>> longer term. So
>>>
>>
>> Good, thanks Vignesh! I'll study a bit more and let you know about the
>> progress on this topic.
> 
> Hi All

Hi,

> 
> At STMicroelectronics we got an OSPI block which is supporting both OSPI and HyperBus protocol
> similarly to the mentioned RPC-IF.
> 
> This means that we intend to split our implementation in 3 drivers as RPC-IF:
>   _ backend driver including common source code to OSPI and HyperBus
>   _ OSPI frontend driver
>   _ HyperBus frontend driver
> 
> Following this discussion thread, we are wondering if it will be the right direction to 
> choose in order to propose this implementation to MTD mailing list.

I think the right direction would be to have hyperflash on top of
SPIMEM, and the SPI controller under drivers/spi.
> 
> Have you an idea about time scale regarding the HyperBus migration over spi-mem ?
> 

No, sorry. It's at best effort from my side. Happy to review proposals
though.

> Thanks
> Patrice
> 
> 
>>
>> Cheers,
>> ta
>>
>>> a) Extend spi_mem_op to support xSPI profile 2.0 transaction template
>>> b) HyperBus layer can then either be a adapter from CFI to spi_mem for CFI
>>> compliant devices. And  be subsumed completely within SPI NOR for SFDP
>>> compliant devices.
>>> c) Move the existing controllers over to new framework.
>>>
>>>
>>> [3] https://lore.kernel.org/all/b8224f46-fc2e-de35-0a90-a2a86cacb489@ti.com/
>>> [4] https://lore.kernel.org/all/20200220084927.7a411d40@collabora.com/
>>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
