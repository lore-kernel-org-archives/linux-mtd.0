Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGogZ-0002r5-Ra
 for linux-mtd@lists.infradead.org; Fri, 02 Jun 2017 15:40:25 +0000
Received: by mail-wr0-x242.google.com with SMTP id g76so1564981wrd.2
 for <linux-mtd@lists.infradead.org>; Fri, 02 Jun 2017 08:40:02 -0700 (PDT)
From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH] UBI: Do not try to autoresize in readonly mode
Date: Fri, 2 Jun 2017 17:39:59 +0200
Cc: linux-mtd@lists.infradead.org
References: <8381186.XTLIOQGYR2@pali> <2142677.yEm4yDLVdN@pali>
 <1345824556.2848.339.camel@sauron.fi.intel.com>
In-Reply-To: <1345824556.2848.339.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3967630.DzeFdH85js";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201706021739.59748@pali>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart3967630.DzeFdH85js
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Friday 24 August 2012 18:09:16 Artem Bityutskiy wrote:
> On Fri, 2012-08-24 at 17:59 +0200, Pali Roh=C3=A1r wrote:
> > > Why do you need to use block2mtd? If you have an image for NOR
> > > flash, use mtdram, if it is for NAND - use nandsim. What
> > > prevents you from using mtdram or nandsim?
> >=20
> > I do not know why, but copying 256 MB image to nandsim takes more
> > time than losetup & block2mtd & mount...
>=20
> May be, how much more? Is that a show-stopper for you? If you copy
> with 'dd', try 'bs=3D2048' if you are simulating a device with a 2048
> bytes NAND page size.
>=20
> But I guess you can patch block2mtd, I do not have objections
> (although it'll report about itself as NOR flash?), but I never used
> it and I am not sure how many bugs there are.

Hi! Years ago I wrote patches for block2mtd to allow specify write size=20
and nand subpage shift. But I forgot to send them. I think they could be=20
useful for other people, so rebased them on mainline kernel I will send=20
them in few minutes.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart3967630.DzeFdH85js
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEUEABECAAYFAlkxhs8ACgkQi/DJPQPkQ1Jj0gCgy45pMnGjP6xjRmZmiooTD3yU
K88Al2d7U8Wl1tVPsGQ9qxr4LZvH3pU=
=Q//M
-----END PGP SIGNATURE-----

--nextPart3967630.DzeFdH85js--
