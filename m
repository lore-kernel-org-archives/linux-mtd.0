Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SLxdX-0008Dw-Hs
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 14:19:36 +0000
Message-ID: <1335104359.7078.0.camel@golum>
Subject: Re: [PATCH 1/1] Remove UBIFS_FS_XATTR config option.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Subodh Nijsure <subodh.nijsure@gmail.com>
Date: Sun, 22 Apr 2012 17:19:19 +0300
In-Reply-To: <1334419797-28995-1-git-send-email-snijsure@grid-net.com>
References: <1334419797-28995-1-git-send-email-snijsure@grid-net.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-zIAwDYVTXJHeKVHgvwid"
Mime-Version: 1.0
Cc: Subodh Nijsure <snijsure@grid-net.com>, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-zIAwDYVTXJHeKVHgvwid
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-04-14 at 09:09 -0700, Subodh Nijsure wrote:
> Remove CONFIG_UBIFS_FS_XATTR configuration option and associated
> UBIFS_FS_XATTR ifdefs.
>=20
> Testing:
>        Tested using integck while using nandsim on x86 & MX28 based=20
>        platform with Micron MT29F2G08ABAEAH4 nand.
>=20
> Signed-off-by: Subodh Nijsure <snijsure@grid-net.com>

Ok, while babies are sleeping I had time to handle my inbox. Pushed to
linux-ubifs.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-zIAwDYVTXJHeKVHgvwid
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPlBNnAAoJECmIfjd9wqK0HMoQALvIYv08xI/FkXPUYYLmCfZD
ocSbo0f5JBDeMkDOqc3WCxK7mISC/f0fNFHZHBGFMjEy4lZmVKnokr97CQtYYqqg
84+be4v0JfLLJcTrAWne5eyUGqs7mWbV6A4cu1u/2MH31+Nkc9+QeCU8AVxqcpzk
nhh3GbazsPavKWLyJNbU1fGjkk4YMkLemuD+D/O97MTVLQPofsZ9oovyUWPuBjXE
gXVV4MFAROr68woaAuAnm1ixBiPQXccZb6Zc44BLwU8Fz44tggdfMUO+GCND93Ts
wzOwWDjOxinr2nnPW/EGxdbQRd6wShaF0ugCbC+TAkBLrZWv6Ki3JQCSc+hCTDEq
Yb7qxSA2TzrLdfas/iDwdueogwVN0CToYvMpQyEqPyFWa/yrNduPb4w5xE/X4IVA
rvePzwHkgAMuypb4awUlfNWX4mZSPAt8Vk9SkN993oTAGxYaiviXobdHO8NWcbFQ
Jvsq07VtByWOSc5M6uNr/HQkDIDVW4dPfrYPsJukFgyaiL5ELNX7jL6r8NyAWZWg
dtLxjYrdxY1GCZWXyLcbi7xiGBBOqpZAaRzmBcX9TbpXiYBxCGZ8WM9Oo7nF2wJu
6PCteVcwz+97fMnaNYsc8qNOdrNjsYGtxyMz+bDukPrx9VrleLQGSVl8TTpmdw38
D+gm/sDHRqOxzAv52OUz
=oED8
-----END PGP SIGNATURE-----

--=-zIAwDYVTXJHeKVHgvwid--
