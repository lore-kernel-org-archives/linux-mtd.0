Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TbSkH-0000fM-MA
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 09:06:54 +0000
Message-ID: <1353575257.2701.24.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: Drop FORTUNET support
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Alexander Shiyan <shc_work@mail.ru>
Date: Thu, 22 Nov 2012 11:07:37 +0200
In-Reply-To: <1353235423-11303-1-git-send-email-shc_work@mail.ru>
References: <1353235423-11303-1-git-send-email-shc_work@mail.ru>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-gvxzWcWLIUBI3vkcwaik"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-gvxzWcWLIUBI3vkcwaik
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-11-18 at 14:43 +0400, Alexander Shiyan wrote:
> The kernel does not contain the symbol SA1100_FORTUNET so the driver
> never compiled and can be removed safely.
>=20
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-gvxzWcWLIUBI3vkcwaik
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQretZAAoJECmIfjd9wqK0qB4P/if4iZlWv5+m9nbkeioqRy+k
E8q0SkMJmVaLrgZULwIEcAt7pk3iTDH8e+ZzxV6AJ/Gs8tohRDlf6qBnY2EwgACv
yoSUpUlS1xLC8TggNdMtvxSZPS0INSr2izRP4EksXYfrRR+L5axEYagBou+ljFOg
zftKPnIYL+6KJ8Q48y9EycjNkP6c2sLrbStDtfhj6HycweRgnSof6f1bRokTK/sM
dtxxwvCF4z3qL0X4AV8Z5IGfdwpjagjbYzDiwxwdByUCyJD9vel8QV2secg7LGOg
OCD6CRLO34CK7243ojj/qg6SQb2tINJgNH/VWZealoNQU+qbtS0JU5rXUabnENnO
TlxbxXopnwJFKnItFE84JvQDhY0tP527WnWb1Lyn4Pf6G3y10T1RU0n86gnYnHQS
GjGjSvgw2YWhXFB8bmcf7EomNwE0r03/h+hGgGpF0NqgOMF/9DdPUM5979bO9A+6
duYOspnIo6AOMtoP3V944g7MFJtScrAwsWWvuF8E+8wBImx2Ef9gnW3BnTFEcUfE
ZHf35cOOD+W+qITYxLzWwaUyhRmCt+HLmIcCf7Y/fYvolSjWYOeuHxnTDnlQ89xi
GN0Bw9BNyo07gQHZhviw5N1AKn5uOQtEK0hfIDVzCyVovfGlQ99hWPHVMi6Vbx5S
gacusci2QedCW4gNOGN4
=dilE
-----END PGP SIGNATURE-----

--=-gvxzWcWLIUBI3vkcwaik--
