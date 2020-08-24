Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A67C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 16:02:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D6722072D
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 16:02:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FJjDgIO8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="faxhd+E/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D6722072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qqB2F7sddrUlfM8YF/WPk4qM94IexLkacnW9QOg1t8M=; b=FJjDgIO8UZViyOrUqNDymxGP/
	ETTdbTEMrs3KiMHzUfoN+ChT8op15jeLJG/+tRokTqUQtidsmjJngdpX1e3KWs/nm5E/rJcqkjKwW
	mNTHp9cNQdwfcFnRPNUbMTMMJDjdgz/Hof+IlitPMDU8BqyyGSELMhLtJywDCrywJSZT3WpTr4kYZ
	nycF5amN6r9av0YMV5N48pltw2GBfD6bI/CrqMxcAI0TsRx7zd22yhUTfoI3fcCPXo064m6eyR5iG
	PG7/6v7h1Cku+mEwZKYBE9zaQPSbxahEENpaXxUQMtwff46/4EOCDEycTagWFgKexmAdVKLlGd/e3
	IRzkjXiqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAEu3-0004FC-PR; Mon, 24 Aug 2020 16:00:59 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAEu0-0004Dq-Dd
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2020 16:00:58 +0000
Received: by mail-qv1-xf42.google.com with SMTP id v1so3949070qvn.3
 for <linux-mtd@lists.infradead.org>; Mon, 24 Aug 2020 09:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wo1WKRputxQ5WEmQk/gfcqmvWhqh/EvoPHmhOwUKjX8=;
 b=faxhd+E/EzFyd/c68LZgtAVunAl5IlW4VnAzDC/LPPaQqJAjfXfz1Zv3ouYnuFvQbr
 Fjy+/maJndRntNt2Z9xRNria6z74hHH7EBXKX8IZyFXp4UfwR2+SPrDfbnftHoGu149l
 5QW/NTTmJxaD9hFTK+idq2D4J0LAzu8R72eImcM1Ndmrm5R3+3rJQwtBz38Culyj77nf
 +ccE2m+1yVQXIaHoDgs0UyvdWHfZTO0g0ED4g/KnQr0M9DMO1m1zmiG6lbIsRZW8+Fze
 9xYmeRGu6X5GUYF4sfN3U3reo8HXANvRGwyyoPHAUGtdnlAAc94bDTR8C4X77KmLP7kI
 kpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wo1WKRputxQ5WEmQk/gfcqmvWhqh/EvoPHmhOwUKjX8=;
 b=SXovRhgPIpfm8+/bAZfYUPm2p29TTBurITIXXW4OFscHNdDbw9dHbC5V8tuCYYrZeQ
 ZVcf25/sXOfBW4xEbMkr1d+HelIUqokqgyJ82g2ODXC0w40H8hN/JeEP3JgYp3XyDb6Y
 yBpQIaMmkqMsg9WsmZmjuqYFgYuYAS1TkDBy0h2n5lSvihZEybMEu0Zs6NrM2hjBSZLr
 3XCb4byWCyskA1ICTY/+5qomllhShHnMwdaIDuYe5UjRTP2h+id14MnAgF/j5l/kUAq5
 K4pqqmXFrm2agW1DAn4dtAUTEiVDwOOhi/N8ohmJzUsIwxZwSjktlxHLE4bnvHh/qMN/
 bpUw==
X-Gm-Message-State: AOAM530nhZkSh3mISUBWmm8viI1Iaf2hpLlYwFiPgW/m9+3MD3pq3WCD
 8zrahJi+7eAGS5u7MO1KFCtN60mKtId6I2KS+DtrVQ==
X-Google-Smtp-Source: ABdhPJz9Uq9KfBaA/7xCW6fnYSxivTewgXPC1ApnfvXHigkpcg5iq1x4FMZbrqUsBPU5PZfwuip2Yxzi0/Zj0fYxZgw=
X-Received: by 2002:ad4:55ca:: with SMTP id bt10mr5553951qvb.200.1598284853742; 
 Mon, 24 Aug 2020 09:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2_RV33kiJ0c34aopZ4iG7LYBR-u=-+BbC+Upyjh1T0Eg@mail.gmail.com>
 <CAFmMkTHqQO1Gj7VeXr4Y_Umb1KzZc2Pf=1pDQvPPpb_XeAFPqQ@mail.gmail.com>
 <20200819065721.GA1375436@lahna.fi.intel.com>
 <CAK8P3a0Bq-ucgC4Xue+B_HV97pTX8YRr4hYh1gfrfGBV_H1EUQ@mail.gmail.com>
 <20200819091123.GE1375436@lahna.fi.intel.com>
 <CAK8P3a19MLfQARXEWzCD-ySq4t9nsyryB+con33HsQ193+muMw@mail.gmail.com>
 <20200824082227.GU1375436@lahna.fi.intel.com>
 <CAK8P3a0==cZDHwZfqvCuvUg9jfjBOBG+AAomE9eqJ2xm-xNLvQ@mail.gmail.com>
 <20200824091542.GC1375436@lahna.fi.intel.com>
 <CAK8P3a2ipcVLOzZ5jsDSmWkm=rsE7UQ8rgTU-o6me+vX+gVa9g@mail.gmail.com>
 <20200824094448.GE1375436@lahna.fi.intel.com>
In-Reply-To: <20200824094448.GE1375436@lahna.fi.intel.com>
From: Daniel Gutson <daniel@eclypsium.com>
Date: Mon, 24 Aug 2020 13:00:42 -0300
Message-ID: <CAFmMkTFVVxqeg6bWj_4iSfSRwcOhxgBpMbyO8mFA2ze4q6LUFA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Do not try to make the SPI flash
 chip writable
To: Mika Westerberg <mika.westerberg@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_120057_113210_2D9F0712 
X-CRM114-Status: GOOD (  30.78  )
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
Cc: Richard Hughes <hughsient@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Arnd Bergmann <arnd@arndb.de>, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 24, 2020 at 6:44 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Mon, Aug 24, 2020 at 11:31:40AM +0200, Arnd Bergmann wrote:
> > On Mon, Aug 24, 2020 at 11:15 AM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > > On Mon, Aug 24, 2020 at 11:08:33AM +0200, Arnd Bergmann wrote:
> > > > On Mon, Aug 24, 2020 at 10:22 AM Mika Westerberg
> > > > <mika.westerberg@linux.intel.com> wrote:
> > > > > On Sat, Aug 22, 2020 at 06:06:03PM +0200, Arnd Bergmann wrote:
> > > > > > On Wed, Aug 19, 2020 at 11:11 AM Mika Westerberg
> > > > > >
> > > > > > The mtd core just checks both the permissions on the device node (which
> > > > > > default to 0600 without any special udev rules) and the MTD_WRITEABLE
> > > > > > on the underlying device that is controlled by the module parameter
> > > > > > in case of intel-spi{,-platform,-pci}.c.
> > > > >
> > > > > OK, thanks.
> > > > >
> > > > > Since we cannot really get rid of the module parameter (AFAIK there are
> > > > > users for it), I still think we should just make the "writeable" to
> > > > > apply to the PCI part as well. That should at least make it consistent,
> > > > > and it also solves Daniel's case.
> > > >
> > > > Can you explain Daniel's case then? I still don't understand what he
> > > > actually wants.
> > > >
> > > > As I keep repeating, the module parameter *does* apply to the pci
> > > > driver front-end since it determines whether the driver will disallow
> > > > writes to the mtd device without it. The only difference is that the pci
> > > > driver will attempt to set the hardware bit without checking the
> > > > module parameter first, while the platform driver does not. If the
> > > > module parameter is not set however, the state of the hardware
> > > > bit is never checked again.
> > >
> > > I think Daniel wants the PCI driver not to set the hardware bit by
> > > default (same as the platform driver).
> >
> > Sure, but *why*?
>
> Because this is part of the platform firmware security check patch he is
> also working on and, I guess making the flash chip writeable by default
> is triggering some of the checks in that patch. Or something along those
> lines ;-)

Correct. I need these drivers to be enabled by default, but they are
documented as "DANGEROUS", so I want to also split the driver
in read-only mode and R/W mode. Currently, the driver is R/W,
and this would be a little first step in that direction.

-- 
Daniel Gutson
Argentina Site Director
Enginieering Director
Eclypsium

Below The Surface: Get the latest threat research and insights on
firmware and supply chain threats from the research team at Eclypsium.
https://eclypsium.com/research/#threatreport

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
