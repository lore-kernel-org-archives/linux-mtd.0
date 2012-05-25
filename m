Message-ID: <1337957902.30969.46.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] mtd mxc_nand: use 32bit copy functions
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Date: Fri, 25 May 2012 17:58:22 +0300
In-Reply-To: <1337955762-19157-1-git-send-email-s.hauer@pengutronix.de>
References: <1337955762-19157-1-git-send-email-s.hauer@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ltFIaKORGdhFNZeM/lkh"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ltFIaKORGdhFNZeM/lkh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-25 at 16:22 +0200, Sascha Hauer wrote:
> The following commit changes the function used to copy from/to
> the hardware buffer to memcpy_[from|to]io. This does not work
> since the hardware cannot handle the byte accesses used by these
> functions. Instead of reverting this patch introduce 32bit
> correspondents of these functions.

Could you please take a look at the checkpatch.pl updates?

WARNING:LONG_LINE: line over 80 characters
#103: FILE: drivers/mtd/nand/mxc_nand.c:276:
+static void memcpy32_fromio(void *trg, const volatile void __iomem  *src, =
size_t size)

WARNING:VOLATILE: Use of volatile is usually wrong: see Documentation/volat=
ile-considered-harmful.txt
#103: FILE: drivers/mtd/nand/mxc_nand.c:276:
+static void memcpy32_fromio(void *trg, const volatile void __iomem  *src, =
size_t size)

WARNING:VOLATILE: Use of volatile is usually wrong: see Documentation/volat=
ile-considered-harmful.txt
#107: FILE: drivers/mtd/nand/mxc_nand.c:280:
+       const volatile u32 *s =3D src;

WARNING:VOLATILE: Use of volatile is usually wrong: see Documentation/volat=
ile-considered-harmful.txt
#113: FILE: drivers/mtd/nand/mxc_nand.c:286:
+static void memcpy32_toio(volatile void __iomem *trg, const void *src, int=
 size)

WARNING:VOLATILE: Use of volatile is usually wrong: see Documentation/volat=
ile-considered-harmful.txt
#116: FILE: drivers/mtd/nand/mxc_nand.c:289:
+       volatile u32 *t =3D trg;

WARNING:LONG_LINE: line over 80 characters
#170: FILE: drivers/mtd/nand/mxc_nand.c:1093:
+               memcpy32_fromio(host->data_buf, host->main_area0, mtd->writ=
esize);

--=20
Best Regards,
Artem Bityutskiy

--=-ltFIaKORGdhFNZeM/lkh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPv54OAAoJECmIfjd9wqK0wIIP/igdfqAIQ8XOXvh7/urjsHlK
gme0WPlAY+e0KInSmJMVvZFXeOcPHGLUvsoMOt/egx5ReXPq3EQVPoez8q/2Tgh8
p9LjbLqH2vp2pc3DMw2XR930+48cW5LtwQI+4Frs1IZqOSCTHFvxUYE5v7wLIkFA
eSTKfjRNADJIj4Bf2YadCEkhcC6384qDUKepzsXxCIn8DK50bSvdYGi3e6IVYwDv
h3k6/SsA4EwZxMSjWh2POId3kAksWF6wVIfII4gL5003D2HDN5KxOtBp8fT5sqbz
NiGIdK2Bm0HkV2PLw5NGt1AKTXCzNg2MrOITN7DwxgUv1S3nNBaQWQY+qcoBC9cc
Am0IkmigTsR/dO7Smeovf23dxiD6UsUz4ckVCnmt054NZ9DKPjeQq7sw+Q6MxAgp
SlVYdN4mFzT1k+JLj4NZhcrZGgsAbRXzZYsyZXCMJlovAUddjcOlUO5Isu8Aslla
JgyMIOtdfeTyBjGuPCg9I+Js/F54MGg9CRBTyHX7Qjb5g1iVvAHiBCJp0T1Or/Qn
rA9GEprlUfYTeRExpJfizr+mVBwmjlUTJw/A4fzQXbCVOUX60wQh6d97l6vI2tsM
ZLBM6E7n3dtG1eF8Z1y807U0btHg9N3WgWFKlRYz9rZOIVtS/UXrhKRNWTjueB35
PRQLvIHUVQo2/2UKR9Q9
=lj6c
-----END PGP SIGNATURE-----

--=-ltFIaKORGdhFNZeM/lkh--
