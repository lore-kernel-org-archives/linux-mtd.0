Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TF3V1-0000AT-GJ
 for linux-mtd@lists.infradead.org; Fri, 21 Sep 2012 13:42:32 +0000
Message-ID: <1348234938.7964.1.camel@sauron.fi.intel.com>
Subject: Re: Fwd: [PATCH 1/1] drivers/mtd/devices/m25p80.c: Fix whole device
 erase
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?ISO-8859-1?Q?C=E9dric?= Cano <ccano@interfaceconcept.com>
Date: Fri, 21 Sep 2012 16:42:18 +0300
In-Reply-To: <505C6017.8060607@ic.fr>
References: <5045BCA9.5040401@ic.fr> <505C6017.8060607@ic.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-jubedpsoj64m7pX+4xEl"
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


--=-jubedpsoj64m7pX+4xEl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-09-21 at 14:39 +0200, C=C3=A9dric Cano wrote:
> From: C=C3=A9dric Cano<ccano@interfaceconcept.com>
>=20
> When the whole SPI Flash is erased, the chip erase command is sent to the
> device without waiting for end of erase. So next read/write accesses are
> in failure.

Can you wait while the chip erase to finish?

> This patch removes chip erase to use only sector per sector erase for
> whole Flash too. When chip erase is done, Flash can be accessed without
> error.

How much slower is this method?

--=20
Best Regards,
Artem Bityutskiy

--=-jubedpsoj64m7pX+4xEl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQXG66AAoJECmIfjd9wqK0tWcP/370pmzfokVib0v81pz3ttdz
GWrZu14HiY/uN7q1dGL1VK0UYRpaZQrFw/sFsTvQIzeydiec7MuPJoMtC0UGHxOX
sZCdCq1uJuVbT3aJzVLqbEFHuH4pK22BrM3feHyP1xMnoDY0tKp1WXB5KjkLRKhw
SPM3xB0xTEqHg6F1DGeXEiX/nwL0q6PuKUr1vGQfA3tLQJzIh35O6FP/l6RFn3cr
qfO5Dogr+zBpAEOEtgp8iMivF9sF/X73uQ4iZQAQhdJ9UP+JD5capuAl0zHQL/99
gMYjZpY/go1iofWlXuQ2AnRX3XnUrgBz2Ff62mxATej/XDAwO3Zd5isiC5kkBIGQ
0yRco8kwaNj++ymK61IC9v3K8pLiyLLSynUJ7VW+w29K0HGuV1ViBqDLdD8bwKn9
I0Xpbq33DVMs5ZnUR6koxs16pfRvVv1ptdJI7j1fE0UxFtcdZwxg4FHzSjvvFORw
vp7cjhgCopBjBF/cH/D66VNAbLJ5I5yF7kdaq2n6lZSzTWBgXRUb1RH6U8Y+D38A
55cEl+ywPMaue3aemhuVbBKeo12alrgRJsyFKs87lt76nRcnEQHmoVVvmdCIT9ap
uKbwJyRVOHkM8Ya4jbaPlk1Uhhp7IejeaiuxogK0u4/DxEGwxGh/fctVL+y8zpmM
J0e2P75QAEkTgnimxNxe
=VfUx
-----END PGP SIGNATURE-----

--=-jubedpsoj64m7pX+4xEl--
