Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OoVsZ-0004sR-Dn
	for linux-mtd@lists.infradead.org; Thu, 26 Aug 2010 06:24:04 +0000
Date: Thu, 26 Aug 2010 08:23:57 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
Subject: Re: [RFC] nand/davinci: Fix comment to match the code
Message-ID: <20100826062357.GA874@pengutronix.de>
References: <1282738700-30966-1-git-send-email-w.sang@pengutronix.de>
	<1282740906.24044.210.camel@localhost>
	<045301cb44d3$2551fef0$6ff5fcd0$@raj@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline
In-Reply-To: <045301cb44d3$2551fef0$6ff5fcd0$@raj@ti.com>
Cc: Artem.Bityutskiy@nokia.com, davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org, 'Sneha Narnakaje' <nsnehaprabha@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Sudhakar,

> > commit 1c3275b656045aff9a75bb2c9f3251af1043ebb3
> > Author: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
> > Date:   Tue Jul 20 15:24:01 2010 -0700
> >=20
> >     mtd: nand: davinci: correct 4-bit error correction
> >    =20
> >     On TI's DA830/OMAP-L137, DA850/OMAP-L138 and DM365, after setting t=
he
> >     4BITECC_ADD_CALC_START bit in the NAND Flash control register to 1 =
and
> >     before waiting for the NAND Flash status register to be equal to 1,=
 2 or
> >     3, we have to wait till the ECC HW goes to correction state.  Witho=
ut this
> >     wait, ECC correction calculations will not be proper.
> >    =20
> >     This has been tested on DA830/OMAP-L137, DA850/OMAP-L138, DM355 and=
 DM365
> >     EVMs.
> >    =20
> >     Signed-off-by: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
> >     Acked-by: Sneha Narnakaje <nsnehaprabha@ti.com>
> >     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> >     Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> >     Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
> >=20
> > then it is already in upstream in Linus' tree. I do not have anything e=
lse from you.
> >=20
>=20
> Yes, this was the patch I was talking about. But this patch seems little
> different than the one I submitted to linux-mtd list at
> http://patchwork.ozlabs.org/patch/59180/. But I can submit another patch
> which corrects it.=20
>=20
> Wolfram Sang,
> Do you agree that in the above link which shows the patch I have submitte=
d,
> the comment matches the code?

Yes. Also, where and how 'timeo' is handled is much better in this patch. If
you create an update patch to make the code look like in the patchwork-link,
you can instantly add my:

Acked-by: Wolfram Sang <w.sang@pengutronix.de>

Thanks,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkx2CH0ACgkQD27XaX1/VRuAdQCgtHiFPGX3btuoGbXCrbN9xznC
A3UAn0EiER+DyPF6t5IVDIpzU7g3b/ev
=HhlU
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
