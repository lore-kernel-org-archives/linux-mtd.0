Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1562C282D5
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 09:12:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 911A62184D
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 09:12:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g5xkF7ve"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 911A62184D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JNiIph1ao9cpMJdI+R17vv32HruJGIRuVl0ldWrpvzk=; b=g5xkF7veUBDfQC
	Jo6Cyf4YfTjTWrGK47MkGmrFUmnhfU3ndA11YFc6C5abmg2qPTYGaK1ncixOKouH80PbEguQceHiP
	bZCi/9nY0HWUkc1GOBzDm0ez6KZZWtD1cnOlfssbMF9/0NUta80PpGb/A2vC1bbBDVkfuq5jbj4S+
	uMd4F0TgUkEoNxShmen6QrJPaXsHFs3iFM8EZSmRqNpb4ZcMW07bmefr0RPHAs0wIpdWR5zyCrMMR
	eq14qq9eLitC4fer9c3djUyAXauLPD5g+PNYLhiNAI+6PiAwf4ZPiejuoKD1cF5qzdHS7OhTkyXtO
	GEbxpJuOXF6U3AVpGcrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1golvP-00010z-PA; Wed, 30 Jan 2019 09:12:51 +0000
Received: from mail-ua1-f65.google.com ([209.85.222.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1golvI-0000s4-6a
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 09:12:47 +0000
Received: by mail-ua1-f65.google.com with SMTP id c24so7843721uak.1
 for <linux-mtd@lists.infradead.org>; Wed, 30 Jan 2019 01:12:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yBbbScLrlPLKFqSS06UtQimhVZMwedu/CXHB5apIjdU=;
 b=PiiGUTB2cATrTEVwV9IeFmUNyZywQmnNw6lT2WBlRVtf7+qPRQjioOoATZdmASacqK
 KatcKrNGq8l7U4JNQx9DpsU+Od12Vwgc4gcNziPbyZJnGIk/31VPPHFBC6htvaI0zUk8
 9cOWWP5PW2/6gJ2dgtUZ+7jSbfAA9+UeeXJbsafC3H4dPfTozF+G7Yv/44xhRQ5RjzOq
 UdIrCqh4lC68Zm0PwiyBnI1R5XlQEBh1JyxvBTvHAHPs0kebQBjwWkKpety9Mvl7EEN5
 FkGhYsBLjq7HKXMbO3pMn0m1hvXDvtwAX1Ygf3FzXWA9dsp1yUtA77LB6dSwy6rCRDXC
 YBrw==
X-Gm-Message-State: AJcUukfyEjJgwImBctOBgEWoeqxee4qByK196f+VdAa6Z0HEZx+Z+OkF
 zbS3XgshcXJWIlSPqv0XNjjAXnYPBDOcYDP4M6M=
X-Google-Smtp-Source: ALg8bN7EnF8WzieEhfgiG2y2g1UvF9eDUHx1jLqOTbINFaj0V8RE26CwHw9CyTesrs44RrGb8HKDsNfeZp4CoS3gHOM=
X-Received: by 2002:ab0:7251:: with SMTP id d17mr12737282uap.0.1548839563085; 
 Wed, 30 Jan 2019 01:12:43 -0800 (PST)
MIME-Version: 1.0
References: <20190102143654.24362-1-bbrezillon@kernel.org>
 <20190102143654.24362-2-bbrezillon@kernel.org>
 <CAMuHMdV-=_0htu9w1xK25RVWgnRaXVR-R-oXc7f-Y_cC9SR25A@mail.gmail.com>
 <20190122133159.2033844c@bbrezillon> <20190129120337.08754bac@bbrezillon>
 <CAMuHMdXVszyR_fkjmy5RpEDW3L-Ewr_tOK3o07OEm2uh4_aSRA@mail.gmail.com>
 <20190130095530.44e7fe8a@bbrezillon>
In-Reply-To: <20190130095530.44e7fe8a@bbrezillon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Jan 2019 10:12:30 +0100
Message-ID: <CAMuHMdXKzinbtDf=cLJCAMMxeSiDrG-Hq_t3r2-kSvZQzizWYg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: Check add_mtd_device() ret code
To: Boris Brezillon <bbrezillon@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_011244_650557_847CF827 
X-CRM114-Status: GOOD (  31.55  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

On Wed, Jan 30, 2019 at 9:55 AM Boris Brezillon <bbrezillon@kernel.org> wrote:
> On Tue, 29 Jan 2019 16:29:55 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Jan 29, 2019 at 12:03 PM Boris Brezillon <bbrezillon@kernel.org> wrote:
> > > On Tue, 22 Jan 2019 13:31:59 +0100
> > > Boris Brezillon <bbrezillon@kernel.org> wrote:
> > > > On Tue, 22 Jan 2019 12:21:11 +0100
> > > > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Wed, Jan 2, 2019 at 3:37 PM Boris Brezillon <bbrezillon@kernel.org> wrote:
> > > > > > add_mtd_device() can fail. We should always check its return value
> > > > > > and gracefully handle the failure case. Fix the call sites where this
> > > > > > not done (in mtdpart.c) and add a __must_check attribute to the
> > > > > > prototype to avoid this kind of mistakes.
> > > > > >
> > > > > > Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
> > > > > > ---
> > > > > > No Fixes or Cc-stable tag here, as this seems to have worked just fine
> > > > > > without checking add_mtd_device() ret code until we started to expose
> > > > > > MTD devices as NVMEM providers (queued for 4.21).
> > > > >
> > > > > Oh yes ;-)
> > > > >
> > > > > https://lore.kernel.org/lkml/87feac02-e955-1897-d4a4-d6d6d1082e45@gmail.com/t/
> > > > >
> > > > > Your patch is very similar to mine, so the crash is gone.
> > > >
> > > > Oops, sorry about that. I completely forgot about this patch. It seems
> > > > the discussion led to a different conclusion though (patch
> > > > allocate_partitions() to reject wrong parts early) and the v2 was never
> > > > sent (or I missed it). Anyway, I guess we should have done both (check
> > > > add_mtd_device() ret code everywhere and patch allocate_partitions() to
> > > > reject bad parts early).
> > > >
> > > > > However, the warning is still there:
> > > > >
> > > > >     m25p80 spi0.0: s25sl032p (4096 Kbytes)
> > > > >     3 fixed-partitions partitions found on MTD device spi0.0
> > > > >     Creating 3 MTD partitions on "spi0.0":
> > > > >     0x000000000000-0x000000080000 : "loader"
> > > > >     0x000000080000-0x000000600000 : "user"
> > > > >     mtd: partition "user" extends beyond the end of device "spi0.0" --
> > > > > size truncated to 0x380000
> > > > >     0x000000600000-0x000004000000 : "flash"
> > > > >     mtd: partition "flash" is out of reach -- disabled
> > > > >     ------------[ cut here ]------------
> > > > >     WARNING: CPU: 0 PID: 1 at drivers/mtd/mtdcore.c:571
> > > > > add_mtd_device+0x90/0x3b0
> > > > >
> > > > > Interestingly, only one partition is created, covering the full size of the
> > > > > device:
> > > > >
> > > > >     # cat /proc/partitions
> > > > >     major minor  #blocks  name
> > > > >
> > > > >       31        0       4096 mtdblock0
> > > > >
> > > > > While I would expect two partitions, "loader" and truncated "user":
> > > > >
> > > > >       31        0        512 mtdblock0
> > > > >       31        1       3584 mtdblock1
> > > >
> > > > Yes, makes sense, I guess your patch was better than mine :-/. Can you
> > > > try with the following diff applied and let me know if it solves the
> > > > problem?
> > >
> > > Gentle ping: is this diff fixing your problem, and do you want me to
> > > send a proper patch for it or should I let you send one?
> >
> > Yes, the diff below fixes the partitions for me, so
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Note that the warning is still there, but that's probably OK.
>
> Just out of curiosity, why do you need to define parts that do not fit
> in the flash?

All of this started as an accident on my side ;-)
The Koelsch board has 2 QSPI FLASHes: the first is 64 MiB large, the
second is 4 MiB large.  Which FLASH is used is selected by a switch, but
the partitioning is specified in DT.
I wanted to use the smaller FLASH for some test, but forgot to update the
partitioning in DT, leading to:

    mtd: partition "user" extends beyond the end of device "spi0.0" --
size truncated to 0x380000

That kernel message indicated MTD tried to handle this gracefully, but
still, the kernel crashed later.

Anyway, it may be considered good practice to handle bad partition
tables, like is done for disk partitioning, so I think it's worthwhile to
have this fixed, which is what your patches achieve.
There's still a WARN_ON() drawing the user's attention, though.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
