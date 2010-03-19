Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NsQCt-0000CS-9p
	for linux-mtd@lists.infradead.org; Fri, 19 Mar 2010 00:36:56 +0000
Date: Fri, 19 Mar 2010 01:36:22 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Ferenc Wagner <wferi@niif.hu>
Subject: Re: CONFIG_MTD_DEBUG vs generic DEBUG support in kernel.h
Message-ID: <20100319003622.GB12348@pengutronix.de>
References: <878w9swhlv.fsf@tac.ki.iif.hu>
	<1268744759.20017.58.camel@localhost>
	<87vdctzjn4.fsf@tac.ki.iif.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Content-Disposition: inline
In-Reply-To: <87vdctzjn4.fsf@tac.ki.iif.hu>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> something standard as dev_(v)dbg or pr_debug/devel (btw. what's the
> difference?) instead.

pr_devel will never produce code if !DEBUG. For pr_debug, it may be differe=
nt
as we have DYNAMIC_DEBUG meanwhile (see kernel.h)

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkuixwYACgkQD27XaX1/VRu8RwCeNoUG6JOT2m94FO7TzVz/sDDq
VHgAn0d4YWYUblMZUGdPUf/mkRmIYPuv
=msme
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
