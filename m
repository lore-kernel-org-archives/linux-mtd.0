Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Ti4Yh-0003vE-Ei
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2012 14:42:16 +0000
Message-ID: <1355150594.2657.34.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] nandsim: Introduce debugfs infrastructure
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Mon, 10 Dec 2012 16:43:14 +0200
In-Reply-To: <1354541500-436-1-git-send-email-elezegarcia@gmail.com>
References: <1354541500-436-1-git-send-email-elezegarcia@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-AWjfILSrpzrhXUPa/wx3"
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


--=-AWjfILSrpzrhXUPa/wx3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-12-03 at 10:31 -0300, Ezequiel Garcia wrote:
> It's more user friendly to report debug information and statistics
> through debugfs, than to use printing facilites.
>=20
> This patch introduces a very minimal debugfs infrastructure
> and moves eraseblock wear report to an entry located at:
>=20
> /sys/kernel/debug/nandsim/wear_report
>=20
> This means we can remove rptwear option and just let
> the user get the wear report when we needs to.

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-AWjfILSrpzrhXUPa/wx3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQxfUCAAoJECmIfjd9wqK0D/gP/AwYb5gYPYgdnB0hHX7ajgKA
SQPe6p/HAor8H8QGqwRtJK78nFhkou9oDcZxPsYXTI/0oUK493JalbDOhzctHdd6
ZVhUbLerpcemd939aHWGzxMCZ9YHDVB0s9FoJV/5XeD4xbP0jSRCIQfzvM6nXvvL
j7NMi72FqIHZpiKg46nJI+o5gjDQfPrYUT+JkgdDIa/GI0sR9IJxBmvneMpJGweP
nyMqhF5+hXlLbxbsRCoWUnfeZLb+soYdNZWmbzBDKKR0LRkgfSwn24HIvPgvwxpL
kUIsln0GyOCOLFnb0BZs3CfrY+Z84d0GsoeDdJozUNLEH6YGIYIvtlZII9WSg8EC
R4rCC0t2JpHX6yG1IP3sJeX/SAmKlGM2AXNGL26Vb18+Sjnd/+eCmJ2rvc9kaHhd
gqboDw1FHb3FnizaQp6fQnxOCqh0ms3o6TBddkxkYjwS2NSZFr0oUcIMLj5jledR
p6sgowTasr1gD9oGBFXqXRxU8T4VEK4/VPOVkIDqdJx5JujnZnFuOFGjfY2wOhSi
gPaGKcKTGVl3DM2apHi0KDdOcFBbTJgBQkNG9zqH5hSBf1f7FXVYg/SmUkw49AZp
KKXeIRRKF+76VKlWmyRn6vEpJtFwPoaoWM2bnEfFTYPsDCaQHot5YyQgOKRfi7lN
rZ8/BIK3r8GsQDhamp9K
=5RTu
-----END PGP SIGNATURE-----

--=-AWjfILSrpzrhXUPa/wx3--
