From: Marek Vasut <marek.vasut@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/3] add the GPMI controller driver for IMX23/IMX28
Date: Sun, 31 Jul 2011 15:51:48 +0200
References: <1311230846-26437-1-git-send-email-b32955@freescale.com>
	<20018.43621.688990.319528@ipc1.ka-ro>
	<CAHMSPgPXnDVO630P9fnogQ0XvPSrwz0MYzXfXZLJoJNRf1gifA@mail.gmail.com>
In-Reply-To: <CAHMSPgPXnDVO630P9fnogQ0XvPSrwz0MYzXfXZLJoJNRf1gifA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201107311551.48223.marek.vasut@gmail.com>
Cc: arnd@arndb.de, dedekind1@gmail.com, Koen Beel <koen.beel.barco@gmail.com>,
	Wolfram Sang <w.sang@pengutronix.de>, Huang Shijie <b32955@freescale.com>,
	linux-mtd@lists.infradead.org, shijie8@gmail.com,
	Shawn Guo <shawn.guo@freescale.com>,
	Lothar =?utf-8?q?Wa=C3=9Fmann?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, July 29, 2011 05:00:48 PM Koen Beel wrote:
> On Fri, Jul 29, 2011 at 2:41 PM, Lothar Wa=C3=9Fmann <LW@karo-electronics=
=2Ede>=20
wrote:
> > Hi,
> >=20
> > Koen Beel writes:
> >> Hi,
> >>=20
> >> On Fri, Jul 29, 2011 at 9:20 AM, Lothar Wa=C3=9Fmann <LW@karo-electron=
ics.de>=20
wrote:
> >> > Hi,
> >> >=20
> >> > Koen Beel writes:
> >> >> Hi,
> >> >>=20
> >> >> I have test on mx23evk board. Still see the same issues.
> >> >>=20
> >> >> On Wed, Jul 27, 2011 at 3:53 AM, Huang Shijie <b32955@freescale.com=
>=20
wrote:
> >> >> > Hi,
> >> >> >=20
> >> >> > Thanks for your test.
> >> >> >=20
> >> >> >> Hi,
> >> >> >>=20
> >> >> >> It's not really working for me.
> >> >> >> I've applied all gpmi-nand driver patches and the dma driver
> >> >> >> patches.
> >> >> >>=20
> >> >> >> I have added following kernel parameters:
> >> >> >> mtdparts=3Dgpmi-nand:20m(boot),-(user) ubi.mtd=3D1 root=3Dubi0:r=
ootfs0
> >> >> >> rootfstype=3Dubifs gpmi_debug_init
> >> >> >>=20
> >> >> >> During boot I get already get DMA timeout:
> >> >> >> [    2.560000] [ start_dma_without_bch_irq : 392 ] DMA timeout,
> >> >> >> last DMA
> >> >> >>=20
> >> >> >> :1
> >> >> >>=20
> >> >> >> [    3.560000] [ start_dma_with_bch_irq : 427 ] bch timeout!!!
> >> >> >> ...
> >> >> >> (see log file in attach line 89)
> >> >>=20
> >> >> I still see this DMA timeout when booting.
> >> >> What kernel parameters do you use? I still use same as above.
> >> >=20
> >> > Do you have an SD card in the system? I'm getting the same error when
> >> > accessing an SD card. Without SD card I can use the flash without any
> >> > errors.
> >>=20
> >> No SD card in the system. At least not on my mx23evk board.
> >> My real target hardware has a SDIO wifi chip.
> >>=20
> >> Are you also testing on the mx23evk board? Really strange it is not
> >> reproducible here then.
> >> Anyone using mx23evk please give:
> >> - revision number of board (I have tested on rev C1)
> >> - kernel parameter used (see previous mail for mine)
> >=20
> > It's getting ever more strange. I only have problems with concurrent
> > access to the flash and SD-card when I do file system based accessed
> > to the SD card.
> > A 'dd if=3D/dev/mmcblk0 of=3D/dev/null' while excessively using the fla=
sh
> > works well, while mounting the SD card and doing an 'ls' produces
> > immediate BCH DMA timeouts.
> >=20
> > Perhaps someone can make anything out of that.
>=20
> I have checked and the function dma_irq_callback is never called
> during my tests. This means the DMA transfer does not even works once.
>=20
> Also no clue here ...

Aren't you getting some undervolt on the powerrail for example ? btw the dr=
iver=20
looks a bit crappy to me, but let's believe it works ;-)

>=20
> > Lothar Wa=C3=9Fmann
> > --
> > ___________________________________________________________
> >=20
> > Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
> > Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
> > Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
> > Handelsregistereintrag: Amtsgericht Aachen, HRB 4996
> >=20
> > www.karo-electronics.de | info@karo-electronics.de
> > ___________________________________________________________
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
