Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C90CF9C70
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 14:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=646dapF+/DBW4Pm+FSuxuqosacXIPqdMUO2QeW4FK/M=; b=d2dRHkR9HWcYYA
	D1S+61T9t25eqzhFhCdJZXDCdIoAQbBbCHcSNcp6xg9XK9W2b3QrLiQ/TP0OaBhX+wVpWYYN7/zoG
	wtR8AbNRpcgRbK8YWUJqSBzbA9x8vThwX7Gz/TjTY1G33ylR5GKTZgSAy5GQMey8uZL3qkvl1sm1y
	hAVkr8kGPMAdLwkdytERj8xzR8AIUbbLxVpryYcQe+tqcbHFGuGON9VygipfT8Z1h01drBc9y8PFN
	O7R3m+xdPbwxUbUtt21hvC00FgYKssQrCG8tMq7iNdGWnKiNs6f/SwfAyWWhoHvBFGLRY+FWHbwxa
	T5KMrGPrY0jm/Wr8tX8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sskQC-0000000HPze-0Hvk;
	Mon, 23 Sep 2024 14:52:16 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sskQ9-0000000HPzI-1MMO
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 14:52:14 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a8d2b24b7a8so56100566b.1
        for <linux-mtd@lists.infradead.org>; Mon, 23 Sep 2024 07:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727103131; x=1727707931; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dvYWgvPz4GHMK4BJ9bWLcc0WD2pvlKF4BVBrgMYJ8ss=;
        b=KgmLHu5tLrJ4WGMsJmjmbgTA823vwYP3PvYdX1EVAEx+b2zaez/RyBHG3onAiVuEJD
         O2xQZhf8IDZnUpdE/5NxboDT15IOAoHsynE1eG2sYmIRwLPJqjJ+LIM43DUHhmGQV+RU
         iBx4hTcPZNXd6JGt1dqexmr6+nYKgHiJ+AVSmAoCFvDi/0dgahUzJT+BLGS7OBkgPpMq
         ze9hwfC+PTlzxLZjZ06NYwLrFtbFp7QjQx2+kE15Y8blmkuXnVxP2+7T6i0S7J+v4QKC
         kF9Q1dAqxiJxkAfMyxgwI9DI4aPI5fOYzF43yZN27bzWsAiXEr8etQ0oSYaO4LlxFp0N
         ZvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727103131; x=1727707931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvYWgvPz4GHMK4BJ9bWLcc0WD2pvlKF4BVBrgMYJ8ss=;
        b=GjKGE90fqCk774Gmj7X1wpvZBV+3fwwitd+FRQhfcxAeE4zrUoVyRtCqqxYiufrAzi
         AUQVtpoNSZoB1XvA+v1VtqfXre6PQODyVKthzBS5fxWxyufnM7pvODfiZimi7TRE8uUQ
         aukxgCRzPKbK3hZpdi/CWyITaaJH7Q7wo7e5YWdhAXfjn4VKHzSF4EH4UyPiXmpkhSO7
         2h/mBnGjv/AWBalF2Rb7SDYYH3V4K/zp1sqW2BR+i0qyx4j81z7jT08tYNDdGvy9LscL
         VO6LR/NhtTWkGj6/Q7Gq9jmKfS52yrFtVktQf0byiu/oUBYpbvvCnXkBmS2J9yPkJW/P
         uugA==
X-Forwarded-Encrypted: i=1; AJvYcCURoNlm+bOsVD+hA+9cdsOocLv6V7UGHnfGyhm9M90wM/IGPi4jmgbRgucxCDa9ad0BwlSKmwmh+m8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQNh/8kM2Tk2zc2B0LwG19dOuKg0tIwvdGEm5DfeSCJH0Tz+xf
	XCZy7dygdSwVH1D/J/9EscuQnfSMXcm16gzdt6/AMOhJ74S805vWVA0GPlkyuzP4pO+oDwDUYw5
	cMRDFddt0frfEUbhYaro7XQc6dw==
X-Google-Smtp-Source: AGHT+IEvo3JhxwABWxqG3yFZJBEez9HzkjZPXVQ6IVtlqFqNG4oRX+cgwW5vzetZ+acXoPUHTt0hu06nL1Lm0kDdYxc=
X-Received: by 2002:a17:907:9482:b0:a8a:85c7:8755 with SMTP id
 a640c23a62f3a-a90c1c747a4mr1776481166b.11.1727103131040; Mon, 23 Sep 2024
 07:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240920181231.20542-1-erezgeva@nwtime.org> <20240920181231.20542-2-erezgeva@nwtime.org>
 <4e0cf43c-4843-451c-ac6f-86775dbccb2b@linaro.org> <CANeKEMOmhAPM1j1_ihzcC2wL6jKsWXPCGfZs+euS8mRvtqgE5A@mail.gmail.com>
 <2c87568d-3caa-4162-91de-094684f1b268@linaro.org> <CANeKEMO4ckeJZHKEOKHVeamPzR045jpwkXWfJS9S6rBiMTayuQ@mail.gmail.com>
 <688d3e68-c339-4a44-b6b5-366dd5f12965@linaro.org>
In-Reply-To: <688d3e68-c339-4a44-b6b5-366dd5f12965@linaro.org>
From: Erez <erezgeva2@gmail.com>
Date: Mon, 23 Sep 2024 16:51:32 +0200
Message-ID: <CANeKEMNKF5WtVgzxbMnLFsqRHNOz=+gD-if8aBqsWwjgDvz3GA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] mtd: spi-nor: core: add manufacturer flags
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Esben Haabendal <esben@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_075213_392009_63FE30C8 
X-CRM114-Status: GOOD (  62.19  )
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

On Mon, 23 Sept 2024 at 16:18, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
>
>
> On 9/23/24 2:01 PM, Erez wrote:
>
> cut
>
> >>>
> >>> mx25l12805d has two OTP regions of 128 KiB and 384 KiB (yes asymmetric).
> >>> While mx25l12833f has two OTP regions of 512 KiB.
> >>
> >> Ok, so you want to add support for mx25l12833f which shares the same ID
> >> as mx25l12805d and has different OTP settings. Is that correct?
> >
> > My patch purpose was initially adding Mactronix OTP.
>
> support needs to be added per flash, not per manufacturer.

The OTP code is per manufacturer.
Not my inventions, See drivers/mtd/spi-nor/winbond.c OTP callbacks.
My patch adds support after a single chip flash.


>
> > After reading a lot of Mactronix datasheets, I suggest also reading
> > all SFDP to all  Mactronix chips.
>
> Why? It seems too invasive. Generally it is not recommended to issue
> unsupported commands to flashes. Change just the flash that you use and
> can test.

It is not, All Mactronix chips in the last 15 years have SFDP.
The chips in the manufacturer compatibility table are all obsolete.
Mactronix reuse the JEDEC IDs. There is no point pretending these are
the same chips.



>
> cut
>
> >> Which flash do you have at hand, both, none, just one of them?
> >
> > When I started working on the OTP code, I used MX25L12833F.
> > But later I left the company.
> > So I use my beaglebone black and connect it to a MX25L3233F.
>
> I understand mx25l12805d and mx25l12833f share the same ID. How is
> mx25l3233f related, does it share the same ID as the previous two?

They are not. I just replaced the company hardware with a different one.
You ask me to report the hardware I use for testing.

The patch covers the one I use with beaglebone black.
I just mentioned the OTP callbacks are per manufacturer.
But if a new chip in the future would require different callbacks,
then just add them.
My patch is using a single chip, the one I send the testing with.
beaglebone black + MX25L3233F.

>
> >
> >>>
> >>> How do we handle it?
> >>> I would gladly remove the obsolete mx25l12805d.
> >>> And skp compatibles all together."
> >>
> >> I need to understand first what you're trying to do. Don't assume that I
> >> remember what we discussed one month ago. Describe the why in the commit
> >> message.
> >
> > "Add support for SPI-NOR Macronix OTP."
> > I wrote in the cover letter.
> > No, I do not expect you to remember everything.
> > I did write my intention in the cover letter.
> >
>
> I already read your cover letter and it didn't explain the challenges
> that you're facing.

Sorry, I will improve my cover letter.

>
> cut
>
> >>>
> >>> You keep sending me contradictory messages.
> >>
> >> when? Please accept my apologies if that's the case, it's not in my
> >> intention. Provide better commit message, help me help you.
> >
> > I tried adding a new compatibility.
> > You say you do not want new compatibility.
>
> I said new compatibility will be introduced as a last resort only if we
> can't differentiate the flashes at run-time. You haven't proved me yet
> that this is the case.

Then you do not read my explanation.
Do you wish me to send the Macronix datasheet of the 4 chips?

>
> > You ask if it is possible to deduce it from JEDEC ID and SFDP,
> > I answer that this is not possible, at least in some cases..
>
> I'm interested just about your case, not all the possible cases.

Actually it is the MX25L3233F and its previous chips.
Anyway, I will not submit a broken solution.
Whether you like the idea or not.

>
> > I try to add OTP parameters in DT. You do not like it, fair enough.
> > What am I to do?
> > Seems like a dead end.
> >
>
> You can better explain what are the challenges you have and answer the
> questions that we're asking ...

I try.
But seems you are lock in a loop.
You want to eat the cake and leave it as is.
You do not want to add compatibility and reject using dynamic OTP.
You are welcome to find a third way.
And no you can not use JEDEC ID and SFDP for that.



> > Erez
> >
> >
> >>
> >>>
> >>> I told you we can not "guess" OTP settings based on JEDEC ID and SFDP existence.
> >>
> >> When? And more importantly, why?
> >
> > I send you example of 3/4 chips that using JEDEC ID and SFDP existence
> > is not enough.
>
> Why? Do they have the exact SFDP tables? Prove me, drop them all.
> Any bit that differs in the SFDP tables is enough to differentiate the
> flavors of flashes. Vendor tables included ;)

Because the SFDP is not related to OTP in any way.
You are planning to decide OTP parameters on non relevant information.
If you wish to implement such a broken feature, you are welcomed.
I'll pass.

> >
> >>
> >>> It may be partial and Macronix may add new chips in the future.
> >>
> >> I don't understand what you mean by partial, please elaborate.
> >
> > I think Kernel like using bullet proof methods.
> > methods that will produce a working results.
> > If I find one example we can not probe the OTP parameters this way, it
> > means this method is NOT bullet proof.
> >
> >>
> >> And we don't add support for what we assume new chips will look like.
> >
> > This is not what I ask for.
> > Just trying to guess OTP parameters in current chips will break with new chips.
> >
>
> Again, I'm interested just in the flashes that you use and can test. I'm
> not interested in addressing theoretical problems.
> >
> >>
> >>> They reuse JEDEC ID only retaining flash size and blocks.
> >>
> >> Yes, I know macronix shares flash IDs among flavors of flashes or new
> >> chips altogether.
> >
> > I am glad you know.
>
> I sense some rage and I find this inappropriate. I'm just trying to help.

Because I repeat myself over and over.
And I find myself in a loop with you.

>
> cut
>
> >>
> >> And I think I already said that you can differentiate between the two
> >> based on SFDP presence. mx25l12833f has SFDP, thus when SFDP present use
> >> the mx25l12833f-OTP configuration. When SFDP is not presence one may add
> >> support for the mx25l12805d-OTP configuration.
> >
> > No, we have 3 chips.
> > 2 are using the same JEDEC ID and both using SFDP, yet they use a different OTP.
>
> Which ones are these?
>
> I guess mx25l12805d is non-SFDP. Then mx25l12833f and mx25l3233f define
> some SFDP tables. Do mx25l12833f and mx25l3233f have the same OTP
> organization?

No, that is the point.


>
> > So, the problem is here, and probably be bigger in the future, despite
> > you "do not care".
> >
>
> I hear about your problem just here, after 3 emails exchanged and at
> least one hour wasted of my time.

Sorry for wasting your time.
I am also wasting mine, I hope you appreciate mine as yourself.

>
> I want to address problems one step at a time. We can address the bigger
> theoretical problems in the future, if they'll ever become real.

As I read more than 15 datasheets of Macronix flash chips, and
specifically ask the Macronix technical staff.
This is not theoretical. But actually.
Having said that, does not mean I plan to support in this patch more
than one chip with OTP.
Only that your suggestion will lead to a broken probing of OTP
parameters, if not in the present, then in the future.
See, until today OTP was not that appealing. I seem to be the first
one who wrote OTP code for Macronix.
So it is not like you have a real experience with it.
I just start the surface of it.





> >
> >>
> >> Is there any case that I miss?
> >
> > According to your reply, I would say pretty much most.
>
> This is again inappropriate ... I will read your next email as well, but
> I'm not going to tolerate such replies anymore.

I agree on this one.
Seems you are looking for something I do not agree on.
This is not because I oppose probing,
 this is because you ask for indirect probing, against Macronix own
recommendation.

Sorry for bothering you

Yours
   Erez

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
