Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SPYNQ-0005er-Ig
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 12:09:49 +0000
Message-ID: <1335960786.10293.50.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: docg3: fix max_bitflips related bug
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Wed, 02 May 2012 15:13:06 +0300
In-Reply-To: <1335893125-15904-1-git-send-email-mikedunn@newsguy.com>
References: <1335893125-15904-1-git-send-email-mikedunn@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-zYPJfUsNB4OnfTh4B0Cb"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-zYPJfUsNB4OnfTh4B0Cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-01 at 10:25 -0700, Mike Dunn wrote:
> This fixes a bug in the docg3 driver that was introduced by the EUCLEAN p=
atch
> set [1].
>=20
> [1] http://lists.infradead.org/pipermail/linux-mtd/2012-April/040941.html
>=20
> Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Folded this patch into:

mtd: driver _read() returns max_bitflips; mtd_read() returns -EUCLEAN

and pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-zYPJfUsNB4OnfTh4B0Cb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPoSTSAAoJECmIfjd9wqK0jogP/3vqPLyGzLae2IrNM++7Tg1G
TaR8qUvYPuy1oNLb+wDKYGm1uTb2+n1cHn1kDFmDJPPFSVq0d+QulJCwYUQicG3d
aQgwbcY8xF0wThzXbhQaY+EFnkWSr472NeoR5WCsuBvkpKHclGKxAjU/XMz50/KV
ERI/sVewH42F1Ih4G0bfxgIxL+/oESNyWxF5ss4djtpdajUYN0BCnYPIKrr8Aqvm
98z5r+7lW1jO85v2PHfdFysgdVhLcjwXL2/RAHs3Jmd5ElrfqJ2hLwv1h8+M16sM
KvKXTKQoOb7M3jkLY9FN11C4/ADnc5q1IV9TiaKeLTiR72QkM9L7/hNN0QJZDXxd
dKYLoQr6Jy6SKhg81olEJtA4Cmqi7tzyQnxEWYZvtCKU59/xobIC0pP024JQsG9y
DFAASwklqzK/ofNCVv/EgzUSmrMCntowxhWYaynJMQfzoBk1DilH+FBUT18jczpT
KSm2YNkjOEWUk+Y8V4y3YAeXV5hKRW5qAQVJHXNCror4dSG4RtmSgcmAWejC1Uwt
VDeSDBCs58fI7Fi/vUGCPkJMu5mpiZKSiy09yW/ImwwI3GI+dRzRo1iCtIRWCMbp
6bs7J/ibqN54aFgAXJSUfbfp6A28+Iv4dbkKcvynDPqAkW8cxAvmjG614+8Kv4qX
LFAcDWxB92Q5ly3lBAhR
=TNu9
-----END PGP SIGNATURE-----

--=-zYPJfUsNB4OnfTh4B0Cb--
