Message-ID: <1335614459.1937.13.camel@koala>
Subject: Re: [PATCH v2 0/3] add gpmi-nand dt support for mx6q and mx28
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Sat, 28 Apr 2012 15:00:59 +0300
In-Reply-To: <1335323184-11233-1-git-send-email-b32955@freescale.com>
References: <1335323184-11233-1-git-send-email-b32955@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-MIkSp/SDtMYGp4+ebonq"
Mime-Version: 1.0
Cc: shawn.guo@linaro.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-MIkSp/SDtMYGp4+ebonq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-04-25 at 11:06 +0800, Huang Shijie wrote:
> The mx6q-arm2 and imx28evk have already support the device tree now.
> So i decide to add the gpmi-nand dt support to them.
>=20
> The mx23 does not support the device tree now. I will add the gpmi dt sup=
port
> when it is ready.

I cannot apply these patches to l2-mtd.git:

Applying: ARM: mx28: add gpmi-nand dt support
error: arch/arm/boot/dts/imx28-evk.dts: does not exist in index
error: arch/arm/boot/dts/imx28.dtsi: does not exist in index

--=20
Best Regards,
Artem Bityutskiy

--=-MIkSp/SDtMYGp4+ebonq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPm9v7AAoJECmIfjd9wqK07RkQAKG/Vfx8iEogacPM+Xeolqmh
MVVs5361kA4auTABZjJH1T3cMT8H+pbaa8MsRpaSKLMEDE5uvIDWVgyWN+W0XHyc
eXsC5UAhn3B75voowKH6XrHr+M339JiZ2c3QIRO6COQBeoOVdkVQoe/BNVJSIVnK
TgY9rLQh7xQoNjqnyDbsJPeQuE/55+Y3JX8W2/0PQGIGP6qOgpL5j4Fsdp6jfqbh
a9RUVzRN/Kr6kcDhQqMUCcL+SUGKuaK8fXlC25gAVEFLdLodVYOJoX3tdgncQMO9
6AdbZEpNUY/BeR9cEf1MLu+Vd7vup8XgsPf4fasuSHpxqZ98+oVzaWejt9Flzlj1
O0aAnfuceG6nDi0De8XT7M6ynbvix7YA3cvmCjQRLSCy1y+l3049FmWlkgmx3/mg
EomphmviTe4CSQujr964/bphmPqebDK3c/mpibeVlVB5LUyxNt+GLU1YGWqzL/40
CnLgEyK35D247iv6hN8y470xK26rPVFF+rUT8Qo3LUBU+z9qcOZnzoYOVWI9bUMH
pz8zKm+RhLsg5wnUn+NzKa2SVABta9I7cMg4CteUhUmf3+j8OBYQ7bQCGPakHA5Q
vGCFsJvQY/C1jswNADJHOe+7JoA2+9XF0WBxIUXO5Nf5C6e5aObB9+mObUJDAXI9
pO6TyBRdl3j2BGgnN75w
=mBR+
-----END PGP SIGNATURE-----

--=-MIkSp/SDtMYGp4+ebonq--
