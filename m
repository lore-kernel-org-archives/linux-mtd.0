Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUHUg-0000g1-VR
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 13:08:52 +0000
Message-ID: <1337087537.2528.206.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: clean up uclinux.c map driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: gerg@snapgear.com
Date: Tue, 15 May 2012 16:12:17 +0300
In-Reply-To: <1337054928-16228-1-git-send-email-gerg@snapgear.com>
References: <1337054928-16228-1-git-send-email-gerg@snapgear.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-L6ad6bNnQyKRDfONIF9r"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Greg Ungerer <gerg@uclinux.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-L6ad6bNnQyKRDfONIF9r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-15 at 14:08 +1000, gerg@snapgear.com wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>=20
> Perform a number of cleanups on the uclinux.c map driver.
> No structural or semantic changes, only minor cleanups.
>=20
> . insert appropriate prefix into printk() calls
> . remove redundant "if" checks in the module exit code
> . remove unnecessary includes
> . make the struct uclinux_ram_map static
> . cast the virtual address calculations to keep them sparse clean
>=20
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Thanks, pushed all 3 patches to l2-mtd.git.

Side note: why do you Cc uclinux-dev@uclinux.org if it is closed mailing
list. Why do you need to make people replying you see rejects from the
mailing list?

--=20
Best Regards,
Artem Bityutskiy

--=-L6ad6bNnQyKRDfONIF9r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPslYxAAoJECmIfjd9wqK0KFMP/1J4vCAYdIGEcGf55N0Lenx8
3+0ZcElm+52b8YX5uY7ZEaUn/euWJJU4BLLAwMnBdVSA/ZxusWkpH4v+XdFeaj1q
MMvoH0zBqNqP3Sha/YPDK5WrZnHhR4oSIDAYuBxLulT0JMOy9xAK7dpZO7QuJtcS
c/9qw12P9d+kVFUSYMxhN6GyV0mTHJtX2xdw6ff39iSEMHHvZIUPwO5qneef0G1i
huAYGyS2SHYoZzo2Nivcm72We91/Y1r19DMXKZxFgegxCZk7BtAyZE2DkTp2PCdW
64uxX8PDAr9y8VyG9LdjjdpgG5YMSqCNzM7mUUoCtf7oUJ/uYzo0s9OVWVirCc2f
eFyW6xrbqyM9xGzBNrlOjvvD6UB/k5z95hbVKfFfBRFeE8YkcZ1hMSWHdzCJIKqc
YITBqvlIwNRmfSpKTxjC/+Os14uFp+CGEh74gLYsDEcRC4qe/Rnaed3+yEyAv5AF
Ea1Sjg8/6KJL1A1fDd6vn42TzCBzEuWsAFmz8DCwxlPY99SG+xcm+RFo1gfutVf/
klkZDJ9IOu/O88bRvrUOkvaWYqQYUChiVgmCfvH3TvmkXKXqwpFa7rAyyr+iMFug
W0UMenYyxhjo5ThBjs/UvmNGIixiHnGVh/M3fcjvhM/kYDhG5vQQi3peuGkd5nUX
4JaaTgjVzVYaoItl/hw7
=srJY
-----END PGP SIGNATURE-----

--=-L6ad6bNnQyKRDfONIF9r--
