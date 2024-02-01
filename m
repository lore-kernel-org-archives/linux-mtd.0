Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AC1C47DDF
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 12:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z2aiYfzIiy9mQV87BYzy6OUCXC3tqqaS47S4H+lMHcU=; b=BHnQoNwBav8Gd9
	JAgJVRDAptLj+Dp0w/DiVuZFdKiJWLA6flX0Tqb21IOgONhw3cmIwscqy+55NF9C62Qq6QYRLdka+
	esefTfLI6s2qiY/uMny9UmAR8scpg1GDxO/E69lMFTEQOuCN8Ia9svDdVCLi6Frq80OaUqi/QyAnp
	uSKDNLhthfNUZWn+h33sFe6WedReFXaj9k0ayYWwzt5dFwavNT57WnJysg/YuixRxBpeMFvC0Rbxz
	YHD69FnepNg2CuAJmPQmRUHujpfuc+puPUa2pQ7qyivaw8tfaTrtj5GC61G8VBjiUezDJTH8maS9E
	VgEO+qDK+xVOYU9jeoIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVWJk-00000007nDD-1kfx;
	Thu, 01 Feb 2024 12:37:20 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVWJh-00000007n9o-2vuL
	for linux-mtd@lists.infradead.org;
	Thu, 01 Feb 2024 12:37:19 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a357cba4a32so113054666b.2
        for <linux-mtd@lists.infradead.org>; Thu, 01 Feb 2024 04:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706791030; x=1707395830; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xoTHSXWECzNeEX4hwunhwLYfV1JWZsEFOUBoOk82HaA=;
        b=f84smFJwq+RKH+Hr+CRLMy7LS1m5XCkOa/SX0ZF3TIjszifPTO9owwzN7Luizqmy+9
         YMg+iKwCsM8KIJdmOkpBaMllsmtTZzXcJ9/7GuxNmtYYAEzOd6qGPyPAGKG9SuhC5N9i
         IVTaK/2XcfJP1BmDZ0KGOVGDcSZdk8l0Y9RBaElrE+p1EXZwuf6EkLqEGULE2CRcszCX
         k4FnBW4/WVhp5/lS+TksU7chYZH5yvhDXKfDkEwWyrJqHQkg+vXnEicA92nP8Rqv1sLE
         1XNY5a+olz/ArI/+4cEumOKi/VdXJ7EcLh1/E94maXd5YxCJLjkg/TeM+Cb3QIzMdh0+
         cYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706791030; x=1707395830;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xoTHSXWECzNeEX4hwunhwLYfV1JWZsEFOUBoOk82HaA=;
        b=opQgwmtMtKA77V0ZLX3GOd2lQqmqibB4Lcp+9CRSsSCXJYlaUsTWgW0AJ9f34NFJ4d
         R3HCsUA5e0nIC3oJwYDEifES1hUIgz4Ux+7G+KlIyLUZgqNdzWojAZiQo+7yf4olf6K3
         SE4DKVgC1Oxr94GZB2Ny1JuVgUUgSp1O/WxteWQOHxMHDcB4B15/sOaLceq+ww+0b5b5
         QsMaxfVntPzqm1PS65/s5X6PT0+Xfxk9CoyHfh560Q1Eh9xKjlMs76R/kukH+UymXHYP
         sVV337R9ohQDoo+bn76406LEGUkunCERKmKKuabRR37Url995jArUj6KJOJOAkezbFBy
         FYig==
X-Gm-Message-State: AOJu0YxPei2cfOCV80HhPnrNyFjVZD6F12Jp5Ia7tD8qUZq3zEQIAqdq
	943oywHvM3OWbNCniGAeJK9SVPLyc9kYsKVNm0zK2lnwd+gQUK/mKMaBxHPCVYM=
X-Google-Smtp-Source: AGHT+IEqOL816tqer2FcKzdKIzrZxu37nCR4OVV1sPdi6208bjjgPQtyRx83t6fmAz32MCNR/qCo6Q==
X-Received: by 2002:a17:906:131a:b0:a36:5551:ad76 with SMTP id w26-20020a170906131a00b00a365551ad76mr1816766ejb.75.1706791030610;
        Thu, 01 Feb 2024 04:37:10 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXegE9bb7E1tgis9igkW5e5d8j7Ofe64E7MpUTScWaOz2Jst1S7myw+BaiaIoekPF/Ev4YmvvcK4Q5SO7mmiai2BLEPcvQqFqdqV9O//wu4QvJ64AmswmGi4DUzKdkk0cCAIRlBBDUErQXcxEH1DJ6zMD3jBCp6USxSLXwTxXiR553A0X+1djg/fHLE5L5J/1j9ay/1tayaCM7PcY5ebTiQphOXYyknzHglx4haE7dFZJwCMPdbuEMmRRrd3WjaDcoFME6his8vU0shUpqn7iBi5du4ijJCRy2Wo71/fBjt7Tlb4y6KZKpgg4yUOMKuAR0IpYqWUXUOUMEI0ifRMzTOFU3A8dyuA87//KGsz9YYVbd9tKvmm1wq0xHFcZl8fuE8wY01YvXQUPk8Op6X4Br5zIfRKW7GB7Xu0BmpcdJHfksstj5Le5ipBATnA9fmZHoGH7Rm2hhFu4SndHCPvdbwaKBqypVR7xgez73zuULyE5x7RmXHSwLF5gKzeJwRqnJt9bhOwu2NkoQEGjQV80wfrgr5h7ixuWizAfQD/SYCQSZbc+E=
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id cw1-20020a170907160100b00a359558648esm4864902ejd.24.2024.02.01.04.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 04:37:10 -0800 (PST)
Message-ID: <9a4339fb-5997-4d94-8471-46ac27c790fa@linaro.org>
Date: Thu, 1 Feb 2024 12:37:08 +0000
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
 <09b1e193-8a87-4f29-a1d5-8dfd370b03a1@linaro.org>
 <cfe84e34-1dc0-459a-a347-e559718b4d75@foss.st.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <cfe84e34-1dc0-459a-a347-e559718b4d75@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_043717_805393_B2DFDC76 
X-CRM114-Status: GOOD (  20.70  )
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



On 2/1/24 12:23, Patrice CHOTARD wrote:
> 
> 
> On 2/1/24 13:02, Tudor Ambarus wrote:
>>
>>
>> On 2/1/24 10:46, Patrice CHOTARD wrote:
>>>
>>>
>>> On 1/22/24 09:13, Tudor Ambarus wrote:
>>>>
>>>>
>>>> On 1/22/24 06:25, Raghavendra, Vignesh wrote:
>>>>>
>>>>>
>>>>> On 1/22/2024 11:41 AM, Tudor Ambarus wrote:
>>>>>> + Sergei, Geert, Mark & linux-spi
>>>>>>
>>>>>> Hi, Sergei,
>>>>>>
>>>>>> On 23.05.2023 07:22, Tudor Ambarus wrote:
>>>>>>> Hi, Takahiro, Vignesh,
>>>>>>>
>>>>>>>
>>>>>>> On 07.04.2023 09:11, tkuw584924@gmail.com wrote:
>>>>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>>>>
>>>>>>>> This sereis adds support for Infineon S26HL-T/S26HS-T flash family.
>>>>>>>> https://www.infineon.com/dgdl/Infineon-S26HS01GTGABHM020-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c7f2a768a017f52f2f5182c91
>>>>>>>>
>>>>>>>> This family supports two interface modes, SPI mode and Hyperbus mode. The mode
>>>>>>>> can be switched at rutime. The default mode is selected by ordering option
>>>>>>>> and non-volatile user configuration. In hyperbus mode, the device is compatible
>>>>>>>> with S26KL-S/S26KS-S hyperflash family that supports hyperbus only so one of
>>>>>>>> use cases of S26Hx-T is replacement of (or migration from) S26Kx-S. This patch
>>>>>>>> set focuses on particular usage that the device is pre-configured as hyperbus
>>>>>>>> mode for compatibility with S26Kx-S.
>>>>>>>
>>>>>>> I'm questioning the overall hyperbus software architecture, not your
>>>>>>> patches per se. IMO hyperbus framework should have been written on top
>>>>>>> of SPIMEM and the controllers be placed in drivers/spi/. So I'd first
>>>>>>> address the SPIMEM adoption before adding/accepting new support. Would
>>>>>>> love to hear more from Vignesh.
>>>>>>>
>>>>>>
>>>>>> RPC is the only multi IO SPI controller that's upstreamed and capable of
>>>>>> dealing with hyperflashes, but there are others which are not upstreamed
>>>>>> yet (microchip).
>>>>>>
>>>>>> Struct ``struct rpcif_op`` [1] duplicates the contents of ``struct
>>>>>> spi_mem_op`` [2] which could have been avoided if hyperflash driver was
>>>>>> extended with SPI MEM support. This way the RPC hyperbus driver, which
>>>>>> is an SPI controller, could have been moved to drivers/spi.
>>>>>>
>>>>>> Sergei, do you remember why we haven't used SPI MEM for hyberbus since
>>>>>> the beginning? Was it something that we aimed for in a future patch set?
>>>>>>
>>>>>> Thanks,
>>>>>> ta
>>>>>>
>>>>>> [1]
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/include/memory/renesas-rpc-if.h?h=mtd/for-6.8#n22
>>>>>>
>>>>>> [2]
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/include/linux/spi/spi-mem.h?h=mtd/for-6.8#n99
>>>>>>
>>>>>
>>>>> The initial hyperflash predates opening up of HyperBus protocol and
>>>>> inclusion of it in xSPI spec. First gen Flashes followed CFI specification
>>>>> and hence made sense to make use of cfi_cmdset_0002.c
>>>>>
>>>>> We did have a discussion on extending spi_mem to support xSPI profile 
>>>>> 2.0 during the RPC_IF [3] [4].
>>>>>
>>>>> Overall, both Controllers and Flashes have moved away from CFI parallel 
>>>>> flash protocol over to xSPI / SPI NOR flash protocol (profile 2.0), so I 
>>>>> agree with Tudor's assessment that we need to move towards spi_mem in 
>>>>> longer term. So
>>>>>
>>>>
>>>> Good, thanks Vignesh! I'll study a bit more and let you know about the
>>>> progress on this topic.
>>>
>>> Hi All
>>
>> Hi,
>>
>>>
>>> At STMicroelectronics we got an OSPI block which is supporting both OSPI and HyperBus protocol
>>> similarly to the mentioned RPC-IF.
>>>
>>> This means that we intend to split our implementation in 3 drivers as RPC-IF:
>>>   _ backend driver including common source code to OSPI and HyperBus
>>>   _ OSPI frontend driver
>>>   _ HyperBus frontend driver
>>>
>>> Following this discussion thread, we are wondering if it will be the right direction to 
>>> choose in order to propose this implementation to MTD mailing list.
>>
>> I think the right direction would be to have hyperflash on top of
>> SPIMEM, and the SPI controller under drivers/spi.
> 
> 
> To be more precise, when you say "would be to have", you mean you will NAK 
> an implementation in 3 drivers as RPC-IF ?
> 

Yes. I think we should move towards SPIMEM adoption, don't you?

> 
>>>
>>> Have you an idea about time scale regarding the HyperBus migration over spi-mem ?
>>>
>>
>> No, sorry. It's at best effort from my side. Happy to review proposals
>> though.
>>
>>> Thanks
>>> Patrice
>>>
>>>
>>>>
>>>> Cheers,
>>>> ta
>>>>
>>>>> a) Extend spi_mem_op to support xSPI profile 2.0 transaction template
>>>>> b) HyperBus layer can then either be a adapter from CFI to spi_mem for CFI
>>>>> compliant devices. And  be subsumed completely within SPI NOR for SFDP
>>>>> compliant devices.
>>>>> c) Move the existing controllers over to new framework.
>>>>>
>>>>>
>>>>> [3] https://lore.kernel.org/all/b8224f46-fc2e-de35-0a90-a2a86cacb489@ti.com/
>>>>> [4] https://lore.kernel.org/all/20200220084927.7a411d40@collabora.com/
>>>>>
>>>>
>>>> ______________________________________________________
>>>> Linux MTD discussion mailing list
>>>> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
