Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TDxpq-0002T9-4F
 for linux-mtd@lists.infradead.org; Tue, 18 Sep 2012 13:27:30 +0000
Message-ID: <1347975164.7112.63.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V3] mtd: basic (read only) driver for BCMA serial flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Tue, 18 Sep 2012 16:32:44 +0300
In-Reply-To: <1347875449-19318-1-git-send-email-zajec5@gmail.com>
References: <1347875449-19318-1-git-send-email-zajec5@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-doQYOEFh9sIJ9c90nv9d"
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


--=-doQYOEFh9sIJ9c90nv9d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-09-17 at 11:50 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> This registers MTD driver for serial flash platform device. Right now it
> supports reading only, writing still has to be implemented.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
> V2: fix mem leak (add failure path in init)
>     signed-off-by
> V3: drop BROKEN
>     drop useless check in bcm47xxsflash_remove
>     marm flash memory as ROM (until we implement writing)

Aiaiai complained:

--- before_patching.log
+++ after_patching.log
@@ @@
+drivers/mtd/devices/bcm47xxsflash.c:30:30: warning: incorrect type in argu=
ment 1 (different address spaces) [sparse]
+drivers/mtd/devices/bcm47xxsflash.c:30:30:    expected void const volatile=
 [noderef] <asn:2>*mem [sparse]
+drivers/mtd/devices/bcm47xxsflash.c:30:30:    got unsigned char [usertype]=
 *src [sparse]
+drivers/mtd/devices/bcm47xxsflash.c:37:38: warning: incorrect type in argu=
ment 1 (different address spaces) [sparse]
+drivers/mtd/devices/bcm47xxsflash.c:37:38:    expected void const volatile=
 [noderef] <asn:2>*mem [sparse]
+drivers/mtd/devices/bcm47xxsflash.c:37:38:    got unsigned int [usertype] =
*<noident> [sparse]
+drivers/mtd/devices/bcm47xxsflash.c:43:30: warning: incorrect type in argu=
ment 1 (different address spaces) [sparse]
+drivers/mtd/devices/bcm47xxsflash.c:43:30:    expected void const volatile=
 [noderef] <asn:2>*mem [sparse]
+drivers/mtd/devices/bcm47xxsflash.c:43:30:    got unsigned char [usertype]=
 *[assigned] src [sparse]

I pushed your patch to l2-mtd.git with these changes:

diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm4=
7xxsflash.c
index f711a51..a328872 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -15,7 +15,7 @@ static int bcm47xxsflash_read(struct mtd_info *mtd, loff_=
t from, size_t len,
 {
        struct bcma_sflash *sflash =3D mtd->priv;
        size_t bytes_read =3D 0;
-       u8 *src =3D (u8 *)KSEG0ADDR(sflash->window + from);
+       __iomem u8 *src =3D (__iomem u8 *)KSEG0ADDR(sflash->window + from);
        int i;
        size_t unaligned_before, unaligned_after;
=20
@@ -34,7 +34,7 @@ static int bcm47xxsflash_read(struct mtd_info *mtd, loff_=
t from, size_t len,
        }
        for (i =3D from - unaligned_before; i < from + len - unaligned_afte=
r;
             i +=3D 4) {
-               *(u32 *)buf =3D readl((u32 *)src);
+               *(u32 *)buf =3D readl(src);
                buf +=3D 4;
                src +=3D 4;
                bytes_read +=3D 4;

--=20
Best Regards,
Artem Bityutskiy

--=-doQYOEFh9sIJ9c90nv9d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQWHf8AAoJECmIfjd9wqK0IEMQAListCi/dfaqbjM5vQfMLhRX
j73QAzISmyoFgYcb54XAOA7aMRTA7mRgmSty5ONw3t282YxMf4iDAdSkTkTzMuxz
N/4K7sRk/mNe5v6AdEksR2vrr9HyOUvhb9UhVk9UxoRbAKSDbvZFgGm+CRmu0qEa
ZBQkOvsmdxEFNuDek5QMyWBAAfbuDcoT3fYAVnyb6HuUyb7G3bNclv4aZfTXRQKs
EDqOyNtgP0jhNrUuvO1wbW1ilwm6khc9/KMbqwwhn+cr+CNNrwYNkolIflfblkhU
mnjal005JsAzvCwI7gy69c/OTEO3VL+5lC9epXzXhp8ex599dsJe6WkunGDvbq54
sr8ftTNRYG+R9NzERmLQ6Byd5gfceYhwzZ94X82aquM5tESHdpgCqyxm75gSIxhi
bUbQgCZGnFOV/xZ+O4I8waWmVTExr0rlTPahJ/K2Y4k2o/jgdpnXn41KKUq8Jpdm
QLwM0DQdsJliJecC1tAjs0JRgooKEoyhBJrAleQDbAcZlXEBui/0VR5GtAcyTYZX
M3szYJApCfsrsZ3j/EgFFAtkaDwk4iLaj7v7wgQfOVV43iatseChGfaxH/50U+ep
xvv+e4FXiuB8P5U1fc9JEbzDLQb+QrJo2/tM9PXLOQRsH/oCAY8lze0oZ/7ek42f
L3ggS6VQ96nTeZJ/7UEA
=UcZJ
-----END PGP SIGNATURE-----

--=-doQYOEFh9sIJ9c90nv9d--
