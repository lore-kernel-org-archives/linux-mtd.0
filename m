Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLxSG-0004Kn-Id
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 14:40:13 +0000
Message-ID: <1349880023.20594.36.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: mtd_oobtest: printk -> pr_{info,err}
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, Vikram Narayanan
 <vikram186@gmail.com>
Date: Wed, 10 Oct 2012 17:40:23 +0300
In-Reply-To: <1348713422-16626-1-git-send-email-computersforpeace@gmail.com>
References: <1348713422-16626-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-7AY68KyztEbhghVc6+Z5"
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


--=-7AY68KyztEbhghVc6+Z5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-09-26 at 19:37 -0700, Brian Norris wrote:
> Use pr_info() and pr_err() while defining pr_fmt(). This saves a few
> characters, joins a few lines, and makes the code a little more readable
> (and grep-able).
>=20
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Not sure about this - there is a patch-set from Vikram Narayanan
<vikram186@gmail.com> (Subject: [RFC PATCH 0/8] mtd_tests: Remove
duplicate code and cleanups) which does this for all tests. I hoped he
can re-send newer version.

Also, this patch-set should probably merge all the split format strings
at the same time.

--=20
Best Regards,
Artem Bityutskiy

--=-7AY68KyztEbhghVc6+Z5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdYjXAAoJECmIfjd9wqK06+AP/14Fg3cqC4+E858AKDQCX2G7
bK0m2WCitYqKycaXAM4SFOG/B+gpFPaVLmfby0wPms82WErnwv49IL6h4kaiiJqN
KzUCxKelsmdG01lwkQ5q9i3l5AxlxNuppd/13cTvkMcR0Z+MiksnnYSz8lKS1R9o
XhYaj9av6GY8Y0FqscQjkdPYC+1LGWkdrWlaJ6CpPNVjKFGWLEzKx/5cIkLGGNlB
zRaViknF6ayJBqk2CZhr2cB2kvNg3Nf6ELKGGyz2htM4x/vbL4ZFI1xjJe8BESjj
hA5NMsKbhWyML4ZMFNphxg/X+56Jo3L0ndO8IpNtjWwN0MYMsfY8guDVuO6qBg2e
8f3Od2dnUl27bC0a49rY+S9Nz3kcah7rS7mPZGDHxEEekNTpfNMui9uhUrbPTCDj
8UNOu9Hz/bizp9cBKEaWlM9f1NMt2rkyBaaCYcLsEcyw5ka20qTQMehkupdO+RKX
rytevD3cK9yaz6p1qllZKme/anH5S+dduDJTKtMN7SVOaH52MrImHDMaA7+IqV2U
hkiP0OuF5DJKwswbcLpN44NegBjlkd/cr9CJt8gXq9HAI0GM0BR+SRNJJU2CFXly
9rst2S3WRcRttT32ZvK+0dUE9ScscCbygIbIqNnfsIBEk1kTgJCg3faATO91r9Qf
7AW662LF2jvKHtzkWyMI
=yUR3
-----END PGP SIGNATURE-----

--=-7AY68KyztEbhghVc6+Z5--
