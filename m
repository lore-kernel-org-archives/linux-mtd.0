Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLxOI-0002N9-NA
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 14:36:07 +0000
Message-ID: <1349879778.20594.33.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: ofpart: Fix incorrect NULL check in
 parse_ofoldpart_partitions()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Date: Wed, 10 Oct 2012 17:36:18 +0300
In-Reply-To: <1348567033-5418-1-git-send-email-sachin.kamat@linaro.org>
References: <1348567033-5418-1-git-send-email-sachin.kamat@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-c7Rl3jxdihvmhSMtFvji"
Mime-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, patches@linaro.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-c7Rl3jxdihvmhSMtFvji
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-09-25 at 15:27 +0530, Sachin Kamat wrote:
> The pointer returned by kzalloc should be tested for NULL
> to avoid potential NULL pointer dereference later. Incorrect
> pointer was being tested for NULL. Bug introduced by commit fbcf62a3
> (mtd: physmap_of: move parse_obsolete_partitions to become separate
> parser).
> This patch fixes this bug.
>=20
> Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> Cc: Artem Bityutskiy <artem.bityutskiy@intel.com>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Added

Cc: stable@vger.kernel.org [3.2+]

and pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-c7Rl3jxdihvmhSMtFvji
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdYfiAAoJECmIfjd9wqK0accP/izKPcGCZjIXIMmBTV2rsc7l
4MSzlXd9fs/Fo6ZPSV1OudLsxB4R5j4G67dP7aK0xlVXMH8Q7Zs14XvGt5WMKhtU
iDcuqGgei1BV/EqJoMH2ktxNah3jZV0iuP6I0R/hhSZsQ1qp2cVpWBGlzDI7abu8
btRg4I53S4u2MaSdqANXkdceHYQczV/WOrv8eZ8pttnPOtug5BsbWhmVbNj3sQpJ
ofpHsXbwt4kIIS99DXpGb7/e56SXnStJ7gtHwUUBy3rUGbfXDRMy1go1PzTx4PEk
K4zmSpewzoCeGDNEa5OIaoaaE8vddrpG/ZIdrcrGhJFSDwIEyJ/oKvHUp/g6ov3I
ALFg6SPqxfsUSGxij8Ej0A3pwvlJR7XP3baCgO6ESKp2IWi/1RKGQtvkZoqc3cJx
EQEcJMyRIdP86U2RAfHNrvLcZ1rkBal13OYoevmy0ePaBp/mIBJvHGTnGfkQLJfk
9NR1X3yeIXb87Fb0R7VE144bZ0QTgqGfiDh12IBsmeqQvXHaI0ZB/VNbShVd3to1
au+AKkl9u288EtqvK/MsJboG4U/xjsvu3DPCaedTLnVr7gYsVjvifaYoAeNKPo4y
ezJE4reOV9dIgH7fCYl2VeMt7qUuAtqvM9VgSmFWgIHlJg9aW3zElGzxMMWYgyzZ
mJv2c0vLmIruV8L9Lx4O
=UjTK
-----END PGP SIGNATURE-----

--=-c7Rl3jxdihvmhSMtFvji--
