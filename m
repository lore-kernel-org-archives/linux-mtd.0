Received: from zigzag.lvk.cs.msu.su ([158.250.17.23])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JUTCN-0003CT-7k
	for linux-mtd@lists.infradead.org; Wed, 27 Feb 2008 20:48:20 +0000
Received: from Debian-exim by zigzag.lvk.cs.msu.su with spam-scanned (Exim
	4.50) id 1JUTCI-0006vA-KP
	for linux-mtd@lists.infradead.org; Wed, 27 Feb 2008 23:48:17 +0300
Received: from ppp85-140-99-217.pppoe.mtu-net.ru ([85.140.99.217] helo=blacky)
	by zigzag.lvk.cs.msu.su with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA:32)
	(Exim 4.50) id 1JUTCI-0006v7-Fg
	for linux-mtd@lists.infradead.org; Wed, 27 Feb 2008 23:48:14 +0300
Received: from nikita by blacky with local (Exim 4.63)
	(envelope-from <yoush@cs.msu.su>) id 1JUTCH-0001X8-6Q
	for linux-mtd@lists.infradead.org; Wed, 27 Feb 2008 23:48:13 +0300
From: "Nikita V. Youshchenko" <yoush@cs.msu.su>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: support for bit-reversed CFI cmd/query
MIME-Version: 1.0
Date: Wed, 27 Feb 2008 23:48:07 +0300
Content-Type: multipart/signed; boundary="nextPart5266589.hXS0jztc2a";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200802272348.13180@blacky.localdomain>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart5266589.hXS0jztc2a
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

commit 049aa6336a85de3143a3dc9cb3f4c87ecc8896b3
Author: Nikita Youshchenko <yoush@cs.msu.su>
Date:   Wed Feb 27 20:25:22 2008 +0000

    mtd: support for bit-reversed CFI cmd/query
   =20
    Some embedded boards have flash chips connected with reversed bit order.
    Example for 16-bit width:
     chip D0 is bus D15
     chip D1 is bus D14
     ...
     chip D15 is bus D0
    It works perfectly for data access, however probing and issuing CFI com=
mands
    for such chips require bit reversing. This patch adds support for this.
   =20
    Signed-off-by: Nikita Youshchenko <yoush@cs.msu.su>

diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
index 6d8f30d..0471cd0 100644
=2D-- a/drivers/mtd/chips/Kconfig
+++ b/drivers/mtd/chips/Kconfig
@@ -57,7 +57,8 @@ config MTD_CFI_NOSWAP
 	  enabled, means that the CPU will not do any swapping; the chips
 	  are expected to be wired to the CPU in 'host-endian' form.
 	  Specific arrangements are possible with the BIG_ENDIAN_BYTE and
=2D	  LITTLE_ENDIAN_BYTE, if the bytes are reversed.
+	  LITTLE_ENDIAN_BYTE, if the bytes are reversed. Also it is possible
+	  to revert bit order in 'magic commands'.
=20
 	  If you have a LART, on which the data (and address) lines were
 	  connected in a fashion which ensured that the nets were as short
@@ -72,6 +73,10 @@ config MTD_CFI_BE_BYTE_SWAP
 config MTD_CFI_LE_BYTE_SWAP
 	bool "LITTLE_ENDIAN_BYTE"
=20
+config MTD_CFI_BIT_SWAP
+	bool "Reverse bit order"
+	select BITREVERSE
+
 endchoice
=20
 config MTD_CFI_GEOMETRY
diff --git a/include/linux/mtd/cfi_endian.h b/include/linux/mtd/cfi_endian.h
index 25724f7..195edae 100644
=2D-- a/include/linux/mtd/cfi_endian.h
+++ b/include/linux/mtd/cfi_endian.h
@@ -52,6 +52,24 @@
 #define cfi16_to_cpu(x) (x)
 #define cfi32_to_cpu(x) (x)
 #define cfi64_to_cpu(x) (x)
+#elif defined(CONFIG_MTD_CFI_BIT_SWAP)
+#include <linux/bitrev.h>
+#define cpu_to_cfi8(x) (x)
+#define cfi8_to_cpu(x) (x)
+#define cpu_to_cfi16(x) ({ u16 y =3D (x); \
+		           (bitrev8(y & 255) << 8) | bitrev8(y >> 8); \
+			})
+#define cfi16_to_cpu(x) ({ u16 y =3D (x); \
+		           (bitrev8(y & 255) << 8) | bitrev8(y >> 8); \
+			})
+#define cpu_to_cfi32(x) (x)
+#define cfi32_to_cpu(x) (x)
+#define cpu_to_cfi64(x) ({ u64 y =3D (x); \
+		           (bitrev32(y & 0xffffffff) << 32) | bitrev32(y >> 32); \
+			})
+#define cfi64_to_cpu(x) ({ u64 y =3D (x); \
+		           (bitrev32(y & 0xffffffff) << 32) | bitrev32(y >> 32); \
+			})
 #else
 #error No CFI endianness defined
 #endif

--nextPart5266589.hXS0jztc2a
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHxcyNv3x5OskTLdsRAoPeAKDCfSLJ3lwloBsUp81CA11kGw4bIACeNKGo
jQlUIVTiJ7OYcrpVTrOYPxU=
=53QG
-----END PGP SIGNATURE-----

--nextPart5266589.hXS0jztc2a--
