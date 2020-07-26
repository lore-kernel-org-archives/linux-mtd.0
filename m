Return-Path: <SRS0=JUqn=BF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BE2C433E0
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jul 2020 07:18:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E73120658
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jul 2020 07:18:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y/PZayYq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IUJ1TV40"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E73120658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bz/CeW3XmbLh44v/Fzso71oZeYV52hFrBl0GoNjPXRY=; b=y/PZayYqVdw4zLd/1OgTSaIm/
	VZ4R3BhXRjbOdBHT1HR1XzmR8eJnfnrJYzXuQskwSgDMHBhGD01i19JEXNppowNBTYxVqIDSawy2I
	j+qpsMgkIcpRwrdppQ+W1b9cQI9ZqmCwm2QQVpWzFolwvacOPbCo/bd52omUEc5MrzmYRXkEyGToH
	+c7smgldIXfhfSvPMmndg+Qn8paG8YTWjt8JUpxbpnhUx67K+aXkSso8eDPNCQa94fwbaL0k1slo7
	UZ37egKqT2shm9k7bOAN4UucgtnUjXb/TV3E97Tb8sAm5G+sTRV8YHeHNLgiD72QRjnrZgHKqVKqe
	X5ymsn0iA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzauX-0000a8-I6; Sun, 26 Jul 2020 07:17:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzauU-0000Zg-5H
 for linux-mtd@lists.infradead.org; Sun, 26 Jul 2020 07:17:27 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E267320658;
 Sun, 26 Jul 2020 07:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595747845;
 bh=aEkIV5Yc1/XFjZwqDPVoFSYk2JX22XKln/kgJ0przBA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IUJ1TV40nHKMyOC0OjL/UzjKvO8R56vep5x+d05V4vytQAonEDwHXoaNDLJPOFfG2
 vFxyrEjHETtPrY0b/7+aH5sygMOK/DGlQZ4w+Lo4VUAHjYGTBzPGVwwuepck67Bno0
 xKm/tPegTBb7NZeFvuOuKanotC/P5eoJfPZAjnbI=
Date: Sun, 26 Jul 2020 09:17:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Gutson <daniel@eclypsium.com>
Subject: Re: [PATCH] Module argument to control whether intel-spi-pci
 attempts to turn the SPI flash chip writeable
Message-ID: <20200726071723.GB441916@kroah.com>
References: <20200724212853.11601-1-daniel.gutson@eclypsium.com>
 <20200725055649.GA1047853@kroah.com>
 <CAFmMkTE_dT9+WJYyb19uQ_HmgJWZSARBy6PveheQJk++NuGbkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFmMkTE_dT9+WJYyb19uQ_HmgJWZSARBy6PveheQJk++NuGbkQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200726_031726_476530_00F1E698 
X-CRM114-Status: GOOD (  31.32  )
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
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Alex Bazhaniuk <alex@eclypsium.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Jul 25, 2020 at 02:20:03PM -0300, Daniel Gutson wrote:
> El s=E1b., 25 jul. 2020 2:56 a. m., Greg Kroah-Hartman <
> gregkh@linuxfoundation.org> escribi=F3:
> =

> > On Fri, Jul 24, 2020 at 06:28:53PM -0300, Daniel Gutson wrote:
> > > Currently, intel-spi has a module argument that controls whether the
> > driver
> > > attempts to turn the SPI flash chip writeable. The default value
> > > is FALSE (don't try to make it writeable).
> > > However, this flag applies only for a number of devices, coming from =
the
> > > platform driver, whereas the devices detected through the PCI driver
> > > (intel-spi-pci) are not subject to this check since the configuration
> > > takes place in intel-spi-pci which doesn't have an argument.
> > >
> > > That's why I propose this patch to add such argument to intel-spi-pci,
> > > so the user can control whether the driver tries to make the chip
> > > writeable or not, being the default FALSE as is the argument of
> > > intel-spi.
> > >
> > > Signed-off-by: Daniel Gutson <daniel.gutson@eclypsium.com>
> > > ---
> > >  drivers/mtd/spi-nor/controllers/intel-spi-pci.c | 16 +++++++++++-----
> > >  1 file changed, 11 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
> > b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
> > > index 81329f680bec..77e57450f166 100644
> > > --- a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
> > > +++ b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
> > > @@ -24,6 +24,10 @@ static const struct intel_spi_boardinfo cnl_info =
=3D {
> > >       .type =3D INTEL_SPI_CNL,
> > >  };
> > >
> > > +static bool writeable;
> > > +module_param(writeable, bool, 0);
> > > +MODULE_PARM_DESC(writeable, "Enable write access to SPI flash chip
> > (default=3D0)");
> >
> > Ick, this isn't the 1990's, please do not add new module parameters,
> > they are a major pain to work with and only work on a global basis, not
> > on a per-device basis.
> >
> > No user will remember how to use this, as it isn't documented anywhere
> > either.  Can you make this a sysfs attribute or something, or better
> > yet, make it "just work" depending on the device type?
> >
> =

> 1) I just did the same that intel-spi.c does.

No need to copy bad examples :)

> You need to understand that there's a set of DIDs coming from the
> lpc_ich (and then the platform) driver, and another set from
> intel-spi-pci. The first set is subject to the check, the second
> doesn't. So there is no "just work" as I understand it.

I have no idea what "DID" is here, sorry.

But why do you want to write it?

> 2) this is an initialization argument, I could make it always NOT attempt
> to make the chip writable, and a system attribute to turn it writable
> post-initialization but the behavior is not the same. In any ways, as I
> mentioned before, some DIDs will be covered by the existing argument of
> intel-spi and other DIDs by this sysfs attribute, becoming IMHO
> inconsistent from the user POV.

What sysfs attribute?  This is a module parameter :(

totally confused,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
