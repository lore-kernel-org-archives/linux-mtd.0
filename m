Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4wIi-0004R3-N3
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 16:00:02 +0000
Received: by mail-wi0-f177.google.com with SMTP id hn17so779649wib.0
 for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2012 09:00:00 -0700 (PDT)
From: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH] UBI: Do not try to autoresize in readonly mode
Date: Fri, 24 Aug 2012 17:59:56 +0200
Message-ID: <2142677.yEm4yDLVdN@pali>
In-Reply-To: <1345823821.2848.331.camel@sauron.fi.intel.com>
References: <8381186.XTLIOQGYR2@pali> <6233716.oXLBM8tzrg@pali>
 <1345823821.2848.331.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2139281.FbzKWQLksD";
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


--nextPart2139281.FbzKWQLksD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday 24 August 2012 18:57:01 Artem Bityutskiy wrote:
> On Fri, 2012-08-24 at 17:48 +0200, Pali Roh=C3=A1r wrote:
> > > > BTW, is there userspace tool for unpacking data from
> > > > ubifs
> > > > image without need to simulate nand device in kernel?
> > >=20
> > > Unfortunately no.
> >=20
> > Ok. I have patch for block2mtd.ko which allows me to mount
> > ubifs image in way: losetup --> block2mtd --> ubiattach -->
> > mount without nandsim. I needed to patch block2mtd, because
> > ubi code needs correct erase size, write size nand subpage
> > shift and full image size. So I added params for these
> > properties in block2mtd code - and it working. But I do not
> > know if this is correct way, but I can send my patch.
>=20
> Why do you need to use block2mtd? If you have an image for NOR
> flash, use mtdram, if it is for NAND - use nandsim. What
> prevents you from using mtdram or nandsim?

I do not know why, but copying 256 MB image to nandsim takes more=20
time than losetup & block2mtd & mount...

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
--nextPart2139281.FbzKWQLksD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlA3pPwACgkQi/DJPQPkQ1K9MgCfbs6f/Y2gECQw3H3kNLgAbv3G
jFoAn2sZVMc33w5SV3jVSD7Yi3uUYswL
=mILT
-----END PGP SIGNATURE-----

--nextPart2139281.FbzKWQLksD--
