Return-Path: <SRS0=zrsi=EJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B0CC2D0A3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 15:19:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5B6B20735
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 15:19:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="poelqkd1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="SshkiWAj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5B6B20735
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oNUBU1eI9TRB5t0KxCHWkuTwQSR382XoFErDKWgW6yM=; b=poelqkd1dmGjU1b7sJh+wIk7g
	b7lZKhcYdgGsNiH0OqHMBwiEb8YlkxBrpXLlEhI+T7arEsV3EsdI6WEDIqw12PR8DApLdDetfKFkc
	SjhLDPe7cGxzODYBmU1kU5Pz8v5uqQW9LnYRP/ZL3QyKYkBJlLHYp4yc895yNcERg1N7KQJrqT4dV
	3Eczm7x/9yw1gn/IJ+aPp0n7da6MPwYn+dDjCz4z/MGttFrbttCI2NN/ByWpGd1P5b5WJg6IMEu7C
	S2bn0fTRbcCVkJQLlXX65E7TuUHYAK/9cAj/BSUC+O1/h+zast5WlIs2vkqTjEZb72ex9KJmKeijQ
	63Ciy6K7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZy4k-0007es-I4; Tue, 03 Nov 2020 15:18:22 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZy4e-0007bE-2m
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2020 15:18:17 +0000
Received: by mail-qt1-x843.google.com with SMTP id p12so4480778qtp.7
 for <linux-mtd@lists.infradead.org>; Tue, 03 Nov 2020 07:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vYUrpUWpmFGKJgf4Pxch6v6/MgxnA2A1h0hT6owcRkY=;
 b=SshkiWAjtFYs2rlJJ3LivK39Rr8gkIA8Xl7S4eUgo4aX0zYjWSxwI+qucQIXXgjNFO
 D2zGmrFGUPAJbdJGhdfqSVxuPamFdCqi3lmZXyizmHV9b2KCeRKVDbKPX+oLigIaGdMK
 rF2jdRAc2I3B95POI0EiNE2JIEOcw/5wQ6ObWk9F2GEhV9QZ3NDeJNaCG+2IWw3bwD6H
 1Q/rjPGRLhJh/NaJLqq1Dib/yTRQhn9tPyrHS5V3OC54q5A9ZSY+6LGw0homW7iZzx/n
 yFfjNYI06edc4zNDdFmnYHVIeC37nNX6/0Iohv7RezOIQzY+3J05NYaP/6ic3YlTZ54X
 YfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vYUrpUWpmFGKJgf4Pxch6v6/MgxnA2A1h0hT6owcRkY=;
 b=BzYP0lz7q0atNEt1QQAaJssCVPOMvjKAkYTkgL4leVdu3bq2Zd6ByOJBezatQlNrI3
 6tr0WlWZkHd6t5/RH11HUx1eN2cs0QnRX2R3CkMRmIZTASAmiysZXV3WH7gX3rAHlcyK
 7GZsnZKzFfaoBXvn1fPrF9p6ObULYX4B/5hsbm4NlJTH1JhEb2PQyLa+cW893FPWH8xj
 +mV4wwpvQ21lJtyfa0gxJajBx64671TZMcaV4aaU5FwirIyfoguZEVYw2FBW+ZoW078O
 HUsYjeT7KbA0yoscdAKvUAEEKwolNVtvJ1mV1lyMwGYqNPfd01Vtrdhp0c8YqxldhUz0
 cx/Q==
X-Gm-Message-State: AOAM531SE+gJvbaUTFZU5E0UlG+/3HPnCGD7PqBmD/tOTEklP3efPpsy
 boe82SCrZtOvWsbiInbHwSY5PxTznh5NDqAm95zN2A==
X-Google-Smtp-Source: ABdhPJxU0p/fXVYrNfpoYAr5eHWGTIuKMCqE7QvyT94egc1XnCWMfxjY0ABEeObwlneNVHsZlXlW0mh2pKTg6oJJHss=
X-Received: by 2002:ac8:6b51:: with SMTP id x17mr18679113qts.203.1604416692698; 
 Tue, 03 Nov 2020 07:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20201028214359.384918-1-daniel.gutson@eclypsium.com>
 <20201029054110.GA3039992@kroah.com>
 <CAFmMkTHBXjNc0DeL0bOZfdJkZjPAHnRU1THHdk0tZcBr1yykTQ@mail.gmail.com>
 <20201029191505.GC986195@kroah.com>
In-Reply-To: <20201029191505.GC986195@kroah.com>
From: Daniel Gutson <daniel@eclypsium.com>
Date: Tue, 3 Nov 2020 12:18:01 -0300
Message-ID: <CAFmMkTHniN8FA7KkknDyRU0E0JWP15dC-xMRqJb-rg8oEgCyYg@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Split intel-spi reading from
 writing
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_101816_515791_F214D6E6 
X-CRM114-Status: GOOD (  39.36  )
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

On Thu, Oct 29, 2020 at 4:14 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Oct 29, 2020 at 12:39:08PM -0300, Daniel Gutson wrote:
> > On Thu, Oct 29, 2020 at 2:40 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Wed, Oct 28, 2020 at 06:43:59PM -0300, Daniel Gutson wrote:
> > > > This patch separates the writing part of the intel-spi drivers
> > > > so the 'dangerous' part can be set/unset independently.
> > > > This way, the kernel can be configured to include the reading
> > > > parts of the driver which can be used without
> > > > the dangerous write operations that can turn the system
> > > > unbootable.
> > > >
> > > > Signed-off-by: Daniel Gutson <daniel.gutson@eclypsium.com>
> > > > ---
> > > >  drivers/mtd/spi-nor/controllers/Kconfig     | 39 ++++++++++++---------
> > > >  drivers/mtd/spi-nor/controllers/intel-spi.c | 12 +++++--
> > > >  2 files changed, 33 insertions(+), 18 deletions(-)
> > > >
> > > > diff --git a/drivers/mtd/spi-nor/controllers/Kconfig b/drivers/mtd/spi-nor/controllers/Kconfig
> > > > index 5c0e0ec2e6d1..491c755fea49 100644
> > > > --- a/drivers/mtd/spi-nor/controllers/Kconfig
> > > > +++ b/drivers/mtd/spi-nor/controllers/Kconfig
> > > > @@ -31,34 +31,41 @@ config SPI_INTEL_SPI
> > > >       tristate
> > > >
> > > >  config SPI_INTEL_SPI_PCI
> > > > -     tristate "Intel PCH/PCU SPI flash PCI driver (DANGEROUS)"
> > > > +     tristate "Intel PCH/PCU SPI flash PCI driver"
> > > >       depends on X86 && PCI
> > > >       select SPI_INTEL_SPI
> > > >       help
> > > > -       This enables PCI support for the Intel PCH/PCU SPI controller in
> > > > -       master mode. This controller is present in modern Intel hardware
> > > > -       and is used to hold BIOS and other persistent settings. Using
> > > > -       this driver it is possible to upgrade BIOS directly from Linux.
> > > > -
> > > > -       Say N here unless you know what you are doing. Overwriting the
> > > > -       SPI flash may render the system unbootable.
> > > > +       This enables read only PCI support for the Intel PCH/PCU SPI
> > > > +       controller in master mode. This controller is present in modern
> > > > +       Intel hardware and is used to hold BIOS and other persistent settings.
> > > > +       Using this driver it is possible to read the SPI chip directly
> > > > +       from Linux.
> > > >
> > > >         To compile this driver as a module, choose M here: the module
> > > >         will be called intel-spi-pci.
> > > >
> > > >  config SPI_INTEL_SPI_PLATFORM
> > > > -     tristate "Intel PCH/PCU SPI flash platform driver (DANGEROUS)"
> > > > +     tristate "Intel PCH/PCU SPI flash platform driver"
> > > >       depends on X86
> > > >       select SPI_INTEL_SPI
> > > >       help
> > > > -       This enables platform support for the Intel PCH/PCU SPI
> > > > +       This enables read only platform support for the Intel PCH/PCU SPI
> > > >         controller in master mode. This controller is present in modern
> > > > -       Intel hardware and is used to hold BIOS and other persistent
> > > > -       settings. Using this driver it is possible to upgrade BIOS
> > > > -       directly from Linux.
> > > > +       Intel hardware and is used to hold BIOS and other persistent settings.
> > > > +       Using this driver it is possible to read the SPI chip directly
> > > > +       from Linux.
> > > > +
> > > > +       To compile this driver as a module, choose M here: the module
> > > > +       will be called intel-spi-pci.
> > > > +
> > > > +config SPI_INTEL_SPI_WRITE
> > > > +     bool "Intel PCH/PCU SPI flash drivers write operations (DANGEROUS)"
> > > > +     depends on SPI_INTEL_SPI_PCI || SPI_INTEL_SPI_PLATFORM
> > > > +     help
> > > > +       This enables full read/write support for the Intel PCH/PCU SPI
> > > > +       controller.
> > > > +       Using this option it may be possible to upgrade BIOS directly
> > > > +       from Linux.
> > > >
> > > >         Say N here unless you know what you are doing. Overwriting the
> > > >         SPI flash may render the system unbootable.
> > > > -
> > > > -       To compile this driver as a module, choose M here: the module
> > > > -       will be called intel-spi-platform.
> > > > diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
> > > > index b54a56a68100..8d8053395c3d 100644
> > > > --- a/drivers/mtd/spi-nor/controllers/intel-spi.c
> > > > +++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
> > > > @@ -266,6 +266,7 @@ static int intel_spi_read_block(struct intel_spi *ispi, void *buf, size_t size)
> > > >       return 0;
> > > >  }
> > > >
> > > > +#ifdef CONFIG_SPI_INTEL_SPI_WRITE
> > >
> > > <snip>
> > >
> > > Please do not add #ifdef to .c files, that's not the proper kernel
> > > coding style at all, and just makes maintaining this file much much
> > > harder over time.
> > >
> > > Split things out into two different files if you really need to do this.
> >
> > What about the static functions that I'll need to turn non-static and
> > in a header file?
> > I mean, the functions that the functions in the new file will have to call.
> > Should I do that, turn static functions into non-static and declared
> > in a header file?
>
> No idea, but again, no #ifdefs in .c files like this, that is not the
> proper kernel coding style as it is not maintainable for the lifespan
> that we have to maintain code.

Is it acceptable to leave static functions unused and let the optimizer
remove them as DCE? This way I would just leave the writing functions
unused and just apply the macro to the struct of the callbacks.
Otherwise, I need to move a lot of static and private macros to the
.h to allow the new file use them.

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
