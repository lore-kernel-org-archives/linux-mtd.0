Received: from mail-wy0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RO7Ad-0002SB-OR
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2011 12:22:24 +0000
Received: by wyi11 with SMTP id 11so137390wyi.36
 for <linux-mtd@lists.infradead.org>; Wed, 09 Nov 2011 04:22:22 -0800 (PST)
Subject: Re: ubi on MLC nand flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Wed, 09 Nov 2011 14:22:32 +0200
In-Reply-To: <4EBA7C90.3050709@newsguy.com>
References: <4EB6A6A8.7010703@newsguy.com>
 <20111106173528.GA25467@parrot.com> <4EB6EDDE.7020603@newsguy.com>
 <1320788720.17770.43.camel@koala> <4EB9EDB7.7000600@newsguy.com>
 <1320828272.24797.26.camel@sauron.fi.intel.com>
 <4EBA7C90.3050709@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-A/HgxeR+Ce1Sj5yliyF+"
Message-ID: <1320841359.24797.29.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Cc: Ivan Djelic <ivan.djelic@parrot.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-A/HgxeR+Ce1Sj5yliyF+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2011-11-09 at 05:13 -0800, Mike Dunn wrote:
> On 11/09/2011 12:44 AM, Artem Bityutskiy wrote:
> >
> > Sounds good, send nice incremental patches :-)
> >
>=20
>=20
> Which git tree should I use?

I guess the l2-mtd-2.6.git tree since it contains the latest MTD work.
Although it is currently based on 3.2-rc1 which may be a bit unstable.
If this does not work, we can create something based on 3.1 release plus
the latest MTD patches for you, I suppose.

--=20
Best Regards,
Artem Bityutskiy

--=-A/HgxeR+Ce1Sj5yliyF+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJOunCIAAoJECmIfjd9wqK0MLAP/2vlCUF+uVQwF2mqtWKnF0dT
/uIE1CXb2sSkVfMUi8V57TjGiRH1gXxAAEVHZNqShJGpazPsVI8EmIIcX3zmtlnV
dJ+YGOXuOMCcjb4pCjNzbpRWWZ+oFVhtKb6CFKrUsrEXpmCFMgdIczSasVD9AxZH
xKPyaTUZQFRAARPYzyE8SdIYdU2HvOf2d3TDagzmtjiqnHB2DmHPI+K8nwNtVB/x
FhV/I9B48073A+wnZz/ZZ0/wut0XF9kVgnF0g3gyTLNFVg3+p0f7l/6PRQQilh0D
0ds2LVkAWUyumUKLoDrhZX4AiFWF6TDrF5gCNmaL4h+OdwKH8BggFHKKDAi4iI3x
BQ8Pb62VogQEuw/YiLtOjAlbhJ4wceLZaJIW9i4jmERKxIsYn+xQ1l4Q+hMWcb+H
myxksPhZiNcxMwMSipl4auVs3pmtFUMwfcfPt0vsiegqKXyolYOD5IYOgIy4rmeh
NO9kYKAHzyHCvKyYga9YXgmz8yUR7dUJAsnjxeWQdXqaIaQf2dg/WLUM5shwSak0
Wk1u/U4Av69eJadz7+kuAVQtSJfh4vzfvM/ZkRKCYBY6SrffhvuTEmWIHFEPkRZv
LmVd36AYx0g9XqdJ2g5JmFBQxxiKUNgFfEQBy6XhMJg2/vHl0+c38ac2qkImHHS4
/2t0yrb7X/J6f3ZN1Xlj
=vsLC
-----END PGP SIGNATURE-----

--=-A/HgxeR+Ce1Sj5yliyF+--
