Received: from ik-out-1112.google.com ([66.249.90.182])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWvp1-0002WG-NJ
	for linux-mtd@lists.infradead.org; Sat, 23 Aug 2008 16:18:40 +0000
Received: by ik-out-1112.google.com with SMTP id c21so799005ika.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 23 Aug 2008 09:18:38 -0700 (PDT)
Date: Sat, 23 Aug 2008 18:18:34 +0200 (CEST)
To: "Singh, Vimal" <vimalsingh@ti.com>
Subject: RE: [PATCH] [MTD] [NAND] nand_ecc.c: adding support for 512 byte ecc
In-Reply-To: <19F8576C6E063C45BE387C64729E739403CD517C1D@dbde02.ent.ti.com>
Message-ID: <alpine.DEB.0.99.0808231816100.12574@frans-desktop>
References: <19F8576C6E063C45BE387C64729E739403CD517C16@dbde02.ent.ti.com>
	<19F8576C6E063C45BE387C64729E739403CD517C1A@dbde02.ent.ti.com>
	<ac9c93b10808211139t69d3ce6euaac35368f1514931@mail.gmail.com>
	<19F8576C6E063C45BE387C64729E739403CD517C1B@dbde02.ent.ti.com>
	<1219385223.18027.105.camel@sauron>
	<19F8576C6E063C45BE387C64729E739403CD517C1C@dbde02.ent.ti.com>,
	<ac9c93b10808220158p13528b81t7dbb0eb6a6d8a5a8@mail.gmail.com>
	<19F8576C6E063C45BE387C64729E739403CD517C1D@dbde02.ent.ti.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=us-ascii
From: frans <fransmeulenbroeks@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "Singh, Vimal" <vimalsingh@ti.com>

Support 512 byte ECC calculation

[FM: updated two comments]

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

---
recreated the patch after making the changes
there are a few other minor optimisations possible, but I am planning to
rework the code and rebench for ARM (there are a few statements
like rp2 = (par ^ rp3) & 0xff; which were marginally faster on pentium
but might be less efficient on ARM and/or MIPS. As this is typically used
for embedded processors it makes sense to optimise for those targets
(especially if the effect for x86 is hardly or not noticable)

Frans.

diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
index fd19787..868147a 100644
--- a/drivers/mtd/nand/nand_ecc.c
+++ b/drivers/mtd/nand/nand_ecc.c
@@ -42,6 +42,8 @@
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <asm/byteorder.h>
 #else
@@ -148,8 +150,9 @@ static const char addressbits[256] = {
 };

 /**
- * nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256-byte block
- * @mtd:	MTD block structure (unused)
+ * nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256/512-byte
+ *			 block
+ * @mtd:	MTD block structure
  * @buf:	input buffer with raw data
  * @code:	output buffer with ECC
  */
@@ -158,13 +161,18 @@ int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
 {
 	int i;
 	const uint32_t *bp = (uint32_t *)buf;
+	/* 256 or 512 bytes/ecc  */
+	const uint32_t eccsize_mult =
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

 	par = 0;
 	rp4 = 0;
@@ -173,6 +181,7 @@ int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
 	rp10 = 0;
 	rp12 = 0;
 	rp14 = 0;
+	rp16 = 0;

 	/*
 	 * The loop is unrolled a number of times;
@@ -181,10 +190,10 @@ int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
 	 * Note: passing unaligned data might give a performance penalty.
 	 * It is assumed that the buffers are aligned.
 	 * tmppar is the cumulative sum of this iteration.
-	 * needed for calculating rp12, rp14 and par
+	 * needed for calculating rp12, rp14, rp16 and par
 	 * also used as a performance improvement for rp6, rp8 and rp10
 	 */
-	for (i = 0; i < 4; i++) {
+	for (i = 0; i < eccsize_mult << 2; i++) {
 		cur = *bp++;
 		tmppar = cur;
 		rp4 ^= cur;
@@ -247,12 +256,14 @@ int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
 			rp12 ^= tmppar;
 		if ((i & 0x2) == 0)
 			rp14 ^= tmppar;
+		if (eccsize_mult == 2 && (i & 0x4) == 0)
+			rp16 ^= tmppar;
 	}

 	/*
 	 * handle the fact that we use longword operations
-	 * we'll bring rp4..rp14 back to single byte entities by shifting and
-	 * xoring first fold the upper and lower 16 bits,
+	 * we'll bring rp4..rp14..rp16 back to single byte entities by
+	 * shifting and xoring first fold the upper and lower 16 bits,
 	 * then the upper and lower 8 bits.
 	 */
 	rp4 ^= (rp4 >> 16);
@@ -273,6 +284,11 @@ int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
 	rp14 ^= (rp14 >> 16);
 	rp14 ^= (rp14 >> 8);
 	rp14 &= 0xff;
+	if (eccsize_mult == 2) {
+		rp16 ^= (rp16 >> 16);
+		rp16 ^= (rp16 >> 8);
+		rp16 &= 0xff;
+	}

 	/*
 	 * we also need to calculate the row parity for rp0..rp3
@@ -315,7 +331,7 @@ int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
 	par &= 0xff;

 	/*
-	 * and calculate rp5..rp15
+	 * and calculate rp5..rp15..rp17
 	 * note that par = rp4 ^ rp5 and due to the commutative property
 	 * of the ^ operator we can say:
 	 * rp5 = (par ^ rp4);
@@ -329,6 +345,8 @@ int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
 	rp11 = (par ^ rp10) & 0xff;
 	rp13 = (par ^ rp12) & 0xff;
 	rp15 = (par ^ rp14) & 0xff;
+	if (eccsize_mult == 2)
+		rp17 = (par ^ rp16) & 0xff;

 	/*
 	 * Finally calculate the ecc bits.
@@ -375,32 +393,46 @@ int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
 	    (invparity[rp9] << 1)  |
 	    (invparity[rp8]);
 #endif
-	code[2] =
-	    (invparity[par & 0xf0] << 7) |
-	    (invparity[par & 0x0f] << 6) |
-	    (invparity[par & 0xcc] << 5) |
-	    (invparity[par & 0x33] << 4) |
-	    (invparity[par & 0xaa] << 3) |
-	    (invparity[par & 0x55] << 2) |
-	    3;
+	if (eccsize_mult == 1)
+		code[2] =
+		    (invparity[par & 0xf0] << 7) |
+		    (invparity[par & 0x0f] << 6) |
+		    (invparity[par & 0xcc] << 5) |
+		    (invparity[par & 0x33] << 4) |
+		    (invparity[par & 0xaa] << 3) |
+		    (invparity[par & 0x55] << 2) |
+		    3;
+	else
+		code[2] =
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

 /**
  * nand_correct_data - [NAND Interface] Detect and correct bit error(s)
- * @mtd:	MTD block structure (unused)
+ * @mtd:	MTD block structure
  * @buf:	raw data read from the chip
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
+	const uint32_t eccsize_mult =
+			(((struct nand_chip *)mtd->priv)->ecc.size) >> 8;

 	/*
 	 * b0 to b2 indicate which bit is faulty (if any)
@@ -426,10 +458,12 @@ int nand_correct_data(struct mtd_info *mtd, unsigned char *buf,

 	if ((((b0 ^ (b0 >> 1)) & 0x55) == 0x55) &&
 	    (((b1 ^ (b1 >> 1)) & 0x55) == 0x55) &&
-	    (((b2 ^ (b2 >> 1)) & 0x54) == 0x54)) { /* single bit error */
+	    ((eccsize_mult == 1 && ((b2 ^ (b2 >> 1)) & 0x54) == 0x54) ||
+	     (eccsize_mult == 2 && ((b2 ^ (b2 >> 1)) & 0x55) == 0x55))) {
+	/* single bit error */
 		/*
-		 * rp15/13/11/9/7/5/3/1 indicate which byte is the faulty byte
-		 * cp 5/3/1 indicate the faulty bit.
+		 * rp17/rp15/13/11/9/7/5/3/1 indicate which byte is the faulty
+		 * byte, cp 5/3/1 indicate the faulty bit.
 		 * A lookup table (called addressbits) is used to filter
 		 * the bits from the byte they are in.
 		 * A marginal optimisation is possible by having three
@@ -443,7 +477,11 @@ int nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
 		 * We could also do addressbits[b2] >> 1 but for the
 		 * performace it does not make any difference
 		 */
-		byte_addr = (addressbits[b1] << 4) + addressbits[b0];
+		if (eccsize_mult == 1)
+			byte_addr = (addressbits[b1] << 4) + addressbits[b0];
+		else
+			byte_addr = (addressbits[b2 & 0x3] << 8) +
+				    (addressbits[b1] << 4) + addressbits[b0];
 		bit_addr = addressbits[b2 >> 2];
 		/* flip the bit */
 		buf[byte_addr] ^= (1 << bit_addr);
