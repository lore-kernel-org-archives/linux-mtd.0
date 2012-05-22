Message-ID: <1337668383.2483.87.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V2] GPMI-NAND: Define ecc.strength
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marek Vasut <marex@denx.de>
Date: Tue, 22 May 2012 09:33:03 +0300
In-Reply-To: <1337633967-8387-1-git-send-email-marex@denx.de>
References: <1337633967-8387-1-git-send-email-marex@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-04siUU2sdMBrWxuAnyz4"
Mime-Version: 1.0
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Huang Shijie <b32955@freescale.com>, Shawn Guo <shawn.guo@linaro.org>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-04siUU2sdMBrWxuAnyz4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-05-21 at 22:59 +0200, Marek Vasut wrote:
> The ecc.strength wasn't set, resulting in the following crash:
> [    2.550000] kernel BUG at drivers/mtd/nand/nand_base.c:3347!
> [    2.550000] Internal error: Oops - BUG: 0 [#1] ARM

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-04siUU2sdMBrWxuAnyz4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPuzMfAAoJECmIfjd9wqK0Jb8P/jgBuulPlXJu0ESnLRboVjLl
TqWo+iHMkEZKzoa4xSKttG/WGzdnolxjUSHoBKdP92lm0u2rHW4l6ssIYhAY4/dU
ocg2eswNDBgEcf76MPhium8KgZXjheUtiuNnVNl0lLoDYnkZQ/zXat+OjPz2Z8uf
bL7OLfel2cVMAyWMvaDaxrH7zqLUulZcqKV94/ID7Ks9370+E10/EjeUNChJMi7H
v1T7P4eCOtFI6udUlMpuaIoqaQJxq/LBjunCrCfCEICCKL2l1mjPQElV/v9UDBjc
cNHU+r8Ph+f4T531EH6UmOyYV7bNGHnPT52WeIiu4czBOqtl+v88CMIlOmLAx6Rt
9nMosmh/Eyugzup5qUi2uWloFCY6ITaSGXDe1zKWBSS8t+GTT9IjwZZE0AZSaDKG
McUiCHws/JWQpTVnGv7VhV4lBZoPYFsZPW9JmJ+gdf+gOdyt/5TO7U6T0FrrZUZj
UT2AGCqY4fTBwjm/+uTfYkKpfXCHzEntFbNZg44U6d68R2cTfgoS9+jqds8WzYRJ
GqOXW84/Uwe5o995lj+sVGZX19tocMeG81esu47dcSQy/eQiv/FimOoA6w34F/+W
8SheWTy8H3y2mX7Oz2oNEGQjH0VIIH+FacOxnZE5O5Qt639irlRfKNice0Xb6Kmm
do0bO1Dj9kYVnmVR7+lO
=pvq6
-----END PGP SIGNATURE-----

--=-04siUU2sdMBrWxuAnyz4--
