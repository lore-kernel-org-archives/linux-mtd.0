Return-Path: <SRS0=zrsi=EJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB1FC388F7
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 16:09:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 896CE22264
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 16:09:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M4l07V73";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jeufbIs6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 896CE22264
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MkPxGm65wWcJHvY5wHHdkn5CFNOqhe6hPOWWxT16CFQ=; b=M4l07V73+QTpNfXgAi7DVUjEr
	b9x3oDUKw2RM7VQxpxmM6W1Oyjr1oeLxcASp1/1fCXv3tBrA4Qu7Sw6fHygRyl8XnggBL0oTtfWEf
	2H30kGcmiGZzx9huaFBK9ngOrctlg/EaZKbzEKU35SzL71/BoAeTezTysaOEQMgirwWpDGgrtH/EQ
	CHkWkPq7HgRG9QVirxXXCOE1K+Ej4u2KQJqg2/jZ1H6qJvgKX99ENoAkEcxpjwSND51bygOxenPPc
	u/eF5/X3rIXlZIrZGWH9rz3ArjQmdOyq43Q3B0ptofzXX72tJEb7aV8EApHtBlwA2GQB4WqVE1YBQ
	5DKS2b7KQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZyqg-0005Jg-DC; Tue, 03 Nov 2020 16:07:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZyqd-0005IN-2V
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2020 16:07:52 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 852B920773;
 Tue,  3 Nov 2020 16:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604419670;
 bh=0C3Om95v4rkiVPQy1gKQdTuxFaRCNJMzTxnpPVwYvNA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jeufbIs6Do9Xlt93/4Oy0lYISit5zvCR+D6O2O2yK5AfuMY09BvsVQARycPHlN6IE
 +l1s6BOvazyFgnAO3ki4rD7/43g+IuFxowO9eJH7uBQl009UZ55jTDoTXclib9iTnM
 aP2bIB4eTZtxm/MGS9HFML5+O8+r31Fbo8vRrmRI=
Date: Tue, 3 Nov 2020 17:08:42 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Gutson <daniel@eclypsium.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Split intel-spi reading from
 writing
Message-ID: <20201103160842.GA4153227@kroah.com>
References: <20201028214359.384918-1-daniel.gutson@eclypsium.com>
 <20201029054110.GA3039992@kroah.com>
 <CAFmMkTHBXjNc0DeL0bOZfdJkZjPAHnRU1THHdk0tZcBr1yykTQ@mail.gmail.com>
 <20201029191505.GC986195@kroah.com>
 <CAFmMkTHniN8FA7KkknDyRU0E0JWP15dC-xMRqJb-rg8oEgCyYg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFmMkTHniN8FA7KkknDyRU0E0JWP15dC-xMRqJb-rg8oEgCyYg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_110751_305247_64D89BDC 
X-CRM114-Status: GOOD (  40.49  )
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

On Tue, Nov 03, 2020 at 12:18:01PM -0300, Daniel Gutson wrote:
> On Thu, Oct 29, 2020 at 4:14 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Oct 29, 2020 at 12:39:08PM -0300, Daniel Gutson wrote:
> > > On Thu, Oct 29, 2020 at 2:40 AM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Wed, Oct 28, 2020 at 06:43:59PM -0300, Daniel Gutson wrote:
> > > > > This patch separates the writing part of the intel-spi drivers
> > > > > so the 'dangerous' part can be set/unset independently.
> > > > > This way, the kernel can be configured to include the reading
> > > > > parts of the driver which can be used without
> > > > > the dangerous write operations that can turn the system
> > > > > unbootable.
> > > > >
> > > > > Signed-off-by: Daniel Gutson <daniel.gutson@eclypsium.com>
> > > > > ---
> > > > >  drivers/mtd/spi-nor/controllers/Kconfig     | 39 ++++++++++++---------
> > > > >  drivers/mtd/spi-nor/controllers/intel-spi.c | 12 +++++--
> > > > >  2 files changed, 33 insertions(+), 18 deletions(-)
> > > > >
> > > > > diff --git a/drivers/mtd/spi-nor/controllers/Kconfig b/drivers/mtd/spi-nor/controllers/Kconfig
> > > > > index 5c0e0ec2e6d1..491c755fea49 100644
> > > > > --- a/drivers/mtd/spi-nor/controllers/Kconfig
> > > > > +++ b/drivers/mtd/spi-nor/controllers/Kconfig
> > > > > @@ -31,34 +31,41 @@ config SPI_INTEL_SPI
> > > > >       tristate
> > > > >
> > > > >  config SPI_INTEL_SPI_PCI
> > > > > -     tristate "Intel PCH/PCU SPI flash PCI driver (DANGEROUS)"
> > > > > +     tristate "Intel PCH/PCU SPI flash PCI driver"
> > > > >       depends on X86 && PCI
> > > > >       select SPI_INTEL_SPI
> > > > >       help
> > > > > -       This enables PCI support for the Intel PCH/PCU SPI controller in
> > > > > -       master mode. This controller is present in modern Intel hardware
> > > > > -       and is used to hold BIOS and other persistent settings. Using
> > > > > -       this driver it is possible to upgrade BIOS directly from Linux.
> > > > > -
> > > > > -       Say N here unless you know what you are doing. Overwriting the
> > > > > -       SPI flash may render the system unbootable.
> > > > > +       This enables read only PCI support for the Intel PCH/PCU SPI
> > > > > +       controller in master mode. This controller is present in modern
> > > > > +       Intel hardware and is used to hold BIOS and other persistent settings.
> > > > > +       Using this driver it is possible to read the SPI chip directly
> > > > > +       from Linux.
> > > > >
> > > > >         To compile this driver as a module, choose M here: the module
> > > > >         will be called intel-spi-pci.
> > > > >
> > > > >  config SPI_INTEL_SPI_PLATFORM
> > > > > -     tristate "Intel PCH/PCU SPI flash platform driver (DANGEROUS)"
> > > > > +     tristate "Intel PCH/PCU SPI flash platform driver"
> > > > >       depends on X86
> > > > >       select SPI_INTEL_SPI
> > > > >       help
> > > > > -       This enables platform support for the Intel PCH/PCU SPI
> > > > > +       This enables read only platform support for the Intel PCH/PCU SPI
> > > > >         controller in master mode. This controller is present in modern
> > > > > -       Intel hardware and is used to hold BIOS and other persistent
> > > > > -       settings. Using this driver it is possible to upgrade BIOS
> > > > > -       directly from Linux.
> > > > > +       Intel hardware and is used to hold BIOS and other persistent settings.
> > > > > +       Using this driver it is possible to read the SPI chip directly
> > > > > +       from Linux.
> > > > > +
> > > > > +       To compile this driver as a module, choose M here: the module
> > > > > +       will be called intel-spi-pci.
> > > > > +
> > > > > +config SPI_INTEL_SPI_WRITE
> > > > > +     bool "Intel PCH/PCU SPI flash drivers write operations (DANGEROUS)"
> > > > > +     depends on SPI_INTEL_SPI_PCI || SPI_INTEL_SPI_PLATFORM
> > > > > +     help
> > > > > +       This enables full read/write support for the Intel PCH/PCU SPI
> > > > > +       controller.
> > > > > +       Using this option it may be possible to upgrade BIOS directly
> > > > > +       from Linux.
> > > > >
> > > > >         Say N here unless you know what you are doing. Overwriting the
> > > > >         SPI flash may render the system unbootable.
> > > > > -
> > > > > -       To compile this driver as a module, choose M here: the module
> > > > > -       will be called intel-spi-platform.
> > > > > diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
> > > > > index b54a56a68100..8d8053395c3d 100644
> > > > > --- a/drivers/mtd/spi-nor/controllers/intel-spi.c
> > > > > +++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
> > > > > @@ -266,6 +266,7 @@ static int intel_spi_read_block(struct intel_spi *ispi, void *buf, size_t size)
> > > > >       return 0;
> > > > >  }
> > > > >
> > > > > +#ifdef CONFIG_SPI_INTEL_SPI_WRITE
> > > >
> > > > <snip>
> > > >
> > > > Please do not add #ifdef to .c files, that's not the proper kernel
> > > > coding style at all, and just makes maintaining this file much much
> > > > harder over time.
> > > >
> > > > Split things out into two different files if you really need to do this.
> > >
> > > What about the static functions that I'll need to turn non-static and
> > > in a header file?
> > > I mean, the functions that the functions in the new file will have to call.
> > > Should I do that, turn static functions into non-static and declared
> > > in a header file?
> >
> > No idea, but again, no #ifdefs in .c files like this, that is not the
> > proper kernel coding style as it is not maintainable for the lifespan
> > that we have to maintain code.
> 
> Is it acceptable to leave static functions unused and let the optimizer
> remove them as DCE?

You will get build warnings if you do that, right?

You have thousands of examples of how to do this correct, it shouldn't
be that tough :)

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
