Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MGUny-0008Tf-Q5
	for linux-mtd@lists.infradead.org; Tue, 16 Jun 2009 09:18:14 +0000
Date: Tue, 16 Jun 2009 11:18:01 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Albrecht =?iso-8859-1?Q?Dre=DF?= <albrecht.dress@arcor.de>
Subject: Re: [PATCH V2 2/2] mtd/maps/mtd-ram: add an of-platform driver
Message-ID: <20090616091801.GC21321@pengutronix.de>
References: <1244203514-12516-3-git-send-email-w.sang@pengutronix.de>
	<1245087807.3185.0@antares>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Content-Disposition: inline
In-Reply-To: <1245087807.3185.0@antares>
Cc: devicetree-discuss@ozlabs.org, grant.likely@secretlab.ca,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Ben Dooks <ben-linux@fluff.org>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--bAmEntskrkuBymla
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2009 at 07:43:20PM +0200, Albrecht Dre=DF wrote:
> Am 05.06.09 14:05 schrieb(en) Wolfram Sang:
>> Create an of-aware driver using the now exported generic functions =20
>> from plat-ram.c. Also add the documentation for the binding. =20
>> Partitions are not yet supported. Tested on a phyCORE-MPC5200B-IO.
>
> Dumb question: what is the current status of this patch?  I ask because =
=20

I don't know.

David wondered if 'of_physmap' could be used, so I wrote what I experienced
during development. I can't tell if this helped the case.

Grant wondered if we need a bankwidth. IMHO it is needed for now, but I don=
't
know if this is a common agreement.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--bAmEntskrkuBymla
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAko3Y0kACgkQD27XaX1/VRsjegCfRhzQq3HNnvxjh6NTeRdmyJvp
Lr4Anj/ApO0NW6IoNRvXHHWrbCjvrFf9
=Sigq
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--
