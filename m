Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SCB1T-0003yX-02
 for linux-mtd@lists.infradead.org; Mon, 26 Mar 2012 14:35:55 +0000
Message-ID: <1332772726.22278.34.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: ixp4xx: fix partition parser argument
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Micha=C5=82_Wr=C3=B3bel?= <michal.wrobel@flytronic.pl>
Date: Mon, 26 Mar 2012 17:38:46 +0300
In-Reply-To: <20120326133735.GA19800@FLYC077.flytronic.local>
References: <20120326133735.GA19800@FLYC077.flytronic.local>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-YJ4rTqd4b8t+Ez2dNRoO"
Mime-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-YJ4rTqd4b8t+Ez2dNRoO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-03-26 at 15:37 +0200, Micha=C5=82 Wr=C3=B3bel wrote:
> Commit c7975330154af17aecc167b33ca866b6b3d98918 ("mtd: abstract last MTD
> partition parser argument") moved the "origin" argument into struct
> mtd_part_parser_data, but didn't update its only user: ixp4xx.c.
>=20
> Signed-off-by: Micha=C5=82 Wr=C3=B3bel <michal.wrobel@flytronic.pl>
> Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> ---
>  drivers/mtd/maps/ixp4xx.c |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)

Thanks, but we already have a fix scheduled in the l2-mtd.git tree:

http://git.infradead.org/users/dedekind/l2-mtd.git/commit/87cd5901e82658b49=
357f41d27b0acbe454b1a3f

--=20
Best Regards,
Artem Bityutskiy

--=-YJ4rTqd4b8t+Ez2dNRoO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPcH93AAoJECmIfjd9wqK0KmYQAK4yNhVlI2/OuPKOBaJqTwN+
MPZozhDn9EUtWkrr4LXDUy+ghPhK90HFM1+NKrhTLuvb6oOyn9MaKttHUbES0UK0
uTx8EijBxVz5c55sy9QhUqn3Ax8iCtN43oLwJ3d+wV9rTXDNly4ziO/Jy7uH4NCx
7JGOdU92qKcE+k+fMIdHLToICWJQuNWRTgOfGg/J7SMFjEA2Jonz/gSd6G0kdZuS
nDc/UtUgGCZ90Q7RZavvQwwgxFD4JoDcSZqFX03B4TebU2mnjIJQjQNhDrGc8aEV
4QsaaKNRlnOcEh6BlIWpsZfhYQM94K2qBfYyIyLEdnvbL8UsgToUsd6rCOvfXTc7
A7w3nLKvq+kOHTzAYBUiQiHouM+Cm9zco85EjbyYv8F2y0wqWasDKwWyEdq5LSAR
1LTaL6AGM2R95uBWofUoF8N0OM27goCjAB4L/NOgQy8kbg1f2RzzW/knMrRn6sa/
DMjyd2oF1KiDeScJ3eAbfEbF74VbwWuZlf4A7MsfFn/cqQMx05HskX00NStWyf2M
npPpT0ubQDLzA2AC7YuQ7wqSdbk0euu0j1XG8EUxR1SPaNauSYV2SsPzdscBvPo8
p3R7FoKxkf9CG91cQ3awXhBLTHdDLn57jEEsWSIFVgsrOQB0rpYddU77fPBXHzjd
OPMxv/WHoIKkSw+85BcC
=ysLn
-----END PGP SIGNATURE-----

--=-YJ4rTqd4b8t+Ez2dNRoO--
