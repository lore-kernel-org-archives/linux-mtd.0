From: "Singh, Vimal" <vimalsingh@ti.com>
To: "dedekind@infradead.org" <dedekind@infradead.org>
Date: Fri, 22 Aug 2008 14:15:17 +0530
Subject: RE: [PATCH] [MTD] [NAND] nand_ecc.c: adding support for 512 byte	ecc
Message-ID: <19F8576C6E063C45BE387C64729E739403CD517C1C@dbde02.ent.ti.com>
References: <19F8576C6E063C45BE387C64729E739403CD517C16@dbde02.ent.ti.com>
	<19F8576C6E063C45BE387C64729E739403CD517C1A@dbde02.ent.ti.com>	 ,
	<ac9c93b10808211139t69d3ce6euaac35368f1514931@mail.gmail.com>
	<19F8576C6E063C45BE387C64729E739403CD517C1B@dbde02.ent.ti.com>,
	<1219385223.18027.105.camel@sauron>
In-Reply-To: <1219385223.18027.105.camel@sauron>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Frans Meulenbroeks <fransmeulenbroeks@gmail.com>,
	Woodhouse <dwmw2@infradead.org>,
	"David@mgw-mx06.nokia.com" <David@mgw-mx06.nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>On Fri, 2008-08-22 at 11:09 +0530, Singh, Vimal wrote:
>> +       rp16 =3D 0;
> >+       rp17 =3D 0; /* to make cmpiler happy */
>Please, use
>
>uint32_t uninitialized_var(rp17);
>
>to avoid unnecessary initialization to 0 and avoid gcc warning as well.

Here is the patch after taking your inputs with some additional changes
in comments.

----
Thanks and Regards,
vimal singh

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---
 drivers/mtd/nand/nand_ecc.c |   84 ++++++++++++++++++++++++++++++++-------=
-----
 1 files changed, 62 insertions(+), 22 deletions(-)

Index: linux-omap-2.6/drivers/mtd/nand/nand_ecc.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-omap-2.6.orig/drivers/mtd/nand/nand_ecc.c	2008-08-22 12:58:33.000=
000000 +0530
+++ linux-omap-2.6/drivers/mtd/nand/nand_ecc.c	2008-08-22 13:10:10.00000000=
0 +0530
@@ -42,6 +42,8 @@
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
 #include <linux/mtd/nand_ecc.h>
 #else
 #include <stdint.h>
@@ -144,7 +146,8 @@
 };
=20
 /**
- * nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256-byte=
 block
+ * nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256/512-=
byte
+ *			 block
  * @mtd:	MTD block structure (unused)
  * @dat:	raw data
  * @ecc_code:	buffer for ECC
@@ -154,13 +157,18 @@
 {
 	int i;
 	const uint32_t *bp =3D (uint32_t *)buf;
+	/* 256 or 512 bytes/ecc  */
+	const uint32_t eccsize_mult =3D
+			(((struct nand_chip *)mtd->priv)->ecc.size) >> 8;
 	uint32_t cur;		/* current value in buffer */
-	/* rp0..rp15 are the various accumulated parities (per byte) */
+	/* rp0..rp15..rp17 are the various accumulated parities (per byte) */
 	uint32_t rp0, rp1, rp2, rp3, rp4, rp5, rp6, rp7;
-	uint32_t rp8, rp9, rp10, rp11, rp12, rp13, rp14, rp15;
+	uint32_t rp8, rp9, rp10, rp11, rp12, rp13, rp14, rp15, rp16;
+	uint32_t uninitialized_var(rp17);	/* to keep compiler happy */
 	uint32_t par;		/* the cumulative parity for all data */
 	uint32_t tmppar;	/* the cumulative parity for this iteration;
-				   for rp12 and rp14 at the end of the loop */
+				   for rp12, rp14 and rp16 at the end of the
+				   loop */
=20
 	par =3D 0;
 	rp4 =3D 0;
@@ -169,6 +177,7 @@
 	rp10 =3D 0;
 	rp12 =3D 0;
 	rp14 =3D 0;
+	rp16 =3D 0;
=20
 	/*
 	 * The loop is unrolled a number of times;
@@ -177,10 +186,10 @@
 	 * Note: passing unaligned data might give a performance penalty.
 	 * It is assumed that the buffers are aligned.
 	 * tmppar is the cumulative sum of this iteration.
-	 * needed for calculating rp12, rp14 and par
+	 * needed for calculating rp12, rp14, rp16 and par
 	 * also used as a performance improvement for rp6, rp8 and rp10
 	 */
-	for (i =3D 0; i < 4; i++) {
+	for (i =3D 0; i < eccsize_mult << 2; i++) {
 		cur =3D *bp++;
 		tmppar =3D cur;
 		rp4 ^=3D cur;
@@ -243,12 +252,14 @@
 			rp12 ^=3D tmppar;
 		if ((i & 0x2) =3D=3D 0)
 			rp14 ^=3D tmppar;
+		if (eccsize_mult =3D=3D 2 && (i & 0x4) =3D=3D 0)
+			rp16 ^=3D tmppar;
 	}
=20
 	/*
 	 * handle the fact that we use longword operations
-	 * we'll bring rp4..rp14 back to single byte entities by shifting and
-	 * xoring first fold the upper and lower 16 bits,
+	 * we'll bring rp4..rp14..rp16 back to single byte entities by
+	 * shifting and xoring first fold the upper and lower 16 bits,
 	 * then the upper and lower 8 bits.
 	 */
 	rp4 ^=3D (rp4 >> 16);
@@ -269,6 +280,11 @@
 	rp14 ^=3D (rp14 >> 16);
 	rp14 ^=3D (rp14 >> 8);
 	rp14 &=3D 0xff;
+	if (eccsize_mult =3D=3D 2) {
+		rp16 ^=3D (rp16 >> 16);
+		rp16 ^=3D (rp16 >> 8);
+		rp16 &=3D 0xff;
+	}
=20
 	/*
 	 * we also need to calculate the row parity for rp0..rp3
@@ -297,7 +313,7 @@
 	par &=3D 0xff;
=20
 	/*
-	 * and calculate rp5..rp15
+	 * and calculate rp5..rp15..rp17
 	 * note that par =3D rp4 ^ rp5 and due to the commutative property
 	 * of the ^ operator we can say:
 	 * rp5 =3D (par ^ rp4);
@@ -311,6 +327,8 @@
 	rp11 =3D (par ^ rp10) & 0xff;
 	rp13 =3D (par ^ rp12) & 0xff;
 	rp15 =3D (par ^ rp14) & 0xff;
+	if (eccsize_mult =3D=3D 2)
+		rp17 =3D (par ^ rp16) & 0xff;
=20
 	/*
 	 * Finally calculate the ecc bits.
@@ -357,14 +375,25 @@
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
+	if (eccsize_mult =3D=3D 1)
+		code[2] =3D
+		    (invparity[par & 0xf0] << 7) |
+		    (invparity[par & 0x0f] << 6) |
+		    (invparity[par & 0xcc] << 5) |
+		    (invparity[par & 0x33] << 4) |
+		    (invparity[par & 0xaa] << 3) |
+		    (invparity[par & 0x55] << 2) |
+		    3;
+	else
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
@@ -376,7 +405,7 @@
  * @read_ecc:	ECC from the chip
  * @calc_ecc:	the ECC calculated from raw data
  *
- * Detect and correct a 1 bit error for 256 byte block
+ * Detect and correct a 1 bit error for 256/512 byte block
  */
 int nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
 		      unsigned char *read_ecc, unsigned char *calc_ecc)
@@ -384,6 +413,9 @@
 	int nr_bits;
 	unsigned char b0, b1, b2;
 	unsigned char byte_addr, bit_addr;
+	/* 256 or 512 bytes/ecc  */
+	const uint32_t eccsize_mult =3D
+			(((struct nand_chip *)mtd->priv)->ecc.size) >> 8;
=20
 	/*
 	 * b0 to b2 indicate which bit is faulty (if any)
@@ -408,10 +440,14 @@
 	/* ordered in order of likelihood */
 	if (nr_bits =3D=3D 0)
 		return 0;	/* no error */
-	if (nr_bits =3D=3D 11) {	/* correctable error */
+ 	if ((((b0 ^ (b0 >> 1)) & 0x55) =3D=3D 0x55) &&
+ 	    (((b1 ^ (b1 >> 1)) & 0x55) =3D=3D 0x55) &&
+	    ((eccsize_mult =3D=3D 1 && ((b2 ^ (b2 >> 1)) & 0x54) =3D=3D 0x54) ||
+	     (eccsize_mult =3D=3D 2 && ((b2 ^ (b2 >> 1)) & 0x55) =3D=3D 0x55))) {
+	/* single bit error */
 		/*
-		 * rp15/13/11/9/7/5/3/1 indicate which byte is the faulty byte
-		 * cp 5/3/1 indicate the faulty bit.
+		 * rp17/rp15/13/11/9/7/5/3/1 indicate which byte is the faulty
+		 * byte, cp 5/3/1 indicate the faulty bit.
 		 * A lookup table (called addressbits) is used to filter
 		 * the bits from the byte they are in.
 		 * A marginal optimisation is possible by having three
@@ -425,7 +461,11 @@
 		 * We could also do addressbits[b2] >> 1 but for the
 		 * performace it does not make any difference
 		 */
-		byte_addr =3D (addressbits[b1] << 4) + addressbits[b0];
+		if (eccsize_mult =3D=3D 1)
+			byte_addr =3D (addressbits[b1] << 4) + addressbits[b0];
+		else
+			byte_addr =3D (addressbits[b2 & 0x3] << 8) +
+				    (addressbits[b1] << 4) + addressbits[b0];
 		bit_addr =3D addressbits[b2 >> 2];
 		/* flip the bit */
 		buf[byte_addr] ^=3D (1 << bit_addr);
