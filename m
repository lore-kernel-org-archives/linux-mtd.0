Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJfrG-0004RH-9E
 for linux-mtd@lists.infradead.org; Mon, 05 Nov 2018 14:28:04 +0000
Date: Mon, 5 Nov 2018 15:27:34 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devel@driverdev.osuosl.org, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] staging: Remove the mt29f_spinand driver
Message-ID: <20181105152734.55179a03@xps13>
In-Reply-To: <20181105132949.GC20797@kroah.com>
References: <20181022201059.8630-1-boris.brezillon@bootlin.com>
 <20181105111227.7bf08cfa@xps13> <20181105132949.GC20797@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Greg,

Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote on Mon, 5 Nov
2018 14:29:49 +0100:

> On Mon, Nov 05, 2018 at 11:12:27AM +0100, Miquel Raynal wrote:
> > Hi Greg,
> >=20
> > Boris Brezillon <boris.brezillon@bootlin.com> wrote on Mon, 22 Oct 2018
> > 22:10:59 +0200:
> >  =20
> > > A new SPI NAND subsystem has been added in drivers/mtd/nand/spi/ and
> > > Micron's MT29F devices are now supported in
> > > drivers/mtd/nand/spi/micron.c.
> > >=20
> > > Remove the old driver.
> > >=20
> > > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > > ---
> > > Hello,
> > >=20
> > > If anything is missing in drivers/mtd/nand/spi/micron.c to properly
> > > support the devices supported by the mt29f_spinand driver, please let
> > > me know.
> > > I might accept to delay removal of this driver if I have some guarant=
ees
> > > that existing users will actually switch to the new driver at some
> > > point.
> > >=20
> > > Regards,
> > >=20
> > > Boris
> > > --- =20
> >=20
> > I plan to apply this patch but I would like your approval first.
> >=20
> > As a summary, the mt29f_spinand driver is a Micron SPI NAND chip
> > driver interfacing with the raw NAND API (which is 'wrong').
> >=20
> > Boris has recently contributed a SPI NAND framework supporting SPI
> > NAND chips from several vendors, including Micron, that is supposed to
> > take over this driver.
> >=20
> > Do you see anything that should prevent us to remove it now? =20
>=20
> Not at all, I was going to add this patch to my tree right now, as I
> couldn't do anything until after 4.20-rc1 was out.  Any objection from
> me just taking it that way and getting it into 4.20-final?

I'm fine with you taking it but I have changes in the pipe that are
impacted by this removal so it would be great if this could happen
pretty early in the 4.20 release cycle (4.20-rc2?), so I will still be
able to base nand/next on top of it.


Thanks,
Miqu=C3=A8l
