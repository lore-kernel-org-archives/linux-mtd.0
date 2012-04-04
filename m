Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SFKEM-0002ke-KP
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2012 07:02:12 +0000
Date: Wed, 4 Apr 2012 09:01:57 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Sam Gandhi <samgandhi9@gmail.com>
Subject: Re: Using GPMI-NAND driver on iMX28 using 3.4-rc1?
Message-ID: <20120404070157.GB24930@pengutronix.de>
References: <CAOdLEarFOdmDBS0iDmafLeBU=NNWxWjejTvJ-eEkQjRO12+VYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline
In-Reply-To: <CAOdLEarFOdmDBS0iDmafLeBU=NNWxWjejTvJ-eEkQjRO12+VYg@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> When booting kernel with initcall_debug we never see that
> gpmi_nand_probe() function is never getting called.

You probably don't have a NAND device registered. Then, there is nothing to
bind a driver to.

> I have gone through the MTD  mailinglist log, and I didn't find
> details on how this GPMI-NAND driver was actually tested on hardware.

It should be there somewhere, the mach relevant patches have been mentioned
there, too.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk978eUACgkQD27XaX1/VRvxAQCfeqdm31PKyp60+t0D/ZBVi3Xl
j7IAoLzWpr+y5TIfQvdndjcR0MUYcMtb
=TgdT
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--
