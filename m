Return-Path: <SRS0=x3fM=EE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CF2C2D0A3
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 15:40:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F26EC20759
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 15:40:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2uPTd9xY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="MvRibrIY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F26EC20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3bHdlLnqS5SiRlF4bmCxqIHTt2DWeo6a4N3IrwmNg2E=; b=2uPTd9xYGWQot0YrQhFP59P8H
	jpFT4ttaBGsArjMt7eFI4vPzoh7AR9iR8j5ULkNurj+GSXuMZ2noWooDRvLxv3Hx4+HMA9qWJdj4g
	Dcfp6Ipd9m7YEWRAEiyalcALGuvzNryPb6QH3b76pQpDVaT4u1I27JzbCv6x2YMJral1yt6vHUuV4
	XhyVQFH80N+yFpqIXqeNknI4fYo1w5hio0dyUNSjLH47DxXOApUarki+JyCZRSNIPKhDnT89p1IJV
	iRh6wsBjpkCl+uEjNJC/p7asKfJN2+qj1vQc/yoHjjlLPBx1WXdtgrGA8xJq4sZXazypSPB2mtDnL
	GNzSeLxKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYA1M-0003N4-W8; Thu, 29 Oct 2020 15:39:25 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYA1J-0003LG-Bl
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2020 15:39:22 +0000
Received: by mail-qk1-x744.google.com with SMTP id k9so2292965qki.6
 for <linux-mtd@lists.infradead.org>; Thu, 29 Oct 2020 08:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YpMSMpdWnDI27qe4/zeIevbA7qnkbhvCd6XQnOrBtHo=;
 b=MvRibrIYNg0MeSZyYa9mK5H+6bXdx7o39FoBXfKv+n6NGem2zAA0tqMOm8vfI0leJw
 JWUs+IYXRbzpZG/oSIkGnv3ljCxoH8nNAmgGvssJ3ksWnMzN3H4TNwpgxITeXMig0MtN
 4QXYfhEN73/wbEvIUXrddTw6VFRtlhh83ch7JtCfG9cwA26Sr4WcUXShte+yisZaJxo6
 uUPkWv0YbHYf8wqbK1Kpw9dc9uuTSBKA0e+ROsPul5RDQCZINks6lQK7FgrD7VOnor2H
 CawPfyaw26oqXCdBXFBVMVYMYrzoevbsBdn0HyA0wYwYFE9emYIWAwnLVkQRFS+WmqVR
 U1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YpMSMpdWnDI27qe4/zeIevbA7qnkbhvCd6XQnOrBtHo=;
 b=TrzEDEgky7tIhlnkvIvo8/q30eo9Ftb70lbjR19f/g2i5um2/xEDKTS8TovVMxaSpx
 EPWR3oOkwwCfexwuKNA0eWJZ/jwlW6gR4t675sjzO9VSC7a1VImIR+tvoXmTD+ncnWwf
 NUVvGE/aCWVkUgrobrBqRguDvTjPRRFAxwuLH5d7WSf1i3XO8mxHVpeL1hd/DCFyV8Ek
 v/BHo5GPeV3f1MS/sjQN1Lx7MzQUmkohsMd1v5ydVXMd62bG/wtmb6sBeHREnqJkZAfw
 1ejHwqE25ny1k8BdttO1SXDjVNCv86m4eI7yY0ErckrqXcf41RNJNggJu2aGh3xBAdR2
 U1Ng==
X-Gm-Message-State: AOAM532jXD6B6xRcp0YGhEx6iTRoPjaq+QxTMDhu7eTOuEXpW8UqXr8T
 KRFweFC0XxYu79poLm456m0XGY+ydg6jsvM4jyfuiJcRuS98Ow==
X-Google-Smtp-Source: ABdhPJxpVMOLJjj0KrRm94hDKYZszMjxYwzxQp5Z8jS/NgD+6SKT0KDkCCiO2OEDnCgVxhaQMDvEsxTan1bMOUlIxJY=
X-Received: by 2002:a05:620a:21d1:: with SMTP id
 h17mr4460360qka.368.1603985959134; 
 Thu, 29 Oct 2020 08:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20201028214359.384918-1-daniel.gutson@eclypsium.com>
 <20201029054110.GA3039992@kroah.com>
In-Reply-To: <20201029054110.GA3039992@kroah.com>
From: Daniel Gutson <daniel@eclypsium.com>
Date: Thu, 29 Oct 2020 12:39:08 -0300
Message-ID: <CAFmMkTHBXjNc0DeL0bOZfdJkZjPAHnRU1THHdk0tZcBr1yykTQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Split intel-spi reading from
 writing
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_113921_739214_75AB7C22 
X-CRM114-Status: GOOD (  33.29  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Richard Weinberger <richard@nod.at>, Richard Hughes <hughsient@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Alex Bazhaniuk <alex@eclypsium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Oct 29, 2020 at 2:40 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Oct 28, 2020 at 06:43:59PM -0300, Daniel Gutson wrote:
> > This patch separates the writing part of the intel-spi drivers
> > so the 'dangerous' part can be set/unset independently.
> > This way, the kernel can be configured to include the reading
> > parts of the driver which can be used without
> > the dangerous write operations that can turn the system
> > unbootable.
> >
> > Signed-off-by: Daniel Gutson <daniel.gutson@eclypsium.com>
> > ---
> >  drivers/mtd/spi-nor/controllers/Kconfig     | 39 ++++++++++++---------
> >  drivers/mtd/spi-nor/controllers/intel-spi.c | 12 +++++--
> >  2 files changed, 33 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/mtd/spi-nor/controllers/Kconfig b/drivers/mtd/spi-nor/controllers/Kconfig
> > index 5c0e0ec2e6d1..491c755fea49 100644
> > --- a/drivers/mtd/spi-nor/controllers/Kconfig
> > +++ b/drivers/mtd/spi-nor/controllers/Kconfig
> > @@ -31,34 +31,41 @@ config SPI_INTEL_SPI
> >       tristate
> >
> >  config SPI_INTEL_SPI_PCI
> > -     tristate "Intel PCH/PCU SPI flash PCI driver (DANGEROUS)"
> > +     tristate "Intel PCH/PCU SPI flash PCI driver"
> >       depends on X86 && PCI
> >       select SPI_INTEL_SPI
> >       help
> > -       This enables PCI support for the Intel PCH/PCU SPI controller in
> > -       master mode. This controller is present in modern Intel hardware
> > -       and is used to hold BIOS and other persistent settings. Using
> > -       this driver it is possible to upgrade BIOS directly from Linux.
> > -
> > -       Say N here unless you know what you are doing. Overwriting the
> > -       SPI flash may render the system unbootable.
> > +       This enables read only PCI support for the Intel PCH/PCU SPI
> > +       controller in master mode. This controller is present in modern
> > +       Intel hardware and is used to hold BIOS and other persistent settings.
> > +       Using this driver it is possible to read the SPI chip directly
> > +       from Linux.
> >
> >         To compile this driver as a module, choose M here: the module
> >         will be called intel-spi-pci.
> >
> >  config SPI_INTEL_SPI_PLATFORM
> > -     tristate "Intel PCH/PCU SPI flash platform driver (DANGEROUS)"
> > +     tristate "Intel PCH/PCU SPI flash platform driver"
> >       depends on X86
> >       select SPI_INTEL_SPI
> >       help
> > -       This enables platform support for the Intel PCH/PCU SPI
> > +       This enables read only platform support for the Intel PCH/PCU SPI
> >         controller in master mode. This controller is present in modern
> > -       Intel hardware and is used to hold BIOS and other persistent
> > -       settings. Using this driver it is possible to upgrade BIOS
> > -       directly from Linux.
> > +       Intel hardware and is used to hold BIOS and other persistent settings.
> > +       Using this driver it is possible to read the SPI chip directly
> > +       from Linux.
> > +
> > +       To compile this driver as a module, choose M here: the module
> > +       will be called intel-spi-pci.
> > +
> > +config SPI_INTEL_SPI_WRITE
> > +     bool "Intel PCH/PCU SPI flash drivers write operations (DANGEROUS)"
> > +     depends on SPI_INTEL_SPI_PCI || SPI_INTEL_SPI_PLATFORM
> > +     help
> > +       This enables full read/write support for the Intel PCH/PCU SPI
> > +       controller.
> > +       Using this option it may be possible to upgrade BIOS directly
> > +       from Linux.
> >
> >         Say N here unless you know what you are doing. Overwriting the
> >         SPI flash may render the system unbootable.
> > -
> > -       To compile this driver as a module, choose M here: the module
> > -       will be called intel-spi-platform.
> > diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
> > index b54a56a68100..8d8053395c3d 100644
> > --- a/drivers/mtd/spi-nor/controllers/intel-spi.c
> > +++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
> > @@ -266,6 +266,7 @@ static int intel_spi_read_block(struct intel_spi *ispi, void *buf, size_t size)
> >       return 0;
> >  }
> >
> > +#ifdef CONFIG_SPI_INTEL_SPI_WRITE
>
> <snip>
>
> Please do not add #ifdef to .c files, that's not the proper kernel
> coding style at all, and just makes maintaining this file much much
> harder over time.
>
> Split things out into two different files if you really need to do this.

What about the static functions that I'll need to turn non-static and
in a header file?
I mean, the functions that the functions in the new file will have to call.
Should I do that, turn static functions into non-static and declared
in a header file?


>
> thanks,
>
> greg k-h



-- 


Daniel Gutson
Engineering Director
Eclypsium, Inc.


Below The Surface: Get the latest threat research and insights on
firmware and supply chain threats from the research team at Eclypsium.
https://eclypsium.com/research/#threatreport

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
