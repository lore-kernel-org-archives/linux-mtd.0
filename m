Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRlp6-0000LN-Bu
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 11:41:57 +0000
Date: Fri, 17 Jul 2009 13:41:53 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Ken MacLeod <ken@bitsko.slc.ut.us>
Subject: Re: [PATCH V2 2/2] mtd/maps/mtd-ram: add an of-platform driver
Message-ID: <20090717114153.GI3150@pengutronix.de>
References: <1244203514-12516-1-git-send-email-w.sang@pengutronix.de>
	<1244203514-12516-3-git-send-email-w.sang@pengutronix.de>
	<1244276049.3751.1176.camel@macbook.infradead.org>
	<20090606111926.GA3279@pengutronix.de>
	<m3iqicnu04.fsf@bitsko.slc.ut.us>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ELVYuRnMxQ5nnKRy"
Content-Disposition: inline
In-Reply-To: <m3iqicnu04.fsf@bitsko.slc.ut.us>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--ELVYuRnMxQ5nnKRy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> This causes of_flash_probe to set up the map and then call
> do_map_probe("map_ram", ...), instead of calling the "obsolete" code
> path.
>=20
> This seems to be working for me.  It looks like partition support
> would be included too but I haven't tried that.

I just tried with partitions: it works. Great!

This approach is also less intrusive; I will make a patch out of it later
today. Maybe this has a better chance of being merged, most features of
plat-ram can probably never be mapped to the device tree anyhow.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5064 |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--ELVYuRnMxQ5nnKRy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpgY4EACgkQD27XaX1/VRse4wCgtox2d8VuaotFRmYlXXMQOAXJ
MLYAoMIAecgPYRlkCem9R8WWiWQsSi9C
=EUJg
-----END PGP SIGNATURE-----

--ELVYuRnMxQ5nnKRy--
