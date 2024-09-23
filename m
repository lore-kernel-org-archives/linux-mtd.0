Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79009CF9C69
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 14:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a/FkzDJd5JWYul1yw6G6UHd9vGOaZRt3jztzsOwXANg=; b=ra8SbgQznzo4yc
	+UzPUeRr+j5L09sbS3+sTGpT7r8cv/MhYPVFHRTzWT8Q4AXBXyEl3LOc4ssbcq7em1ft/Ba2V0/2Z
	ACoSb6MlpGxwBcHSVoSaDg9Hr9KZX25YhqGog7xutrWcxy7a1gDqZutjkSexieH4flzIYm53bWI85
	UQRaveQHwHQtFfeX0cjzB7M0XqHS8vnVo3DcVcQLGQmWBzA8lNS5kr5Rdfz290rmIM9L9tSVYmQSa
	LFv8YonWcFkzTQUirTw+ZT1pSie+afvTrDYTgN5cMFUyEsD+DaYHRvg4AUDoSLd3NGUUZmIFSRBNM
	kwTED5zIVk1UugGe68FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssjtb-0000000HMG7-3jcQ;
	Mon, 23 Sep 2024 14:18:35 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssjtZ-0000000HMDj-09PX
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 14:18:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-42cd46f3a26so37668125e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 23 Sep 2024 07:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727101111; x=1727705911; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2FmzoM+gq+uFwXHs1nemPf5IMWJAS6uXYL8yL81x6Ws=;
        b=VJSdhDF/Cjo12ZPv2uOxeleMCp14WU83B9x06bDOHe0w93pbxQC2h3yJSrDtWyqNse
         PdleX/TqTknVuus2Jp0e0ine7u8uHugroRU00kj0HhNBKPLbHNhiuOFDVZv+3OyAR+s3
         GRo/e2EWZYbSgqMLTiOtfyTUnTldUNM4MNmj24ZPa9ubxgu6VgtrtUxG3+FqIJM2Ycij
         YyBe1PP9sSyl3Oi26moyJzD9+Jc4+GXtiZmGXx16eBv2CVNQwzuVjnoUVjzouiMNsaHV
         uRwm87KAJwIt/EL+NTfbDPC7TQxG8zJxn5nZqwlxuEqGRAVc5PESPjhf0mpO0AwXmG+m
         PVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727101111; x=1727705911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2FmzoM+gq+uFwXHs1nemPf5IMWJAS6uXYL8yL81x6Ws=;
        b=tv4ashnyVqbgxBU3IHbjDRTU4Qi+F1tJL8jyrs5njb8klmUZluFzWG5gN/WhHPF6wL
         zUpVG1BkU3xnGGVNmCHVxQegNUYSG1XxwMElP2xhDK4sNSbUKd69J7F/qcypksSSrkjs
         oS61bk87ofaFTQvWQAI3UhUDLPBAQl+VkiFbGXD5spsk+NBKsjeQJx8DWEy68QEZS/eu
         Oj/4Ur//hnQH7DKbiTzI9L4zj6jlPk5ojZQZFPbODtIkFGSMv55Dn02S+pC4A0munNGw
         pofyyqpwpugZFDLt0QvzJNxOhvJYanUcYBXyJrtXGV24fyLuYVh313N+y2NgHZwfbxlh
         +3Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVKuBDWlzkVkB0Yn+XUX2levGg8OSogrWn3L1CdrHFkf8B50RYADir9MqfE8Yh/NbeEiGRlNAJHw5Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuoGC+vtYv1DqmD3+a64pRL0m9anoIqizrCDSuPiJ8813YvvT1
	L8seXl5v2OvZ5WTnEehaljDBQ+2ryuMZW7acE7EOLM1D/ayhH607i4vEYqLyp2M=
X-Google-Smtp-Source: AGHT+IGu1hopE+dTd8xiVA++86nDFbQKYhbmtS+//vHskxqqCkbXQd4a1pod9/FsUJlEipv+9gjXmQ==
X-Received: by 2002:a05:600c:34c2:b0:42c:ba0d:c766 with SMTP id 5b1f17b1804b1-42e7abe22ccmr76427165e9.6.1727101110926;
        Mon, 23 Sep 2024 07:18:30 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e754ce37bsm128270445e9.48.2024.09.23.07.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 07:18:30 -0700 (PDT)
Message-ID: <688d3e68-c339-4a44-b6b5-366dd5f12965@linaro.org>
Date: Mon, 23 Sep 2024 15:18:28 +0100
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
 <2c87568d-3caa-4162-91de-094684f1b268@linaro.org>
 <CANeKEMO4ckeJZHKEOKHVeamPzR045jpwkXWfJS9S6rBiMTayuQ@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CANeKEMO4ckeJZHKEOKHVeamPzR045jpwkXWfJS9S6rBiMTayuQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_071833_133963_7487D481 
X-CRM114-Status: GOOD (  37.06  )
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



On 9/23/24 2:01 PM, Erez wrote:

cut

>>>
>>> mx25l12805d has two OTP regions of 128 KiB and 384 KiB (yes asymmetric).
>>> While mx25l12833f has two OTP regions of 512 KiB.
>>
>> Ok, so you want to add support for mx25l12833f which shares the same ID
>> as mx25l12805d and has different OTP settings. Is that correct?
> 
> My patch purpose was initially adding Mactronix OTP.

support needs to be added per flash, not per manufacturer.

> After reading a lot of Mactronix datasheets, I suggest also reading
> all SFDP to all  Mactronix chips.

Why? It seems too invasive. Generally it is not recommended to issue
unsupported commands to flashes. Change just the flash that you use and
can test.

cut

>> Which flash do you have at hand, both, none, just one of them?
> 
> When I started working on the OTP code, I used MX25L12833F.
> But later I left the company.
> So I use my beaglebone black and connect it to a MX25L3233F.

I understand mx25l12805d and mx25l12833f share the same ID. How is
mx25l3233f related, does it share the same ID as the previous two?

> 
>>>
>>> How do we handle it?
>>> I would gladly remove the obsolete mx25l12805d.
>>> And skp compatibles all together."
>>
>> I need to understand first what you're trying to do. Don't assume that I
>> remember what we discussed one month ago. Describe the why in the commit
>> message.
> 
> "Add support for SPI-NOR Macronix OTP."
> I wrote in the cover letter.
> No, I do not expect you to remember everything.
> I did write my intention in the cover letter.
> 

I already read your cover letter and it didn't explain the challenges
that you're facing.

cut

>>>
>>> You keep sending me contradictory messages.
>>
>> when? Please accept my apologies if that's the case, it's not in my
>> intention. Provide better commit message, help me help you.
> 
> I tried adding a new compatibility.
> You say you do not want new compatibility.

I said new compatibility will be introduced as a last resort only if we
can't differentiate the flashes at run-time. You haven't proved me yet
that this is the case.

> You ask if it is possible to deduce it from JEDEC ID and SFDP,
> I answer that this is not possible, at least in some cases..

I'm interested just about your case, not all the possible cases.

> I try to add OTP parameters in DT. You do not like it, fair enough.
> What am I to do?
> Seems like a dead end.
> 

You can better explain what are the challenges you have and answer the
questions that we're asking ...
> Erez
> 
> 
>>
>>>
>>> I told you we can not "guess" OTP settings based on JEDEC ID and SFDP existence.
>>
>> When? And more importantly, why?
> 
> I send you example of 3/4 chips that using JEDEC ID and SFDP existence
> is not enough.

Why? Do they have the exact SFDP tables? Prove me, drop them all.
Any bit that differs in the SFDP tables is enough to differentiate the
flavors of flashes. Vendor tables included ;)
> 
>>
>>> It may be partial and Macronix may add new chips in the future.
>>
>> I don't understand what you mean by partial, please elaborate.
> 
> I think Kernel like using bullet proof methods.
> methods that will produce a working results.
> If I find one example we can not probe the OTP parameters this way, it
> means this method is NOT bullet proof.
> 
>>
>> And we don't add support for what we assume new chips will look like.
> 
> This is not what I ask for.
> Just trying to guess OTP parameters in current chips will break with new chips.
> 

Again, I'm interested just in the flashes that you use and can test. I'm
not interested in addressing theoretical problems.
> 
>>
>>> They reuse JEDEC ID only retaining flash size and blocks.
>>
>> Yes, I know macronix shares flash IDs among flavors of flashes or new
>> chips altogether.
> 
> I am glad you know.

I sense some rage and I find this inappropriate. I'm just trying to help.

cut

>>
>> And I think I already said that you can differentiate between the two
>> based on SFDP presence. mx25l12833f has SFDP, thus when SFDP present use
>> the mx25l12833f-OTP configuration. When SFDP is not presence one may add
>> support for the mx25l12805d-OTP configuration.
> 
> No, we have 3 chips.
> 2 are using the same JEDEC ID and both using SFDP, yet they use a different OTP.

Which ones are these?

I guess mx25l12805d is non-SFDP. Then mx25l12833f and mx25l3233f define
some SFDP tables. Do mx25l12833f and mx25l3233f have the same OTP
organization?

> So, the problem is here, and probably be bigger in the future, despite
> you "do not care".
> 

I hear about your problem just here, after 3 emails exchanged and at
least one hour wasted of my time.

I want to address problems one step at a time. We can address the bigger
theoretical problems in the future, if they'll ever become real.
> 
>>
>> Is there any case that I miss?
> 
> According to your reply, I would say pretty much most.

This is again inappropriate ... I will read your next email as well, but
I'm not going to tolerate such replies anymore.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
