Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tvpse-0006u2-U4
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2013 13:51:45 +0000
Message-ID: <1358430781.2731.252.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: fsl_ifc_nand: use more portable i/o accessors
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Kim Phillips <kim.phillips@freescale.com>
Date: Thu, 17 Jan 2013 15:53:01 +0200
In-Reply-To: <20130111162359.33980fd3436fcc65e71da1c0@freescale.com>
References: <20130111162359.33980fd3436fcc65e71da1c0@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-QL3lJATxOyBULRaix/qI"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Prabhakar Kushwaha <prabhakar@freescale.com>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-QL3lJATxOyBULRaix/qI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2013-01-11 at 16:23 -0600, Kim Phillips wrote:
> in/out_be32 accessors are Power arch centric whereas
> ioread/writebe32 are available in other arches.
>=20
> Since the IFC device registers are annotated big endian in
> fsl_ifc.h, the accessor annotations now match, resulting in the
> pleasant side-effect of this patch silencing sparse endian
> warnings such as the following:
>=20
> drivers/mtd/nand/fsl_ifc_nand.c:179:19: warning: incorrect type in argume=
nt 1 (different base types)
> drivers/mtd/nand/fsl_ifc_nand.c:179:19:    expected unsigned int volatile=
 [noderef] [usertype] <asn:2>*addr
> drivers/mtd/nand/fsl_ifc_nand.c:179:19:    got restricted __be32 [noderef=
] <asn:2>*<noident>
>=20
> Signed-off-by: Kim Phillips <kim.phillips@freescale.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-QL3lJATxOyBULRaix/qI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ+AI9AAoJECmIfjd9wqK0p4AP/1ZHlvLCC9jq3LZtWS5My6Ff
w3QDDQ5HoCGS+RDqM8BJ0tqsiZIesSnBN1BH2mNE6QQn6wu4nVDnB91pHhaOaRSL
ICgXRbTi4eJk8hvM3PXlonZL7JnUb+3Oc6O1pDTu3Zi7pyPH8lgPk5d4DjlbxhPZ
JWSa1X1zDyy9cyoNUGvg3pQXXdfDTyd3ZKkPerqTw07Xt7rcPgdBpohQntJWdVpY
uIvt596fUz1wsTWYxMnLHSNhKeBAbLIayaxzUrk+NklsYuZsB8KK9QHWRZQIZsIq
V+ZvIoIh3V3HtdGxjMKpqFu2fvmM3XteQCvzXJAE3JPXiyrqBViXvNq6IuPx1Xx7
pOjcb7JLyWx+6DSV039uWRsMZxrRQKwDE8Ijh9xbL46KUl7FIXbYlVtr5oTXHXL/
GZRO11FjK+Pga9e6Wxq/+44sZBN53ld+x/cmt/+0pjaOhiEtVdOh0MalMlsLVAVh
/vasi2bReQad0FOSb/n6ImnHcoZ1OdIGJ4D0ZH+cNFVk/7vPZR75JLzMijF9yDKH
kadXmdyOxx/JzA5YilQTC4530/X5ta/TeKqN5Ri7Skae88Sitewlr0PgKs6JuFPl
fUSTmrDC2LUxrQ5LkdY9bijV73jHMXVOwx7A/ToEmPrz/iOTYiFYxz+jorOUbV1j
cI/iF3mgIXQU99lZlmQv
=1TSf
-----END PGP SIGNATURE-----

--=-QL3lJATxOyBULRaix/qI--
