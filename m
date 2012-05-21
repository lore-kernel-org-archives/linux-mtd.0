Message-ID: <1337587991.2483.65.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] GPMI-NAND: Define ecc.strength
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marek Vasut <marex@denx.de>
Date: Mon, 21 May 2012 11:13:11 +0300
In-Reply-To: <1337571865-8016-1-git-send-email-marex@denx.de>
References: <1337571865-8016-1-git-send-email-marex@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-8qxEtcgMNK+ixo/eG8j6"
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


--=-8qxEtcgMNK+ixo/eG8j6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-05-21 at 05:44 +0200, Marek Vasut wrote:
> The ecc.strength wasn't set, resulting in the following crash:

How about ccing -stable? Can you find out which commit broke the driver?

--=20
Best Regards,
Artem Bityutskiy

--=-8qxEtcgMNK+ixo/eG8j6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPufkXAAoJECmIfjd9wqK0V30QALAFiuSILqyUGg4q97QUSAqH
5R9Ng9TgqCzlFs5DRMynEshIJwnOieq61cFDMlfGlXmFNYfqneXY0D+pGZJ0LqAd
Va6qWQ/WKu+yK0GPUzZI+vHCkoh8zFalY2VcJ5EnzwtX7jw8ewlN/5R66+FgWeX7
KTqVgPNyesVNX6LxwwlIbWdfqPY2R0+opPOU4r6FycCaFsLb2bkNTBP5LRoWvqUy
mqGtnTrOVLOrYeOTMCqRNyNFolZvHZUp+cUrsfit+v8VKyOKM7cvrnsZitsI9bIo
g7z/7qyimoCKNhA3Gc/XNYiVfQ/QkUVw3HEPC/wUEF5fzn9zuXTnldJOP3EKT3Jx
zILyxM9LKaM7UFYt3DrIN7Ka26K/MB8GtJg0ZYMiAEJUFiRWO3eJUlcSCkmlWiER
4mY9ffZysJGRPpQO6p8rM00G0nyCMHDNuQ4yHhTNokvO6iK7kzQUMa7qATxJOE1+
cy/ew4BXHGvVcBRnGDeRmAAgMQJ5AVaznymzvZICc/UNEkrzhy0polnCX/lwQ+23
fC4Vbog27PpqYMU+/IkHjDYwXfkOH9weibYhUmsvR2T0D8TYsEd3huR3Pdr0w1GB
fn8/ELdemTWwJiG0uoyVA5u8w7I94tsa3S13+viDyVUjb71TDKUh9pC+hgfsAECF
OVN9ckaz5DXJ+cHf9TIJ
=dxv3
-----END PGP SIGNATURE-----

--=-8qxEtcgMNK+ixo/eG8j6--
