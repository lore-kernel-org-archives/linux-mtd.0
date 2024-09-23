Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32500CF9C6E
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 12:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=blpzZ8vxA2h3hOxL+A0B5FSbNePGfd0KmaiIZzNPHFQ=; b=a+p8HSRELiKlM7
	YvWsuv5nCVcCmabKxNCPYfRia8HbQV6CHYhLqm0SDsnkp+meQrijh4PL69OWe7VZlgPqD2YQape5C
	ypZ+u3BC7oQt74zao8XV09WPlsZODuyHj71MrJVVJbESVV7pER4XHOBmjYbkrj9AaBPIl8C58pG3y
	1/V2FwwNJ2FrzVgBwGck3tsCu+NxD8buavQpY6ykUN3i3jWsk421r0Ld1SvrY7uhuarjlUZkzrdD0
	FXlM2ajN+Ifb32ke12l/J9zXOE8k0oO5Z4oxLmEbnLQks0Esomv3xxlH4YWaqSA4aWht543huE1oS
	KQxh4PFc2vRPqVbjzxug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sshqf-0000000H8uu-29sW;
	Mon, 23 Sep 2024 12:07:25 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sshqb-0000000H8sc-2kmL
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 12:07:23 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso38534865e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 23 Sep 2024 05:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727093239; x=1727698039; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G2gTdIRa+4av8ZO1VEuKDTF8d0ArdIdZUGvGfp1ZLPQ=;
        b=MgbY7eK5w3lV5VYj4N7ugGib9NwnrZCYye9H+IhmF9qflyMTvQaxfS3AfbojFOuR5Y
         MCYnl/wpfwCI7v66PL5AQO4BCXlFUJPM9pwBh5L5MXlMNXGiyUIVAwH1HoiITWXNqpvF
         PXXYxuaT9oGzqSSu5Td0qyspE2QDtUsP1ZM/AormJ6EUk27F6S4q4VEEjg8cVBwS+wWl
         Z5M7zZWhVyhatew6MibSgplgzas7rHMROAsfB53PAMsVDGOAsyatIru2u8zyeUBY1iCd
         WhubnllWr97RLstwBGorrhs4sT5Gr3iT33c0prfrtJf6GHontFw2iNnJhopRklv5p+7a
         acoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727093239; x=1727698039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G2gTdIRa+4av8ZO1VEuKDTF8d0ArdIdZUGvGfp1ZLPQ=;
        b=phsTIpQfoZIVnGwGMCoBNvWwUJrqq6C2sgOLLbqzYqMp1nq4wty8DadFHp6Ap+zqxr
         LH0f3Cyp3nwsEXZ9hnPpjkIX9zesLHcuBKJHkFiYZUCi3PJGjzU/WNijA1xCJL+qa6Zf
         UEaGpCyPgs8F5mHKzDt7rEKi7Lbs4l5mKoMg2tKjO2RwcKRQwsCVvEtFETxXYyo60TVj
         s2DCkeyusO0eUou0Pjzj0Z+Leu4S30MjjNPrsslJEOszgLFqXPe3AaQrNKxlU0kQTD2a
         jyCgcgldy/ycR9Fma0VYPQ3nlfsZL0tIO9Rkl9YQ/iH50Lct2Ew1Ka8ArYbx6I2qKYR9
         +2zA==
X-Forwarded-Encrypted: i=1; AJvYcCUEu9Qxft/i/wNqpEWmDb5GLGR9sOb5a/ePoQCxU6vMaBRuYfI2lO0Tt/CWL8Qtty5zgaeVTD6Di7Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5XIHBMQaUktarRSip5PEoA6kQ2sNCvKhP2MX2Sd4rNW/7P3Rt
	R1clWPQ8dkZu5X0Q7QhennOTxgA3l2/fHze2JIxk1mCU4vuj6kAtYkzYG1XFydE=
X-Google-Smtp-Source: AGHT+IHxeKCoN6oEL8DDvB657+8nV3I1QTbZQvrmTpr8AD2mgbnDig66H3xC4+6FS9+s0nXhE2pmaQ==
X-Received: by 2002:a05:600c:3553:b0:42c:bae0:f059 with SMTP id 5b1f17b1804b1-42e7abe1274mr72494645e9.5.1727093239338;
        Mon, 23 Sep 2024 05:07:19 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7543f3f4sm125405035e9.16.2024.09.23.05.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 05:07:18 -0700 (PDT)
Message-ID: <2c87568d-3caa-4162-91de-094684f1b268@linaro.org>
Date: Mon, 23 Sep 2024 13:07:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] mtd: spi-nor: core: add manufacturer flags
To: Erez <erezgeva2@gmail.com>
Cc: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Esben Haabendal <esben@geanix.com>
References: <20240920181231.20542-1-erezgeva@nwtime.org>
 <20240920181231.20542-2-erezgeva@nwtime.org>
 <4e0cf43c-4843-451c-ac6f-86775dbccb2b@linaro.org>
 <CANeKEMOmhAPM1j1_ihzcC2wL6jKsWXPCGfZs+euS8mRvtqgE5A@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CANeKEMOmhAPM1j1_ihzcC2wL6jKsWXPCGfZs+euS8mRvtqgE5A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_050721_783611_05BF39EC 
X-CRM114-Status: GOOD (  38.92  )
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



On 9/23/24 11:31 AM, Erez wrote:
> On Mon, 23 Sept 2024 at 08:04, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>> Hi,
>>

Hi!

>> On 9/20/24 7:12 PM, Erez Geva wrote:
>>> From: Erez Geva <ErezGeva2@gmail.com>
>>>
>>> Add flag for always trying reading SFDP:
>>> Some vendors reuse all JEDEC IDs on manufacture table
>>>  with new chips that support SFDP.
>>>
>>> Add flag for reading OTP parameters from device tree.
>>> Some vendors reuse JEDEC IDs
>>>  with several chips with different OTP parameters.
>>> Alternatively we read parameters from SFDP.
>>> But the OTP parameters are absent from the SFDP.
>>
>> Do you have some specific flashes that you try to identify? Why can't
>> they be differentiated at runtime?
> 
> You can not figure OTP parameters based on  JEDEC ID and SFDP existence.
> I did send a few examples.
> 
> One of them:
> "How?
> 
> When using mx25l12805d, we do not read SFDP.
> As it uses the no-SFDP flags.
> When using mx25l12833f hardware with mx25l12805d driver, it did not
> try to read the SFDP.
> Yet mx25l12833f does have SFDP, when I remove the no-SFDP flags, the
> driver fetch the SFDP.
> 
> Secondly SFDP does not contain OTP information.
> 
> mx25l12805d has two OTP regions of 128 KiB and 384 KiB (yes asymmetric).
> While mx25l12833f has two OTP regions of 512 KiB.

Ok, so you want to add support for mx25l12833f which shares the same ID
as mx25l12805d and has different OTP settings. Is that correct?

Which flash do you have at hand, both, none, just one of them?
> 
> How do we handle it?
> I would gladly remove the obsolete mx25l12805d.
> And skp compatibles all together."

I need to understand first what you're trying to do. Don't assume that I
remember what we discussed one month ago. Describe the why in the commit
message.
> 
> 
>>
>>> So there is not other way but to add the OTP parameters in the device tree.
>>>
>>
>> If there isn't any way to distinguish the flashes at runtime (which I
>> doubt/challenge btw), then as a last resort we introduce a dedicated
>> compatible for the flash in cause and specify all needed parameters in a
>> dedicated flash entry. This shall be more generic as further flash
>> parameters can be statically specified in the dedicated flash entry,
>> less invasive for dt, and less confusing for people when they decide
>> whether to use OTP or not. OTP params in device tree is a no-go.
>>
>> But again, you have to prove why you can't distinguish the flash at
>> runtime before introducing a new flash compatible. So don't go this path
>> before sharing with us what you're trying to achieve.
> 
> You keep sending me contradictory messages.

when? Please accept my apologies if that's the case, it's not in my
intention. Provide better commit message, help me help you.

> 
> I told you we can not "guess" OTP settings based on JEDEC ID and SFDP existence.

When? And more importantly, why?

> It may be partial and Macronix may add new chips in the future.

I don't understand what you mean by partial, please elaborate.

And we don't add support for what we assume new chips will look like.

> They reuse JEDEC ID only retaining flash size and blocks.

Yes, I know macronix shares flash IDs among flavors of flashes or new
chips altogether.

> This is why compatibilities work with new Macronix chips . Although by

In the last 7 years we haven't add any new compatible for SPI NOR, I
don't understand what are you referring to.

> reading the SFDP, we can use higher speeds.

I don't see what's your point with this sentence.

> We can use SFDP parameters to read  flash size, blocks and speed.
> But it does not contain any OTP parameters.
> I found only one Macronix chip with an enterprise SFDP table with a
> boolean flag for OTP, this does not help us much.

So you say that there's a specific vendor SFDP table that contains a bit
indicating whether OTP is supported or not? Use that then.

> Macronix technical support was explicit on OTP settings. You can not

Provide us the answer for your specific flash. I don't care yet about
all their flashes.

> deduce them. You must know what chip you use.

And I think I already said that you can differentiate between the two
based on SFDP presence. mx25l12833f has SFDP, thus when SFDP present use
the mx25l12833f-OTP configuration. When SFDP is not presence one may add
support for the mx25l12805d-OTP configuration.

Is there any case that I miss?

> As far as I can see, Macronix does not reuse module names (god thanks for that).
> 
> I do not mind using flash compatible.
> Just clarify that point.
> And I will send the patches accordingly.
> 

I'm afraid I haven't understood yet what you're trying to achieve to
provide some guidance.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
