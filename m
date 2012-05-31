Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sa2Q6-0007l2-Ua
 for linux-mtd@lists.infradead.org; Thu, 31 May 2012 10:15:55 +0000
Message-ID: <1338459575.2536.120.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] UBIFS: compute KSA size and store in superblock
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Thu, 31 May 2012 13:19:35 +0300
In-Reply-To: <alpine.DEB.2.00.1205311211340.15137@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1205251509220.2989@eristoteles.iwoars.net>
 <1337952271.30969.37.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1205301531220.6465@eristoteles.iwoars.net>
 <1338391121.2536.94.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1205311211340.15137@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-q+nJxltiS2A7bqUBtaXm"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-q+nJxltiS2A7bqUBtaXm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-05-31 at 12:12 +0200, Joel Reardon wrote:
> > You need to validate that:
> >
> > 1. if use_ubifsec is true, then ksa_lebs is not zero.
> > 2. ksa_lebs is sane - not too small, not too large.
> >
>=20
> Will add an assert and a dbg check function.

Why assert? The point is that if we read the superblock we should check
that it is sane. See teh validate_sb() function. If any of the above 2
checks fail - the superblock is insane and we should refuse mounting.

--=20
Best Regards,
Artem Bityutskiy

--=-q+nJxltiS2A7bqUBtaXm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPx0W3AAoJECmIfjd9wqK0NRYP+gOwuCLytJlrCiOhcn/mM4JR
m5wkTKjAcRaxFDfTMon0ZYtZ0tF62OKrjSTYQbk1/QH//dGqo+8+JZhYUN+VrzXO
3zYxOImoJwxI3rGVbcd9ZJt++PfPYx5BiiULyKp1oYwUpxB2vOZDwPdTNytjLeo8
YAFt1lsGtUFqisdYRjwR/ynoJ3I4l0SWPtz1i74q/L7VekjOleEZXVwprub9SdxI
/HzcBraWQRBJna+0ycwntH5342KK9cDlq9Gd1ZnYV/+jJSogH8pai28x0TT2TAYp
UQ2FL9oyFYabTbg6Hut4c1GQCm1KIoPKIj05cooXf1h5I0gfD8RCRZvCi33IO9sv
dsHR/yj1YZpRCc87JKMVDOj+YyyLQ8eESuIqzxDFlY+1b1ahK8UL0YMZWjIreAIf
U3ukOij8z0ebfgQUTfPSPPxooyLldoZA9OQqcg+eIOBlHg2S4/ZqViaXqpQCNIK5
ylpa4TcMGw3CrparZF+3aSjTQMFWadCF4rghRULkLKPGVe0dIfdu+bVL+UmPdikd
LnGHGfpTOggSiWWKAP2QzkAmYHLNUiC0b3CIHFbINqCtVwPuuFRZyt6UZWiEQuy4
5c0O++bol11LLLwnfRzvWKZXcdVFEnouvn8WCTfkHHbkQRAFHmZwkRverke0cnAa
MLIDIdFoDt9cDncu+ic8
=NQwX
-----END PGP SIGNATURE-----

--=-q+nJxltiS2A7bqUBtaXm--
