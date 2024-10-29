Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068D7D2AB3F
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 13:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=brylpEhYCAe2kPsswGKpr3ccmsGLj2lyGsHgosuFTOw=; b=g57IpBlYhBh20x
	Eg1RTCpvYxBGTfOrjBdboJ6+SRsvz7TYx9rT33o1CzaVQtLIYAVcK9bvOPGN7LuTOwRFPIxice/76
	0qo8bpGdflxHlFQ5iLQqtaOFoE/ApMPlkq2ylqJuYO5JZKt4SLwNkgy4h3NXa/262A5UsluO2P2ny
	okgZeZRKCyVewqI4xzhg53bLaiYXdqn/yXnfNlFew7gY6b2W3ekPMnDwx1Zd+/MIqGQbE2iigxLZC
	gXhPmuwhVkM7kBNJIi6aNCEZBSGGcC8Zw8PtfuTUgCCP1xrojuefrMT1pWxU0L8MlxaqHiBXbJhfB
	v/9fSYZnKZzJaWH1okog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mSN-0000000EbQg-3kJM;
	Tue, 29 Oct 2024 13:40:23 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mNH-0000000EacV-0Iw1
	for linux-mtd@lists.infradead.org;
	Tue, 29 Oct 2024 13:35:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso54878965e9.0
        for <linux-mtd@lists.infradead.org>; Tue, 29 Oct 2024 06:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730208905; x=1730813705; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+EPSagbJNibvgvISoxlTHCzy9uP06DCcHvDI0SGO33s=;
        b=x9pZPGTLil60VqxpL7TkyVKtxs7Pc182BwGAKgeCscwOfT7ue1cpXGcfqbmNflGR2F
         S5qo4mD8IrSYwPiEzv2rTdPtHF11s0PeXOIfxbXkKJNTrZWtI/fDvr6ZfGOnIbNt46Mi
         jgCxn+NU6h+31t9L+y6LyxlYdQyncKMS50v5HzU7V5bpq0XVdx2Nt3ItS9QLVjgP51Hd
         YW1kNpx1sOHSCFvsjScswypIoRx0TxiDyGm+azY7SsQAzQZmt1b4xOPqCTXp238Rw7tO
         2/n+40YlHotpg2/1hpsyxWvASOECiiQZ7V5Xm8pVXeH9I0yDH7h5rR9hchwFX4eLEdhl
         O05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730208905; x=1730813705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+EPSagbJNibvgvISoxlTHCzy9uP06DCcHvDI0SGO33s=;
        b=DQRz2A46rHamLbLTSG8izp8u5x6BpbC5BJ7FcpjdJWXALX4PhGghAZJA0obE9IOg+j
         BFGqIDkVgRNnVpnZpAKPyVM8xmHKlhP19+DCug+8a4Z5vR6UYDvkuDLfZcVNmoHVIXn0
         zX2dtwQKOkjDh3vzDkCgoPLveMmwuWixeFFzKQWCYACmAwa8TCeJOFWiTStzC7RL5bR/
         otjggEXhfXbXpETbgRDVwO+zpvfyMn3Vdt9qcLZJfFZl6cDh7/c4h4Fzym3V4JtiWMoL
         LDKPPxDhTYn7vclMh2wC51Tlp+TdZ59MOq7by10OKiV39zsDa//FlCejZPXgWa6tJdXd
         5CSw==
X-Forwarded-Encrypted: i=1; AJvYcCXz4FBGhUZVbVvR/WuVgqZ7fUY/EviuGgwNwAFSNfd19r4Y1KWxJlwTdcG+j9JEbpeCdmoxUZCREYA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzcWrPU/ewalxve/StCWzCNYTxBl8BO2w/+p7dC+AQIGSUtb3t7
	weeEjkQiXjM2OSpYvyOFI98SlpEDT2s2rCN9xDY9p/pkapkbnX3t3xbqnU2Vi4U=
X-Google-Smtp-Source: AGHT+IEN43GPROeIzibt4MSindA3Ieb0caiE4z2wg9uYkNsWVGAHOaRud+GyTcWUzbdiXUO2rdVS7g==
X-Received: by 2002:a05:600c:4711:b0:431:586e:7e7 with SMTP id 5b1f17b1804b1-4319ac6e818mr111337495e9.1.1730208905077;
        Tue, 29 Oct 2024 06:35:05 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b55f689sm175326845e9.16.2024.10.29.06.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 06:35:04 -0700 (PDT)
Message-ID: <7a370586-203d-4e3b-827c-82e4306ae69d@linaro.org>
Date: Tue, 29 Oct 2024 13:35:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: atmel: add at25sf321 entry
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241029-spi-nor-v2-1-e166c3900e19@gmail.com>
 <0bbd2514-ff51-4b0c-b3ad-547e4937d9f4@linaro.org>
 <ZyDgSRcT79yksuG2@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <ZyDgSRcT79yksuG2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_063507_170769_AEE3F6C6 
X-CRM114-Status: GOOD (  19.80  )
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



On 10/29/24 1:16 PM, Marcus Folkesson wrote:
> Hi Tudor,
> 

Hi!

> On Tue, Oct 29, 2024 at 11:36:17AM +0000, Tudor Ambarus wrote:
>>
>>
>> On 10/29/24 11:23 AM, Marcus Folkesson wrote:
>>> Add entry for the at25sf321 32Mbit SPI flash.
>>>
>>> This flash is populated on a custom board and was tested at
>>> 10MHz frequency using the "ti,da830-spi" SPI controller.
>>>
>>
>> no sfdp for this one?
> 
> No SFDP for this one!
>>
>>> Link:
>>> https://www.renesas.com/en/document/dst/at25sf321-datasheet?r=1608801
>>>
>>> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>>> ---
> 
> [...]
> 
>>> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
>>> index 45d1153a04a07b7c61f46b117311b24ab695038f..8285a16b253d54ae8c4a5302850244d2248aa755 100644
>>> --- a/drivers/mtd/spi-nor/atmel.c
>>> +++ b/drivers/mtd/spi-nor/atmel.c
>>> @@ -238,6 +238,11 @@ static const struct flash_info atmel_nor_parts[] = {
>>>  		.flags = SPI_NOR_HAS_LOCK,
>>>  		.no_sfdp_flags = SECT_4K,
>>>  		.fixups = &at25fs_nor_fixups
>>> +	}, {
>>> +		.id = SNOR_ID(0x1f, 0x87, 0x01),
>>> +		.name = "at25sf321",
>>> +		.size = SZ_4M,
>>> +		.no_sfdp_flags = SECT_4K,
>>
>> it seems this flash supports dual and quad reads. Do you care to
>> add/test these modes?
>>
>> you'll need mtd-utils
> 
> Sure, not sure how I test it though.
> I've added mtd-utils but I do not see any good parameters to set mode?

Ah, you can't specify the width at runtime.

In SPI NOR you need to update your flash entry to contain:
	.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,

then in your device tree you can set dual mode by doing
spi-tx-bus-width = <2>;
spi-rx-bus-width = <2>;

For quad you set the tx/rx widths to 4.

Do a cat /sys/kernel/debug/spi-nor/spi0.0/params to see what params get
set. You need to do the tests from
https://docs.kernel.org/driver-api/mtd/spi-nor.html, starting with
section "3 Dump debugfs data", for each of the dual/quad modes.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
