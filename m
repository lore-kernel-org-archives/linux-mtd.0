Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SF9Zh-0002gn-Sr
 for linux-mtd@lists.infradead.org; Tue, 03 Apr 2012 19:39:30 +0000
Date: Tue, 3 Apr 2012 21:39:20 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH] mtd/gpmi : do not include the mxs.h
Message-ID: <20120403193920.GC2201@pengutronix.de>
References: <1333247817-18472-1-git-send-email-shijie8@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="69pVuxX8awAiJ7fD"
Content-Disposition: inline
In-Reply-To: <1333247817-18472-1-git-send-email-shijie8@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--69pVuxX8awAiJ7fD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 31, 2012 at 10:36:57PM -0400, Huang Shijie wrote:
> The mxs.h does not exit in the mx6q.
> So rewrite the __mxs_clrl()/__mxs_setl() and remove the mxs.h.
>=20
> Signed-off-by: Huang Shijie <shijie8@gmail.com>

I am quite sure we will have STMP devices in 3.5 which should make this pat=
ch
obsolete. If this patch is considered a bugfix for 3.4, then OK for now.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--69pVuxX8awAiJ7fD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk97UegACgkQD27XaX1/VRvmsQCfXylR4pqF5WNlzrLOKsP7PQVk
U4oAoJDoErn34dhEXouqcNZD9J33QRrT
=4AYS
-----END PGP SIGNATURE-----

--69pVuxX8awAiJ7fD--
