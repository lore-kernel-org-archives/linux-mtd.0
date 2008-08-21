From: "Singh, Vimal" <vimalsingh@ti.com>
To: frans <fransmeulenbroeks@gmail.com>
Date: Thu, 21 Aug 2008 16:21:34 +0530
Subject: RE: [PATCH] [MTD] [NAND] nand_ecc.c: adding support for 512 byte ecc
Message-ID: <19F8576C6E063C45BE387C64729E739403CD517C1A@dbde02.ent.ti.com>
References: <19F8576C6E063C45BE387C64729E739403CD517C16@dbde02.ent.ti.com>
In-Reply-To: <19F8576C6E063C45BE387C64729E739403CD517C16@dbde02.ent.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, David
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Frans,

Frans Meulenbroeks wrote:
> This patch for nand_ecc.c fixes three issues
>
> - fix code so it also works on big endian architectures
> - added a printk in case of an uncorrectable ecc error
> - strenghten the test for correctable errors (decreasing the chance
>   that multiple bit faults by accident will be seen as correctable)
>
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
> diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
> index a8e8413..d99e569 100644

We can make this to support for 512 byte ecc calculation and correction als=
o.
It can be helpful, particularly in cases where hardware ecc option is prese=
nt and is using 512 byte ecc, to make software ecc and hardware ecc compati=
ble. So that switching could be possible at run time i.e. both can be used =
by switching at load time.

I have prepared a patch on top of your latest patch.
Please review it and provide your comments on this.

----
Thanks and Regards,
vimal singh

Signed-off-by: Vimal Singh <vimalsingh@ti.com>

Index: linux-omap-2.6/drivers/mtd/nand/nand_ecc.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-omap-2.6.orig/drivers/mtd/nand/nand_ecc.c	2008-08-21 10:33:30.000=
000000 +0530
+++ linux-omap-2.6/drivers/mtd/nand/nand_ecc.c	2008-08-21 10:50:39.00000000=
0 +0530
@@ -42,6 +42,8 @@
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <asm/byteorder.h>
 #else
@@ -158,10 +160,11 @@
 {
 	int i;
 	const uint32_t *bp =3D (uint32_t *)buf;
+	/* 256 or 512 bytes/ecc  */
+	uint32_t j =3D(((struct nand_chip *)mtd->priv)->ecc.size)/256;
 	uint32_t cur;		/* current value in buffer */
-	/* rp0..rp15 are the various accumulated parities (per byte) */
+	/* rp0..rp15..rp17 are the various accumulated parities (per byte) */
 	uint32_t rp0, rp1, rp2, rp3, rp4, rp5, rp6, rp7;
-	uint32_t rp8, rp9, rp10, rp11, rp12, rp13, rp14, rp15;
+	uint32_t rp8, rp9, rp10, rp11, rp12, rp13, rp14, rp15, rp16, rp17;
 	uint32_t par;		/* the cumulative parity for all data */
 	uint32_t tmppar;	/* the cumulative parity for this iteration;
 				   for rp12 and rp14 at the end of the loop */
@@ -173,6 +176,8 @@
 	rp10 =3D 0;
 	rp12 =3D 0;
 	rp14 =3D 0;
+	if (j =3D=3D 2)
+		rp16 =3D 0;
=20
 	/*
 	 * The loop is unrolled a number of times;
@@ -184,7 +189,7 @@
 	 * needed for calculating rp12, rp14 and par
 	 * also used as a performance improvement for rp6, rp8 and rp10
 	 */
-	for (i =3D 0; i < 4; i++) {
+	for (i =3D 0; i < 4*j; i++) {
 		cur =3D *bp++;
 		tmppar =3D cur;
 		rp4 ^=3D cur;
@@ -247,6 +252,8 @@
 			rp12 ^=3D tmppar;
 		if ((i & 0x2) =3D=3D 0)
 			rp14 ^=3D tmppar;
+		if (j =3D=3D 2 && (i & 0x4) =3D=3D 0)
+			rp16 ^=3D tmppar;
 	}
=20
 	/*
@@ -273,6 +280,11 @@
 	rp14 ^=3D (rp14 >> 16);
 	rp14 ^=3D (rp14 >> 8);
 	rp14 &=3D 0xff;
+	if (j =3D=3D 2) {
+		rp16 ^=3D (rp16 >> 16);
+		rp16 ^=3D (rp16 >> 8);
+		rp16 &=3D 0xff;
+	}
=20
 	/*
 	 * we also need to calculate the row parity for rp0..rp3
@@ -329,6 +341,8 @@
 	rp11 =3D (par ^ rp10) & 0xff;
 	rp13 =3D (par ^ rp12) & 0xff;
 	rp15 =3D (par ^ rp14) & 0xff;
+	if (j =3D=3D 2)
+		rp17 =3D (par ^ rp16) & 0xff;
=20
 	/*
 	 * Finally calculate the ecc bits.
@@ -375,14 +389,25 @@
 	    (invparity[rp9] << 1)  |
 	    (invparity[rp8]);
 #endif
-	code[2] =3D
-	    (invparity[par & 0xf0] << 7) |
-	    (invparity[par & 0x0f] << 6) |
-	    (invparity[par & 0xcc] << 5) |
-	    (invparity[par & 0x33] << 4) |
-	    (invparity[par & 0xaa] << 3) |
-	    (invparity[par & 0x55] << 2) |
-	    3;
+	if (j =3D=3D 1)
+		code[2] =3D
+		    (invparity[par & 0xf0] << 7) |
+		    (invparity[par & 0x0f] << 6) |
+		    (invparity[par & 0xcc] << 5) |
+		    (invparity[par & 0x33] << 4) |
+		    (invparity[par & 0xaa] << 3) |
+		    (invparity[par & 0x55] << 2) |
+		    3;
+	else if (j =3D=3D 2)
+		code[2] =3D
+		    (invparity[par & 0xf0] << 7) |
+		    (invparity[par & 0x0f] << 6) |
+		    (invparity[par & 0xcc] << 5) |
+		    (invparity[par & 0x33] << 4) |
+		    (invparity[par & 0xaa] << 3) |
+		    (invparity[par & 0x55] << 2) |
+		    (invparity[rp17] << 1) |
+		    (invparity[rp16] << 0);
 	return 0;
 }
 EXPORT_SYMBOL(nand_calculate_ecc);
@@ -401,6 +426,7 @@
 {
 	unsigned char b0, b1, b2;
 	unsigned char byte_addr, bit_addr;
+	/* 256 or 512 bytes/ecc  */
+	uint32_t j =3D (((struct nand_chip *)mtd->priv)->ecc.size)/256;
=20
 	/*
 	 * b0 to b2 indicate which bit is faulty (if any)
@@ -426,7 +452,8 @@
=20
 	if ((((b0 ^ (b0 >> 1)) & 0x55) =3D=3D 0x55) &&
 	    (((b1 ^ (b1 >> 1)) & 0x55) =3D=3D 0x55) &&
-	    (((b2 ^ (b2 >> 1)) & 0x54) =3D=3D 0x54)) { /* single bit error */
+	    ((j =3D=3D 1 && ((b2 ^ (b2 >> 1)) & 0x54) =3D=3D 0x54) ||
+	     (j =3D=3D 2 && ((b2 ^ (b2 >> 1)) & 0x55) =3D=3D 0x55))) {
+	/* single bit error */
 		/*
 		 * rp15/13/11/9/7/5/3/1 indicate which byte is the faulty byte
 		 * cp 5/3/1 indicate the faulty bit.
@@ -443,7 +470,10 @@
 		 * We could also do addressbits[b2] >> 1 but for the
 		 * performace it does not make any difference
 		 */
-		byte_addr =3D (addressbits[b1] << 4) + addressbits[b0];
+		if (j =3D=3D 1)
+			byte_addr =3D (addressbits[b1] << 4) + addressbits[b0];
+		else if (j =3D=3D 2)
+			byte_addr =3D (addressbits[b2 & 0x3] << 8) +=20
+				    (addressbits[b1] << 4) + addressbits[b0];
 		bit_addr =3D addressbits[b2 >> 2];
 		/* flip the bit */
 		buf[byte_addr] ^=3D (1 << bit_addr);
