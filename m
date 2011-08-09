Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qqt8A-0008Uz-Il
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2011 20:42:31 +0000
Date: Tue, 9 Aug 2011 22:42:23 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: GPMI-NAND Status?
Message-ID: <20110809204223.GA5858@pengutronix.de>
References: <20110805135133.GA26981@pengutronix.de>
	<4E3F8087.6070206@freescale.com>
	<20110809093546.GB1923@pengutronix.de>
	<4E4111F3.5070409@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline
In-Reply-To: <4E4111F3.5070409@freescale.com>
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


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >>>Always reproducible by me when trying to format mtd0. Sometimes(always=
?) seen
> >>>by Koen during boot (on read?). Never seen by Huang? It is currently u=
nclear if
> >>After I used a different .config, it never appears in my side.
> >So, you have a config which triggers this? That should be useful for
> >debugging. What do you need to enable to see this?
> >
> My old config is made by myself. I think it was a wrong config,

Let's see what the bug is in the end, but I don't think a config could be
"wrong" in a way to trigger such a bug. Even misconfiguration can be handled
gracefully with code.

> it's not a DMA bug, I discuss with Koen, and make sure that the bug is
> caused by the GPMI or BCH.

Did you get any further during this day?

> it's a different bug from  Aisheng Dong's bug.

Okay, I had a look at this one today.

> >>>* custom kernel command line parameters
> >>The kernel command line 'gpmi_nand' is to avoid the conflict with
> >>other modules such as
> >>SD.
> >>
> >>If it's be removed, I have to use different config to resolve the
> >>issue which is not better either. :(
> >This is a board-specific issue, so you should handle this at
> >board-level, not at driver level.
> >
> I wish to handle it at the board level.
>=20
> But I have no idea how to solve the conflict between GPMI and SD.  :(
>=20
> Could you give me some hint?

For starters, you could move some kerel-parameter to the board-file and cre=
ate the
devices as needed depending on that:

if (gpmi_nand)
	mx28_add_gpmi_nand(&mx28evk_gpmi_nand_data);
else
	mx28_add_mxs_mmc(1, &mx28evk_mmc_pdata[1]);

or something alike unless I miss something. This is probably not the best
solution as well, but at least it keeps the driver free from the
board-configuration.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk5Bm64ACgkQD27XaX1/VRsPWACgvSXS9dcoTJ3F8JUhWMO0uwUv
uEUAoI04g4fBV+gvD/c9HcYMuTuyXt5+
=s/Lm
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
