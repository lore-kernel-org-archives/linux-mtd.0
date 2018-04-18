Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8nuM-0002X7-B3
 for linux-mtd@lists.infradead.org; Wed, 18 Apr 2018 14:18:09 +0000
Date: Wed, 18 Apr 2018 16:17:47 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Vignesh R <vigneshr@ti.com>
Cc: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, Peter Pan <peterpansjtu@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Frieder Schrempf
 <frieder.schrempf@exceet.de>, Mark Brown <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>
Subject: Re: [PATCH v2 04/10] spi: Extend the core to ease integration of
 SPI memory controllers
Message-ID: <20180418161747.7060ae3b@bbrezillon>
In-Reply-To: <991f6a90-2211-acb9-c384-1d49d5468b31@ti.com>
References: <20180410224439.9260-1-boris.brezillon@bootlin.com>
 <20180410224439.9260-5-boris.brezillon@bootlin.com>
 <60f3d53a-9668-9e1c-9f29-45aaf4004630@ti.com>
 <20180412171005.5cfaba58@bbrezillon>
 <20180412215951.751bf889@bbrezillon>
 <991f6a90-2211-acb9-c384-1d49d5468b31@ti.com>
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

Hi Vignesh,

On Tue, 17 Apr 2018 09:42:18 +0530
Vignesh R <vigneshr@ti.com> wrote:

> >>  =20
> >> >=C2=A0=C2=A0  =20
> >> > > + } addr;
> >> > > +
> >> > > + struct {
> >> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 nbytes;
> >> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 buswidth;
> >> > > + } dummy;
> >> > > +
> >> > > + struct {
> >> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 buswidth;
> >> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum spi_mem_dat=
a_dir dir;
> >> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int nby=
tes;
> >> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* buf.{in,out} =
must be DMA-able. */
> >> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union {
> >> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *in;
> >> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const void *out;
> >> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } buf;
> >> > > + } data;
> >> > > +};
> >> > > +=C2=A0=C2=A0=C2=A0  =20
> >> >=20
> >> > Some flash devices support Dual/Quad DDR (Double Data Rate) mode and=
 the
> >> > SPI controller driver would need to know this information. We will n=
eed
> >> > to add a field for that.=C2=A0  =20
> >>=20
> >> Well, let's wait until we actually need that.
> >>  =20
> >> >=20
> >> > Currently, there are drivers under mtd/spi-nor/ that need to know
> >> > page/sector/total size of flash memory(info available in
> >> > -`struct spi_nor). We would need a way to provide this info to spi_m=
em
> >> > drivers, if we ever plan to move drivers under mtd/spi-nor to spi/=
=C2=A0  =20
> >>=20
> >> Again, we'll see when we'll try to move them, but I hope still we won't
> >> need that. Looks like the kind of information I'd like to keep away
> >> from spi controller drivers. =20
> >=20
> > Let me clarify this part. I already thought a bit about this problem,
> > and that's the very reason we have an intermediate layer with a spi_mem
> > struct pointing to the real spi_device object. The idea is to add new
> > fields to spi_mem object if/when we really have to. We'd also have to
> > add ->attach/detach() methods to spi_mem_ops so that SPI mem controller
> > can know when a new device is about to be accessed by a spi-mem
> > driver, can parse the information provided in spi_mem and configure the
> > controller accordingly.
> >=20
> > Now, even if that's something I considered when designing the spi-mem
> > interface, I'd like to stay away from this sort of specialization as
> > long as possible. Why? Simply because dealing with memory specificities
> > like "is it a NOR, a NAND or an SRAM? Should I erase blocks before
> > writing data? What's the page size, sector size, eraseblock size? ..."
> > is not something that belongs in the SPI framework. IMHO, it should
> > stay in SPI mem drivers (the SPI NOR or SPI NAND framework are such SPI
> > mem drivers).
> >=20
> > This being said, I see a real need for advanced features. One example I
> > have in mind is a "direct-mapping API", where a spi_mem user could ask
> > for a specific region of the memory to be directly mapped (if the
> > feature is supported by the controller of course). And that's something
> > I think we can make generic enough to consider adding it to the
> > spi_mem_ops interface. All we'll need is a way to say "I want to map
> > this portion of the memory in R, W or RW and when you need to
> > read/write use this spi_mem_op and patch the address based on the
> > actual memory address that is being accessed".
> > =20
>=20
>=20
> Many of the SPI NOR controllers, especially the ones that support direct
> mapping are smart and need more flash specific data. For example,
> cadence-quadspi needs to know pagesize as this controller automatically
> sends write enable when writes cross page boundary. I guess, such
> controllers pose a problem to spi_mem_ops in passing spi_nor internal
> data to drivers. Or such controllers may need to be continued to be
> supported directly under spi-nor framework?

It's not decided yet. I'm not closing the door to any of those advanced
controllers yet, just need to have a closer look before taking a
decision. To me, it sounds like information that might be needed to
handle direct mapping in write mode for SPI NORs and we're not there
yet.

>=20
> I am okay with this series in general. But, was trying to understand
> which drivers will fall under spi_mem and which will continue to remain
> under mtd/spi-nor

Ideally, all of them, but maybe not with all the advanced features
supported at the beginning. The only things I'd like to keep outside of
drivers/spi are controllers that are only able to send commands for a
specific type of memory (like only commands to address SPI NORs).

I'm fine discussing all of this, with real use cases to explain why we
need to expose the memory type, and the memory organization information
to SPI controller drivers, but I'd prefer to do that in a separate
thread if you don't mind.

Regards,

Boris
