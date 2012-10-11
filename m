Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TMGqi-0002w8-Fm
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2012 11:22:44 +0000
Message-ID: <1349954577.12014.13.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] [MTD] MTD driver for LPDDR2-NVM PCM memories
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
Date: Thu, 11 Oct 2012 14:22:57 +0300
In-Reply-To: <1349385434-3073-1-git-send-email-valibert@micron.com>
References: <1349385434-3073-1-git-send-email-valibert@micron.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-iW21Di2uYVIGQNRIIf5K"
Mime-Version: 1.0
Cc: arnd@arndb.de, lporzio@micron.com, linux-mtd@lists.infradead.org,
 valibert@micron.com, svenkatr@ti.com, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-iW21Di2uYVIGQNRIIf5K
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-10-04 at 23:17 +0200, Vincenzo Aliberti wrote:
> Dear All,
>     continuing Micron support activity on PCM memories you can find here-=
below a=20
> patch containing MTD driver for LPDDR2-NVM memories as demoed during Q2 L=
inaro=20
> Connect in Hong Kong.
>=20
> Let me thank TI Panda open source team for support on platform enablement=
=20
> activity and Arnd for his first feedback on driver implementation

include/mtd/mtd-abi.h file does not longer exist, please re-base your
driver. Could you please also feed it to the checkpatch.pl tool and fix
style issues?

> +		pr_alert(
> +		"lpddr2_nvm_probe: Failed to allocate memory for map\n");

Just join this into 1 line. It is OK to have lines longer than 80
sybmols if you print a string.

Do this for all other similar places please.

--=20
Best Regards,
Artem Bityutskiy

--=-iW21Di2uYVIGQNRIIf5K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdqwRAAoJECmIfjd9wqK0myUP/3mlk8nMrllyb9M0hfaB9ia2
cFxhrfXAMm73muVd9m/ymULMyMX07/av0IisldJpuL382xQSmWkuy4unluZ9TmTk
66vTLUtFqzuMWOVJXdqf+lsZkxXFsuGGlfCNskQ2eADnoZ76Ge6PUVZfo1Ws15lO
PT1r664vyqUUFzxdUbWbxdy9/7PS9bUullJhw36r4m0FZXuKrE+OTYIJoxFeYMeN
zof69URi+Uz60QFV4qr/aJ2oAY+smFwNUHSfHz4ALR1D8RBX935uYkz9MKl6/dhv
Ywd3nK/XzJy+FIiW1oNoFyqo0L0I6ynV6DWdMIQMqaGsuHV3NQjxBOyQg4IScnO9
6c9cGDq/7DBVR9q5zA/TLd8+bu7MKX8+WmU+eSru3J/lqbmEQ8keuRE+OVB2rqxu
+LwrKaMOWOY8amadYxjm1SwgVUtTwQ5zZwGMOmbfQw+LGlVjNp26bf+nzzVZdK3Y
GzCSNcakg1hCjNigf4ITTcN30YImHd+1afsbq8dSU8X9id77hhlHpGAsqpJ2aR2m
jDE8rwIpUTRjimC4WmVLVIoPikgA6wFMGYqw6qggAx4Vhlo8KBYjyqMhxQTGCz/G
lUTMyKBeCM7vhFSHZqxS2y6hSLej3F++d06sjY+MVq25H5TuZxnjkTFmJ+8MwBRu
KpyVaG6+rgKIxhelxHK4
=G6VZ
-----END PGP SIGNATURE-----

--=-iW21Di2uYVIGQNRIIf5K--
