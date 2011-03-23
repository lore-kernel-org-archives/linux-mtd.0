From: Florian Fainelli <ffainelli@freebox.fr>
To: linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/7] add GPMI support for imx28
Date: Wed, 23 Mar 2011 16:16:56 +0100
References: <1300239773-4222-1-git-send-email-b32955@freescale.com>
	<4D8964F4.3070104@freescale.com>
	<19850.2584.566366.251874@ipc1.ka-ro>
In-Reply-To: <19850.2584.566366.251874@ipc1.ka-ro>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201103231616.56375.ffainelli@freebox.fr>
Cc: Huang Shijie <b32955@freescale.com>, linux@arm.linux.org.uk,
	dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Wednesday 23 March 2011 15:56:24 Lothar Wa=C3=9Fmann wrote:
> Hi,
>=20
> Huang Shijie writes:
> > Hi Lothar:
> >     Thanks a lot for your carefully review.
> > >=20
> > > Hi,
> > >=20
> > > some general comments:
> > > - Why are you not using the existing nand_ids but inventing your own
> > >=20
> > >    database?
> >=20
> > The nand_ids{} contains poor information for me.
> > Such as :
> > [1]The nand_ids does not have the enough information for the page
> > size,oob size for some new NANDs.
> >=20
> >     And you can not get the information from parsing the NAND ids, such
> >=20
> > as some Micron NANDs.
>=20
> You could use it for the standard chips where you do not need
> additional information. That way most NAND chips could be supported
> out of the box without having to modify the driver.
>=20
> > [2]I need the timing information of the NAND. The nand_ids DOES not have
> > it. I have to
> >=20
> >     read the datasheet of the NAND, and add it to my database.
>=20
> Do we really need exact timing data for each individual chip?
> Or couldn't we live with some sane timing that works for most chips
> and provide some means to specify a different timing via
> platform_data?

I suppose this is the way it should be done, but then you might some need s=
ome=20
sort of NAND detection available before registering the driver. Eventually,=
=20
the bootloader might have configured the appropriate timings already.

Have you considered using ONFI chips? They have standard timings at least.

>=20
> > > - What is the purpose of the 'rom_helpers'? To me it looks like they
> > >=20
> > >    are doing something that should be done in the mtd partition
> > >    handlers, not in the flash chip driver.
> >=20
> > We have saled a lot products based the imx23 or imx28.
> > All the products support the nand boot mode by flashing the kernel to
> > the kernel partitions of the nands.
> > In order to compliant to the old product, the layout of the nand is
> > constraint to the current situation:
> > [1] first a boot partition for the kernel.
> > [2] the rest is for other uses, such as rootfs.
> >=20
> > So I have to use the rom_helpers to split the kernel partition before
> > the real MTD partition initializations.
>=20
> Why can't you just create appropriate partitions using the standard
> partition handlers?
>=20
>=20
> Lothar Wa=C3=9Fmann
