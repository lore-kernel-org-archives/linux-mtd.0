Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SStEG-0007tM-BV
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 17:02:09 +0000
Message-ID: <1336755933.2625.100.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] [JFFS2] allow JFFS2 to discriminate between recoverable
 and non-recoverable errors
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Date: Fri, 11 May 2012 20:05:33 +0300
In-Reply-To: <1336662824-2594-1-git-send-email-jcd@tribudubois.net>
References: <1336662824-2594-1-git-send-email-jcd@tribudubois.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ZiSg/HG94pHGuDhrcHjI"
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


--=-ZiSg/HG94pHGuDhrcHjI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-05-10 at 17:13 +0200, Jean-Christophe DUBOIS wrote:
> This patch is basicaly a reverse of commit f326966b3df47f4fa7e90425f60efd=
d30c31fe19.
>=20
> It allows JFFS2 to make the distinction between a potential transient err=
or
> (reading or writing the media) and a non recoverable error like a bad CRC=
 on
> the extended attribute data or some insconsitent paramaters.
>=20
> In order to make clear that the error is indeed intended to report a corr=
upted
> attribute, a new local error code (JFFS2_XATTR_IS_CORRUPTED) is introduce=
d.
>=20
> This error code is never reported to user space and only checked locally =
in this
> file.

Pushed both to l2-mtd.git, thanks!

Can you confirm that these 2 patches solve the issues you earlier
described on this mailing list?

--=20
Best Regards,
Artem Bityutskiy

--=-ZiSg/HG94pHGuDhrcHjI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPrUbdAAoJECmIfjd9wqK0HUIP/RNuZ3J1ewxMWuX2/coFynm0
dpJN/87zLvmU/XXitKnimIznUM5XuYk6m28Qr6voD7tdFvfQbl27xcr8CNsr/plM
yn04WCPXTTLRBShpOhGFxUwAnzCHDItR5fqNSmwOIJ0olXenNSvuyBIlapVOAy3p
hbT1BaVaGDQ7uiIkWT+8l5NsqUXezPKJ2QCsklmIQlGN+fbmbkLjGRZoBpry5xO1
yIR7E4sV/GuFMRY4YPQSWIc50bokuIdPF2p/oTiV2v7BEpgW0s66mdIZ6kb6HDRc
U7kb5g9H7I1c/Pxb5wx1T+abKqZiq2JO+IHE9Dr9scTErtxeFEp9+025mj9Rr+QI
H408/ER6j7zwUeCH6IJNMnbjMPUfedLEAiFNwpPz4kP2Y6qRw5Ursta9MOtelAnx
YJee3T4yiJfMqeCsJXFypDmdLVgXGvtZC2sXOqNfg9lMYW1RT5FnsI7OaIUS2CM8
Px6G13K8HOTrKGW3JDLPZNrOrz1EhdJs3ONvs+cmqLcFlTQd8R9hDSSgqQKervWk
rmlpxir65/OP2F0jD+HVbEr/YW4OZk0oCQt/jqVZ8yI6qoCvBSjWcTaYzsnJDJmy
CJEvCtSxAez8r5BOhyjZR57/nOeXA2QZDXL8JjsdOjGeUZ4J1tUD/AF4HYrAtowK
XnztEyszxBFfOD106UUh
=ATlG
-----END PGP SIGNATURE-----

--=-ZiSg/HG94pHGuDhrcHjI--
