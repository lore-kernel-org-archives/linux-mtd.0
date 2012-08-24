Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4w7Y-0002eU-4w
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 15:48:28 +0000
Received: by wibhn17 with SMTP id hn17so770324wib.0
 for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2012 08:48:25 -0700 (PDT)
From: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH] UBI: Do not try to autoresize in readonly mode
Date: Fri, 24 Aug 2012 17:48:18 +0200
Message-ID: <6233716.oXLBM8tzrg@pali>
In-Reply-To: <1345822171.2848.325.camel@sauron.fi.intel.com>
References: <8381186.XTLIOQGYR2@pali>
 <1345822171.2848.325.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7317310.tDS1sqTQz6";
 micalg="pgp-sha1"; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--nextPart7317310.tDS1sqTQz6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday 24 August 2012 18:29:31 Artem Bityutskiy wrote:
> On Sat, 2012-08-18 at 14:11 +0200, Pali Roh=C3=A1r wrote:
> > I'm sending small patch which skip autoresizing ubi in
> > readonly mode. I think it is really not good idea to try
> > resize in ro mode.
>=20
> Hi, I've just pushed a similar patch to linux-ubi.git, is this
> fine with you? I've also CCed -stable.
>=20

Hi, patch is OK. I tested it and working for me fine.

> > BTW, is there userspace tool for unpacking data from ubifs
> > image without need to simulate nand device in kernel?
>=20
> Unfortunately no.

Ok. I have patch for block2mtd.ko which allows me to mount ubifs=20
image in way: losetup --> block2mtd --> ubiattach --> mount=20
without nandsim. I needed to patch block2mtd, because ubi code=20
needs correct erase size, write size nand subpage shift and full=20
image size. So I added params for these properties in block2mtd=20
code - and it working. But I do not know if this is correct way,=20
but I can send my patch.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
--nextPart7317310.tDS1sqTQz6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlA3okIACgkQi/DJPQPkQ1LB0QCfYi6Bft6DMqPBwpWEoRkbtk4m
QHwAoMXUZPs2oXzYKGVt2eaCsKBS/OIM
=Q6Op
-----END PGP SIGNATURE-----

--nextPart7317310.tDS1sqTQz6--
