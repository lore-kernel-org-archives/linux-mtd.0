From: "Singh, Vimal" <vimalsingh@ti.com>
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Date: Fri, 22 Aug 2008 14:57:28 +0530
Subject: RE: [PATCH] [MTD] [NAND] nand_ecc.c: adding support for 512 byte ecc
Message-ID: <19F8576C6E063C45BE387C64729E739403CD517C1D@dbde02.ent.ti.com>
References: <19F8576C6E063C45BE387C64729E739403CD517C16@dbde02.ent.ti.com>
	<19F8576C6E063C45BE387C64729E739403CD517C1A@dbde02.ent.ti.com>
	<ac9c93b10808211139t69d3ce6euaac35368f1514931@mail.gmail.com>
	<19F8576C6E063C45BE387C64729E739403CD517C1B@dbde02.ent.ti.com>
	<1219385223.18027.105.camel@sauron>
	<19F8576C6E063C45BE387C64729E739403CD517C1C@dbde02.ent.ti.com>,
	<ac9c93b10808220158p13528b81t7dbb0eb6a6d8a5a8@mail.gmail.com>
In-Reply-To: <ac9c93b10808220158p13528b81t7dbb0eb6a6d8a5a8@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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

Frans,

Below is the patch prepared on top of the current git head.
=20
>I suggest to merge your changes with the mtd git version of nand_ecc.c
>The current HEAD for this file can be found here:
>http://git.infradead.org/mtd-2.6.git?a=3Dblob_plain;f=3Ddrivers/mtd/nand/n=
and_ecc.c;hb=3D17c1d2be28e485c0c8b09661db39d5bf2605069d

Sorry for sending patches on wrong versions...

---
 drivers/mtd/nand/nand_ecc.c |   82 ++++++++++++++++++++++++++++++++-------=
-----
 1 files changed, 60 insertions(+), 22 deletions(-)

Index: linux-omap-2.6/drivers/mtd/nand/nand_ecc.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-omap-2.6.orig/drivers/mtd/nand/nand_ecc.c	2008-08-22 14:35:48.000=
000000 +0530
+++ linux-omap-2.6/drivers/mtd/nand/nand_ecc.c	2008-08-22 14:46:41.00000000=
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
@@ -148,7 +150,8 @@
 };
=20
 /**
- * nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256-byte=
 block
+ * nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256/512-=
byte
+ *			 block
  * @mtd:	MTD block structure (unused)
  * @buf:	input buffer with raw data
  * @code:	output buffer with ECC
@@ -158,13 +161,18 @@
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
+	uint32_t uninitialized_var(rp17);	/* to make compiler happy */
 	uint32_t par;		/* the cumulative parity for all data */
 	uint32_t tmppar;	/* the cumulative parity for this iteration;
-				   for rp12 and rp14 at the end of the loop */
+				   for rp12, rp14 and rp16 at the end of the
+				   loop */
=20
 	par =3D 0;
 	rp4 =3D 0;
@@ -173,6 +181,7 @@
 	rp10 =3D 0;
 	rp12 =3D 0;
 	rp14 =3D 0;
+	rp16 =3D 0;
=20
 	/*
 	 * The loop is unrolled a number of times;
@@ -181,10 +190,10 @@
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
@@ -247,12 +256,14 @@
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
@@ -273,6 +284,11 @@
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
@@ -315,7 +331,7 @@
 	par &=3D 0xff;
=20
 	/*
-	 * and calculate rp5..rp15
+	 * and calculate rp5..rp15..rp17
 	 * note that par =3D rp4 ^ rp5 and due to the commutative property
 	 * of the ^ operator we can say:
 	 * rp5 =3D (par ^ rp4);
@@ -329,6 +345,8 @@
 	rp11 =3D (par ^ rp10) & 0xff;
 	rp13 =3D (par ^ rp12) & 0xff;
 	rp15 =3D (par ^ rp14) & 0xff;
+	if (eccsize_mult =3D=3D 2)
+		rp17 =3D (par ^ rp16) & 0xff;
=20
 	/*
 	 * Finally calculate the ecc bits.
@@ -375,14 +393,25 @@
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
@@ -394,13 +423,16 @@
  * @read_ecc:	ECC from the chip
  * @calc_ecc:	the ECC calculated from raw data
  *
- * Detect and correct a 1 bit error for 256 byte block
+ * Detect and correct a 1 bit error for 256/512 byte block
  */
 int nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
 		      unsigned char *read_ecc, unsigned char *calc_ecc)
 {
 	unsigned char b0, b1, b2;
 	unsigned char byte_addr, bit_addr;
+	/* 256 or 512 bytes/ecc  */
+	const uint32_t eccsize_mult =3D
+			(((struct nand_chip *)mtd->priv)->ecc.size) >> 8;
=20
 	/*
 	 * b0 to b2 indicate which bit is faulty (if any)
@@ -426,10 +458,12 @@
=20
 	if ((((b0 ^ (b0 >> 1)) & 0x55) =3D=3D 0x55) &&
 	    (((b1 ^ (b1 >> 1)) & 0x55) =3D=3D 0x55) &&
-	    (((b2 ^ (b2 >> 1)) & 0x54) =3D=3D 0x54)) { /* single bit error */
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
@@ -443,7 +477,11 @@
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
