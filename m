Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Ti3eG-0000jO-Sd
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2012 13:43:58 +0000
Message-ID: <1355147097.2657.33.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: gpmi: Always report ECC stats and return max_bitflips
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Zach Sadecki <zsadecki@itwatchdogs.com>
Date: Mon, 10 Dec 2012 15:44:57 +0200
In-Reply-To: <50BD01F8.3040003@itwatchdogs.com>
References: <50BD01F8.3040003@itwatchdogs.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Bs1Wrqm7z36yA4bE9UWD"
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


--=-Bs1Wrqm7z36yA4bE9UWD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-12-03 at 13:48 -0600, Zach Sadecki wrote:
> Always report corrected and failed ECC stats back up to the MTD layer.  A=
lso
> return max_bitflips from read_page() as is expected from NAND drivers now=
.
>=20
> Signed-off-by: Zach Sadecki <zsadecki@itwatchdogs.com>

Could you please send a version which applies cleanly to the l2-mtd.git
tree? Thanks!

git://git.infradead.org/users/dedekind/l2-mtd.git

--=20
Best Regards,
Artem Bityutskiy

--=-Bs1Wrqm7z36yA4bE9UWD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQxedZAAoJECmIfjd9wqK018gP/RA6NhatMef39eFIqk3EfqU9
S2LRJMPvs7jU7kXNgYfdmh1ZzA3ERnRuW82ktRo41yOFm1a3WrpVNTyofM9qqo/N
D5xsyj7C/a34JAE4LW5HdtDbsfuqJBsHmWX+dDzs2nWK1fkWFAbJi/6lo7dYRTZX
Q1yrCEfmQpejUbIofVFzolTXClO96Wwhs5sAo4ynJ7jENdhKKkmF4EiZtDx1iPNC
IvD2lHfKK6WnwYl4dmePXIH8aFwC+ku+4+TEH3YYXv93v0lls82dRAJTMTf3e6/1
DBjEqYaq9gILwm86oJTzG74dtaVut9h1Nq/7MO8YS9ipH7S9qnSPqzZswyLmFgtq
pgyKX/wAkoML8Q2Sl72NeqbRJWDYGFIG1LCqr1KdQof2mAnu9sO14TrqzA4NO0bi
nTtGy9PibI0k3anqAsawHbiJhIeIc3Ub8odlIEFq/tzrn0RygF9lXy5qmGCqD0Z/
fz59gDMo4eTO9/3ZSMRDePTXvnRAVG9zKpnE8T1yJoPx0epkttr2Rz2kZfky/N/A
YJvbl+O54JOwFlpLgna0dUv7Ep/bcKjlCIUIGAcDLk6CM4H80I6awTkWoherFF/J
jIKMt+wJljcSNLFWQIO+r4naASjRWhxGIRwRzO6XugnHvrcYVhgTrkXDXpfabLo2
VoQ+PLgP/KUKqXG9Dn8S
=OVb7
-----END PGP SIGNATURE-----

--=-Bs1Wrqm7z36yA4bE9UWD--
