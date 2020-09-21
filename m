Return-Path: <SRS0=HVA7=C6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79189C43464
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 09:23:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E60820BED
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 09:23:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lEP+X4aJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjDwSU0T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E60820BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AKuRzkrnNJiu58esa3lFqFlN1VX2Mq/O5j741BP8RTQ=; b=lEP+X4aJd27GwHnlRdGwQxPj2
	mvqZlis18YknSRt64ZDJMFVv0TWzkY5Fwu2DIMZyKHrej/nPd0NRoNPw2VDbdIK2S5OoAycjY2a26
	1UUxUDEkA8KBfEs0FQFneyjD3N2jg0H92CapjJYAfJIxIvqlmFgO+c0cfAQDFRhpgJrzWI4G2MXBO
	czOB1r/x24Z+4cBIUX1gqN3jW3Z/PWp1GFSnUdoW4T/pforBODmy1gdlov3cLkyfXFSRCsYeAxBBv
	f51b0i30QEIFuE/9r4BpnD0E6HuRKCkQ5Wl5KwTcjxRy7AjFGC6XKJL6l1J2lWD1TPTU45yuy+YYP
	wsWML9Dfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKI24-0007W7-0B; Mon, 21 Sep 2020 09:22:48 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKI21-0007VU-0R
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2020 09:22:45 +0000
Received: by mail-vs1-xe43.google.com with SMTP id y190so7707635vsy.1
 for <linux-mtd@lists.infradead.org>; Mon, 21 Sep 2020 02:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u05Wpr6th3gZZuc/V20qeaHoZS50SymbELxflFMO990=;
 b=KjDwSU0Tf5V4c/INdNqjvjsLyIBQ193QAxcl1MJ+xS8p5vsOZ0SnNgzZRm1+O0im4+
 qk4vQPxGC13M/wfpkYEPYN6emBEKJg4f0lv9A2FbWWBDVzeUcX5Tuqo2Uukx2kRRe7NG
 2ZI3YrOuL5ViJOYb+0VvaAPnzLhhGHvUef/0V8J4b0yrh9jE6igoDBlCqJQIHWiernni
 7f5SxDhQoqEm0rroih8bG4xd0eONMdMANgqMCXpFFXmai4cGVSuktQJRxjqKMw5kNjtO
 X2RbQ+gXUiiWB/PDqpCq+8tyJ1WwcxkWqc0GmnZbs6ZeCPyXpJgKZovjEK2Gm3Lv5UDX
 kKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u05Wpr6th3gZZuc/V20qeaHoZS50SymbELxflFMO990=;
 b=Zr66tQYGiS/niGGuNnDT22e/ZzK1hyfiMcSyCk5Hx5haxuZ0LFIkL6CMFz5FhCjRQj
 50B3Xzqb0ttazD6mD83dzPLDQnXw61DhC3TIG9hVhiesTD5e89ObDjuKoXkmjQZ1YxZc
 8eprHPG3yM/07qI99OYkdJHYTBXnZDRb4wS0pZyXpA4Ncos5Ynne0+QfZHh9d3oBYT/1
 6h0hQJD/qbPmFVBuz4k0XMMOvOVZydEtmqBcxV9Ir4a6AB4wrmOs/rEH6m7foSmGpeHl
 51J/seMxeuqVZsQjZ2ejcADVUk4cLvViPaWC2olFATR8xQ6Lgn5ABNj7dAC4d1fwmv0A
 //mA==
X-Gm-Message-State: AOAM532iOjCNHhXNZAMpP/+BSmJc94COiESsZRtbTW0pRRieB6lXrspt
 Z8l/I2s2sWthBs+jMQ4jyzXeUX1CBhazR5PFqiE=
X-Google-Smtp-Source: ABdhPJzUWckquMgh8fcOKZ48Ed2m+xd2Ifw1dPUf8l36Q3uxUObIbBt85EXRRYt0NG6BO/wwbytwHa0Va72GqAaYj0Q=
X-Received: by 2002:a67:e150:: with SMTP id o16mr15814357vsl.57.1600680163197; 
 Mon, 21 Sep 2020 02:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <CADBnMviQd-9TbkJFUCWE8THCYF9oq-iZfu6Cjxcy9GvTfe=KUg@mail.gmail.com>
 <CAFLxGvw9TMHz5Mf=RYytB3N6uMuK5md+WxF=atzvaXcuibmNsg@mail.gmail.com>
 <CADBnMvjuS4F8CLwbGRTAt3bVyA7DAwEFwMmNqRdNJyZCRpXCXw@mail.gmail.com>
 <CAFLxGvxF_mK573Xhc0w2njjf4qRPSTiMf9B_GRBnJo1kj1MbkQ@mail.gmail.com>
 <CAFLxGvyHWFmLTYmyqmJo9Rfm87D_ZafBWyQSMvdYKLFTUM9p+Q@mail.gmail.com>
In-Reply-To: <CAFLxGvyHWFmLTYmyqmJo9Rfm87D_ZafBWyQSMvdYKLFTUM9p+Q@mail.gmail.com>
From: Kristof Havasi <havasiefr@gmail.com>
Date: Mon, 21 Sep 2020 11:23:11 +0200
Message-ID: <CADBnMvhcowEVqUYwg3vVK-F-=N+mRNQAsaihXuUorW-iWnWcxg@mail.gmail.com>
Subject: Re: UBIFS-AUTH panic after reboot
To: Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_052245_058026_32434B06 
X-CRM114-Status: GOOD (  19.14  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 19 Sep 2020 at 22:54, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> On Sat, Sep 19, 2020 at 10:02 PM Richard Weinberger
> <richard.weinberger@gmail.com> wrote:
> >
> > On Thu, Sep 17, 2020 at 4:48 PM Kristof Havasi <havasiefr@gmail.com> wrote:
> > > Without "chk_lprops" the panic is only visible after the restart, but if it was
> > > enabled the following assertion was triggering an immediate panic:
> > > (Should I "reformat" long log lines in the future or leave them verbatim?)
> > >
> > > UBIFS error (ubi0:4 pid 649): ubifs_assert_failed: UBIFS assert
> > > failed: (val >> nrbits) == 0 || nrbits == 32, in fs/ubifs/lpt.c:231
> > > UBIFS warning (ubi0:4 pid 649): ubifs_ro_mode.part.1: switched to
> >
> > Hm, the number of bits we ask to pack is smaller than val.
> > Maybe we have some subtle bug where a node length is not correctly
> > calculated.
> >
> > From your other mail:
> > > >         0: free 0 dirty 255408 flags 1 lnum 0
> >
> > Dirty is larger than LEB size (253952). Must not happen.
> >
> > > >         1: free 0 dirty 190192 flags 1 lnum 0
> > > >         2: free 0 dirty 255360 flags 1 lnum 0
> >
> > Same.
> >
> > > >         3: free 0 dirty 248896 flags 1 lnum 0
> >
> > Does the problem also trigger with encryption disabled? So just with
> > authentication?

I couldn't trigger the same error with encryption disabled and authentication
enabled. Even if I enabled all the chk_* knobs under kernel/debug/ubifs/, no
failed assertion or error/warning log could be observed.

ubi0: attached mtd1 (name "ubivols", size 1023 MiB)
ubi0: PEB size: 262144 bytes (256 KiB), LEB size: 253952 bytes
ubi0: min./max. I/O unit sizes: 4096/4096, sub-page size 4096
ubi0: VID header offset: 4096 (aligned 4096), data offset: 8192
ubi0: good PEBs: 4063, bad PEBs: 32, corrupted PEBs: 0
ubi0: user volume: 5, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 2/1, WL threshold: 4096, image sequence
number: 460709978
ubi0: available PEBs: 0, total reserved PEBs: 4063, PEBs reserved for
bad PEB handling: 48
ubi0: background thread "ubi_bgt0d" started, PID 638
rtc-rv8803 1-0032: setting system clock to 2020-09-21T09:11:23 UTC (1600679483)
UBIFS (ubi0:4): Mounting in authenticated mode
UBIFS (ubi0:4): background thread "ubifs_bgt0_4" started, PID 642
UBIFS (ubi0:4): UBIFS: mounted UBI device 0, volume 4, name "rootfs"
UBIFS (ubi0:4): LEB size: 253952 bytes (248 KiB), min./max. I/O unit
sizes: 4096 bytes/4096 bytes
UBIFS (ubi0:4): FS size: 1004888064 bytes (958 MiB, 3957 LEBs),
journal size 9404416 bytes (8 MiB, 38 LEBs)
UBIFS (ubi0:4): reserved for root: 0 bytes (0 KiB)
UBIFS (ubi0:4): media format: w4/r0 (latest is w5/r0), UUID
7BFF4409-EE99-4BAB-9091-16FFDEBBD78A, small LPT model
VFS: Mounted root (ubifs filesystem) on device 0:13.

>
> One more question, when you mount ubifs successuflly, you see a line like:
> UBIFS (ubi0:0): media format: w5/r0 (latest is w5/r0), UUID
> 942AA41D-81B8-4F57-9CE6-0548D0D0DCB0, big LPT model
>
> Does it print big LPT or small LPT model?

small LPT model.

UBIFS (ubi0:4): Mounting in authenticated mode
UBIFS (ubi0:4): Successfully verified super block signature
UBIFS (ubi0:4): background thread "ubifs_bgt0_4" started, PID 634
UBIFS (ubi0:4): UBIFS: mounted UBI device 0, volume 4, name "rootfs"
UBIFS (ubi0:4): LEB size: 253952 bytes (248 KiB), min./max. I/O unit
sizes: 4096 bytes/4096 bytes
UBIFS (ubi0:4): FS size: 1004888064 bytes (958 MiB, 3957 LEBs),
journal size 9404416 bytes (8 MiB, 38 LEBs)
UBIFS (ubi0:4): reserved for root: 0 bytes (0 KiB)
UBIFS (ubi0:4): media format: w5/r0 (latest is w5/r0), UUID
3F835B56-9D63-49F9-A3A8-4EFDF2800462, small LPT model
VFS: Mounted root (ubifs filesystem) on device 0:13.
fscrypt: AES-256-CTS-CBC using implementation "cts(atmel-cbc-aes)"
devtmpfs: mounted
Freeing unused kernel memory: 1024K
fscrypt: AES-256-XTS using implementation "xts(atmel-ecb-aes)"

Thank you,
        Kristof


On Sat, 19 Sep 2020 at 22:54, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> On Sat, Sep 19, 2020 at 10:02 PM Richard Weinberger
> <richard.weinberger@gmail.com> wrote:
> >
> > On Thu, Sep 17, 2020 at 4:48 PM Kristof Havasi <havasiefr@gmail.com> wrote:
> > > Without "chk_lprops" the panic is only visible after the restart, but if it was
> > > enabled the following assertion was triggering an immediate panic:
> > > (Should I "reformat" long log lines in the future or leave them verbatim?)
> > >
> > > UBIFS error (ubi0:4 pid 649): ubifs_assert_failed: UBIFS assert
> > > failed: (val >> nrbits) == 0 || nrbits == 32, in fs/ubifs/lpt.c:231
> > > UBIFS warning (ubi0:4 pid 649): ubifs_ro_mode.part.1: switched to
> >
> > Hm, the number of bits we ask to pack is smaller than val.
> > Maybe we have some subtle bug where a node length is not correctly
> > calculated.
> >
> > From your other mail:
> > > >         0: free 0 dirty 255408 flags 1 lnum 0
> >
> > Dirty is larger than LEB size (253952). Must not happen.
> >
> > > >         1: free 0 dirty 190192 flags 1 lnum 0
> > > >         2: free 0 dirty 255360 flags 1 lnum 0
> >
> > Same.
> >
> > > >         3: free 0 dirty 248896 flags 1 lnum 0
> >
> > Does the problem also trigger with encryption disabled? So just with
> > authentication?
>
> One more question, when you mount ubifs successuflly, you see a line like:
> UBIFS (ubi0:0): media format: w5/r0 (latest is w5/r0), UUID
> 942AA41D-81B8-4F57-9CE6-0548D0D0DCB0, big LPT model
>
> Does it print big LPT or small LPT model?
>
> --
> Thanks,
> //richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
