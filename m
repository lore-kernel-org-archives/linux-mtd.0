Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SkWYp-00044o-N5
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 08:28:17 +0000
Message-ID: <1340958741.3070.133.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd-utils: Check mtdoffset is not larger than mtd.size
 in case of a bad block.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tomer Barletz <barletz@gmail.com>
Date: Fri, 29 Jun 2012 11:32:21 +0300
In-Reply-To: <4FEA2DC1.9090003@gmail.com>
References: <4FEA2DC1.9090003@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-N184S2a5MpleLTjD4eJU"
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


--=-N184S2a5MpleLTjD4eJU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-06-26 at 14:46 -0700, Tomer Barletz wrote:
> mtdoffset is being tested against mtd.size in the outer two loops, but=
=20
> the third nested one does not test against it.
> In case of a bad block we'll try to access an out of bounds offset in=20
> the next MEMGETBADBLOCK ioctl, which will fail with EINVAL.
> In case mtdoffset is indeed larger than the partition size, we need to=
=20
> bail, since there are not enough "good" blocks to complete the write.
>=20
> Signed-off-by: Tomer Barletz <barletz@gmail.com>

Pushed to mtd-utils, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-N184S2a5MpleLTjD4eJU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP7WgVAAoJECmIfjd9wqK0SfAQAIxAXgRXpdyWL0f71NNEMjcB
Q8LF9LUV/5Gqv1a5NlUYuKE5zYZJBvWnLCNPveBBHK8Y9IqGRx0fubSgjbynn0TX
hMmGL+R+zBKelBQU1VdALubvRJNggPoc76eSTItscr04INNFjMKJOhi8+WkYN/NC
CJRoeA5f/tQueXUXVpfw5npqMMKn+JXWJ1G39z6aWhSFb4qeUeTm843ng8KERoPb
lTD+vdKWCPIiX0cD9+DQ0CyAfk55BkGFsyGLHXqRH1TmUd2+NYTjcg9ShzlPjoiK
YyKtDZz75LNibvJfJ+mLoTfikOh5f7KCAVue+raX46ime94QM3CFbUvlnz8Cnz3b
2I9XaP3HYkr012ywRUi5l1WgFerYjdD+zPifWKsdNavcOw2YBwoSWhR85EKVGkaQ
fip2vb21o4/oLaWY172hNywQhKlmypNIQOHz5U9IuF4LNqiWz9Q0BrFjdi0XUULB
RnLXHaY/dG8592XkIFcnQxbSmSccBMUrGTV4Iw4D1y3We1XOaUl75sz9yBH7RcD2
vug7w0nLdhQmXM/HcnTnWfafz6AM3eEwF2HPASisn7S21Jo4ZIVCSj+IFGhyjibl
5RLWSqeg4QQTcoGO8InkENB+0ttWmK7dv93go59GjO4gDA2ngj8kugtTJIaednj4
P9WdquzCTH4QEXxqcLUq
=u8w8
-----END PGP SIGNATURE-----

--=-N184S2a5MpleLTjD4eJU--
