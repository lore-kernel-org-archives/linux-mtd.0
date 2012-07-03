Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sm2N9-0005yU-Ag
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2012 12:38:27 +0000
Message-ID: <1341319344.2979.62.camel@sauron.fi.intel.com>
Subject: Re: [Q] ubi->beb_rsvd_pebs calculations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Tue, 03 Jul 2012 15:42:24 +0300
In-Reply-To: <20120703153314.15948c90@pixies.home.jungo.com>
References: <20120701195230.0f141288@pixies.home.jungo.com>
 <1341312827.2979.53.camel@sauron.fi.intel.com>
 <20120703153314.15948c90@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-n1AxzTIXljcz0wGQ8tAl"
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


--=-n1AxzTIXljcz0wGQ8tAl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-07-03 at 15:33 +0300, Shmulik Ladkani wrote:
> However, the attempt refilling the 'beb_rsvd_pebs' after volume
> remove/shrink will still exist.

Ah, right, it is needed in case you had smaller %, but then changed the
config/attch option and increased it.

--=20
Best Regards,
Artem Bityutskiy

--=-n1AxzTIXljcz0wGQ8tAl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP8uiwAAoJECmIfjd9wqK067UP/102bBWglaE+yE2Ewht/ertv
osoVWNCr5tAvwN0qh69QIGZ1qeLOoCZPHpf8E9C5DSux57kv5H56Co5QwqZ04ZMU
8GFBvOqBFS23pKAisc+00FBbqhSHIl9QwWlWMg8zBVuIUZPNoxRzKiwNr0NKi18K
55DW0mvPAPziLNPnBh5FRy2MDH/6J2rwVpce6s1IoV0dUdNFDHuRptwIgnCfVLKu
e9X0LAy9qRyLS7ic8pPk5JR/Z2suJ4eA828ZICod4zQJ2+eWuw/Inz5l8Kxle9kI
YvURNSIhd/RWqDrYJaJv3VqkkwdxMQOFoVUq2fvezp8RH5vBywPI5iBcnA1DFTWw
eM9kMx/BAn0ThQydj5vaBwSJIrN1pABYspCcC6QheamSWr+A+TmR3AIx0KqJfawc
JQq3K/OBamOERGbOdQu6oGNxz2W0QwT9ukWrWs2tygWU6Qb3/K+UgLqaXazsVzXS
cHHZkyHsxP6a+51KWCUcAdYHXjMbLzTJjv/4/FVYSUCEZ4qTnxzEIrVLHVLQEFTh
O33DaseKlKPa3EN089NxiAVRaQROhaDMoQ3q/jb3VeIX2nh+8Z8ItFH2rr2pSrn0
aun/a3mcX6zydzE8xZEmptjle1LUlMWc8EXr5tUuT449p2URqsFjJVz2BqNMkUjg
uF0AS7a0KDcHe5zS8mCR
=P7ze
-----END PGP SIGNATURE-----

--=-n1AxzTIXljcz0wGQ8tAl--
