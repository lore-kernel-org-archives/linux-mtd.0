Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA70C83F33
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Sep 2023 18:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGXBzDY+l02RIGbOhuA3XOilILru89QKumfq2ORZSuY=; b=epPoiuvwv162uW
	Xec1gnFPCPeARaDBo5Bfg1CfhoAy7mYtOMTdOtzFyvKokGkEB9DUX3a4fP/h5s/7cKhj/CyP7drkD
	eX61V4toaiq6NHvB5fHbClaJvN9Tr1LQiWTovfC7wyCRHpoP7SVAXBY4Jz8cOO+AqcvqlIT0hNVlU
	Y4ZWYtF7H2uWw8tC7YoiKwDh2/blnmwg36x6JN7Lk70o2aoMP3kXFVXbHRjakCH4NXPqQ+QGjDyy6
	hUWQwqZIaXWcw9ruynQFzmBeojGT5hJ2zAzhDutKXZmKf2SGQ8QrwpTPy7Grg59tUXpImMprr5mU7
	aJ2+RN7tMiZH7Zb5rjGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdEDY-004a0H-1B;
	Mon, 04 Sep 2023 18:22:32 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdEDV-004ZzY-2C
	for linux-mtd@lists.infradead.org;
	Mon, 04 Sep 2023 18:22:31 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5009969be25so2675029e87.3
        for <linux-mtd@lists.infradead.org>; Mon, 04 Sep 2023 11:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1693851747; x=1694456547; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nIQO7Ie9VkKzrMM5Wfe6jISQfV4/UOvfmz+1/s96Bf4=;
        b=UqB544X7a+Q8d8p4mAgtWyIxD6HrxnOP4QJaaxn0TE+FbQVH0upJQAVDIrn/jdsaaD
         APc8kPZAnfBgMDL0MSKTjzn/AQjM9hQK5SY4geNXgNs29dMQlByn8MyR9gHd76Zh48j5
         x49T7YBGYuu4YZvnL+/AdncPe8ekDZq4848+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693851747; x=1694456547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIQO7Ie9VkKzrMM5Wfe6jISQfV4/UOvfmz+1/s96Bf4=;
        b=IIgn1xGoM5/G1DSJ2bRvmTm0Sj4DBpEpFp312MHqMKO/G9WmZXyJg1VOZgDPfEkWP7
         sv8lpxtee8vz80qi1QRnrMYGYcOgl7S3H0dSaxYMCRQ+NAbDBtz7mIwiAyx/snQuWEd+
         ZECy8CudMEg+Vx2C7LSij4D5wVPnEzHTEsQrjj2DOmWvEznX2uXItsMReq9MZEIFuVFj
         KnMVmo35stoTuVGGHjXAcE5ptJFpqdL46CK0fj2dWEKIVOnWOZClYOr89w6aTSxQHhDW
         WXnkqPONoBu8dYMHelv37NzbQPPyTeMnQnjLHoO9CyOsoqh9czs3otjkDcEIfeO6TLRa
         T7XA==
X-Gm-Message-State: AOJu0Yw3i9WcQqjeoCROH2G1nN70MDM9DWX1IsBEJWu8oONv1CvTbJGu
	snMTwNBv2ur9tBcYdUguG+l5OqhWx7WGTAdcrJB+eeLl
X-Google-Smtp-Source: AGHT+IG9ovDjigvU7bDkbyuCUKEznYo1ofIXwIeS/goRuVYJ+EVtrH/RaE3MH0NZYvT56rBwVHkQ5A==
X-Received: by 2002:ac2:4f09:0:b0:500:bd75:77cf with SMTP id k9-20020ac24f09000000b00500bd7577cfmr7891226lfr.17.1693851747362;
        Mon, 04 Sep 2023 11:22:27 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id g26-20020a19ee1a000000b0050089b26ea1sm1839804lfb.276.2023.09.04.11.22.26
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 11:22:26 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-500a8b2b73eso2699145e87.0
        for <linux-mtd@lists.infradead.org>; Mon, 04 Sep 2023 11:22:26 -0700 (PDT)
X-Received: by 2002:a05:6512:488c:b0:501:b8dc:6c45 with SMTP id
 eq12-20020a056512488c00b00501b8dc6c45mr980028lfb.18.1693851746170; Mon, 04
 Sep 2023 11:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230901184136.73b2833e@xps-13> <CAHk-=wgUntc0u-6WQ9U3OmNHTqB=cZQoWcTOXaipB+gixV5NPA@mail.gmail.com>
 <20230904102819.54d95098@xps-13>
In-Reply-To: <20230904102819.54d95098@xps-13>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 4 Sep 2023 11:22:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj44eeYipM1Qjvena4ZG66-a04AE8H_zMtv6V1WFXYZcQ@mail.gmail.com>
Message-ID: <CAHk-=wj44eeYipM1Qjvena4ZG66-a04AE8H_zMtv6V1WFXYZcQ@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: Changes for v6.6-rc1
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, 
	Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, 
	Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_112229_724694_287B1EE9 
X-CRM114-Status: GOOD (  42.00  )
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

On Mon, 4 Sept 2023 at 01:28, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Back in 2020, you complained about one of my pull requests with:
>
> > You didn't even mention the stm32 controller change, which seems to be
> > the biggest individual thing in here..
>
> And indeed that was a mistake on my side, but I received that comment
> as a request for a more detailed list of what had been touched. That's
> likely an over interpretation, but it lead me to be more exhaustive so
> the "you did not mention <this>" would no longer happen.

You went from one extreme to another, and what I really would want is
a nice middle ground: mention the important things, summarize the
rest, and if something is subtle, please explain it.

Now, that "something is subtle" may not even happen most of the time -
particularly in drivers - so that is probably almost never an issue.

> About your request today, I totally get why you would like something
> more meaningful, but I don't know how to do it. Sometimes I get series
> which have a goal and I could definitely try to capture that goal in
> the summary rather than listing the patches.

Exactly. If you have a series with a goal, please mention / explain
the goal - not the details of the series.

But, as you say:

> But then, what about the
> endless list of miscellaneous patches to fix the style, the W=1
> warnings, various robot complains...

Absolutely. That's generally the bulk of any subsystem, and then all
you need to do is mention it as a kind of "this is what happened".

When I complained back in 2020, it was bvecause you didn't mention
even the big changes. Although quite often "big" changes can also just
be "a lot of cleanup", so mentioning it as such is also fine.

>  Because this is what I mostly get
> currently, and I believe there is no way you'll prefer something like
> this:
> * Fix misc typos
> * Fix misc style fixes
> * Update to newer API's
> Or maybe it is as long as the patches are trivial?

Absolutely. That's _exactly_ what I want for trivial patches
(including if it's a series of 15 trivial patches that all do the same
thing to 15 different drivers).

Instead of mentioning the individual patches, just say exactly the
above kind of "Update to new helper APIs", or "Fix warnings reported
by syzbot".

Honestly, for pure "endpoint" drivers, that's kind of the expected
explanation. Drivers themselves seldom have any conceptually big
changes, and so the above kind of things is normal and expected.  So
then you have exactly that kind of  "Fix W=1 warnings" comment without
any more specificity.

Then, occasionally you have one driver that gets a lot of work because
somebody goes in and cleans up that driver in _particular_, and so if
one particular driver stands out because a vendor (or an individual)
just decided to do a lot of spring cleaning, then you might have a
much more specific "Lots of work on cleaning up the XYZ driver"
mention.

Just as an example, let's look at some of the recent driver merges I
did, and take something like SCSI where not a lot of interesting stuff
happened. The mention was just

     "Updates to the usual drivers (ufs, lpfc, qla2xxx, mpi3mr, libsas) and
      the usual minor updates and bug fixes but no significant core changes"

and that's ok. It was a lot of small patches that didn't do anything
that you'd really care about unless you had some specific interest in
a driver.

But I mention that merge message because it is worth noting that I
actually complained a bit to James about it, because that pull also
did end up having one thing that stood out if you looked at the
diffstat: it removed the UFS HPB support entirely. Nobody *really*
cares about it (because it was never used), which was James' argument
for not mentioning it, but it's the kind of thing that *does* stand
out and might be worth mentioning even if it's just a curiosity. It's
a _conceptually_ interesting part of the pull, even if it doesn't
actually matter in the real world.

So I give that merge message as an example of both a perfectly fine
thing in general, but also as an example of "yeah, it could certainly
have been better". Just to give you kind of an idea what I'm looking
for.

And don't get me wrong: sometimes I really appreciate - and want - a
lot more. *IF* there are major ABI changes, I not only want them
mentioned, I really want them explained.

They *probably* don't actually happen for the MTD subsystem very much,
if at all, but to give an example of somebody who does do that kind of
"ABI changes that can affect a lot of other maintainers", we have
things like the VFS layer that then affects multiple different
filesystems, and then that shows up in the merge messages as big
explanations. Or new system calls, or things like that, which affect
not only the internal kernel ABI, but that actually exposes new
user-space ABI. Then the explanations can be tens of lines of "this is
what's going on".

So examples from the VFS layer on *those* kinds of changes:

    git show 475d4df82719
    git show c0a572d9d32f

and no, I do not expect the MTD drivers to ever do that.

But to give a recent example of a nice middle road from a merge I did
yesterday, look at the phy pull from yesterday, or the HID updates
from Friday. They have slightly different approaches to the summary,
but both of those make me feel like they are explaining what went on
in some simple summary without bogging down in excessive detail:"

    git show db906f0ca6bb
    git show 29aa98d0fe01

Anyway, all those examples are meant as just that - *examples*. It
obviously depends entirely on what has been going on, and different
subsystems can have very different rules. And often "core changes" to
the subsystem are much more worthy of mention than some cleanup of
individual drivers.

A merge message of just a single line of "Trivial cleanups to drivers"
can be entirely acceptable. But then I do expect to just see pretty
much completely mindless one- or few-liners.

Or a merge message might be 30+ lines of explanation, but then I do
expect it to be some major new feature or re-organization that will
affect end-users or other subsystems.

So there is no one single "correct" thing.

                  Linus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
