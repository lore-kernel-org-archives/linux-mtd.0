Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A37C76195
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Mar 2023 08:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xShDY8WEtxz25gbmcjvMsbC+ZGG7znjIR3W+Kck52x4=; b=FssmHyRT6H0anq
	nH2PL5kQPMV3IqRnyeWpRMF/uIwzdkDjHJQIgyqhX0B4wGyjkXf7UPLtJEU3LL1uDf3I9dNxlB6vS
	VvmF/Jn6qn3u2hJQO4MPES4n4+OgshJ4CTtmPQxwiGNHZzR3VmvHSA5Y9j/nd/LrTguzL8geElzOW
	Sltb1wHNcVc/G9iC7EI1a203FVTXzBbDCFaiRIgWB1ZeVapET/Y861/vSaRjKxOveOtl0rIKc5p3g
	CeezrecvyAE9o2RoMWQfLoltbK/pJy91DJZzngrXRt0SyIfuwyWWcsENlNXg/7MvKuuv40MduG28v
	vljBvSGsAPKjDu3WRJFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5MX-001Sbp-1X;
	Fri, 17 Mar 2023 08:22:57 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5MP-001STf-2F
	for linux-mtd@lists.infradead.org;
	Fri, 17 Mar 2023 08:22:51 +0000
Received: by mail-ed1-x536.google.com with SMTP id er8so5551107edb.0
        for <linux-mtd@lists.infradead.org>; Fri, 17 Mar 2023 01:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679041365;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5uwGDh8QwGbP6Je3psYljx59SJDVQNC0/RlJsjOY7tA=;
        b=Gi1U46N9vBpxGUH9Aojlt8UIldoDk2iJ/yeibnXWeSKFeLA1483ItAtA0pRIJ2Ea45
         IKO1JQ+6eKIyX+3n7Cq5jvbTiWBjoBlaIQjFtHMyWhtb3ZRMSBP/WYNu8WG8H2BTOWCt
         3H7EafkZyH9YwNfabT1I/QOhcTMQtuym1RY91HqQkQZadT1Fgdp+CABTDzj+LXQPKWam
         rU7P4oLRTRBV9hIr9Ym6+DsutxHNuoePrrHXZdzrkWMVwDmEZ5RYsudwJrXW2vKPvpzR
         bXxyEUeQrfYMEGaYb0WHolIPZKFSV36K0AKUtvl8USBcsnHq/QenRilkcy3KBwcW6EEN
         wkpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679041365;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5uwGDh8QwGbP6Je3psYljx59SJDVQNC0/RlJsjOY7tA=;
        b=Cz7rzgaLar40DVTR0tL4QcACYu4SGbuCrKuVFpl0W48jAMkJNA+YoimRzH/XyamS9F
         bNTDJ86MOPrd4uJ2TlMhY4s8L8orsJ8KNLdudrANwKPOEx9Z7I5F7DPBbplC6yuHGYRf
         z/p6wpAsw0cGauGhz737riLmik2jdDIHX8OcNh6Vrdi1N4Z3PmHWUGAFhVgJiL6y3QRK
         WaVwWziff0OhiG9i+fSyBPqk6KiMwgBg4aM+1pvtHwFZ4jit7JrjNLgqDURpMXFOR/O7
         gG/23wJ+eKXmjtxd1tqFhPsqfnDcAPO132ig/cR8SF+TAY3eFogZby0V4Dd4LPITeEMC
         aRXQ==
X-Gm-Message-State: AO0yUKVyU2LRFgmjbMYI3/FHUTZciOwNK5II7uZFUGbIwelES8K4ZzxP
	kCwUlCHbIw3EGa6lNxcjhdGqjQ==
X-Google-Smtp-Source: AK7set/d5BdjjG2dFsAp4fT5KSLYOwoNp24aebCWCfg1eIaFf9Ep0wzVj9kJuj6Qq753PhRJIBXsaQ==
X-Received: by 2002:a17:906:fe05:b0:930:1391:da7c with SMTP id wy5-20020a170906fe0500b009301391da7cmr7108691ejb.60.1679041363301;
        Fri, 17 Mar 2023 01:22:43 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id t1-20020a170906178100b008d1dc5f5692sm683618eje.76.2023.03.17.01.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:22:42 -0700 (PDT)
Message-ID: <4f06f992-7a26-6542-709d-785abf35d036@linaro.org>
Date: Fri, 17 Mar 2023 08:22:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 8/8] mtd: spi-nor: macronix: Add support for
 mx25uw51245g with RWW
Content-Language: en-US
To: liao jaime <jaimeliao.tw@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Jaime Liao <jaimeliao@mxic.com.tw>,
 Julien Su <juliensu@mxic.com.tw>, Alvin Zhou <alvinzhou@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>, linux-arm-kernel@lists.infradead.org
References: <20230201113603.293758-1-miquel.raynal@bootlin.com>
 <20230201113603.293758-9-miquel.raynal@bootlin.com>
 <8c54df69-52ac-b2e7-09d8-2066fb15c998@linaro.org>
 <CAAQoYRmk6X287B5-U3sk-ThUrm-210W_u8mkvBcsxBwaCDX53w@mail.gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAAQoYRmk6X287B5-U3sk-ThUrm-210W_u8mkvBcsxBwaCDX53w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_012249_734983_FDD5703D 
X-CRM114-Status: GOOD (  21.51  )
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



On 3/17/23 07:43, liao jaime wrote:
> Hi Tudor
> 
>>
>> Hi, Jaime, Miquel,
>>
>> Any news with the datasheet, can you send me a copy of it?
>>
>> On 2/1/23 11:36, Miquel Raynal wrote:
>>> Describe this new part and provide the RWW flag for it.
>>>
>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>> ---
>>>  drivers/mtd/spi-nor/macronix.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
>>> index 6853ec9ae65d..655e7eec865c 100644
>>> --- a/drivers/mtd/spi-nor/macronix.c
>>> +++ b/drivers/mtd/spi-nor/macronix.c
>>> @@ -82,6 +82,9 @@ static const struct flash_info macronix_nor_parts[] = {
>>>       { "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024)
>>>               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>>>               FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>>> +     { "mx25uw51245g", INFOB(0xc2813a, 0, 16 * 1024, 1024, 4)
>>> +             NO_SFDP_FLAGS(SECT_4K | SPI_NOR_RWW)
>>> +             FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>>
>> Is this flash not really supporting SFDP?
> Yap MX25UW51245G have SFDP table support.

Okay, then for the next iteration of the series we should have
PARSE_SFDP set.

> As below is the link of octal DTR feature patch which include
> MX25UW51245G SFDP information.
> 
> https://patchwork.ozlabs.org/project/uboot/patch/20220718064922.20193-2-jaimeliao.tw@gmail.com/

cool, thanks.

I'd also like an erase, verify erase, write, read back and compare test
if possible, just to make sure that the flash works in it's first day.
Obviously in linux, not u-boot. The how is in the link below.

> 
> Sorry for that I can't share the link of datasheet cause Macronix
> didn't make it public.

Ok, no worries.

Cheers,
ta
>>
>> We ask people that update or add new flash entries to do a erase, verify
>> erase, write, read back and compare test. Also to dump the sysfs
>> entries. Here's how to do that:
>>
>> https://lore.kernel.org/lkml/97a3b023-b9bc-c34d-45a4-ddd56f47bd76@microchip.com/T/
>>
>> Thanks,
>> ta
> Thanks
> Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
