Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TeOF4-0005jb-Sn
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2012 10:54:47 +0000
Message-ID: <1354272933.30168.82.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] mtd: remove the de-select chip code in
 nand_release_device()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Fri, 30 Nov 2012 12:55:33 +0200
In-Reply-To: <1353307410-17529-1-git-send-email-b32955@freescale.com>
References: <1353307410-17529-1-git-send-email-b32955@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-fhJZpuAOVXEK50RqjGXd"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-fhJZpuAOVXEK50RqjGXd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-11-19 at 14:43 +0800, Huang Shijie wrote:
> The nand_get_device() does not select the chip, but nand_release_device()
> does de-select the chip. It is really strange.
>=20
> With the current code, nand_sync() will de-select the chip, even if the c=
hip
> has never been selected.
>=20
> To make the balance of select/de-select chip, it's better to remove the
> de-select chip code in nand_release_device() which makes the code more
> clear.
>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-fhJZpuAOVXEK50RqjGXd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQuJClAAoJECmIfjd9wqK0OtUP/3VSsv4m61DPLEC0qx2zLZ7d
Ou8Z5frkIkFoVg1+JWEV/A7I3sYkdQq7P64/aI5nLzhL2i22NgVdUWE3wHcXB4VE
M/Dplc1qWB5FDoKHEBu0sLqZq42eiVVDHeJjBAeDRZPv8QyiKmlU1ZKm856qJbeh
olhNsDhmL8GdnvNk5MBSsxxQEFOX3mWKzLbqKQNJSHjlxSQIWZbNvbsXCNW9yFcU
fo7vDJyuGv1hIJSjbFkUYCakFzQd5kv1cNSe4+v+tg7KZhm3HvWkKebGUiqhwme7
zqmpZVN0ovlfKhgrIczwChYkeWy3scFsMCFVy2ZE1BLxKQDkWF7KJlGwJlcNF2iU
wY+IAQbRP9Y7Kmtao5juvj/Mo2/6SrhXdbMVG52ZQeiBBSy9bqEKP8gEQiQHYoFa
ph0ztdaJVxDyYnGe2cP7cM0vwp84VP89ebezMaDpsGT2PMCKbS1cqjzL9BBhjHnb
Eh0P605ngSBhZ1QSvowsLh6wc74jdpAsVBJa5hY1oDrojzzZo2TDUkX9fgZ+DRbT
hIrNwEUclisRRM0AZ/7ivuIO55weX2yF0B8BLKPDreb0qP7Vk3cARO/Wa5ZWgcoW
GlaKl46TLrmbHnGiGIH2kkLVj/fcqVK+DWmdQdCBg89LRMiLOBorveBTjpnUnr+h
tVYr7zZhdqoraK3TO8lj
=9KdR
-----END PGP SIGNATURE-----

--=-fhJZpuAOVXEK50RqjGXd--
