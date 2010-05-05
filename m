Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9ZW7-0004Tk-0n
	for linux-mtd@lists.infradead.org; Wed, 05 May 2010 07:59:40 +0000
Message-ID: <4BE1255E.2090109@pengutronix.de>
Date: Wed, 05 May 2010 09:59:26 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
References: <1272537664-21603-1-git-send-email-mkl@pengutronix.de>	
	<1273036359.3702.35.camel@localhost>
	<1273036482.3702.37.camel@localhost>
In-Reply-To: <1273036482.3702.37.camel@localhost>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig086463D8969395408A6E84BD"
Subject: Re: [PATCH] ubi: init even if mtd device cannot be attached, if built
	into kernel
Cc: Roel Kluin <roel.kluin@gmail.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig086463D8969395408A6E84BD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Artem Bityutskiy wrote:
> On Wed, 2010-05-05 at 08:12 +0300, Artem Bityutskiy wrote:
>>> +#ifdef CONFIG_MTD_UBI_MODULE
>>> +static inline int ubi_is_module(void) { return 1; }
>>> +#else
>>> +static inline int ubi_is_module(void) { return 0; }
>>> +#endif
>> I really hate these ifdefs. Dunno why, but they feel disgusting.
>>
>> I understand your issue and agree that is should be fixed. And I canno=
t
>> really see a better solution. So if no-one complains, I'll accept your=

>> patch.
>>
>> However, for consistency with other UBI code (see debug.h), please, do=

>> this like
>>
>> #ifdef CONFIG_MTD_UBI_MODULE
>> #define ubi_is_module() 1
>> #else
>> #define ubi_is_module() 1
>> #endif
>=20
> Err, of course the second one should be 0, not 1. I can actually do thi=
s
> modification myself, or you can re-send your patch.

I'll resend a patch.

Cheers, Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enig086463D8969395408A6E84BD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkvhJWMACgkQjTAFq1RaXHPszwCfYk9/tt0FKmJ8REW2pCNBI2Zl
C/gAoJeRJby4s/ZRtO3Wb6QCJWmoK4aY
=/bA1
-----END PGP SIGNATURE-----

--------------enig086463D8969395408A6E84BD--
