Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SbuGw-00077p-6U
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2012 13:58:10 +0000
Message-ID: <1338904913.2507.60.camel@sauron.fi.intel.com>
Subject: Re: ubi: fastmap: v7: ubi_update_fastmap failure
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Tue, 05 Jun 2012 17:01:53 +0300
In-Reply-To: <4FCE0E81.9000705@nod.at>
References: <20120605164142.02d9e235@pixies.home.jungo.com>
 <4FCE0E81.9000705@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-EQ8CUdl0Y968fdNxrKRE"
Mime-Version: 1.0
Cc: adrian.hunter@intel.com, Heinz.Egger@linutronix.de,
 linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 tglx@linutronix.de, tim.bird@am.sony.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-EQ8CUdl0Y968fdNxrKRE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-06-05 at 15:49 +0200, Richard Weinberger wrote:
> Please use v7+.
> It looks like you need:
> [PATCH 01/23] UBI: Fastmap: Fix EC overflow calculation

Just pushed that to linux-ubi.git / fastmap.

--=20
Best Regards,
Artem Bityutskiy

--=-EQ8CUdl0Y968fdNxrKRE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPzhFRAAoJECmIfjd9wqK0WDIP/10C5vnwu7QaG8pYVVjEmh/l
QGRfbJszOwbGO4ccYb4YsLQVqUTkVtjQ+fSkS0qXENUw7apVF14oasWp1pgY+57S
r9+VUvjP3yFwfxkVXHkqcOGNNFz8NDSTwNrqIo+TSErKLW7Wn4uMD/RD717ZUzCG
p30dYxyhSvQLVaMpiKkXWT6zM2WcJTjfZGMvU/7EBS0Mh48dn9CZhOVW57XTjCwG
Uqk0hMFLQ0T9ZZoipdDJabO0X6YwVOef/Rb/PyPi6QMSM+vtcNuF35Isw+gwKBut
tUYPJsS1zP0r79IugoaYn7TZ76yIlxJ2tn04kxUgXgz45Fq8iu84Xqijckm8ycXj
b+6WWpigeltbTx/qf5Ic/7oSJqhQwZ2bLwdc6kgf1py/zAs8TGKQTYGlyiqphfJY
69NPMVKjhvILtSVrQuacz1RE7UbMa+opfIhaT41MWxuQpX45P4M2FTWqwpZwIbK2
pRBnypCcZ9pAEW+AWqIJF7alhihb3rHQmnVSjJwlSsqckulN1h5XcW1G3fji7LJe
pwKemxq3hsDpvTTzA9tYDwmQLbzk45mNkP2mrY5oh77JUlZrFeMnCkG7iuvBALzt
Tx+VnKMGT5Rjk5nT/8avx6NcUdeI5E/jbcrXW3FIsiqKVV2GcebGRYkwCN933zSU
lZxMEeO2g6cgJGDld3Ni
=Urcu
-----END PGP SIGNATURE-----

--=-EQ8CUdl0Y968fdNxrKRE--
