Return-Path: <SRS0=lgj1=BW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC3D7C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2020 15:42:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97220207DA
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2020 15:42:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nCoKuA8M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="HXcUj/8n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97220207DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cEEFdEDDxGY11GHi40p5uJCdItXliJMM1i0odCIeWE8=; b=nCoKuA8MJE3xXehewXXYA1qTY
	5/mRbBZEE5KezVyLtXgGVHzKqaoTe8duSXKES/FtCwI/yKwESr1dzdVnuetYO5AFI/qxaXO/DsqPH
	ReXVuQr9t99A7DJw60b+GWshpglVY/fcHmVZw01H2RzsXBgHrJRmp1vWsRmrKLGsgYNZys3oWa+dS
	SGfgTJWVhlAya+fNhDtHI9wSvHfR9oSfHyAo6Fa9TCPlRy0YNXcPMZ2o1kdtiipNu7pdWaNAB9wVS
	0P5YmsGIXjIe6qP9PW7cdrOMu0Qn0TCvtmIiUb/wSb1zU/5TBnSffGu3wa4WTpBEousiKWcnc9u46
	bInJqYhlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5ssz-0002bV-B5; Wed, 12 Aug 2020 15:41:53 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5ssv-0002ay-VN
 for linux-mtd@lists.infradead.org; Wed, 12 Aug 2020 15:41:51 +0000
Received: by mail-qv1-xf42.google.com with SMTP id j10so1192478qvo.13
 for <linux-mtd@lists.infradead.org>; Wed, 12 Aug 2020 08:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=haCZp8d7OZAFbRh0ccsZ5DNIkLr16Zii89E0sXPAORI=;
 b=HXcUj/8nYPyuiRt/bdiw2udHv9wTKOG/PYcKO9Gdsa/+oPPJKPsPVQcmvC83jET7Om
 Jsq1HYXsoxblYI/Zm1SvjAW6qzpb5YPSSHii/6rBssU7Wu2MYDzwZ30Zj3UbS9tu7Ljj
 JDPTUz7lxQdbQkDwDjISjIGUU4mVfXRTgGTdMoa+N04kYDTE82ai1MVZfo249Owbho6G
 5tQqbEnl7yoCIuRT9DFSTclrP8ex43bu6ik/16p5EnaVOtdiPN8hIonEiHZl92rX+IPW
 teGtTYpyvkc8LTR+YbHG6/V3vPaKJ84ZEeySq3IDVJmQA8L3Lf0Wew4fTri8X8Tu5yXL
 2ecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=haCZp8d7OZAFbRh0ccsZ5DNIkLr16Zii89E0sXPAORI=;
 b=jS6aNEGCdkz5JLVmYzTwjDPrkDb56UcsKNUbBBF/0LClAMTNWGh+GgXT8tfI08Nu/3
 5falMpy/T5xJohjO5PaW2YvXzpDkBHSK4Bg/hsqV8Po02mr/b5N4r2A9vFo8duyqGiCH
 STAgWWI2Ju0VjNxe4ChYrkYbSnm/sxNVMxGf+yU9y6Szf7nbNyr5C17r0T8HBFRcz+lV
 g6RqHcMswKzzKV1vENZJvtCpK79NSPlJY0b3EvHlENR6gANZCpFeQgb7MYU1XNXt8bza
 QvMZZCnKYXjm2Z6rI1XfT+4HEQRtgUDGYD30sxpC2xfSkQHpTgGjTEdZHqKkmXAiMQBP
 N6sA==
X-Gm-Message-State: AOAM532miml9fdguF3MXJlEEHmz3KAZzf1ufHPNJDEDlI0apxBKgNy+i
 Pp4o/r96EaRSFNIr8SZq06PCFTpOLK+qk+SBNnwl3w==
X-Google-Smtp-Source: ABdhPJzXAxewiJp6SpmJoqd5oXPp1B2xCxwmqfuOwpOLAawT9RWGc8YhA071QWN3Hamy52lLh5Ro0K3VQnLOSTRCjNI=
X-Received: by 2002:ad4:55ca:: with SMTP id bt10mr172844qvb.200.1597246906738; 
 Wed, 12 Aug 2020 08:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200804135817.5495-1-daniel.gutson@eclypsium.com>
 <CAK8P3a0_fJ0BfD5Qvxdo0s7CbjPWaGA8QTgYhbXR=omafOHH4Q@mail.gmail.com>
 <CAFmMkTHEm8k+5GZkVJbDZMEhMwpsqVKRb-hGskSpBstdLRuFyA@mail.gmail.com>
 <CAK8P3a27bTYyn3N+tX=i_6f4KrQkOmkUA1zUQfvCW7qw6smSkQ@mail.gmail.com>
 <CAFmMkTF9eVm0tpOKEy2rzdX=Scr3RwqHDFy_i24R3F5ok-4=eA@mail.gmail.com>
 <CAK8P3a3mf8_Y4DWe3WuBO-Xo0N4Jj=-rrtFzD6w0TriGZPu1_g@mail.gmail.com>
 <CAFmMkTFzmC=aY0gR6urLu-8Oq8aeHBUWi-TodG8XhXKCcC057A@mail.gmail.com>
In-Reply-To: <CAFmMkTFzmC=aY0gR6urLu-8Oq8aeHBUWi-TodG8XhXKCcC057A@mail.gmail.com>
From: Daniel Gutson <daniel@eclypsium.com>
Date: Wed, 12 Aug 2020 12:41:35 -0300
Message-ID: <CAFmMkTE+2Qxo43bZkwCszEYbXFV22YdpLJD40gB6LgvnPbvdSA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Do not try to make the SPI flash
 chip writable
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_114150_276974_EF6A5E2B 
X-CRM114-Status: GOOD (  45.75  )
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
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

ping

On Tue, Aug 4, 2020 at 6:26 PM Daniel Gutson <daniel@eclypsium.com> wrote:
>
> On Tue, Aug 4, 2020 at 5:46 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Tue, Aug 4, 2020 at 9:57 PM Daniel Gutson <daniel@eclypsium.com> wrote:
> > > On Tue, Aug 4, 2020 at 4:06 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > On Tue, Aug 4, 2020 at 5:49 PM Daniel Gutson <daniel@eclypsium.com> wrote:
> > > > > On Tue, Aug 4, 2020 at 12:21 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > >> On Tue, Aug 4, 2020 at 3:58 PM Daniel Gutson
> > > > >> <daniel.gutson@eclypsium.com> wrote:
> > > > >
> > > > > What about just saying
> > > > >
> > > > > "This patch removes the attempt by the intel-spi-pci driver to
> > > > > make the chip always writable."
> > > >
> > > > Yes, that is much better, though it still sounds like it would at the
> > > > moment allow writing to the device from software without also
> > > > setting the module parameter. I would say something like
> > > >
> > > > "Disallow overriding the write protection in the PCI driver
> > > > with a module parameter and instead honor the current
> > > > state of the write protection as set by the firmware."
> > >
> > > But wait, Mika, the author of the file, asked earlier not to remove
> > > the module parameter of intel-spi, and just remove the unconditional
> > > attempt to turn the chip writable in intle-spi-pci.
> >
> > Yes, and I think that is fine (aside from the inconsistency with bay trail
> > that you have not commented on),
>
> There are two inconsistencies before any of my patches:
> 1) in intel-spi.c: uses the module parameter only for bay trail.
> 2) intel-spi.c uses a module parameter whereas intel-spi-pci doesn't
>
> My initial patch addressed #2 by also adding a module parameter to
> intel-spi-pci,
> but then some of you discouraged me to use module parameters.
> Mika showed up and suggested to leave intel-spi.c as is (with its
> module parameter),
> and remove the code in intel-spi-pci that tried to turn the SPI chip
> writable if the BIOS
> was unlocked.
>
> > but that only touches the hardware
> > write-protection, which doesn't really have any effect unless user
> > space also configures the driver module to allow writing to the
> > mtd device.
> >
> > > So I'm not touching intel-pci, just removing that code from
> > > intel-spi-pci without adding a new module parameter.
> > >
> > > Are you aligned on this?
> >
> > One of us is still very confused about what the driver does.
> > You seem to have gone back to saying that without the
> > change a user could just write to the device even without
> > passing the module parameter to intel-spi.ko?
>
> What I'm trying to say is that, if the BIOS is unlocked
> (no driver involvement here), the intel-spi-pci turns the
> chip writable even without changing the module parameter of intel-spi.
> This is because the attempt to turn the chip writable occurs in
> the probing of intel-spi-pci, that is, earlier than the intel-spi
> initialization.
>
> >
> > Maybe you should start by explaining what scenario you
> > actually want to prevent here. Is it
>
> Was it clear from above?
>
> Before commenting below, it's important to note again that
> the driver will succeed in turning the chip writable only if the
> BIOS is unlocked by its build time specification.
> The WPD field (Write Protect Disable) bit only has effect if
> the BIOS is not locked. This WPD bit is the one that the intel-spi-pci
> driver tries to set unconditionally. If the BIOS is locked, it will cause
> no effect. But if the BIOS is not locked, the chip will
> end up in Write Protect Disabled state.
> My latest patch simply leaves alone the WPD bit in intel-spi-pci,
> not trying to set it to 1.
>
> I'm not sure the options below are now fully compatible
> with my explanation above.
>
> >
> > a) the hardware write-protect bit getting changed, which
> >     introduces the possibility of corrupting the flash even
> >     if nothing tries to write to it,
> >
> > b) root users setting the device writable with the intention
> >    of writing to it even though firmware has politely asked
> >    for this not to be done (by setting the write-protect bit
> >    but not preventing it from being disabled again), or
> >
> > c) a writeable mtd device showing up even without
> >     the module parameter being set at all?
> >
> > I thought the initial patch was about c) which turned out
> > to be a non-issue, and then the later patch being about b).
> >
> >      Arnd
>
>
>
> --
> Daniel Gutson
> Argentina Site Director
> Enginieering Director
> Eclypsium
>
> Below The Surface: Get the latest threat research and insights on
> firmware and supply chain threats from the research team at Eclypsium.
> https://eclypsium.com/research/#threatreport



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
