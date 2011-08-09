Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qqij1-0002IN-Ru
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2011 09:35:53 +0000
Date: Tue, 9 Aug 2011 11:35:46 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: GPMI-NAND Status?
Message-ID: <20110809093546.GB1923@pengutronix.de>
References: <20110805135133.GA26981@pengutronix.de>
	<4E3F8087.6070206@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Content-Disposition: inline
In-Reply-To: <4E3F8087.6070206@freescale.com>
Cc: Koen Beel <koen.beel.barco@gmail.com>, Shawn Guo <shawn.guo@linaro.org>,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Lothar =?iso-8859-15?Q?Wa=DFmann?= <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >DMA timeouts [1]
> >=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >[    2.560000] [ start_dma_without_bch_irq : 392 ] DMA timeout, last DMA=
 :1
> >[    3.560000] [ start_dma_with_bch_irq : 427 ] bch timeout!!!
> >
> >Always reproducible by me when trying to format mtd0. Sometimes(always?)=
 seen
> >by Koen during boot (on read?). Never seen by Huang? It is currently unc=
lear if
> After I used a different .config, it never appears in my side.

So, you have a config which triggers this? That should be useful for
debugging. What do you need to enable to see this?

> Please test the driver again when you back to office.
> Pay attention to your version of /arch/arm/configs/mxs_defconfig.
> Your mxs_defconfig may miss Shawn Guo's patches.

I have all the correct patches, I triple-checked that. Regarding the
config, I am not looking for a config that works, I want my config to
work. I meanwhile have the feeling this is a bug in the DMA driver
(because Aisheng Dong has DMA problems, too, in the audio path), still
we need to be sure.

> >problem overwriting all-0xff data in NAND [2]
> >=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >Although it occured only when writing JFFS2 images so far, this is a gen=
eric
> >issue and needs to be fixed, right?
> >
> Artem said it should not change the driver, but the upper layer(jffs2).
>=20
> So I think i do not need to change the driver.

OK, read it again, got it now. Agreed.


> >* custom sysfs-entries
> My sysfs-entries is in the GPMI-NAND directory.
> Does be a mainline driver means I should not have any sysfs-entries?
> If it does, i can remove it.

It is some kund of ABI, so we would have to support them forever. If
there is no really strong reason to have them, it is better to remove
them.

>=20
> >* custom kernel command line parameters
> The kernel command line 'gpmi_nand' is to avoid the conflict with
> other modules such as
> SD.
>=20
> If it's be removed, I have to use different config to resolve the
> issue which is not better either. :(

This is a board-specific issue, so you should handle this at
board-level, not at driver level.

> >* namespacing (some functions have no prefix, some have "mil_", some hav=
e mx23)
> >   (I think 'mil' means 'mtd interface layer', but why is that needed?)
> The mil is used to make the gpmi_nand_data{} simple.
> Without it, the gpmi_nand_data{} will very big.
>=20
> The functions which have mx23 prefix are only used in mx23.
> The functions which have no prefix can used in both mx28 and mx23.

I understood this, but wonder if mx23_* specific stuff has to be in the
main driver. Will have a closer look to the driver this week, then I can
say more.

> >Complexity
> >=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >The driver is not easy to review. I wonder if it makes sense to use incr=
emental
> >patches for it? maybe making it a staging driver could be a solution for=
 that?
> Frankly speaking, the current driver is maybe the smallest version now.
>=20
> I even do not add the on-chip BBT feature now.

OK.

> >Huang, are you interested in accepting patches or do you prefer we just =
point
> >at certain code and you then fix it? Starting with a simpler driver and =
then
> Feel free to mail me the patch. it's welcome.

We'd need a branch somewhere for that, so we have a history.

> >adding stuff might be another option if we can't chase all the bugs in t=
he
> >current driver.
> >
> >That being said, I'd think fixing the DMA issue has prio #1 and maybe we=
 can
> >meet in IRC or something to work that out? Is there interest in that?
> What about gtalk?

Definately not my favourite, but seems like Koen and you already use it.
Might try it...

Regards,

    Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk5A/3IACgkQD27XaX1/VRt8hQCffAGt9TMldE13HeA0OtZBPoK5
OBEAn1+6voUo/jurTNgCNJnNVWvzR1gP
=nBji
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--
