Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TF32D-0005Vb-4m
 for linux-mtd@lists.infradead.org; Fri, 21 Sep 2012 13:12:45 +0000
Message-ID: <1348233151.7550.0.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: m25p80: Disable 4K erase for s25sl032p, s25sl064p
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Marek Vasut <marex@denx.de>
Date: Fri, 21 Sep 2012 16:12:31 +0300
In-Reply-To: <1346729496-3303-1-git-send-email-marex@denx.de>
References: <1346729496-3303-1-git-send-email-marex@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-QFQrdhP35tjkAxgIt6a1"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <david.woodhouse@intel.com>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-QFQrdhP35tjkAxgIt6a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-09-04 at 05:31 +0200, Marek Vasut wrote:
> Quoting from the datasheet for S25FL064P, rev. 05, Nov 18 2011,
> section 9.17:
>=20
> A 64 kB sector erase (D8h) command issued on 4 kB or 8 kB erase
> sectors will erase all sectors in the specified 64 kB region.
> However, please note that a 4 kB sector erase (20h) or 8 kB
> sector erase (40h) command will not work on a 64 kB sector.
>=20
> Refering further to Table 8.1 and Table 8.2, it is clearly seen
> that most of the sectors are 64kB, therefore disable this 4K
> erase support since it's valid only on first/last sectors.

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-QFQrdhP35tjkAxgIt6a1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQXGe/AAoJECmIfjd9wqK0+DwP/RMIMWX07AKDqRBa5hq3hJbj
xgE9fu7/OESBJGF/2wHW9OdK37a9N+uk0hOe6LwyMWu0qYqQ+oMkxhgNd9+GpR6A
NJOGbrVz+ObeMTkwhZf//Z1SZNndaQslnBkQrlPdEU1cGJh4mGIlCNHNKMe2Laue
FwxUeblFuXl+mnnI/JvlGitzqttOdnEqT24Y0hZVuz7aQDu9yZVasLwYc29EYb7o
L3G77Vzvz607GFYBnNVr/m/jYKVaFKTg/1z3ahROxQj6tZhaJO5TYwZScUEDwDya
jFTKdONzLEoQ8D+kb9MFls0+X4geqi9E0lhoA39nkMQ0fE6+e81MFjINfohgIBsM
pGkgdchenyDTLjtlomViHbHRk1PZuYet52lpASbMyhg331QJBhzCp7l4bSXLB6he
hq34Fm/x68V0AhGYlZjJtoauPEgRQHkGicAOo5GhyPYJwXPMDfZqH/AiBvg51J7n
0yoTIZimhwKgYGzMY75rdMta1+i8UStUatpELMoQ5d5N6SZvAYxdqP+VxqPtmUXU
pQlcaGpQAa/ZNJY4Sjk1Spr4HKXWaru75EsAdk1KofPri9KuxWQjQ75YQowHMAAt
E3O+G83iZOopZaeYQUf5yQKOXl2RdiV40aSXwcqC4W7rUwOmNN7hPtchVRjMBXF/
Hlaeses0qWJDYFFDFzvK
=ThjC
-----END PGP SIGNATURE-----

--=-QFQrdhP35tjkAxgIt6a1--
