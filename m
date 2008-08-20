Received: from ug-out-1314.google.com ([66.249.92.173])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KVt65-0005WF-GV
	for linux-mtd@lists.infradead.org; Wed, 20 Aug 2008 19:11:57 +0000
Received: by ug-out-1314.google.com with SMTP id m2so936262uge.5
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Aug 2008 12:11:55 -0700 (PDT)
Date: Wed, 20 Aug 2008 21:11:50 +0200 (CEST)
To: linux-mtd@lists.infradead.org, Troy Kisk <troy.kisky@boundarydevices.com>,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] [MTD] [NAND] nand_ecc.c: fix big endian, strengthen test,
	add printk
Message-ID: <alpine.DEB.0.99.0808202111040.27952@frans-desktop>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=us-ascii
From: frans <fransmeulenbroeks@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch for nand_ecc.c fixes three issues

- fix code so it also works on big endian architectures
- added a printk in case of an uncorrectable ecc error
- strenghten the test for correctable errors (decreasing the chance
  that multiple bit faults by accident will be seen as correctable)

Note: the big endian code is only tested in a testbed (running on big endian
hardware) as I cannot rebuild and test a big endian kernel at the moment.
However the only thing that can go wrong is if <asm/byteorder.h> does not
give __BIG_ENDIAN in that case. In my eyes very unlikely.

Please review and apply (or send feedback).

Best regards, Frans

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
index a8e8413..d99e569 100644
--- a/drivers/mtd/nand/nand_ecc.c
+++ b/drivers/mtd/nand/nand_ecc.c
@@ -43,6 +43,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mtd/nand_ecc.h>
+#include <asm/byteorder.h>
 #else
 #include <stdint.h>
 struct mtd_info;
@@ -51,6 +52,9 @@ struct mtd_info;
 #define MODULE_LICENSE(x)	/* x */
 #define MODULE_AUTHOR(x)	/* x */
 #define MODULE_DESCRIPTION(x)	/* x */
+
+#define printk printf
+#define KERN_ERR		""
 #endif

 /*
@@ -273,24 +277,38 @@ int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
 	/*
 	 * we also need to calculate the row parity for rp0..rp3
 	 * This is present in par, because par is now
-	 * rp3 rp3 rp2 rp2
+	 * rp3 rp3 rp2 rp2 in little endian and
+	 * rp2 rp2 rp3 rp3 in big endian
 	 * as well as
-	 * rp1 rp0 rp1 rp0
+	 * rp1 rp0 rp1 rp0 in little endian and
+	 * rp0 rp1 rp0 rp1 in big endian
 	 * First calculate rp2 and rp3
-	 * (and yes: rp2 = (par ^ rp3) & 0xff; but doing that did not
-	 * give a performance improvement)
 	 */
+#ifdef __BIG_ENDIAN
+	rp2 = (par >> 16);
+	rp2 ^= (rp2 >> 8);
+	rp2 &= 0xff;
+	rp3 = par & 0xffff;
+	rp3 ^= (rp3 >> 8);
+	rp3 &= 0xff;
+#else
 	rp3 = (par >> 16);
 	rp3 ^= (rp3 >> 8);
 	rp3 &= 0xff;
 	rp2 = par & 0xffff;
 	rp2 ^= (rp2 >> 8);
 	rp2 &= 0xff;
+#endif

 	/* reduce par to 16 bits then calculate rp1 and rp0 */
 	par ^= (par >> 16);
+#ifdef __BIG_ENDIAN
+	rp0 = (par >> 8) & 0xff;
+	rp1 = (par & 0xff);
+#else
 	rp1 = (par >> 8) & 0xff;
 	rp0 = (par & 0xff);
+#endif

 	/* finally reduce par to 8 bits */
 	par ^= (par >> 8);
@@ -381,7 +399,6 @@ EXPORT_SYMBOL(nand_calculate_ecc);
 int nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
 		      unsigned char *read_ecc, unsigned char *calc_ecc)
 {
-	int nr_bits;
 	unsigned char b0, b1, b2;
 	unsigned char byte_addr, bit_addr;

@@ -401,14 +418,15 @@ int nand_correct_data(struct mtd_info *mtd, unsigned char *buf,

 	/* check if there are any bitfaults */

-	/* count nr of bits; use table lookup, faster than calculating it */
-	nr_bits = bitsperbyte[b0] + bitsperbyte[b1] + bitsperbyte[b2];
-
 	/* repeated if statements are slightly more efficient than switch ... */
 	/* ordered in order of likelihood */
-	if (nr_bits == 0)
+
+	if ((b0 | b1 | b2) == 0)
 		return 0;	/* no error */
-	if (nr_bits == 11) {	/* correctable error */
+
+	if ((((b0 ^ (b0 >> 1)) & 0x55) == 0x55) &&
+	    (((b1 ^ (b1 >> 1)) & 0x55) == 0x55) &&
+	    (((b2 ^ (b2 >> 1)) & 0x54) == 0x54)) { /* single bit error */
 		/*
 		 * rp15/13/11/9/7/5/3/1 indicate which byte is the faulty byte
 		 * cp 5/3/1 indicate the faulty bit.
@@ -430,9 +448,13 @@ int nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
 		/* flip the bit */
 		buf[byte_addr] ^= (1 << bit_addr);
 		return 1;
+
 	}
-	if (nr_bits == 1)
+	/* count nr of bits; use table lookup, faster than calculating it */
+	if ((bitsperbyte[b0] + bitsperbyte[b1] + bitsperbyte[b2]) == 1)
 		return 1;	/* error in ecc data; no action needed */
+
+	printk(KERN_ERR "uncorrectable error : ");
 	return -1;
 }
 EXPORT_SYMBOL(nand_correct_data);
