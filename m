Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C892CF9C6E
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 13:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8iVLbMWGxT2v6UhwjRjvJ7UE2WrQaq4SE4U2aJMxuGY=; b=FnQNQPw4h6lkNH
	9ORZtQYRCsQ2BBJCrcVejF/DgbtZWrF7r/xt7Rs/htvJm/hoM65XSPHtyJiVaCYmzPLBX8QIYRqqu
	zUMqdFj8xtROx93FyA8ggNTbzFxFi/GPLFpXQxwzLadoJ3CFUod1UghM5GIKGWJ7+6Oj/DzGJT6AE
	0XJIvmHE8PD8Lz/6EKceeh/aOgv3JgSrdreF6mjF9FCB/i5ctWh1aG0CSWiBSigP0frBZ9FHaQ5uh
	MsS55C/pqMwKUlZ5L4cEFpJEHX0J7zIbrR4h1Pz0kf6WnOOa3OXsKG3SQEspyTeyWcVn9mJaA1rYF
	GNECztKKUpPhbX3IR5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssihQ-0000000HEei-1FwF;
	Mon, 23 Sep 2024 13:01:56 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssihM-0000000HEe1-3IyV
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 13:01:54 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a7a843bef98so583014566b.2
        for <linux-mtd@lists.infradead.org>; Mon, 23 Sep 2024 06:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727096511; x=1727701311; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e/gF8/Lfb4a/bJjAHEDn5s6YpBeBGVhxEuTLoEXlIKI=;
        b=cqTqad6CtbuG+K9nDNEmUHrjFJqs7R1aspfaA9tMOCkGkyBoEnG1V1MfHaLco0UEYz
         qrvSEbU9ua92bCLFTta1vmvvHjyYF6hAsNUWE4ui0lyM01iTrdZx7qwyO767tQBp3oiw
         u5EX+7q9d11qyEQhMdW9vyFwLdr42UtkUJtvUIb36g1pE4qsAfPLQ9WfYjEReVtxsu2c
         hZYg47/lgz/dc3KHvSxzE8eGNdB4ogfnou2nnCr0S3DW7rZdn6/vMDDUYFUMld5H7IsS
         cFEYHK9ktJGe3XnYoU87dTqkw/tmKGfHtUNMABfsQbaQx5kN4qClac/CI4TeaEXvMo6m
         6Vng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727096511; x=1727701311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/gF8/Lfb4a/bJjAHEDn5s6YpBeBGVhxEuTLoEXlIKI=;
        b=kF2ETJHThzgv6NS9GvbIyrm1yjNGK39nXrAmYpBkOn29E5E5b0BXsGxv/224ti5vl3
         7+cqkSjTEqiJ7A+sTBWobU68l8GFJi3IJ6peP500iL5p13aa21iQy3VpWnTCmCOJUpmN
         JyZi/mtYDNWi3cC0UXzlbhI2ubNQQIxVbDjtDpl5H6XH77rK7+iKSzkoynLdXV4tzLns
         zCZT/F0V2u7mfbzXtkzuLVF/pmhYM9CXu1RHzAi/RoBSBwV5/PQhfsdXbDsKVgwdyN5H
         AV01ytTxUa2JpQjYxq7VMT7atCRW2OrvS8vJp5dGKOrF4b3sshyKrBWdzdorvF3qpy03
         ip6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5GqukkpPYNb5kYe3PsrnmRt3dw27OWWb4uQez/Kl11qe1/j484Aj3XCTVHvULKmpshR117kIC/xE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy25F91hPeQlRqprzjwKqELGr2rR1ovUNI7Uh7pxkGu5OK+YMLx
	qqEZzwVnJ9OEtj14dg+0mb9Yoos0Wdu5iwRt1eSBV/nkXmRYIVCYnCL5Gpb/Lrp44DIJqwFO2xI
	KSPGpQpoqC67EmI7PkLnw6/WJkJQBMeOZUg==
X-Google-Smtp-Source: AGHT+IEy0HmVgdJuHDr2khlgjJkc6dmg17690sJbqL96jYBBl/KemeFLe4A4YJAnZ+5vfhJev+MJqSLMaQoK6KY2Loo=
X-Received: by 2002:a17:907:f148:b0:a86:700f:93c0 with SMTP id
 a640c23a62f3a-a90d504f5c6mr1085431466b.35.1727096510186; Mon, 23 Sep 2024
 06:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240920181231.20542-1-erezgeva@nwtime.org> <20240920181231.20542-2-erezgeva@nwtime.org>
 <4e0cf43c-4843-451c-ac6f-86775dbccb2b@linaro.org> <CANeKEMOmhAPM1j1_ihzcC2wL6jKsWXPCGfZs+euS8mRvtqgE5A@mail.gmail.com>
 <2c87568d-3caa-4162-91de-094684f1b268@linaro.org>
In-Reply-To: <2c87568d-3caa-4162-91de-094684f1b268@linaro.org>
From: Erez <erezgeva2@gmail.com>
Date: Mon, 23 Sep 2024 15:01:13 +0200
Message-ID: <CANeKEMO4ckeJZHKEOKHVeamPzR045jpwkXWfJS9S6rBiMTayuQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] mtd: spi-nor: core: add manufacturer flags
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Esben Haabendal <esben@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_060152_860116_21133DA3 
X-CRM114-Status: GOOD (  61.47  )
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

On Mon, 23 Sept 2024 at 14:07, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
>
>
> On 9/23/24 11:31 AM, Erez wrote:
> > On Mon, 23 Sept 2024 at 08:04, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> >>
> >> Hi,
> >>
>
> Hi!
>
> >> On 9/20/24 7:12 PM, Erez Geva wrote:
> >>> From: Erez Geva <ErezGeva2@gmail.com>
> >>>
> >>> Add flag for always trying reading SFDP:
> >>> Some vendors reuse all JEDEC IDs on manufacture table
> >>>  with new chips that support SFDP.
> >>>
> >>> Add flag for reading OTP parameters from device tree.
> >>> Some vendors reuse JEDEC IDs
> >>>  with several chips with different OTP parameters.
> >>> Alternatively we read parameters from SFDP.
> >>> But the OTP parameters are absent from the SFDP.
> >>
> >> Do you have some specific flashes that you try to identify? Why can't
> >> they be differentiated at runtime?
> >
> > You can not figure OTP parameters based on  JEDEC ID and SFDP existence.
> > I did send a few examples.
> >
> > One of them:
> > "How?
> >
> > When using mx25l12805d, we do not read SFDP.
> > As it uses the no-SFDP flags.
> > When using mx25l12833f hardware with mx25l12805d driver, it did not
> > try to read the SFDP.
> > Yet mx25l12833f does have SFDP, when I remove the no-SFDP flags, the
> > driver fetch the SFDP.
> >
> > Secondly SFDP does not contain OTP information.
> >
> > mx25l12805d has two OTP regions of 128 KiB and 384 KiB (yes asymmetric).
> > While mx25l12833f has two OTP regions of 512 KiB.
>
> Ok, so you want to add support for mx25l12833f which shares the same ID
> as mx25l12805d and has different OTP settings. Is that correct?

My patch purpose was initially adding Mactronix OTP.
After reading a lot of Mactronix datasheets, I suggest also reading
all SFDP to all  Mactronix chips.

I add compatibility as I follow Kernel rule, that new code must be used!

>
> Which flash do you have at hand, both, none, just one of them?

When I started working on the OTP code, I used MX25L12833F.
But later I left the company.
So I use my beaglebone black and connect it to a MX25L3233F.

> >
> > How do we handle it?
> > I would gladly remove the obsolete mx25l12805d.
> > And skp compatibles all together."
>
> I need to understand first what you're trying to do. Don't assume that I
> remember what we discussed one month ago. Describe the why in the commit
> message.

"Add support for SPI-NOR Macronix OTP."
I wrote in the cover letter.
No, I do not expect you to remember everything.
I did write my intention in the cover letter.



> >
> >
> >>
> >>> So there is not other way but to add the OTP parameters in the device tree.
> >>>
> >>
> >> If there isn't any way to distinguish the flashes at runtime (which I
> >> doubt/challenge btw), then as a last resort we introduce a dedicated
> >> compatible for the flash in cause and specify all needed parameters in a
> >> dedicated flash entry. This shall be more generic as further flash
> >> parameters can be statically specified in the dedicated flash entry,
> >> less invasive for dt, and less confusing for people when they decide
> >> whether to use OTP or not. OTP params in device tree is a no-go.
> >>
> >> But again, you have to prove why you can't distinguish the flash at
> >> runtime before introducing a new flash compatible. So don't go this path
> >> before sharing with us what you're trying to achieve.
> >
> > You keep sending me contradictory messages.
>
> when? Please accept my apologies if that's the case, it's not in my
> intention. Provide better commit message, help me help you.

I tried adding a new compatibility.
You say you do not want new compatibility.
You ask if it is possible to deduce it from JEDEC ID and SFDP,
I answer that this is not possible, at least in some cases..
I try to add OTP parameters in DT. You do not like it, fair enough.
What am I to do?
Seems like a dead end.

Erez


>
> >
> > I told you we can not "guess" OTP settings based on JEDEC ID and SFDP existence.
>
> When? And more importantly, why?

I send you example of 3/4 chips that using JEDEC ID and SFDP existence
is not enough.

>
> > It may be partial and Macronix may add new chips in the future.
>
> I don't understand what you mean by partial, please elaborate.

I think Kernel like using bullet proof methods.
methods that will produce a working results.
If I find one example we can not probe the OTP parameters this way, it
means this method is NOT bullet proof.

>
> And we don't add support for what we assume new chips will look like.

This is not what I ask for.
Just trying to guess OTP parameters in current chips will break with new chips.


>
> > They reuse JEDEC ID only retaining flash size and blocks.
>
> Yes, I know macronix shares flash IDs among flavors of flashes or new
> chips altogether.

I am glad you know.

>
> > This is why compatibilities work with new Macronix chips . Although by
>
> In the last 7 years we haven't add any new compatible for SPI NOR, I
> don't understand what are you referring to.

The fact we can not deduce OTP parameters with current methods.
I do not mind in what way we do it.
But it seems there is no way according to your suggestions.

>
> > reading the SFDP, we can use higher speeds.
>
> I don't see what's your point with this sentence.

SFDP specifies different methods of reading and writing. Double, block.
But it does not contain any information on OTP.


>
> > We can use SFDP parameters to read  flash size, blocks and speed.
> > But it does not contain any OTP parameters.
> > I found only one Macronix chip with an enterprise SFDP table with a
> > boolean flag for OTP, this does not help us much.
>
> So you say that there's a specific vendor SFDP table that contains a bit
> indicating whether OTP is supported or not? Use that then.

I found only one chip like that.
All the others do not have it.
Nor any information on OTP size and number of regions.
So, no it does not help much.
I do not hold any information.

>
> > Macronix technical support was explicit on OTP settings. You can not
>
> Provide us the answer for your specific flash. I don't care yet about
> all their flashes.

There are two parts:

SFDP - all Mactronix chips whether they are in the compatibilities or
not, have SFDP.
 There is no logic to skip SFDP just because we have an old chip entry
in the compatibilities table.

OTP - I want to add only one chip with OTP, the one I test.
 But I can not rely on JEDEC ID or SFDP to deduce the OTP parameters.
 So as I understand we have two options:Add compatibility for this
chip, or add dynamic OTP parameters (in DT or sysfs).


>
> > deduce them. You must know what chip you use.
>
> And I think I already said that you can differentiate between the two
> based on SFDP presence. mx25l12833f has SFDP, thus when SFDP present use
> the mx25l12833f-OTP configuration. When SFDP is not presence one may add
> support for the mx25l12805d-OTP configuration.

No, we have 3 chips.
2 are using the same JEDEC ID and both using SFDP, yet they use a different OTP.
So, the problem is here, and probably be bigger in the future, despite
you "do not care".


>
> Is there any case that I miss?

According to your reply, I would say pretty much most.

>
> > As far as I can see, Macronix does not reuse module names (god thanks for that).
> >
> > I do not mind using flash compatible.
> > Just clarify that point.
> > And I will send the patches accordingly.
> >
>
> I'm afraid I haven't understood yet what you're trying to achieve to
> provide some guidance.

I do not understand you either.
But I try to work on my communication skills.

Thank you for your feedback

Erez

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
