Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RbwDH-00089H-Ol
 for linux-mtd@lists.infradead.org; Sat, 17 Dec 2011 15:30:16 +0000
Received: by iadk27 with SMTP id k27so5568344iad.36
 for <linux-mtd@lists.infradead.org>; Sat, 17 Dec 2011 07:30:14 -0800 (PST)
Message-ID: <1324135902.4240.46.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] plat_ram: call mtd_device_register only if partition
 data exists
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ilya Yanok <yanok@emcraft.com>
Date: Sat, 17 Dec 2011 17:31:42 +0200
In-Reply-To: <1323733076-6301-1-git-send-email-yanok@emcraft.com>
References: <1323733076-6301-1-git-send-email-yanok@emcraft.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-a9xW0n8rKtRch0ot4jqO"
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


--=-a9xW0n8rKtRch0ot4jqO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-12-13 at 00:37 +0100, Ilya Yanok wrote:
> mtd_device_parse_register() registers the device as a whole if no
> partition data is passed so there is no reason to call
> mtd_device_register() after that.
>=20
> Signed-off-by: Ilya Yanok <yanok@emcraft.com>

This seems to be a bug-fix, right? What happens without this patch?
We end up with 2 MTD equivalent MTD devices?

--=20
Best Regards,
Artem Bityutskiy

--=-a9xW0n8rKtRch0ot4jqO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO7LXfAAoJECmIfjd9wqK0eWkQALaAFrLguDchkquMi5uDEoIy
UGPBrfzfefTzqIhKtirv2s+IuT3pFuohKSR3NgtdMDK40W8lE2P1kLZdcAe+RdlZ
l92OBi3XvTQyLwGxN6SCAPAHiAhc5euXicFUGm+9+GFNSx7tIvU1hjSor4k0pmsi
7ZN14WRo71v/vny1po2JK1gEKIJ0yhdIjVDsZXLaPbXqvLwEeCwD3fBHL5j/cliB
RgaYRmlU64Dm/KxZQQiv1ZXbmalGUXCwsmvK7W1/PT6OTyLwjBHfL4lZfBX8E4VO
BWyBjesSP1GJcr4F+RFainzy4OyQyZACj71NGHw5h6/Nf0OkEmT2xxZDZ8hOG5Tl
ka2mrZMmF0CAi0fLgCXbzesMZ8GKi0L4HP5qb7nTHR3lKVlw6NkFNQS+JsrnKdTa
w7DKPChtpKDzB9s+uVd3tFGCocT+9DJCw2X62RqvArqvVNNCbg7diEORregNHLdH
aGZ+aUkZtVbZzLR8zlmgHhFHj/4/yu0mgfItrd4iDGFiTxed6k1IX5G4KoNfhEgd
J+t9T8pq5K40baxIB8xru40fmpS8/d6FMkWv3i+lo+TLOsQABXus7RqvXm2hq/tM
60CoOMB4VpnpZiKYpOD6R9bscJBX7bGqlG7yhwezbXuVYZyjsB0JtvSBbRMtwwY7
yFW8dpX1LdpOeX/kajt6
=YGsV
-----END PGP SIGNATURE-----

--=-a9xW0n8rKtRch0ot4jqO--
