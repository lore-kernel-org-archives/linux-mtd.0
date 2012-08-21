Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3uE3-00019u-Kl
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 19:34:56 +0000
Received: by bkcji2 with SMTP id ji2so56457bkc.36
 for <linux-mtd@lists.infradead.org>; Tue, 21 Aug 2012 12:34:53 -0700 (PDT)
Message-ID: <1345577690.1886.10.camel@kyv>
Subject: Re: [PATCH v3 6/6] UBI: drop CONFIG_MTD_UBI_BEB_LIMIT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 21 Aug 2012 22:34:50 +0300
In-Reply-To: <1345478416-23900-7-git-send-email-richard.genoud@gmail.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345478416-23900-7-git-send-email-richard.genoud@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-bW+VNFMvp5bEDogtE10g"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-bW+VNFMvp5bEDogtE10g
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-20 at 18:00 +0200, Richard Genoud wrote:
> This option can be set by a kernel parameter and an ioctl, so we may not
> need the kernel config option any more.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

Thanks for separating this. Actually, I've given some more thoughts, and
changed my mind :-) Shmulik is right, it is nicer to preserve the
Kconfig option. So let's drop this patch.

AFAICS, all the kernel stuff is in my tree now.


--=20
Best Regards,
Artem Bityutskiy

--=-bW+VNFMvp5bEDogtE10g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQM+LaAAoJECmIfjd9wqK0R6IQAK3RL58E291QZRl9r4AMdV7K
bdTCiBxEKRSz/V8deueerxcPFlvIvj7DQqhbSQ0nc2BD8ZQ/pQ6cd6VAuOLkkoTo
4CcG40xYS38QXgAeUn89JyKaxyGG2U4r/vopQmEyXpm27iSvsm8MdnyEm8GicIe4
CX5pi1I1nIfjr6NJAteOpeMKSf3ZFuNcEUd6fRR8lmYze9bPKZdkSaAqniY27t95
QK336NovbYGrNIBg8BDgJbP0x6Nx2IAHRPglAzUoPlvmnJXdoexKI7TaEklGAYCz
0z6unUVLveviuGGUM2JO4mrVtRU2+Jgqmk+3sDg+NNvtBu10zOIGypxmZtuWq6ij
Hzjfo/FtZmYx2lksWtJ1YqzYCFioJzZOfqdtoqTWah3xiteC9XiOjqt6pd626OLK
xl/Yu5M/zICKvLQFUETIEQTpWPCXB+1D2r+xBRVs8H6XP5Rdv1ohh+dfJe44JtCn
HbsMxhhBeoMnQ+EUOkzbaRdSkI2X48dO4O1agwRlMK2//yRt7EHKc6Hv/6gfLHs8
kHEXEoYxCxMBxkdy5uM3aTnmbovTMXph1aFFc9ddNiMMxwMqHGkQ9PXMx7unHyWM
9j8H4VWhBg/YvuxAseZlD3hEiRryq3vKxgU4SS6CcDWtHk+8/fmLIM9DjtVIwmIG
falDYucTNd99+bER7LnO
=p7dg
-----END PGP SIGNATURE-----

--=-bW+VNFMvp5bEDogtE10g--
