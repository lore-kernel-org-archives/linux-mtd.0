Message-ID: <1348647884.24309.35.camel@sauron.fi.intel.com>
Subject: Re: [GIT PULL] ARM: LPC32xx: core update
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Roland Stigge <stigge@antcom.de>
Date: Wed, 26 Sep 2012 11:24:44 +0300
In-Reply-To: <5052FE40.2030305@antcom.de>
References: <50488FD6.4080402@antcom.de> <201209131155.16756.arnd@arndb.de>
 <5052FE40.2030305@antcom.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-puKyVxIknHQfr2oQs+tz"
Mime-Version: 1.0
Cc: arm@kernel.org, Linux MTD <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-puKyVxIknHQfr2oQs+tz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-09-14 at 11:52 +0200, Roland Stigge wrote:
> Hi Arnd,
>=20
> On 13/09/12 13:55, Arnd Bergmann wrote:
> > On Thursday 06 September 2012, Roland Stigge wrote:
> >>       ARM: LPC32xx: Provide DMA filter callbacks via platform data
> >=20
> > This patch results in build errors in the for-next branch with lpc32xx_=
defconfig:
> >=20
> > arch/arm/mach-lpc32xx/phy3250.c:40:35: fatal error: linux/mtd/lpc32xx_s=
lc.h: No such file or directory
> > arch/arm/mach-lpc32xx/phy3250.c:41:35: fatal error: linux/mtd/lpc32xx_m=
lc.h: No such file or directory
> > arch/arm/mach-lpc32xx/phy3250.c:226:15: error: variable 'lpc32xx_slc_da=
ta' has initializer but incomplete type
> > arch/arm/mach-lpc32xx/phy3250.c:227:2: error: unknown field 'dma_filter=
' specified in initializer
> > arch/arm/mach-lpc32xx/phy3250.c:227:2: error: excess elements in struct=
 initializer [-Werror]
> > arch/arm/mach-lpc32xx/phy3250.c:227:2: error: (near initialization for =
'lpc32xx_slc_data') [-Werror]
> > arch/arm/mach-lpc32xx/phy3250.c:230:15: error: variable 'lpc32xx_mlc_da=
ta' has initializer but incomplete type
> > arch/arm/mach-lpc32xx/phy3250.c:231:2: error: unknown field 'dma_filter=
' specified in initializer
> > arch/arm/mach-lpc32xx/phy3250.c:231:2: error: excess elements in struct=
 initializer [-Werror]
> > arch/arm/mach-lpc32xx/phy3250.c:231:2: error: (near initialization for =
'lpc32xx_mlc_data') [-Werror]
> >=20
> > It seems that we're missing a dependency. Which tree did the patch to a=
dd
> > these go through? Can we add that to the same branch in arm-soc?
>=20
> Right - there is a dependency on l2-mtd.git here.
>=20
> Since they didn't request pull for 3.6, there is quite some stuff
> pending in their tree (but I wonder why it isn't already part of
> linux-next, so the above error at least shouldn't occur in linux-next).

It is in linux-next:

[dedekind@sauron linux-next (master)]$ git log --format=3D'%h %an %s' drive=
rs/mtd/ | grep Stigge
562dec8 Roland Stigge mtd: lpc32xx_mlc: Cleanup after DT-only conversion
ad978ee Roland Stigge mtd: lpc32xx_slc: Cleanup after DT-only conversion
7359e4c Roland Stigge mtd: lpc32xx_mlc: Make driver independent of AMBA DMA=
 engine driver
fa5eae7 Roland Stigge mtd: lpc32xx_slc: Make driver independent of AMBA DMA=
 engine driver
79f9df7 Roland Stigge mtd: lpc32xx_mlc: Adjust to pl08x DMA interface chang=
es
314a156 Roland Stigge mtd: lpc32xx_slc: Adjust to pl08x DMA interface chang=
es
70f7cb7 Roland Stigge mtd: add LPC32xx MLC NAND driver
d5842ab Roland Stigge mtd: lpc32xx_slc: Make probe() return -EPROBE_DEFER i=
f necessary
21535ab Roland Stigge mtd: lpc32xx_slc: Use of_get_named_gpio()
2944a44 Roland Stigge mtd: add LPC32xx SLC NAND driver
9d7b4b5 Roland Stigge [MTD] [NAND] Fix refactoring of EDB7312 hwcontrol fun=
ction.
4a32cfa Roland Stigge [MTD] [NAND] Fix refactoring of EDB7312 hwcontrol fun=
ction.

--=20
Best Regards,
Artem Bityutskiy

--=-puKyVxIknHQfr2oQs+tz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYrvMAAoJECmIfjd9wqK078wP/29TcnlgTaDVM9noPb6gir7h
fF7/5PdZogC2pD6LUrJAYiI/tGR1f/ARmkNS1ONmGCfagbgmJaSy7DtGIt7MJ4qI
8cZ1KnsOo13OKfNjZt99aEGueRO94UMKME4WOlk8cTk66UgSQmxVsTqy3Edb8Wpc
go61QLfXtRJgG+ZPCPFmDHswQBKZmEGUUYvIj3oCBR/SGrC8a9m32ZQRG2zdbyTU
rhq17Bt4oQOILKEarliLGF62q23Nib/4SNQMNtdAfE4PNGbnJ8Iqt28Amvq7YTlN
z4h7mYjdl48RinBcUKxjaGd3CgPGZUy3X/sZ8T9er+fd3WzAiv/PlLamgndqKvvU
cz01oC9VMNHRB0amc3BMUq122Ze4xfVV3/hWnsx05Vpjwj9OzqnCOgnBysZNP+xA
elKLJLwrTyBSDJ9mUK1JG64RpyvjbsGdXqMHN5I7zIQG0BwsMKK2UUx1AR5pPcnj
2hpQX129kFDNmw8PryRAHulfdU9/QHc7tI4iOzpTRYgZ/Xdz14v7nfmrv/7LAyMa
pUo5Yht6BxnixYk7xWMIvjCBo5LCMJM8TjUyjhz4OI2agGFn2poJr80cUb4kwp9s
ID5poAiKs6y59rIWy2OheXYtvk3seoNLQEcnv+XZWXyx4g5L02gPh75AM7L4tXBX
Y26DtGddYS2i20eB3PUE
=/RWk
-----END PGP SIGNATURE-----

--=-puKyVxIknHQfr2oQs+tz--
