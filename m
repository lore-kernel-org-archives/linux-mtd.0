Received: from [69.28.251.93] (helo=b32.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OVuHo-00037j-8X
	for linux-mtd@lists.infradead.org; Mon, 05 Jul 2010 22:37:14 +0000
From: Kevin Cernekee <cernekee@gmail.com>
Date: Mon, 5 Jul 2010 15:10:34 -0700
Subject: [PATCH 1/5] mtd-utils: move libmtd source files to lib/ subdirectory
Message-Id: <4822394121cd0a8f08b0bd3ecd6af199@localhost>
To: <dedekind1@gmail.com>, <saeed.bishara@gmail.com>, <jwboyer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Source files for libmtd, crc32, and fec are scattered throughout the
tree.  Move them to a central location so they can be built into a
common "libmtd.a" library used by all mtd-utils programs.

This patch only renames/deletes files and does not change the content.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 crc32.c                       |   95 ----
 crc32.h                       |   19 -
 fec.c                         |  904 --------------------------------
 include/common.h              |   87 +++
 include/crc32.h               |   22 +
 include/libmtd.h              |  246 +++++++++
 lib/crc32.c                   |   95 ++++
 lib/fec.c                     |  904 ++++++++++++++++++++++++++++++++
 lib/libmtd.c                  | 1157 +++++++++++++++++++++++++++++++++++++++++
 lib/libmtd_int.h              |   88 ++++
 lib/libmtd_legacy.c           |  359 +++++++++++++
 mkfs.ubifs/crc32.c            |   95 ----
 mkfs.ubifs/crc32.h            |   22 -
 ubi-utils/include/libmtd.h    |  246 ---------
 ubi-utils/src/common.h        |   87 ---
 ubi-utils/src/crc32.c         |   95 ----
 ubi-utils/src/crc32.h         |   17 -
 ubi-utils/src/libmtd.c        | 1157 -----------------------------------------
 ubi-utils/src/libmtd_int.h    |   88 ----
 ubi-utils/src/libmtd_legacy.c |  359 -------------
 20 files changed, 2958 insertions(+), 3184 deletions(-)
 delete mode 100644 crc32.c
 delete mode 100644 crc32.h
 delete mode 100644 fec.c
 create mode 100644 include/common.h
 create mode 100644 include/crc32.h
 create mode 100644 include/libmtd.h
 create mode 100644 lib/crc32.c
 create mode 100644 lib/fec.c
 create mode 100644 lib/libmtd.c
 create mode 100644 lib/libmtd_int.h
 create mode 100644 lib/libmtd_legacy.c
 delete mode 100644 mkfs.ubifs/crc32.c
 delete mode 100644 mkfs.ubifs/crc32.h
 delete mode 100644 ubi-utils/include/libmtd.h
 delete mode 100644 ubi-utils/src/common.h
 delete mode 100644 ubi-utils/src/crc32.c
 delete mode 100644 ubi-utils/src/crc32.h
 delete mode 100644 ubi-utils/src/libmtd.c
 delete mode 100644 ubi-utils/src/libmtd_int.h
 delete mode 100644 ubi-utils/src/libmtd_legacy.c

diff --git a/crc32.c b/crc32.c
deleted file mode 100644
index 6b1e50c..0000000
--- a/crc32.c
+++ /dev/null
@@ -1,95 +0,0 @@
-/*
- *  COPYRIGHT (C) 1986 Gary S. Brown.  You may use this program, or
- *  code or tables extracted from it, as desired without restriction.
- *
- *  First, the polynomial itself and its table of feedback terms.  The
- *  polynomial is
- *  X^32+X^26+X^23+X^22+X^16+X^12+X^11+X^10+X^8+X^7+X^5+X^4+X^2+X^1+X^0
- *
- *  Note that we take it "backwards" and put the highest-order term in
- *  the lowest-order bit.  The X^32 term is "implied"; the LSB is the
- *  X^31 term, etc.  The X^0 term (usually shown as "+1") results in
- *  the MSB being 1
- *
- *  Note that the usual hardware shift register implementation, which
- *  is what we're using (we're merely optimizing it by doing eight-bit
- *  chunks at a time) shifts bits into the lowest-order term.  In our
- *  implementation, that means shifting towards the right.  Why do we
- *  do it this way?  Because the calculated CRC must be transmitted in
- *  order from highest-order term to lowest-order term.  UARTs transmit
- *  characters in order from LSB to MSB.  By storing the CRC this way
- *  we hand it to the UART in the order low-byte to high-byte; the UART
- *  sends each low-bit to hight-bit; and the result is transmission bit
- *  by bit from highest- to lowest-order term without requiring any bit
- *  shuffling on our part.  Reception works similarly
- *
- *  The feedback terms table consists of 256, 32-bit entries.  Notes
- *
- *      The table can be generated at runtime if desired; code to do so
- *      is shown later.  It might not be obvious, but the feedback
- *      terms simply represent the results of eight shift/xor opera
- *      tions for all combinations of data and CRC register values
- *
- *      The values must be right-shifted by eight bits by the "updcrc
- *      logic; the shift must be unsigned (bring in zeroes).  On some
- *      hardware you could probably optimize the shift in assembler by
- *      using byte-swap instructions
- *      polynomial $edb88320
- */
-
-#include <stdint.h>
-
-const uint32_t crc32_table[256] = {
-	0x00000000L, 0x77073096L, 0xee0e612cL, 0x990951baL, 0x076dc419L,
-	0x706af48fL, 0xe963a535L, 0x9e6495a3L, 0x0edb8832L, 0x79dcb8a4L,
-	0xe0d5e91eL, 0x97d2d988L, 0x09b64c2bL, 0x7eb17cbdL, 0xe7b82d07L,
-	0x90bf1d91L, 0x1db71064L, 0x6ab020f2L, 0xf3b97148L, 0x84be41deL,
-	0x1adad47dL, 0x6ddde4ebL, 0xf4d4b551L, 0x83d385c7L, 0x136c9856L,
-	0x646ba8c0L, 0xfd62f97aL, 0x8a65c9ecL, 0x14015c4fL, 0x63066cd9L,
-	0xfa0f3d63L, 0x8d080df5L, 0x3b6e20c8L, 0x4c69105eL, 0xd56041e4L,
-	0xa2677172L, 0x3c03e4d1L, 0x4b04d447L, 0xd20d85fdL, 0xa50ab56bL,
-	0x35b5a8faL, 0x42b2986cL, 0xdbbbc9d6L, 0xacbcf940L, 0x32d86ce3L,
-	0x45df5c75L, 0xdcd60dcfL, 0xabd13d59L, 0x26d930acL, 0x51de003aL,
-	0xc8d75180L, 0xbfd06116L, 0x21b4f4b5L, 0x56b3c423L, 0xcfba9599L,
-	0xb8bda50fL, 0x2802b89eL, 0x5f058808L, 0xc60cd9b2L, 0xb10be924L,
-	0x2f6f7c87L, 0x58684c11L, 0xc1611dabL, 0xb6662d3dL, 0x76dc4190L,
-	0x01db7106L, 0x98d220bcL, 0xefd5102aL, 0x71b18589L, 0x06b6b51fL,
-	0x9fbfe4a5L, 0xe8b8d433L, 0x7807c9a2L, 0x0f00f934L, 0x9609a88eL,
-	0xe10e9818L, 0x7f6a0dbbL, 0x086d3d2dL, 0x91646c97L, 0xe6635c01L,
-	0x6b6b51f4L, 0x1c6c6162L, 0x856530d8L, 0xf262004eL, 0x6c0695edL,
-	0x1b01a57bL, 0x8208f4c1L, 0xf50fc457L, 0x65b0d9c6L, 0x12b7e950L,
-	0x8bbeb8eaL, 0xfcb9887cL, 0x62dd1ddfL, 0x15da2d49L, 0x8cd37cf3L,
-	0xfbd44c65L, 0x4db26158L, 0x3ab551ceL, 0xa3bc0074L, 0xd4bb30e2L,
-	0x4adfa541L, 0x3dd895d7L, 0xa4d1c46dL, 0xd3d6f4fbL, 0x4369e96aL,
-	0x346ed9fcL, 0xad678846L, 0xda60b8d0L, 0x44042d73L, 0x33031de5L,
-	0xaa0a4c5fL, 0xdd0d7cc9L, 0x5005713cL, 0x270241aaL, 0xbe0b1010L,
-	0xc90c2086L, 0x5768b525L, 0x206f85b3L, 0xb966d409L, 0xce61e49fL,
-	0x5edef90eL, 0x29d9c998L, 0xb0d09822L, 0xc7d7a8b4L, 0x59b33d17L,
-	0x2eb40d81L, 0xb7bd5c3bL, 0xc0ba6cadL, 0xedb88320L, 0x9abfb3b6L,
-	0x03b6e20cL, 0x74b1d29aL, 0xead54739L, 0x9dd277afL, 0x04db2615L,
-	0x73dc1683L, 0xe3630b12L, 0x94643b84L, 0x0d6d6a3eL, 0x7a6a5aa8L,
-	0xe40ecf0bL, 0x9309ff9dL, 0x0a00ae27L, 0x7d079eb1L, 0xf00f9344L,
-	0x8708a3d2L, 0x1e01f268L, 0x6906c2feL, 0xf762575dL, 0x806567cbL,
-	0x196c3671L, 0x6e6b06e7L, 0xfed41b76L, 0x89d32be0L, 0x10da7a5aL,
-	0x67dd4accL, 0xf9b9df6fL, 0x8ebeeff9L, 0x17b7be43L, 0x60b08ed5L,
-	0xd6d6a3e8L, 0xa1d1937eL, 0x38d8c2c4L, 0x4fdff252L, 0xd1bb67f1L,
-	0xa6bc5767L, 0x3fb506ddL, 0x48b2364bL, 0xd80d2bdaL, 0xaf0a1b4cL,
-	0x36034af6L, 0x41047a60L, 0xdf60efc3L, 0xa867df55L, 0x316e8eefL,
-	0x4669be79L, 0xcb61b38cL, 0xbc66831aL, 0x256fd2a0L, 0x5268e236L,
-	0xcc0c7795L, 0xbb0b4703L, 0x220216b9L, 0x5505262fL, 0xc5ba3bbeL,
-	0xb2bd0b28L, 0x2bb45a92L, 0x5cb36a04L, 0xc2d7ffa7L, 0xb5d0cf31L,
-	0x2cd99e8bL, 0x5bdeae1dL, 0x9b64c2b0L, 0xec63f226L, 0x756aa39cL,
-	0x026d930aL, 0x9c0906a9L, 0xeb0e363fL, 0x72076785L, 0x05005713L,
-	0x95bf4a82L, 0xe2b87a14L, 0x7bb12baeL, 0x0cb61b38L, 0x92d28e9bL,
-	0xe5d5be0dL, 0x7cdcefb7L, 0x0bdbdf21L, 0x86d3d2d4L, 0xf1d4e242L,
-	0x68ddb3f8L, 0x1fda836eL, 0x81be16cdL, 0xf6b9265bL, 0x6fb077e1L,
-	0x18b74777L, 0x88085ae6L, 0xff0f6a70L, 0x66063bcaL, 0x11010b5cL,
-	0x8f659effL, 0xf862ae69L, 0x616bffd3L, 0x166ccf45L, 0xa00ae278L,
-	0xd70dd2eeL, 0x4e048354L, 0x3903b3c2L, 0xa7672661L, 0xd06016f7L,
-	0x4969474dL, 0x3e6e77dbL, 0xaed16a4aL, 0xd9d65adcL, 0x40df0b66L,
-	0x37d83bf0L, 0xa9bcae53L, 0xdebb9ec5L, 0x47b2cf7fL, 0x30b5ffe9L,
-	0xbdbdf21cL, 0xcabac28aL, 0x53b39330L, 0x24b4a3a6L, 0xbad03605L,
-	0xcdd70693L, 0x54de5729L, 0x23d967bfL, 0xb3667a2eL, 0xc4614ab8L,
-	0x5d681b02L, 0x2a6f2b94L, 0xb40bbe37L, 0xc30c8ea1L, 0x5a05df1bL,
-	0x2d02ef8dL
-};
diff --git a/crc32.h b/crc32.h
deleted file mode 100644
index ee3145b..0000000
--- a/crc32.h
+++ /dev/null
@@ -1,19 +0,0 @@
-#ifndef CRC32_H
-#define CRC32_H
-
-#include <stdint.h>
-
-extern const uint32_t crc32_table[256];
-
-/* Return a 32-bit CRC of the contents of the buffer. */
-
-	static inline uint32_t
-crc32(uint32_t val, const void *ss, int len)
-{
-	const unsigned char *s = ss;
-	while (--len >= 0)
-		val = crc32_table[(val ^ *s++) & 0xff] ^ (val >> 8);
-	return val;
-}
-
-#endif
diff --git a/fec.c b/fec.c
deleted file mode 100644
index 6d9020f..0000000
--- a/fec.c
+++ /dev/null
@@ -1,904 +0,0 @@
-/*
- * fec.c -- forward error correction based on Vandermonde matrices
- * 980624
- * (C) 1997-98 Luigi Rizzo (luigi@iet.unipi.it)
- *
- * Portions derived from code by Phil Karn (karn@ka9q.ampr.org),
- * Robert Morelos-Zaragoza (robert@spectra.eng.hawaii.edu) and Hari
- * Thirumoorthy (harit@spectra.eng.hawaii.edu), Aug 1995
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- *
- * 1. Redistributions of source code must retain the above copyright
- *    notice, this list of conditions and the following disclaimer.
- * 2. Redistributions in binary form must reproduce the above
- *    copyright notice, this list of conditions and the following
- *    disclaimer in the documentation and/or other materials
- *    provided with the distribution.
- *
- * THIS SOFTWARE IS PROVIDED BY THE AUTHORS ``AS IS'' AND
- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
- * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
- * PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHORS
- * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
- * OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
- * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
- * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
- * TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
- * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
- * OF SUCH DAMAGE.
- */
-
-/*
- * The following parameter defines how many bits are used for
- * field elements. The code supports any value from 2 to 16
- * but fastest operation is achieved with 8 bit elements
- * This is the only parameter you may want to change.
- */
-#ifndef GF_BITS
-#define GF_BITS  8	/* code over GF(2**GF_BITS) - change to suit */
-#endif
-
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-
-/*
- * stuff used for testing purposes only
- */
-
-#ifdef	TEST
-#define DEB(x)
-#define DDB(x) x
-#define	DEBUG	0	/* minimal debugging */
-#ifdef	MSDOS
-#include <time.h>
-struct timeval {
-    unsigned long ticks;
-};
-#define gettimeofday(x, dummy) { (x)->ticks = clock() ; }
-#define DIFF_T(a,b) (1+ 1000000*(a.ticks - b.ticks) / CLOCKS_PER_SEC )
-typedef unsigned long u_long ;
-typedef unsigned short u_short ;
-#else /* typically, unix systems */
-#include <sys/time.h>
-#define DIFF_T(a,b) \
-	(1+ 1000000*(a.tv_sec - b.tv_sec) + (a.tv_usec - b.tv_usec) )
-#endif
-
-#define TICK(t) \
-	{struct timeval x ; \
-	gettimeofday(&x, NULL) ; \
-	t = x.tv_usec + 1000000* (x.tv_sec & 0xff ) ; \
-	}
-#define TOCK(t) \
-	{ u_long t1 ; TICK(t1) ; \
-	  if (t1 < t) t = 256000000 + t1 - t ; \
-	  else t = t1 - t ; \
-	  if (t == 0) t = 1 ;}
-	
-u_long ticks[10];	/* vars for timekeeping */
-#else
-#define DEB(x)
-#define DDB(x)
-#define TICK(x)
-#define TOCK(x)
-#endif /* TEST */
-
-/*
- * You should not need to change anything beyond this point.
- * The first part of the file implements linear algebra in GF.
- *
- * gf is the type used to store an element of the Galois Field.
- * Must constain at least GF_BITS bits.
- *
- * Note: unsigned char will work up to GF(256) but int seems to run
- * faster on the Pentium. We use int whenever have to deal with an
- * index, since they are generally faster.
- */
-#if (GF_BITS < 2  && GF_BITS >16)
-#error "GF_BITS must be 2 .. 16"
-#endif
-#if (GF_BITS <= 8)
-typedef unsigned char gf;
-#else
-typedef unsigned short gf;
-#endif
-
-#define	GF_SIZE ((1 << GF_BITS) - 1)	/* powers of \alpha */
-
-/*
- * Primitive polynomials - see Lin & Costello, Appendix A,
- * and  Lee & Messerschmitt, p. 453.
- */
-static char *allPp[] = {    /* GF_BITS	polynomial		*/
-    NULL,		    /*  0	no code			*/
-    NULL,		    /*  1	no code			*/
-    "111",		    /*  2	1+x+x^2			*/
-    "1101",		    /*  3	1+x+x^3			*/
-    "11001",		    /*  4	1+x+x^4			*/
-    "101001",		    /*  5	1+x^2+x^5		*/
-    "1100001",		    /*  6	1+x+x^6			*/
-    "10010001",		    /*  7	1 + x^3 + x^7		*/
-    "101110001",	    /*  8	1+x^2+x^3+x^4+x^8	*/
-    "1000100001",	    /*  9	1+x^4+x^9		*/
-    "10010000001",	    /* 10	1+x^3+x^10		*/
-    "101000000001",	    /* 11	1+x^2+x^11		*/
-    "1100101000001",	    /* 12	1+x+x^4+x^6+x^12	*/
-    "11011000000001",	    /* 13	1+x+x^3+x^4+x^13	*/
-    "110000100010001",	    /* 14	1+x+x^6+x^10+x^14	*/
-    "1100000000000001",	    /* 15	1+x+x^15		*/
-    "11010000000010001"	    /* 16	1+x+x^3+x^12+x^16	*/
-};
-
-
-/*
- * To speed up computations, we have tables for logarithm, exponent
- * and inverse of a number. If GF_BITS <= 8, we use a table for
- * multiplication as well (it takes 64K, no big deal even on a PDA,
- * especially because it can be pre-initialized an put into a ROM!),
- * otherwhise we use a table of logarithms.
- * In any case the macro gf_mul(x,y) takes care of multiplications.
- */
-
-static gf gf_exp[2*GF_SIZE];	/* index->poly form conversion table	*/
-static int gf_log[GF_SIZE + 1];	/* Poly->index form conversion table	*/
-static gf inverse[GF_SIZE+1];	/* inverse of field elem.		*/
-				/* inv[\alpha**i]=\alpha**(GF_SIZE-i-1)	*/
-
-/*
- * modnn(x) computes x % GF_SIZE, where GF_SIZE is 2**GF_BITS - 1,
- * without a slow divide.
- */
-static inline gf
-modnn(int x)
-{
-    while (x >= GF_SIZE) {
-	x -= GF_SIZE;
-	x = (x >> GF_BITS) + (x & GF_SIZE);
-    }
-    return x;
-}
-
-#define SWAP(a,b,t) {t tmp; tmp=a; a=b; b=tmp;}
-
-/*
- * gf_mul(x,y) multiplies two numbers. If GF_BITS<=8, it is much
- * faster to use a multiplication table.
- *
- * USE_GF_MULC, GF_MULC0(c) and GF_ADDMULC(x) can be used when multiplying
- * many numbers by the same constant. In this case the first
- * call sets the constant, and others perform the multiplications.
- * A value related to the multiplication is held in a local variable
- * declared with USE_GF_MULC . See usage in addmul1().
- */
-#if (GF_BITS <= 8)
-static gf gf_mul_table[GF_SIZE + 1][GF_SIZE + 1];
-
-#define gf_mul(x,y) gf_mul_table[x][y]
-
-#define USE_GF_MULC register gf * __gf_mulc_
-#define GF_MULC0(c) __gf_mulc_ = gf_mul_table[c]
-#define GF_ADDMULC(dst, x) dst ^= __gf_mulc_[x]
-
-static void
-init_mul_table()
-{
-    int i, j;
-    for (i=0; i< GF_SIZE+1; i++)
-	for (j=0; j< GF_SIZE+1; j++)
-	    gf_mul_table[i][j] = gf_exp[modnn(gf_log[i] + gf_log[j]) ] ;
-
-    for (j=0; j< GF_SIZE+1; j++)
-	    gf_mul_table[0][j] = gf_mul_table[j][0] = 0;
-}
-#else	/* GF_BITS > 8 */
-static inline gf
-gf_mul(x,y)
-{
-    if ( (x) == 0 || (y)==0 ) return 0;
-     
-    return gf_exp[gf_log[x] + gf_log[y] ] ;
-}
-#define init_mul_table()
-
-#define USE_GF_MULC register gf * __gf_mulc_
-#define GF_MULC0(c) __gf_mulc_ = &gf_exp[ gf_log[c] ]
-#define GF_ADDMULC(dst, x) { if (x) dst ^= __gf_mulc_[ gf_log[x] ] ; }
-#endif
-
-/*
- * Generate GF(2**m) from the irreducible polynomial p(X) in p[0]..p[m]
- * Lookup tables:
- *     index->polynomial form		gf_exp[] contains j= \alpha^i;
- *     polynomial form -> index form	gf_log[ j = \alpha^i ] = i
- * \alpha=x is the primitive element of GF(2^m)
- *
- * For efficiency, gf_exp[] has size 2*GF_SIZE, so that a simple
- * multiplication of two numbers can be resolved without calling modnn
- */
-
-/*
- * i use malloc so many times, it is easier to put checks all in
- * one place.
- */
-static void *
-my_malloc(int sz, char *err_string)
-{
-    void *p = malloc( sz );
-    if (p == NULL) {
-	fprintf(stderr, "-- malloc failure allocating %s\n", err_string);
-	exit(1) ;
-    }
-    return p ;
-}
-
-#define NEW_GF_MATRIX(rows, cols) \
-    (gf *)my_malloc(rows * cols * sizeof(gf), " ## __LINE__ ## " )
-
-/*
- * initialize the data structures used for computations in GF.
- */
-static void
-generate_gf(void)
-{
-    int i;
-    gf mask;
-    char *Pp =  allPp[GF_BITS] ;
-
-    mask = 1;	/* x ** 0 = 1 */
-    gf_exp[GF_BITS] = 0; /* will be updated at the end of the 1st loop */
-    /*
-     * first, generate the (polynomial representation of) powers of \alpha,
-     * which are stored in gf_exp[i] = \alpha ** i .
-     * At the same time build gf_log[gf_exp[i]] = i .
-     * The first GF_BITS powers are simply bits shifted to the left.
-     */
-    for (i = 0; i < GF_BITS; i++, mask <<= 1 ) {
-	gf_exp[i] = mask;
-	gf_log[gf_exp[i]] = i;
-	/*
-	 * If Pp[i] == 1 then \alpha ** i occurs in poly-repr
-	 * gf_exp[GF_BITS] = \alpha ** GF_BITS
-	 */
-	if ( Pp[i] == '1' )
-	    gf_exp[GF_BITS] ^= mask;
-    }
-    /*
-     * now gf_exp[GF_BITS] = \alpha ** GF_BITS is complete, so can als
-     * compute its inverse.
-     */
-    gf_log[gf_exp[GF_BITS]] = GF_BITS;
-    /*
-     * Poly-repr of \alpha ** (i+1) is given by poly-repr of
-     * \alpha ** i shifted left one-bit and accounting for any
-     * \alpha ** GF_BITS term that may occur when poly-repr of
-     * \alpha ** i is shifted.
-     */
-    mask = 1 << (GF_BITS - 1 ) ;
-    for (i = GF_BITS + 1; i < GF_SIZE; i++) {
-	if (gf_exp[i - 1] >= mask)
-	    gf_exp[i] = gf_exp[GF_BITS] ^ ((gf_exp[i - 1] ^ mask) << 1);
-	else
-	    gf_exp[i] = gf_exp[i - 1] << 1;
-	gf_log[gf_exp[i]] = i;
-    }
-    /*
-     * log(0) is not defined, so use a special value
-     */
-    gf_log[0] =	GF_SIZE ;
-    /* set the extended gf_exp values for fast multiply */
-    for (i = 0 ; i < GF_SIZE ; i++)
-	gf_exp[i + GF_SIZE] = gf_exp[i] ;
-
-    /*
-     * again special cases. 0 has no inverse. This used to
-     * be initialized to GF_SIZE, but it should make no difference
-     * since noone is supposed to read from here.
-     */
-    inverse[0] = 0 ;
-    inverse[1] = 1;
-    for (i=2; i<=GF_SIZE; i++)
-	inverse[i] = gf_exp[GF_SIZE-gf_log[i]];
-}
-
-/*
- * Various linear algebra operations that i use often.
- */
-
-/*
- * addmul() computes dst[] = dst[] + c * src[]
- * This is used often, so better optimize it! Currently the loop is
- * unrolled 16 times, a good value for 486 and pentium-class machines.
- * The case c=0 is also optimized, whereas c=1 is not. These
- * calls are unfrequent in my typical apps so I did not bother.
- * 
- * Note that gcc on
- */
-#define addmul(dst, src, c, sz) \
-    if (c != 0) addmul1(dst, src, c, sz)
-
-#define UNROLL 16 /* 1, 4, 8, 16 */
-static void
-addmul1(gf *dst1, gf *src1, gf c, int sz)
-{
-    USE_GF_MULC ;
-    register gf *dst = dst1, *src = src1 ;
-    gf *lim = &dst[sz - UNROLL + 1] ;
-
-    GF_MULC0(c) ;
-
-#if (UNROLL > 1) /* unrolling by 8/16 is quite effective on the pentium */
-    for (; dst < lim ; dst += UNROLL, src += UNROLL ) {
-	GF_ADDMULC( dst[0] , src[0] );
-	GF_ADDMULC( dst[1] , src[1] );
-	GF_ADDMULC( dst[2] , src[2] );
-	GF_ADDMULC( dst[3] , src[3] );
-#if (UNROLL > 4)
-	GF_ADDMULC( dst[4] , src[4] );
-	GF_ADDMULC( dst[5] , src[5] );
-	GF_ADDMULC( dst[6] , src[6] );
-	GF_ADDMULC( dst[7] , src[7] );
-#endif
-#if (UNROLL > 8)
-	GF_ADDMULC( dst[8] , src[8] );
-	GF_ADDMULC( dst[9] , src[9] );
-	GF_ADDMULC( dst[10] , src[10] );
-	GF_ADDMULC( dst[11] , src[11] );
-	GF_ADDMULC( dst[12] , src[12] );
-	GF_ADDMULC( dst[13] , src[13] );
-	GF_ADDMULC( dst[14] , src[14] );
-	GF_ADDMULC( dst[15] , src[15] );
-#endif
-    }
-#endif
-    lim += UNROLL - 1 ;
-    for (; dst < lim; dst++, src++ )		/* final components */
-	GF_ADDMULC( *dst , *src );
-}
-
-/*
- * computes C = AB where A is n*k, B is k*m, C is n*m
- */
-static void
-matmul(gf *a, gf *b, gf *c, int n, int k, int m)
-{
-    int row, col, i ;
-
-    for (row = 0; row < n ; row++) {
-	for (col = 0; col < m ; col++) {
-	    gf *pa = &a[ row * k ];
-	    gf *pb = &b[ col ];
-	    gf acc = 0 ;
-	    for (i = 0; i < k ; i++, pa++, pb += m )
-		acc ^= gf_mul( *pa, *pb ) ;
-	    c[ row * m + col ] = acc ;
-	}
-    }
-}
-
-#ifdef DEBUG
-/*
- * returns 1 if the square matrix is identiy
- * (only for test)
- */
-static int
-is_identity(gf *m, int k)
-{
-    int row, col ;
-    for (row=0; row<k; row++)
-	for (col=0; col<k; col++)
-	    if ( (row==col && *m != 1) ||
-		 (row!=col && *m != 0) )
-		 return 0 ;
-	    else
-		m++ ;
-    return 1 ;
-}
-#endif /* debug */
-
-/*
- * invert_mat() takes a matrix and produces its inverse
- * k is the size of the matrix.
- * (Gauss-Jordan, adapted from Numerical Recipes in C)
- * Return non-zero if singular.
- */
-DEB( int pivloops=0; int pivswaps=0 ; /* diagnostic */)
-static int
-invert_mat(gf *src, int k)
-{
-    gf c, *p ;
-    int irow, icol, row, col, i, ix ;
-
-    int error = 1 ;
-    int *indxc = my_malloc(k*sizeof(int), "indxc");
-    int *indxr = my_malloc(k*sizeof(int), "indxr");
-    int *ipiv = my_malloc(k*sizeof(int), "ipiv");
-    gf *id_row = NEW_GF_MATRIX(1, k);
-    gf *temp_row = NEW_GF_MATRIX(1, k);
-
-    memset(id_row, '\0', k*sizeof(gf));
-    DEB( pivloops=0; pivswaps=0 ; /* diagnostic */ )
-    /*
-     * ipiv marks elements already used as pivots.
-     */
-    for (i = 0; i < k ; i++)
-	ipiv[i] = 0 ;
-
-    for (col = 0; col < k ; col++) {
-	gf *pivot_row ;
-	/*
-	 * Zeroing column 'col', look for a non-zero element.
-	 * First try on the diagonal, if it fails, look elsewhere.
-	 */
-	irow = icol = -1 ;
-	if (ipiv[col] != 1 && src[col*k + col] != 0) {
-	    irow = col ;
-	    icol = col ;
-	    goto found_piv ;
-	}
-	for (row = 0 ; row < k ; row++) {
-	    if (ipiv[row] != 1) {
-		for (ix = 0 ; ix < k ; ix++) {
-		    DEB( pivloops++ ; )
-		    if (ipiv[ix] == 0) {
-			if (src[row*k + ix] != 0) {
-			    irow = row ;
-			    icol = ix ;
-			    goto found_piv ;
-			}
-		    } else if (ipiv[ix] > 1) {
-			fprintf(stderr, "singular matrix\n");
-			goto fail ; 
-		    }
-		}
-	    }
-	}
-	if (icol == -1) {
-	    fprintf(stderr, "XXX pivot not found!\n");
-	    goto fail ;
-	}
-found_piv:
-	++(ipiv[icol]) ;
-	/*
-	 * swap rows irow and icol, so afterwards the diagonal
-	 * element will be correct. Rarely done, not worth
-	 * optimizing.
-	 */
-	if (irow != icol) {
-	    for (ix = 0 ; ix < k ; ix++ ) {
-		SWAP( src[irow*k + ix], src[icol*k + ix], gf) ;
-	    }
-	}
-	indxr[col] = irow ;
-	indxc[col] = icol ;
-	pivot_row = &src[icol*k] ;
-	c = pivot_row[icol] ;
-	if (c == 0) {
-	    fprintf(stderr, "singular matrix 2\n");
-	    goto fail ;
-	}
-	if (c != 1 ) { /* otherwhise this is a NOP */
-	    /*
-	     * this is done often , but optimizing is not so
-	     * fruitful, at least in the obvious ways (unrolling)
-	     */
-	    DEB( pivswaps++ ; )
-	    c = inverse[ c ] ;
-	    pivot_row[icol] = 1 ;
-	    for (ix = 0 ; ix < k ; ix++ )
-		pivot_row[ix] = gf_mul(c, pivot_row[ix] );
-	}
-	/*
-	 * from all rows, remove multiples of the selected row
-	 * to zero the relevant entry (in fact, the entry is not zero
-	 * because we know it must be zero).
-	 * (Here, if we know that the pivot_row is the identity,
-	 * we can optimize the addmul).
-	 */
-	id_row[icol] = 1;
-	if (memcmp(pivot_row, id_row, k*sizeof(gf)) != 0) {
-	    for (p = src, ix = 0 ; ix < k ; ix++, p += k ) {
-		if (ix != icol) {
-		    c = p[icol] ;
-		    p[icol] = 0 ;
-		    addmul(p, pivot_row, c, k );
-		}
-	    }
-	}
-	id_row[icol] = 0;
-    } /* done all columns */
-    for (col = k-1 ; col >= 0 ; col-- ) {
-	if (indxr[col] <0 || indxr[col] >= k)
-	    fprintf(stderr, "AARGH, indxr[col] %d\n", indxr[col]);
-	else if (indxc[col] <0 || indxc[col] >= k)
-	    fprintf(stderr, "AARGH, indxc[col] %d\n", indxc[col]);
-	else
-	if (indxr[col] != indxc[col] ) {
-	    for (row = 0 ; row < k ; row++ ) {
-		SWAP( src[row*k + indxr[col]], src[row*k + indxc[col]], gf) ;
-	    }
-	}
-    }
-    error = 0 ;
-fail:
-    free(indxc);
-    free(indxr);
-    free(ipiv);
-    free(id_row);
-    free(temp_row);
-    return error ;
-}
-
-/*
- * fast code for inverting a vandermonde matrix.
- * XXX NOTE: It assumes that the matrix
- * is not singular and _IS_ a vandermonde matrix. Only uses
- * the second column of the matrix, containing the p_i's.
- *
- * Algorithm borrowed from "Numerical recipes in C" -- sec.2.8, but
- * largely revised for my purposes.
- * p = coefficients of the matrix (p_i)
- * q = values of the polynomial (known)
- */
-
-int
-invert_vdm(gf *src, int k)
-{
-    int i, j, row, col ;
-    gf *b, *c, *p;
-    gf t, xx ;
-
-    if (k == 1) 	/* degenerate case, matrix must be p^0 = 1 */
-	return 0 ;
-    /*
-     * c holds the coefficient of P(x) = Prod (x - p_i), i=0..k-1
-     * b holds the coefficient for the matrix inversion
-     */
-    c = NEW_GF_MATRIX(1, k);
-    b = NEW_GF_MATRIX(1, k);
-
-    p = NEW_GF_MATRIX(1, k);
-   
-    for ( j=1, i = 0 ; i < k ; i++, j+=k ) {
-	c[i] = 0 ;
-	p[i] = src[j] ;    /* p[i] */
-    }
-    /*
-     * construct coeffs. recursively. We know c[k] = 1 (implicit)
-     * and start P_0 = x - p_0, then at each stage multiply by
-     * x - p_i generating P_i = x P_{i-1} - p_i P_{i-1}
-     * After k steps we are done.
-     */
-    c[k-1] = p[0] ;	/* really -p(0), but x = -x in GF(2^m) */
-    for (i = 1 ; i < k ; i++ ) {
-	gf p_i = p[i] ; /* see above comment */
-	for (j = k-1  - ( i - 1 ) ; j < k-1 ; j++ )
-	    c[j] ^= gf_mul( p_i, c[j+1] ) ;
-	c[k-1] ^= p_i ;
-    }
-
-    for (row = 0 ; row < k ; row++ ) {
-	/*
-	 * synthetic division etc.
-	 */
-	xx = p[row] ;
-	t = 1 ;
-	b[k-1] = 1 ; /* this is in fact c[k] */
-	for (i = k-2 ; i >= 0 ; i-- ) {
-	    b[i] = c[i+1] ^ gf_mul(xx, b[i+1]) ;
-	    t = gf_mul(xx, t) ^ b[i] ;
-	}
-	for (col = 0 ; col < k ; col++ )
-	    src[col*k + row] = gf_mul(inverse[t], b[col] );
-    }
-    free(c) ;
-    free(b) ;
-    free(p) ;
-    return 0 ;
-}
-
-static int fec_initialized = 0 ;
-static void
-init_fec()
-{
-    TICK(ticks[0]);
-    generate_gf();
-    TOCK(ticks[0]);
-    DDB(fprintf(stderr, "generate_gf took %ldus\n", ticks[0]);)
-    TICK(ticks[0]);
-    init_mul_table();
-    TOCK(ticks[0]);
-    DDB(fprintf(stderr, "init_mul_table took %ldus\n", ticks[0]);)
-    fec_initialized = 1 ;
-}
-
-/*
- * This section contains the proper FEC encoding/decoding routines.
- * The encoding matrix is computed starting with a Vandermonde matrix,
- * and then transforming it into a systematic matrix.
- */
-
-#define FEC_MAGIC	0xFECC0DEC
-
-struct fec_parms {
-    u_long magic ;
-    int k, n ;		/* parameters of the code */
-    gf *enc_matrix ;
-} ;
-
-void
-fec_free(struct fec_parms *p)
-{
-    if (p==NULL ||
-       p->magic != ( ( (FEC_MAGIC ^ p->k) ^ p->n) ^ (int)(p->enc_matrix)) ) {
-	fprintf(stderr, "bad parameters to fec_free\n");
-	return ;
-    }
-    free(p->enc_matrix);
-    free(p);
-}
-
-/*
- * create a new encoder, returning a descriptor. This contains k,n and
- * the encoding matrix.
- */
-struct fec_parms *
-fec_new(int k, int n)
-{
-    int row, col ;
-    gf *p, *tmp_m ;
-
-    struct fec_parms *retval ;
-
-    if (fec_initialized == 0)
-	init_fec();
-
-    if (k > GF_SIZE + 1 || n > GF_SIZE + 1 || k > n ) {
-	fprintf(stderr, "Invalid parameters k %d n %d GF_SIZE %d\n",
-		k, n, GF_SIZE );
-	return NULL ;
-    }
-    retval = my_malloc(sizeof(struct fec_parms), "new_code");
-    retval->k = k ;
-    retval->n = n ;
-    retval->enc_matrix = NEW_GF_MATRIX(n, k);
-    retval->magic = ( ( FEC_MAGIC ^ k) ^ n) ^ (int)(retval->enc_matrix) ;
-    tmp_m = NEW_GF_MATRIX(n, k);
-    /*
-     * fill the matrix with powers of field elements, starting from 0.
-     * The first row is special, cannot be computed with exp. table.
-     */
-    tmp_m[0] = 1 ;
-    for (col = 1; col < k ; col++)
-	tmp_m[col] = 0 ;
-    for (p = tmp_m + k, row = 0; row < n-1 ; row++, p += k) {
-	for ( col = 0 ; col < k ; col ++ )
-	    p[col] = gf_exp[modnn(row*col)];
-    }
-
-    /*
-     * quick code to build systematic matrix: invert the top
-     * k*k vandermonde matrix, multiply right the bottom n-k rows
-     * by the inverse, and construct the identity matrix at the top.
-     */
-    TICK(ticks[3]);
-    invert_vdm(tmp_m, k); /* much faster than invert_mat */
-    matmul(tmp_m + k*k, tmp_m, retval->enc_matrix + k*k, n - k, k, k);
-    /*
-     * the upper matrix is I so do not bother with a slow multiply
-     */
-    memset(retval->enc_matrix, '\0', k*k*sizeof(gf) );
-    for (p = retval->enc_matrix, col = 0 ; col < k ; col++, p += k+1 )
-	*p = 1 ;
-    free(tmp_m);
-    TOCK(ticks[3]);
-
-    DDB(fprintf(stderr, "--- %ld us to build encoding matrix\n",
-	    ticks[3]);)
-    DEB(pr_matrix(retval->enc_matrix, n, k, "encoding_matrix");)
-    return retval ;
-}
-
-/*
- * fec_encode accepts as input pointers to n data packets of size sz,
- * and produces as output a packet pointed to by fec, computed
- * with index "index".
- */
-void
-fec_encode(struct fec_parms *code, gf *src[], gf *fec, int index, int sz)
-{
-    int i, k = code->k ;
-    gf *p ;
-
-    if (GF_BITS > 8)
-	sz /= 2 ;
-
-    if (index < k)
-         memcpy(fec, src[index], sz*sizeof(gf) ) ;
-    else if (index < code->n) {
-	p = &(code->enc_matrix[index*k] );
-	memset(fec, '\0', sz*sizeof(gf));
-	for (i = 0; i < k ; i++)
-	    addmul(fec, src[i], p[i], sz ) ;
-    } else
-	fprintf(stderr, "Invalid index %d (max %d)\n",
-	    index, code->n - 1 );
-}
-
-void fec_encode_linear(struct fec_parms *code, gf *src, gf *fec, int index, int sz)
-{
-    int i, k = code->k ;
-    gf *p ;
-
-    if (GF_BITS > 8)
-	sz /= 2 ;
-
-    if (index < k)
-	    memcpy(fec, src + (index * sz), sz*sizeof(gf) ) ;
-    else if (index < code->n) {
-	p = &(code->enc_matrix[index*k] );
-	memset(fec, '\0', sz*sizeof(gf));
-	for (i = 0; i < k ; i++)
-	    addmul(fec, src + (i * sz), p[i], sz ) ;
-    } else
-	fprintf(stderr, "Invalid index %d (max %d)\n",
-	    index, code->n - 1 );
-}
-/*
- * shuffle move src packets in their position
- */
-static int
-shuffle(gf *pkt[], int index[], int k)
-{
-    int i;
-
-    for ( i = 0 ; i < k ; ) {
-	if (index[i] >= k || index[i] == i)
-	    i++ ;
-	else {
-	    /*
-	     * put pkt in the right position (first check for conflicts).
-	     */
-	    int c = index[i] ;
-
-	    if (index[c] == c) {
-		DEB(fprintf(stderr, "\nshuffle, error at %d\n", i);)
-		return 1 ;
-	    }
-	    SWAP(index[i], index[c], int) ;
-	    SWAP(pkt[i], pkt[c], gf *) ;
-	}
-    }
-    DEB( /* just test that it works... */
-    for ( i = 0 ; i < k ; i++ ) {
-	if (index[i] < k && index[i] != i) {
-	    fprintf(stderr, "shuffle: after\n");
-	    for (i=0; i<k ; i++) fprintf(stderr, "%3d ", index[i]);
-	    fprintf(stderr, "\n");
-	    return 1 ;
-	}
-    }
-    )
-    return 0 ;
-}
-
-/*
- * build_decode_matrix constructs the encoding matrix given the
- * indexes. The matrix must be already allocated as
- * a vector of k*k elements, in row-major order
- */
-static gf *
-build_decode_matrix(struct fec_parms *code, gf *pkt[], int index[])
-{
-    int i , k = code->k ;
-    gf *p, *matrix = NEW_GF_MATRIX(k, k);
-
-    TICK(ticks[9]);
-    for (i = 0, p = matrix ; i < k ; i++, p += k ) {
-#if 1 /* this is simply an optimization, not very useful indeed */
-	if (index[i] < k) {
-	    memset(p, '\0', k*sizeof(gf) );
-	    p[i] = 1 ;
-	} else
-#endif
-	if (index[i] < code->n )
-	    memcpy(p,  &(code->enc_matrix[index[i]*k]), k*sizeof(gf) ); 
-	else {
-	    fprintf(stderr, "decode: invalid index %d (max %d)\n",
-		index[i], code->n - 1 );
-	    free(matrix) ;
-	    return NULL ;
-	}
-    }
-    TICK(ticks[9]);
-    if (invert_mat(matrix, k)) {
-	free(matrix);
-	matrix = NULL ;
-    }
-    TOCK(ticks[9]);
-    return matrix ;
-}
-
-/*
- * fec_decode receives as input a vector of packets, the indexes of
- * packets, and produces the correct vector as output.
- *
- * Input:
- *	code: pointer to code descriptor
- *	pkt:  pointers to received packets. They are modified
- *	      to store the output packets (in place)
- *	index: pointer to packet indexes (modified)
- *	sz:    size of each packet
- */
-int
-fec_decode(struct fec_parms *code, gf *pkt[], int index[], int sz)
-{
-    gf *m_dec ; 
-    gf **new_pkt ;
-    int row, col , k = code->k ;
-
-    if (GF_BITS > 8)
-	sz /= 2 ;
-
-    if (shuffle(pkt, index, k))	/* error if true */
-	return 1 ;
-    m_dec = build_decode_matrix(code, pkt, index);
-
-    if (m_dec == NULL)
-	return 1 ; /* error */
-    /*
-     * do the actual decoding
-     */
-    new_pkt = my_malloc (k * sizeof (gf * ), "new pkt pointers" );
-    for (row = 0 ; row < k ; row++ ) {
-	if (index[row] >= k) {
-	    new_pkt[row] = my_malloc (sz * sizeof (gf), "new pkt buffer" );
-	    memset(new_pkt[row], '\0', sz * sizeof(gf) ) ;
-	    for (col = 0 ; col < k ; col++ )
-		addmul(new_pkt[row], pkt[col], m_dec[row*k + col], sz) ;
-	}
-    }
-    /*
-     * move pkts to their final destination
-     */
-    for (row = 0 ; row < k ; row++ ) {
-	if (index[row] >= k) {
-	    memcpy(pkt[row], new_pkt[row], sz*sizeof(gf));
-	    free(new_pkt[row]);
-	}
-    }
-    free(new_pkt);
-    free(m_dec);
-
-    return 0;
-}
-
-/*********** end of FEC code -- beginning of test code ************/
-
-#if (TEST || DEBUG)
-void
-test_gf()
-{
-    int i ;
-    /*
-     * test gf tables. Sufficiently tested...
-     */
-    for (i=0; i<= GF_SIZE; i++) {
-        if (gf_exp[gf_log[i]] != i)
-	    fprintf(stderr, "bad exp/log i %d log %d exp(log) %d\n",
-		i, gf_log[i], gf_exp[gf_log[i]]);
-
-        if (i != 0 && gf_mul(i, inverse[i]) != 1)
-	    fprintf(stderr, "bad mul/inv i %d inv %d i*inv(i) %d\n",
-		i, inverse[i], gf_mul(i, inverse[i]) );
-	if (gf_mul(0,i) != 0)
-	    fprintf(stderr, "bad mul table 0,%d\n",i);
-	if (gf_mul(i,0) != 0)
-	    fprintf(stderr, "bad mul table %d,0\n",i);
-    }
-}
-#endif /* TEST */
diff --git a/include/common.h b/include/common.h
new file mode 100644
index 0000000..d14cb48
--- /dev/null
+++ b/include/common.h
@@ -0,0 +1,87 @@
+/*
+ * Copyright (c) Artem Bityutskiy, 2007, 2008
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+#ifndef __UBI_UTILS_COMMON_H__
+#define __UBI_UTILS_COMMON_H__
+
+#include <stdio.h>
+#include <ctype.h>
+#include <string.h>
+#include <errno.h>
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+#define MIN(a ,b) ((a) < (b) ? (a) : (b))
+#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
+
+/* Verbose messages */
+#define verbose(verbose, fmt, ...) do {                            \
+	if (verbose)                                               \
+		printf(PROGRAM_NAME ": " fmt "\n", ##__VA_ARGS__); \
+} while(0)
+
+/* Normal messages */
+#define normsg(fmt, ...) do {                              \
+	printf(PROGRAM_NAME ": " fmt "\n", ##__VA_ARGS__); \
+} while(0)
+#define normsg_cont(fmt, ...) do {                    \
+	printf(PROGRAM_NAME ": " fmt, ##__VA_ARGS__); \
+} while(0)
+#define normsg_cont(fmt, ...) do {                         \
+	printf(PROGRAM_NAME ": " fmt, ##__VA_ARGS__);      \
+} while(0)
+
+/* Error messages */
+#define errmsg(fmt, ...)  ({                                                \
+	fprintf(stderr, PROGRAM_NAME ": error!: " fmt "\n", ##__VA_ARGS__); \
+	-1;                                                                 \
+})
+
+/* System error messages */
+#define sys_errmsg(fmt, ...)  ({                                            \
+	int _err = errno;                                                   \
+	size_t _i;                                                           \
+	fprintf(stderr, PROGRAM_NAME ": error!: " fmt "\n", ##__VA_ARGS__); \
+	for (_i = 0; _i < sizeof(PROGRAM_NAME) + 1; _i++)                   \
+		fprintf(stderr, " ");                                       \
+	fprintf(stderr, "error %d (%s)\n", _err, strerror(_err));           \
+	-1;                                                                 \
+})
+
+/* Warnings */
+#define warnmsg(fmt, ...) do {                                                \
+	fprintf(stderr, PROGRAM_NAME ": warning!: " fmt "\n", ##__VA_ARGS__); \
+} while(0)
+
+static inline int is_power_of_2(unsigned long long n)
+{
+	        return (n != 0 && ((n & (n - 1)) == 0));
+}
+
+long long ubiutils_get_bytes(const char *str);
+void ubiutils_print_bytes(long long bytes, int bracket);
+void ubiutils_print_text(FILE *stream, const char *txt, int len);
+int ubiutils_srand(void);
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif /* !__UBI_UTILS_COMMON_H__ */
diff --git a/include/crc32.h b/include/crc32.h
new file mode 100644
index 0000000..86fc841
--- /dev/null
+++ b/include/crc32.h
@@ -0,0 +1,22 @@
+/*
+ * This code was taken from the linux kernel. The license is GPL Version 2.
+ */
+
+#ifndef __CRC32_H__
+#define __CRC32_H__
+
+#include <stdint.h>
+
+extern const uint32_t crc32_table[256];
+
+/* Return a 32-bit CRC of the contents of the buffer. */
+static inline uint32_t ubifs_crc32(uint32_t val, const void *ss, int len)
+{
+	const unsigned char *s = ss;
+
+	while (--len >= 0)
+		val = crc32_table[(val ^ *s++) & 0xff] ^ (val >> 8);
+	return val;
+}
+
+#endif /* __CRC32_H__ */
diff --git a/include/libmtd.h b/include/libmtd.h
new file mode 100644
index 0000000..0aea966
--- /dev/null
+++ b/include/libmtd.h
@@ -0,0 +1,246 @@
+/*
+ * Copyright (C) 2008, 2009 Nokia Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *
+ * Author: Artem Bityutskiy
+ *
+ * MTD library.
+ */
+
+#ifndef __LIBMTD_H__
+#define __LIBMTD_H__
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+/* Maximum MTD device name length */
+#define MTD_NAME_MAX 127
+/* Maximum MTD device type string length */
+#define MTD_TYPE_MAX 64
+
+/* MTD library descriptor */
+typedef void * libmtd_t;
+
+/**
+ * @mtd_dev_cnt: count of MTD devices in system
+ * @lowest_mtd_num: lowest MTD device number in system
+ * @highest_mtd_num: highest MTD device number in system
+ * @sysfs_supported: non-zero if sysfs is supported by MTD
+ */
+struct mtd_info
+{
+	int mtd_dev_cnt;
+	int lowest_mtd_num;
+	int highest_mtd_num;
+	unsigned int sysfs_supported:1;
+};
+
+/**
+ * struct mtd_dev_info - information about an MTD device.
+ * @mtd_num: MTD device number
+ * @major: major number of corresponding character device
+ * @minor: minor number of corresponding character device
+ * @type: flash type (constants like %MTD_NANDFLASH defined in mtd-abi.h)
+ * @type_str: static R/O flash type string
+ * @name: device name
+ * @size: device size in bytes
+ * @eb_cnt: count of eraseblocks
+ * @eb_size: eraseblock size
+ * @min_io_size: minimum input/output unit size
+ * @subpage_size: sub-page size
+ * @oob_size: OOB size (zero if the device does not have OOB area)
+ * @region_cnt: count of additional erase regions
+ * @writable: zero if the device is read-only
+ * @bb_allowed: non-zero if the MTD device may have bad eraseblocks
+ */
+struct mtd_dev_info
+{
+	int mtd_num;
+	int major;
+	int minor;
+	int type;
+	const char type_str[MTD_TYPE_MAX + 1];
+	const char name[MTD_NAME_MAX + 1];
+	long long size;
+	int eb_cnt;
+	int eb_size;
+	int min_io_size;
+	int subpage_size;
+	int oob_size;
+	int region_cnt;
+	unsigned int writable:1;
+	unsigned int bb_allowed:1;
+};
+
+/**
+ * libmtd_open - open MTD library.
+ *
+ * This function initializes and opens the MTD library and returns MTD library
+ * descriptor in case of success and %NULL in case of failure. In case of
+ * failure, errno contains zero if MTD is not present in the system, or
+ * contains the error code if a real error happened.
+ */
+libmtd_t libmtd_open(void);
+
+/**
+ * libmtd_close - close MTD library.
+ * @desc: MTD library descriptor
+ */
+void libmtd_close(libmtd_t desc);
+
+/**
+ * mtd_get_info - get general MTD information.
+ * @desc: MTD library descriptor
+ * @info: the MTD device information is returned here
+ *
+ * This function fills the passed @info object with general MTD information and
+ * returns %0 in case of success and %-1 in case of failure. If MTD subsystem is
+ * not present in the system, errno is set to @ENODEV.
+ */
+int mtd_get_info(libmtd_t desc, struct mtd_info *info);
+
+/**
+ * mtd_get_dev_info - get information about an MTD device.
+ * @desc: MTD library descriptor
+ * @node: name of the MTD device node
+ * @mtd: the MTD device information is returned here
+ *
+ * This function gets information about MTD device defined by the @node device
+ * node file and saves this information in the @mtd object. Returns %0 in case
+ * of success and %-1 in case of failure. If MTD subsystem is not present in the
+ * system, or the MTD device does not exist, errno is set to @ENODEV.
+ */
+int mtd_get_dev_info(libmtd_t desc, const char *node, struct mtd_dev_info *mtd);
+
+/**
+ * mtd_get_dev_info1 - get information about an MTD device.
+ * @desc: MTD library descriptor
+ * @mtd_num: MTD device number to fetch information about
+ * @mtd: the MTD device information is returned here
+ *
+ * This function is identical to 'mtd_get_dev_info()' except that it accepts
+ * MTD device number, not MTD character device.
+ */
+int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd);
+
+/**
+ * mtd_erase - erase an eraseblock.
+ * @mtd: MTD device description object
+ * @fd: MTD device node file descriptor
+ * @eb: eraseblock to erase
+ *
+ * This function erases eraseblock @eb of MTD device described by @fd. Returns
+ * %0 in case of success and %-1 in case of failure.
+ */
+int mtd_erase(const struct mtd_dev_info *mtd, int fd, int eb);
+
+/**
+ * mtd_torture - torture an eraseblock.
+ * @mtd: MTD device description object
+ * @fd: MTD device node file descriptor
+ * @eb: eraseblock to torture
+ *
+ * This function tortures eraseblock @eb. Returns %0 in case of success and %-1
+ * in case of failure.
+ */
+int mtd_torture(const struct mtd_dev_info *mtd, int fd, int eb);
+
+/**
+ * mtd_is_bad - check if eraseblock is bad.
+ * @mtd: MTD device description object
+ * @fd: MTD device node file descriptor
+ * @eb: eraseblock to check
+ *
+ * This function checks if eraseblock @eb is bad. Returns %0 if not, %1 if yes,
+ * and %-1 in case of failure.
+ */
+int mtd_is_bad(const struct mtd_dev_info *mtd, int fd, int eb);
+
+/**
+ * mtd_mark_bad - mark an eraseblock as bad.
+ * @mtd: MTD device description object
+ * @fd: MTD device node file descriptor
+ * @eb: eraseblock to mark as bad
+ *
+ * This function marks eraseblock @eb as bad. Returns %0 in case of success and
+ * %-1 in case of failure.
+ */
+int mtd_mark_bad(const struct mtd_dev_info *mtd, int fd, int eb);
+
+/**
+ * mtd_read - read data from an MTD device.
+ * @mtd: MTD device description object
+ * @fd: MTD device node file descriptor
+ * @eb: eraseblock to read from
+ * @offs: offset withing the eraseblock to read from
+ * @buf: buffer to read data to
+ * @len: how many bytes to read
+ *
+ * This function reads @len bytes of data from eraseblock @eb and offset @offs
+ * of the MTD device defined by @mtd and stores the read data at buffer @buf.
+ * Returns %0 in case of success and %-1 in case of failure.
+ */
+int mtd_read(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
+	     void *buf, int len);
+
+/**
+ * mtd_write - write data to an MTD device.
+ * @mtd: MTD device description object
+ * @fd: MTD device node file descriptor
+ * @eb: eraseblock to write to
+ * @offs: offset withing the eraseblock to write to
+ * @buf: buffer to write
+ * @len: how many bytes to write
+ *
+ * This function writes @len bytes of data to eraseblock @eb and offset @offs
+ * of the MTD device defined by @mtd. Returns %0 in case of success and %-1 in
+ * case of failure.
+ */
+int mtd_write(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
+	      void *buf, int len);
+
+/**
+ * mtd_write_img - write a file to MTD device.
+ * @mtd: MTD device description object
+ * @fd: MTD device node file descriptor
+ * @eb: eraseblock to write to
+ * @offs: offset withing the eraseblock to write to
+ * @img_name: the file to write
+ *
+ * This function writes an image @img_name the MTD device defined by @mtd. @eb
+ * and @offs are the starting eraseblock and offset on the MTD device. Returns
+ * %0 in case of success and %-1 in case of failure.
+ */
+int mtd_write_img(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
+		  const char *img_name);
+
+/**
+ * mtd_probe_node - test MTD node.
+ * @desc: MTD library descriptor
+ * @node: the node to test
+ *
+ * This function tests whether @node is an MTD device node and returns %1 if it
+ * is, and %-1 if it is not (errno is ENODEV in this case) or if an error
+ * occurred.
+ */
+int mtd_probe_node(libmtd_t desc, const char *node);
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif /* __LIBMTD_H__ */
diff --git a/lib/crc32.c b/lib/crc32.c
new file mode 100644
index 0000000..6b1e50c
--- /dev/null
+++ b/lib/crc32.c
@@ -0,0 +1,95 @@
+/*
+ *  COPYRIGHT (C) 1986 Gary S. Brown.  You may use this program, or
+ *  code or tables extracted from it, as desired without restriction.
+ *
+ *  First, the polynomial itself and its table of feedback terms.  The
+ *  polynomial is
+ *  X^32+X^26+X^23+X^22+X^16+X^12+X^11+X^10+X^8+X^7+X^5+X^4+X^2+X^1+X^0
+ *
+ *  Note that we take it "backwards" and put the highest-order term in
+ *  the lowest-order bit.  The X^32 term is "implied"; the LSB is the
+ *  X^31 term, etc.  The X^0 term (usually shown as "+1") results in
+ *  the MSB being 1
+ *
+ *  Note that the usual hardware shift register implementation, which
+ *  is what we're using (we're merely optimizing it by doing eight-bit
+ *  chunks at a time) shifts bits into the lowest-order term.  In our
+ *  implementation, that means shifting towards the right.  Why do we
+ *  do it this way?  Because the calculated CRC must be transmitted in
+ *  order from highest-order term to lowest-order term.  UARTs transmit
+ *  characters in order from LSB to MSB.  By storing the CRC this way
+ *  we hand it to the UART in the order low-byte to high-byte; the UART
+ *  sends each low-bit to hight-bit; and the result is transmission bit
+ *  by bit from highest- to lowest-order term without requiring any bit
+ *  shuffling on our part.  Reception works similarly
+ *
+ *  The feedback terms table consists of 256, 32-bit entries.  Notes
+ *
+ *      The table can be generated at runtime if desired; code to do so
+ *      is shown later.  It might not be obvious, but the feedback
+ *      terms simply represent the results of eight shift/xor opera
+ *      tions for all combinations of data and CRC register values
+ *
+ *      The values must be right-shifted by eight bits by the "updcrc
+ *      logic; the shift must be unsigned (bring in zeroes).  On some
+ *      hardware you could probably optimize the shift in assembler by
+ *      using byte-swap instructions
+ *      polynomial $edb88320
+ */
+
+#include <stdint.h>
+
+const uint32_t crc32_table[256] = {
+	0x00000000L, 0x77073096L, 0xee0e612cL, 0x990951baL, 0x076dc419L,
+	0x706af48fL, 0xe963a535L, 0x9e6495a3L, 0x0edb8832L, 0x79dcb8a4L,
+	0xe0d5e91eL, 0x97d2d988L, 0x09b64c2bL, 0x7eb17cbdL, 0xe7b82d07L,
+	0x90bf1d91L, 0x1db71064L, 0x6ab020f2L, 0xf3b97148L, 0x84be41deL,
+	0x1adad47dL, 0x6ddde4ebL, 0xf4d4b551L, 0x83d385c7L, 0x136c9856L,
+	0x646ba8c0L, 0xfd62f97aL, 0x8a65c9ecL, 0x14015c4fL, 0x63066cd9L,
+	0xfa0f3d63L, 0x8d080df5L, 0x3b6e20c8L, 0x4c69105eL, 0xd56041e4L,
+	0xa2677172L, 0x3c03e4d1L, 0x4b04d447L, 0xd20d85fdL, 0xa50ab56bL,
+	0x35b5a8faL, 0x42b2986cL, 0xdbbbc9d6L, 0xacbcf940L, 0x32d86ce3L,
+	0x45df5c75L, 0xdcd60dcfL, 0xabd13d59L, 0x26d930acL, 0x51de003aL,
+	0xc8d75180L, 0xbfd06116L, 0x21b4f4b5L, 0x56b3c423L, 0xcfba9599L,
+	0xb8bda50fL, 0x2802b89eL, 0x5f058808L, 0xc60cd9b2L, 0xb10be924L,
+	0x2f6f7c87L, 0x58684c11L, 0xc1611dabL, 0xb6662d3dL, 0x76dc4190L,
+	0x01db7106L, 0x98d220bcL, 0xefd5102aL, 0x71b18589L, 0x06b6b51fL,
+	0x9fbfe4a5L, 0xe8b8d433L, 0x7807c9a2L, 0x0f00f934L, 0x9609a88eL,
+	0xe10e9818L, 0x7f6a0dbbL, 0x086d3d2dL, 0x91646c97L, 0xe6635c01L,
+	0x6b6b51f4L, 0x1c6c6162L, 0x856530d8L, 0xf262004eL, 0x6c0695edL,
+	0x1b01a57bL, 0x8208f4c1L, 0xf50fc457L, 0x65b0d9c6L, 0x12b7e950L,
+	0x8bbeb8eaL, 0xfcb9887cL, 0x62dd1ddfL, 0x15da2d49L, 0x8cd37cf3L,
+	0xfbd44c65L, 0x4db26158L, 0x3ab551ceL, 0xa3bc0074L, 0xd4bb30e2L,
+	0x4adfa541L, 0x3dd895d7L, 0xa4d1c46dL, 0xd3d6f4fbL, 0x4369e96aL,
+	0x346ed9fcL, 0xad678846L, 0xda60b8d0L, 0x44042d73L, 0x33031de5L,
+	0xaa0a4c5fL, 0xdd0d7cc9L, 0x5005713cL, 0x270241aaL, 0xbe0b1010L,
+	0xc90c2086L, 0x5768b525L, 0x206f85b3L, 0xb966d409L, 0xce61e49fL,
+	0x5edef90eL, 0x29d9c998L, 0xb0d09822L, 0xc7d7a8b4L, 0x59b33d17L,
+	0x2eb40d81L, 0xb7bd5c3bL, 0xc0ba6cadL, 0xedb88320L, 0x9abfb3b6L,
+	0x03b6e20cL, 0x74b1d29aL, 0xead54739L, 0x9dd277afL, 0x04db2615L,
+	0x73dc1683L, 0xe3630b12L, 0x94643b84L, 0x0d6d6a3eL, 0x7a6a5aa8L,
+	0xe40ecf0bL, 0x9309ff9dL, 0x0a00ae27L, 0x7d079eb1L, 0xf00f9344L,
+	0x8708a3d2L, 0x1e01f268L, 0x6906c2feL, 0xf762575dL, 0x806567cbL,
+	0x196c3671L, 0x6e6b06e7L, 0xfed41b76L, 0x89d32be0L, 0x10da7a5aL,
+	0x67dd4accL, 0xf9b9df6fL, 0x8ebeeff9L, 0x17b7be43L, 0x60b08ed5L,
+	0xd6d6a3e8L, 0xa1d1937eL, 0x38d8c2c4L, 0x4fdff252L, 0xd1bb67f1L,
+	0xa6bc5767L, 0x3fb506ddL, 0x48b2364bL, 0xd80d2bdaL, 0xaf0a1b4cL,
+	0x36034af6L, 0x41047a60L, 0xdf60efc3L, 0xa867df55L, 0x316e8eefL,
+	0x4669be79L, 0xcb61b38cL, 0xbc66831aL, 0x256fd2a0L, 0x5268e236L,
+	0xcc0c7795L, 0xbb0b4703L, 0x220216b9L, 0x5505262fL, 0xc5ba3bbeL,
+	0xb2bd0b28L, 0x2bb45a92L, 0x5cb36a04L, 0xc2d7ffa7L, 0xb5d0cf31L,
+	0x2cd99e8bL, 0x5bdeae1dL, 0x9b64c2b0L, 0xec63f226L, 0x756aa39cL,
+	0x026d930aL, 0x9c0906a9L, 0xeb0e363fL, 0x72076785L, 0x05005713L,
+	0x95bf4a82L, 0xe2b87a14L, 0x7bb12baeL, 0x0cb61b38L, 0x92d28e9bL,
+	0xe5d5be0dL, 0x7cdcefb7L, 0x0bdbdf21L, 0x86d3d2d4L, 0xf1d4e242L,
+	0x68ddb3f8L, 0x1fda836eL, 0x81be16cdL, 0xf6b9265bL, 0x6fb077e1L,
+	0x18b74777L, 0x88085ae6L, 0xff0f6a70L, 0x66063bcaL, 0x11010b5cL,
+	0x8f659effL, 0xf862ae69L, 0x616bffd3L, 0x166ccf45L, 0xa00ae278L,
+	0xd70dd2eeL, 0x4e048354L, 0x3903b3c2L, 0xa7672661L, 0xd06016f7L,
+	0x4969474dL, 0x3e6e77dbL, 0xaed16a4aL, 0xd9d65adcL, 0x40df0b66L,
+	0x37d83bf0L, 0xa9bcae53L, 0xdebb9ec5L, 0x47b2cf7fL, 0x30b5ffe9L,
+	0xbdbdf21cL, 0xcabac28aL, 0x53b39330L, 0x24b4a3a6L, 0xbad03605L,
+	0xcdd70693L, 0x54de5729L, 0x23d967bfL, 0xb3667a2eL, 0xc4614ab8L,
+	0x5d681b02L, 0x2a6f2b94L, 0xb40bbe37L, 0xc30c8ea1L, 0x5a05df1bL,
+	0x2d02ef8dL
+};
diff --git a/lib/fec.c b/lib/fec.c
new file mode 100644
index 0000000..6d9020f
--- /dev/null
+++ b/lib/fec.c
@@ -0,0 +1,904 @@
+/*
+ * fec.c -- forward error correction based on Vandermonde matrices
+ * 980624
+ * (C) 1997-98 Luigi Rizzo (luigi@iet.unipi.it)
+ *
+ * Portions derived from code by Phil Karn (karn@ka9q.ampr.org),
+ * Robert Morelos-Zaragoza (robert@spectra.eng.hawaii.edu) and Hari
+ * Thirumoorthy (harit@spectra.eng.hawaii.edu), Aug 1995
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above
+ *    copyright notice, this list of conditions and the following
+ *    disclaimer in the documentation and/or other materials
+ *    provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE AUTHORS ``AS IS'' AND
+ * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
+ * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
+ * PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHORS
+ * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
+ * OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+ * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
+ * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
+ * TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
+ * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
+ * OF SUCH DAMAGE.
+ */
+
+/*
+ * The following parameter defines how many bits are used for
+ * field elements. The code supports any value from 2 to 16
+ * but fastest operation is achieved with 8 bit elements
+ * This is the only parameter you may want to change.
+ */
+#ifndef GF_BITS
+#define GF_BITS  8	/* code over GF(2**GF_BITS) - change to suit */
+#endif
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+/*
+ * stuff used for testing purposes only
+ */
+
+#ifdef	TEST
+#define DEB(x)
+#define DDB(x) x
+#define	DEBUG	0	/* minimal debugging */
+#ifdef	MSDOS
+#include <time.h>
+struct timeval {
+    unsigned long ticks;
+};
+#define gettimeofday(x, dummy) { (x)->ticks = clock() ; }
+#define DIFF_T(a,b) (1+ 1000000*(a.ticks - b.ticks) / CLOCKS_PER_SEC )
+typedef unsigned long u_long ;
+typedef unsigned short u_short ;
+#else /* typically, unix systems */
+#include <sys/time.h>
+#define DIFF_T(a,b) \
+	(1+ 1000000*(a.tv_sec - b.tv_sec) + (a.tv_usec - b.tv_usec) )
+#endif
+
+#define TICK(t) \
+	{struct timeval x ; \
+	gettimeofday(&x, NULL) ; \
+	t = x.tv_usec + 1000000* (x.tv_sec & 0xff ) ; \
+	}
+#define TOCK(t) \
+	{ u_long t1 ; TICK(t1) ; \
+	  if (t1 < t) t = 256000000 + t1 - t ; \
+	  else t = t1 - t ; \
+	  if (t == 0) t = 1 ;}
+	
+u_long ticks[10];	/* vars for timekeeping */
+#else
+#define DEB(x)
+#define DDB(x)
+#define TICK(x)
+#define TOCK(x)
+#endif /* TEST */
+
+/*
+ * You should not need to change anything beyond this point.
+ * The first part of the file implements linear algebra in GF.
+ *
+ * gf is the type used to store an element of the Galois Field.
+ * Must constain at least GF_BITS bits.
+ *
+ * Note: unsigned char will work up to GF(256) but int seems to run
+ * faster on the Pentium. We use int whenever have to deal with an
+ * index, since they are generally faster.
+ */
+#if (GF_BITS < 2  && GF_BITS >16)
+#error "GF_BITS must be 2 .. 16"
+#endif
+#if (GF_BITS <= 8)
+typedef unsigned char gf;
+#else
+typedef unsigned short gf;
+#endif
+
+#define	GF_SIZE ((1 << GF_BITS) - 1)	/* powers of \alpha */
+
+/*
+ * Primitive polynomials - see Lin & Costello, Appendix A,
+ * and  Lee & Messerschmitt, p. 453.
+ */
+static char *allPp[] = {    /* GF_BITS	polynomial		*/
+    NULL,		    /*  0	no code			*/
+    NULL,		    /*  1	no code			*/
+    "111",		    /*  2	1+x+x^2			*/
+    "1101",		    /*  3	1+x+x^3			*/
+    "11001",		    /*  4	1+x+x^4			*/
+    "101001",		    /*  5	1+x^2+x^5		*/
+    "1100001",		    /*  6	1+x+x^6			*/
+    "10010001",		    /*  7	1 + x^3 + x^7		*/
+    "101110001",	    /*  8	1+x^2+x^3+x^4+x^8	*/
+    "1000100001",	    /*  9	1+x^4+x^9		*/
+    "10010000001",	    /* 10	1+x^3+x^10		*/
+    "101000000001",	    /* 11	1+x^2+x^11		*/
+    "1100101000001",	    /* 12	1+x+x^4+x^6+x^12	*/
+    "11011000000001",	    /* 13	1+x+x^3+x^4+x^13	*/
+    "110000100010001",	    /* 14	1+x+x^6+x^10+x^14	*/
+    "1100000000000001",	    /* 15	1+x+x^15		*/
+    "11010000000010001"	    /* 16	1+x+x^3+x^12+x^16	*/
+};
+
+
+/*
+ * To speed up computations, we have tables for logarithm, exponent
+ * and inverse of a number. If GF_BITS <= 8, we use a table for
+ * multiplication as well (it takes 64K, no big deal even on a PDA,
+ * especially because it can be pre-initialized an put into a ROM!),
+ * otherwhise we use a table of logarithms.
+ * In any case the macro gf_mul(x,y) takes care of multiplications.
+ */
+
+static gf gf_exp[2*GF_SIZE];	/* index->poly form conversion table	*/
+static int gf_log[GF_SIZE + 1];	/* Poly->index form conversion table	*/
+static gf inverse[GF_SIZE+1];	/* inverse of field elem.		*/
+				/* inv[\alpha**i]=\alpha**(GF_SIZE-i-1)	*/
+
+/*
+ * modnn(x) computes x % GF_SIZE, where GF_SIZE is 2**GF_BITS - 1,
+ * without a slow divide.
+ */
+static inline gf
+modnn(int x)
+{
+    while (x >= GF_SIZE) {
+	x -= GF_SIZE;
+	x = (x >> GF_BITS) + (x & GF_SIZE);
+    }
+    return x;
+}
+
+#define SWAP(a,b,t) {t tmp; tmp=a; a=b; b=tmp;}
+
+/*
+ * gf_mul(x,y) multiplies two numbers. If GF_BITS<=8, it is much
+ * faster to use a multiplication table.
+ *
+ * USE_GF_MULC, GF_MULC0(c) and GF_ADDMULC(x) can be used when multiplying
+ * many numbers by the same constant. In this case the first
+ * call sets the constant, and others perform the multiplications.
+ * A value related to the multiplication is held in a local variable
+ * declared with USE_GF_MULC . See usage in addmul1().
+ */
+#if (GF_BITS <= 8)
+static gf gf_mul_table[GF_SIZE + 1][GF_SIZE + 1];
+
+#define gf_mul(x,y) gf_mul_table[x][y]
+
+#define USE_GF_MULC register gf * __gf_mulc_
+#define GF_MULC0(c) __gf_mulc_ = gf_mul_table[c]
+#define GF_ADDMULC(dst, x) dst ^= __gf_mulc_[x]
+
+static void
+init_mul_table()
+{
+    int i, j;
+    for (i=0; i< GF_SIZE+1; i++)
+	for (j=0; j< GF_SIZE+1; j++)
+	    gf_mul_table[i][j] = gf_exp[modnn(gf_log[i] + gf_log[j]) ] ;
+
+    for (j=0; j< GF_SIZE+1; j++)
+	    gf_mul_table[0][j] = gf_mul_table[j][0] = 0;
+}
+#else	/* GF_BITS > 8 */
+static inline gf
+gf_mul(x,y)
+{
+    if ( (x) == 0 || (y)==0 ) return 0;
+     
+    return gf_exp[gf_log[x] + gf_log[y] ] ;
+}
+#define init_mul_table()
+
+#define USE_GF_MULC register gf * __gf_mulc_
+#define GF_MULC0(c) __gf_mulc_ = &gf_exp[ gf_log[c] ]
+#define GF_ADDMULC(dst, x) { if (x) dst ^= __gf_mulc_[ gf_log[x] ] ; }
+#endif
+
+/*
+ * Generate GF(2**m) from the irreducible polynomial p(X) in p[0]..p[m]
+ * Lookup tables:
+ *     index->polynomial form		gf_exp[] contains j= \alpha^i;
+ *     polynomial form -> index form	gf_log[ j = \alpha^i ] = i
+ * \alpha=x is the primitive element of GF(2^m)
+ *
+ * For efficiency, gf_exp[] has size 2*GF_SIZE, so that a simple
+ * multiplication of two numbers can be resolved without calling modnn
+ */
+
+/*
+ * i use malloc so many times, it is easier to put checks all in
+ * one place.
+ */
+static void *
+my_malloc(int sz, char *err_string)
+{
+    void *p = malloc( sz );
+    if (p == NULL) {
+	fprintf(stderr, "-- malloc failure allocating %s\n", err_string);
+	exit(1) ;
+    }
+    return p ;
+}
+
+#define NEW_GF_MATRIX(rows, cols) \
+    (gf *)my_malloc(rows * cols * sizeof(gf), " ## __LINE__ ## " )
+
+/*
+ * initialize the data structures used for computations in GF.
+ */
+static void
+generate_gf(void)
+{
+    int i;
+    gf mask;
+    char *Pp =  allPp[GF_BITS] ;
+
+    mask = 1;	/* x ** 0 = 1 */
+    gf_exp[GF_BITS] = 0; /* will be updated at the end of the 1st loop */
+    /*
+     * first, generate the (polynomial representation of) powers of \alpha,
+     * which are stored in gf_exp[i] = \alpha ** i .
+     * At the same time build gf_log[gf_exp[i]] = i .
+     * The first GF_BITS powers are simply bits shifted to the left.
+     */
+    for (i = 0; i < GF_BITS; i++, mask <<= 1 ) {
+	gf_exp[i] = mask;
+	gf_log[gf_exp[i]] = i;
+	/*
+	 * If Pp[i] == 1 then \alpha ** i occurs in poly-repr
+	 * gf_exp[GF_BITS] = \alpha ** GF_BITS
+	 */
+	if ( Pp[i] == '1' )
+	    gf_exp[GF_BITS] ^= mask;
+    }
+    /*
+     * now gf_exp[GF_BITS] = \alpha ** GF_BITS is complete, so can als
+     * compute its inverse.
+     */
+    gf_log[gf_exp[GF_BITS]] = GF_BITS;
+    /*
+     * Poly-repr of \alpha ** (i+1) is given by poly-repr of
+     * \alpha ** i shifted left one-bit and accounting for any
+     * \alpha ** GF_BITS term that may occur when poly-repr of
+     * \alpha ** i is shifted.
+     */
+    mask = 1 << (GF_BITS - 1 ) ;
+    for (i = GF_BITS + 1; i < GF_SIZE; i++) {
+	if (gf_exp[i - 1] >= mask)
+	    gf_exp[i] = gf_exp[GF_BITS] ^ ((gf_exp[i - 1] ^ mask) << 1);
+	else
+	    gf_exp[i] = gf_exp[i - 1] << 1;
+	gf_log[gf_exp[i]] = i;
+    }
+    /*
+     * log(0) is not defined, so use a special value
+     */
+    gf_log[0] =	GF_SIZE ;
+    /* set the extended gf_exp values for fast multiply */
+    for (i = 0 ; i < GF_SIZE ; i++)
+	gf_exp[i + GF_SIZE] = gf_exp[i] ;
+
+    /*
+     * again special cases. 0 has no inverse. This used to
+     * be initialized to GF_SIZE, but it should make no difference
+     * since noone is supposed to read from here.
+     */
+    inverse[0] = 0 ;
+    inverse[1] = 1;
+    for (i=2; i<=GF_SIZE; i++)
+	inverse[i] = gf_exp[GF_SIZE-gf_log[i]];
+}
+
+/*
+ * Various linear algebra operations that i use often.
+ */
+
+/*
+ * addmul() computes dst[] = dst[] + c * src[]
+ * This is used often, so better optimize it! Currently the loop is
+ * unrolled 16 times, a good value for 486 and pentium-class machines.
+ * The case c=0 is also optimized, whereas c=1 is not. These
+ * calls are unfrequent in my typical apps so I did not bother.
+ * 
+ * Note that gcc on
+ */
+#define addmul(dst, src, c, sz) \
+    if (c != 0) addmul1(dst, src, c, sz)
+
+#define UNROLL 16 /* 1, 4, 8, 16 */
+static void
+addmul1(gf *dst1, gf *src1, gf c, int sz)
+{
+    USE_GF_MULC ;
+    register gf *dst = dst1, *src = src1 ;
+    gf *lim = &dst[sz - UNROLL + 1] ;
+
+    GF_MULC0(c) ;
+
+#if (UNROLL > 1) /* unrolling by 8/16 is quite effective on the pentium */
+    for (; dst < lim ; dst += UNROLL, src += UNROLL ) {
+	GF_ADDMULC( dst[0] , src[0] );
+	GF_ADDMULC( dst[1] , src[1] );
+	GF_ADDMULC( dst[2] , src[2] );
+	GF_ADDMULC( dst[3] , src[3] );
+#if (UNROLL > 4)
+	GF_ADDMULC( dst[4] , src[4] );
+	GF_ADDMULC( dst[5] , src[5] );
+	GF_ADDMULC( dst[6] , src[6] );
+	GF_ADDMULC( dst[7] , src[7] );
+#endif
+#if (UNROLL > 8)
+	GF_ADDMULC( dst[8] , src[8] );
+	GF_ADDMULC( dst[9] , src[9] );
+	GF_ADDMULC( dst[10] , src[10] );
+	GF_ADDMULC( dst[11] , src[11] );
+	GF_ADDMULC( dst[12] , src[12] );
+	GF_ADDMULC( dst[13] , src[13] );
+	GF_ADDMULC( dst[14] , src[14] );
+	GF_ADDMULC( dst[15] , src[15] );
+#endif
+    }
+#endif
+    lim += UNROLL - 1 ;
+    for (; dst < lim; dst++, src++ )		/* final components */
+	GF_ADDMULC( *dst , *src );
+}
+
+/*
+ * computes C = AB where A is n*k, B is k*m, C is n*m
+ */
+static void
+matmul(gf *a, gf *b, gf *c, int n, int k, int m)
+{
+    int row, col, i ;
+
+    for (row = 0; row < n ; row++) {
+	for (col = 0; col < m ; col++) {
+	    gf *pa = &a[ row * k ];
+	    gf *pb = &b[ col ];
+	    gf acc = 0 ;
+	    for (i = 0; i < k ; i++, pa++, pb += m )
+		acc ^= gf_mul( *pa, *pb ) ;
+	    c[ row * m + col ] = acc ;
+	}
+    }
+}
+
+#ifdef DEBUG
+/*
+ * returns 1 if the square matrix is identiy
+ * (only for test)
+ */
+static int
+is_identity(gf *m, int k)
+{
+    int row, col ;
+    for (row=0; row<k; row++)
+	for (col=0; col<k; col++)
+	    if ( (row==col && *m != 1) ||
+		 (row!=col && *m != 0) )
+		 return 0 ;
+	    else
+		m++ ;
+    return 1 ;
+}
+#endif /* debug */
+
+/*
+ * invert_mat() takes a matrix and produces its inverse
+ * k is the size of the matrix.
+ * (Gauss-Jordan, adapted from Numerical Recipes in C)
+ * Return non-zero if singular.
+ */
+DEB( int pivloops=0; int pivswaps=0 ; /* diagnostic */)
+static int
+invert_mat(gf *src, int k)
+{
+    gf c, *p ;
+    int irow, icol, row, col, i, ix ;
+
+    int error = 1 ;
+    int *indxc = my_malloc(k*sizeof(int), "indxc");
+    int *indxr = my_malloc(k*sizeof(int), "indxr");
+    int *ipiv = my_malloc(k*sizeof(int), "ipiv");
+    gf *id_row = NEW_GF_MATRIX(1, k);
+    gf *temp_row = NEW_GF_MATRIX(1, k);
+
+    memset(id_row, '\0', k*sizeof(gf));
+    DEB( pivloops=0; pivswaps=0 ; /* diagnostic */ )
+    /*
+     * ipiv marks elements already used as pivots.
+     */
+    for (i = 0; i < k ; i++)
+	ipiv[i] = 0 ;
+
+    for (col = 0; col < k ; col++) {
+	gf *pivot_row ;
+	/*
+	 * Zeroing column 'col', look for a non-zero element.
+	 * First try on the diagonal, if it fails, look elsewhere.
+	 */
+	irow = icol = -1 ;
+	if (ipiv[col] != 1 && src[col*k + col] != 0) {
+	    irow = col ;
+	    icol = col ;
+	    goto found_piv ;
+	}
+	for (row = 0 ; row < k ; row++) {
+	    if (ipiv[row] != 1) {
+		for (ix = 0 ; ix < k ; ix++) {
+		    DEB( pivloops++ ; )
+		    if (ipiv[ix] == 0) {
+			if (src[row*k + ix] != 0) {
+			    irow = row ;
+			    icol = ix ;
+			    goto found_piv ;
+			}
+		    } else if (ipiv[ix] > 1) {
+			fprintf(stderr, "singular matrix\n");
+			goto fail ; 
+		    }
+		}
+	    }
+	}
+	if (icol == -1) {
+	    fprintf(stderr, "XXX pivot not found!\n");
+	    goto fail ;
+	}
+found_piv:
+	++(ipiv[icol]) ;
+	/*
+	 * swap rows irow and icol, so afterwards the diagonal
+	 * element will be correct. Rarely done, not worth
+	 * optimizing.
+	 */
+	if (irow != icol) {
+	    for (ix = 0 ; ix < k ; ix++ ) {
+		SWAP( src[irow*k + ix], src[icol*k + ix], gf) ;
+	    }
+	}
+	indxr[col] = irow ;
+	indxc[col] = icol ;
+	pivot_row = &src[icol*k] ;
+	c = pivot_row[icol] ;
+	if (c == 0) {
+	    fprintf(stderr, "singular matrix 2\n");
+	    goto fail ;
+	}
+	if (c != 1 ) { /* otherwhise this is a NOP */
+	    /*
+	     * this is done often , but optimizing is not so
+	     * fruitful, at least in the obvious ways (unrolling)
+	     */
+	    DEB( pivswaps++ ; )
+	    c = inverse[ c ] ;
+	    pivot_row[icol] = 1 ;
+	    for (ix = 0 ; ix < k ; ix++ )
+		pivot_row[ix] = gf_mul(c, pivot_row[ix] );
+	}
+	/*
+	 * from all rows, remove multiples of the selected row
+	 * to zero the relevant entry (in fact, the entry is not zero
+	 * because we know it must be zero).
+	 * (Here, if we know that the pivot_row is the identity,
+	 * we can optimize the addmul).
+	 */
+	id_row[icol] = 1;
+	if (memcmp(pivot_row, id_row, k*sizeof(gf)) != 0) {
+	    for (p = src, ix = 0 ; ix < k ; ix++, p += k ) {
+		if (ix != icol) {
+		    c = p[icol] ;
+		    p[icol] = 0 ;
+		    addmul(p, pivot_row, c, k );
+		}
+	    }
+	}
+	id_row[icol] = 0;
+    } /* done all columns */
+    for (col = k-1 ; col >= 0 ; col-- ) {
+	if (indxr[col] <0 || indxr[col] >= k)
+	    fprintf(stderr, "AARGH, indxr[col] %d\n", indxr[col]);
+	else if (indxc[col] <0 || indxc[col] >= k)
+	    fprintf(stderr, "AARGH, indxc[col] %d\n", indxc[col]);
+	else
+	if (indxr[col] != indxc[col] ) {
+	    for (row = 0 ; row < k ; row++ ) {
+		SWAP( src[row*k + indxr[col]], src[row*k + indxc[col]], gf) ;
+	    }
+	}
+    }
+    error = 0 ;
+fail:
+    free(indxc);
+    free(indxr);
+    free(ipiv);
+    free(id_row);
+    free(temp_row);
+    return error ;
+}
+
+/*
+ * fast code for inverting a vandermonde matrix.
+ * XXX NOTE: It assumes that the matrix
+ * is not singular and _IS_ a vandermonde matrix. Only uses
+ * the second column of the matrix, containing the p_i's.
+ *
+ * Algorithm borrowed from "Numerical recipes in C" -- sec.2.8, but
+ * largely revised for my purposes.
+ * p = coefficients of the matrix (p_i)
+ * q = values of the polynomial (known)
+ */
+
+int
+invert_vdm(gf *src, int k)
+{
+    int i, j, row, col ;
+    gf *b, *c, *p;
+    gf t, xx ;
+
+    if (k == 1) 	/* degenerate case, matrix must be p^0 = 1 */
+	return 0 ;
+    /*
+     * c holds the coefficient of P(x) = Prod (x - p_i), i=0..k-1
+     * b holds the coefficient for the matrix inversion
+     */
+    c = NEW_GF_MATRIX(1, k);
+    b = NEW_GF_MATRIX(1, k);
+
+    p = NEW_GF_MATRIX(1, k);
+   
+    for ( j=1, i = 0 ; i < k ; i++, j+=k ) {
+	c[i] = 0 ;
+	p[i] = src[j] ;    /* p[i] */
+    }
+    /*
+     * construct coeffs. recursively. We know c[k] = 1 (implicit)
+     * and start P_0 = x - p_0, then at each stage multiply by
+     * x - p_i generating P_i = x P_{i-1} - p_i P_{i-1}
+     * After k steps we are done.
+     */
+    c[k-1] = p[0] ;	/* really -p(0), but x = -x in GF(2^m) */
+    for (i = 1 ; i < k ; i++ ) {
+	gf p_i = p[i] ; /* see above comment */
+	for (j = k-1  - ( i - 1 ) ; j < k-1 ; j++ )
+	    c[j] ^= gf_mul( p_i, c[j+1] ) ;
+	c[k-1] ^= p_i ;
+    }
+
+    for (row = 0 ; row < k ; row++ ) {
+	/*
+	 * synthetic division etc.
+	 */
+	xx = p[row] ;
+	t = 1 ;
+	b[k-1] = 1 ; /* this is in fact c[k] */
+	for (i = k-2 ; i >= 0 ; i-- ) {
+	    b[i] = c[i+1] ^ gf_mul(xx, b[i+1]) ;
+	    t = gf_mul(xx, t) ^ b[i] ;
+	}
+	for (col = 0 ; col < k ; col++ )
+	    src[col*k + row] = gf_mul(inverse[t], b[col] );
+    }
+    free(c) ;
+    free(b) ;
+    free(p) ;
+    return 0 ;
+}
+
+static int fec_initialized = 0 ;
+static void
+init_fec()
+{
+    TICK(ticks[0]);
+    generate_gf();
+    TOCK(ticks[0]);
+    DDB(fprintf(stderr, "generate_gf took %ldus\n", ticks[0]);)
+    TICK(ticks[0]);
+    init_mul_table();
+    TOCK(ticks[0]);
+    DDB(fprintf(stderr, "init_mul_table took %ldus\n", ticks[0]);)
+    fec_initialized = 1 ;
+}
+
+/*
+ * This section contains the proper FEC encoding/decoding routines.
+ * The encoding matrix is computed starting with a Vandermonde matrix,
+ * and then transforming it into a systematic matrix.
+ */
+
+#define FEC_MAGIC	0xFECC0DEC
+
+struct fec_parms {
+    u_long magic ;
+    int k, n ;		/* parameters of the code */
+    gf *enc_matrix ;
+} ;
+
+void
+fec_free(struct fec_parms *p)
+{
+    if (p==NULL ||
+       p->magic != ( ( (FEC_MAGIC ^ p->k) ^ p->n) ^ (int)(p->enc_matrix)) ) {
+	fprintf(stderr, "bad parameters to fec_free\n");
+	return ;
+    }
+    free(p->enc_matrix);
+    free(p);
+}
+
+/*
+ * create a new encoder, returning a descriptor. This contains k,n and
+ * the encoding matrix.
+ */
+struct fec_parms *
+fec_new(int k, int n)
+{
+    int row, col ;
+    gf *p, *tmp_m ;
+
+    struct fec_parms *retval ;
+
+    if (fec_initialized == 0)
+	init_fec();
+
+    if (k > GF_SIZE + 1 || n > GF_SIZE + 1 || k > n ) {
+	fprintf(stderr, "Invalid parameters k %d n %d GF_SIZE %d\n",
+		k, n, GF_SIZE );
+	return NULL ;
+    }
+    retval = my_malloc(sizeof(struct fec_parms), "new_code");
+    retval->k = k ;
+    retval->n = n ;
+    retval->enc_matrix = NEW_GF_MATRIX(n, k);
+    retval->magic = ( ( FEC_MAGIC ^ k) ^ n) ^ (int)(retval->enc_matrix) ;
+    tmp_m = NEW_GF_MATRIX(n, k);
+    /*
+     * fill the matrix with powers of field elements, starting from 0.
+     * The first row is special, cannot be computed with exp. table.
+     */
+    tmp_m[0] = 1 ;
+    for (col = 1; col < k ; col++)
+	tmp_m[col] = 0 ;
+    for (p = tmp_m + k, row = 0; row < n-1 ; row++, p += k) {
+	for ( col = 0 ; col < k ; col ++ )
+	    p[col] = gf_exp[modnn(row*col)];
+    }
+
+    /*
+     * quick code to build systematic matrix: invert the top
+     * k*k vandermonde matrix, multiply right the bottom n-k rows
+     * by the inverse, and construct the identity matrix at the top.
+     */
+    TICK(ticks[3]);
+    invert_vdm(tmp_m, k); /* much faster than invert_mat */
+    matmul(tmp_m + k*k, tmp_m, retval->enc_matrix + k*k, n - k, k, k);
+    /*
+     * the upper matrix is I so do not bother with a slow multiply
+     */
+    memset(retval->enc_matrix, '\0', k*k*sizeof(gf) );
+    for (p = retval->enc_matrix, col = 0 ; col < k ; col++, p += k+1 )
+	*p = 1 ;
+    free(tmp_m);
+    TOCK(ticks[3]);
+
+    DDB(fprintf(stderr, "--- %ld us to build encoding matrix\n",
+	    ticks[3]);)
+    DEB(pr_matrix(retval->enc_matrix, n, k, "encoding_matrix");)
+    return retval ;
+}
+
+/*
+ * fec_encode accepts as input pointers to n data packets of size sz,
+ * and produces as output a packet pointed to by fec, computed
+ * with index "index".
+ */
+void
+fec_encode(struct fec_parms *code, gf *src[], gf *fec, int index, int sz)
+{
+    int i, k = code->k ;
+    gf *p ;
+
+    if (GF_BITS > 8)
+	sz /= 2 ;
+
+    if (index < k)
+         memcpy(fec, src[index], sz*sizeof(gf) ) ;
+    else if (index < code->n) {
+	p = &(code->enc_matrix[index*k] );
+	memset(fec, '\0', sz*sizeof(gf));
+	for (i = 0; i < k ; i++)
+	    addmul(fec, src[i], p[i], sz ) ;
+    } else
+	fprintf(stderr, "Invalid index %d (max %d)\n",
+	    index, code->n - 1 );
+}
+
+void fec_encode_linear(struct fec_parms *code, gf *src, gf *fec, int index, int sz)
+{
+    int i, k = code->k ;
+    gf *p ;
+
+    if (GF_BITS > 8)
+	sz /= 2 ;
+
+    if (index < k)
+	    memcpy(fec, src + (index * sz), sz*sizeof(gf) ) ;
+    else if (index < code->n) {
+	p = &(code->enc_matrix[index*k] );
+	memset(fec, '\0', sz*sizeof(gf));
+	for (i = 0; i < k ; i++)
+	    addmul(fec, src + (i * sz), p[i], sz ) ;
+    } else
+	fprintf(stderr, "Invalid index %d (max %d)\n",
+	    index, code->n - 1 );
+}
+/*
+ * shuffle move src packets in their position
+ */
+static int
+shuffle(gf *pkt[], int index[], int k)
+{
+    int i;
+
+    for ( i = 0 ; i < k ; ) {
+	if (index[i] >= k || index[i] == i)
+	    i++ ;
+	else {
+	    /*
+	     * put pkt in the right position (first check for conflicts).
+	     */
+	    int c = index[i] ;
+
+	    if (index[c] == c) {
+		DEB(fprintf(stderr, "\nshuffle, error at %d\n", i);)
+		return 1 ;
+	    }
+	    SWAP(index[i], index[c], int) ;
+	    SWAP(pkt[i], pkt[c], gf *) ;
+	}
+    }
+    DEB( /* just test that it works... */
+    for ( i = 0 ; i < k ; i++ ) {
+	if (index[i] < k && index[i] != i) {
+	    fprintf(stderr, "shuffle: after\n");
+	    for (i=0; i<k ; i++) fprintf(stderr, "%3d ", index[i]);
+	    fprintf(stderr, "\n");
+	    return 1 ;
+	}
+    }
+    )
+    return 0 ;
+}
+
+/*
+ * build_decode_matrix constructs the encoding matrix given the
+ * indexes. The matrix must be already allocated as
+ * a vector of k*k elements, in row-major order
+ */
+static gf *
+build_decode_matrix(struct fec_parms *code, gf *pkt[], int index[])
+{
+    int i , k = code->k ;
+    gf *p, *matrix = NEW_GF_MATRIX(k, k);
+
+    TICK(ticks[9]);
+    for (i = 0, p = matrix ; i < k ; i++, p += k ) {
+#if 1 /* this is simply an optimization, not very useful indeed */
+	if (index[i] < k) {
+	    memset(p, '\0', k*sizeof(gf) );
+	    p[i] = 1 ;
+	} else
+#endif
+	if (index[i] < code->n )
+	    memcpy(p,  &(code->enc_matrix[index[i]*k]), k*sizeof(gf) ); 
+	else {
+	    fprintf(stderr, "decode: invalid index %d (max %d)\n",
+		index[i], code->n - 1 );
+	    free(matrix) ;
+	    return NULL ;
+	}
+    }
+    TICK(ticks[9]);
+    if (invert_mat(matrix, k)) {
+	free(matrix);
+	matrix = NULL ;
+    }
+    TOCK(ticks[9]);
+    return matrix ;
+}
+
+/*
+ * fec_decode receives as input a vector of packets, the indexes of
+ * packets, and produces the correct vector as output.
+ *
+ * Input:
+ *	code: pointer to code descriptor
+ *	pkt:  pointers to received packets. They are modified
+ *	      to store the output packets (in place)
+ *	index: pointer to packet indexes (modified)
+ *	sz:    size of each packet
+ */
+int
+fec_decode(struct fec_parms *code, gf *pkt[], int index[], int sz)
+{
+    gf *m_dec ; 
+    gf **new_pkt ;
+    int row, col , k = code->k ;
+
+    if (GF_BITS > 8)
+	sz /= 2 ;
+
+    if (shuffle(pkt, index, k))	/* error if true */
+	return 1 ;
+    m_dec = build_decode_matrix(code, pkt, index);
+
+    if (m_dec == NULL)
+	return 1 ; /* error */
+    /*
+     * do the actual decoding
+     */
+    new_pkt = my_malloc (k * sizeof (gf * ), "new pkt pointers" );
+    for (row = 0 ; row < k ; row++ ) {
+	if (index[row] >= k) {
+	    new_pkt[row] = my_malloc (sz * sizeof (gf), "new pkt buffer" );
+	    memset(new_pkt[row], '\0', sz * sizeof(gf) ) ;
+	    for (col = 0 ; col < k ; col++ )
+		addmul(new_pkt[row], pkt[col], m_dec[row*k + col], sz) ;
+	}
+    }
+    /*
+     * move pkts to their final destination
+     */
+    for (row = 0 ; row < k ; row++ ) {
+	if (index[row] >= k) {
+	    memcpy(pkt[row], new_pkt[row], sz*sizeof(gf));
+	    free(new_pkt[row]);
+	}
+    }
+    free(new_pkt);
+    free(m_dec);
+
+    return 0;
+}
+
+/*********** end of FEC code -- beginning of test code ************/
+
+#if (TEST || DEBUG)
+void
+test_gf()
+{
+    int i ;
+    /*
+     * test gf tables. Sufficiently tested...
+     */
+    for (i=0; i<= GF_SIZE; i++) {
+        if (gf_exp[gf_log[i]] != i)
+	    fprintf(stderr, "bad exp/log i %d log %d exp(log) %d\n",
+		i, gf_log[i], gf_exp[gf_log[i]]);
+
+        if (i != 0 && gf_mul(i, inverse[i]) != 1)
+	    fprintf(stderr, "bad mul/inv i %d inv %d i*inv(i) %d\n",
+		i, inverse[i], gf_mul(i, inverse[i]) );
+	if (gf_mul(0,i) != 0)
+	    fprintf(stderr, "bad mul table 0,%d\n",i);
+	if (gf_mul(i,0) != 0)
+	    fprintf(stderr, "bad mul table %d,0\n",i);
+    }
+}
+#endif /* TEST */
diff --git a/lib/libmtd.c b/lib/libmtd.c
new file mode 100644
index 0000000..3ff031c
--- /dev/null
+++ b/lib/libmtd.c
@@ -0,0 +1,1157 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ * Copyright (C) 2009 Nokia Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *
+ * Author: Artem Bityutskiy
+ *
+ * MTD library.
+ */
+
+#include <limits.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <errno.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <dirent.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <sys/ioctl.h>
+#include <mtd/mtd-user.h>
+
+#include <libmtd.h>
+#include "libmtd_int.h"
+#include "common.h"
+
+/**
+ * mkpath - compose full path from 2 given components.
+ * @path: the first component
+ * @name: the second component
+ *
+ * This function returns the resulting path in case of success and %NULL in
+ * case of failure.
+ */
+static char *mkpath(const char *path, const char *name)
+{
+	char *n;
+	int len1 = strlen(path);
+	int len2 = strlen(name);
+
+	n = malloc(len1 + len2 + 2);
+	if (!n) {
+		sys_errmsg("cannot allocate %d bytes", len1 + len2 + 2);
+		return NULL;
+	}
+
+	memcpy(n, path, len1);
+	if (n[len1 - 1] != '/')
+		n[len1++] = '/';
+
+	memcpy(n + len1, name, len2 + 1);
+	return n;
+}
+
+/**
+ * read_data - read data from a file.
+ * @file: the file to read from
+ * @buf: the buffer to read to
+ * @buf_len: buffer length
+ *
+ * This function returns number of read bytes in case of success and %-1 in
+ * case of failure. Note, if the file contains more then @buf_len bytes of
+ * date, this function fails with %EINVAL error code.
+ */
+static int read_data(const char *file, void *buf, int buf_len)
+{
+	int fd, rd, tmp, tmp1;
+
+	fd = open(file, O_RDONLY);
+	if (fd == -1)
+		return -1;
+
+	rd = read(fd, buf, buf_len);
+	if (rd == -1) {
+		sys_errmsg("cannot read \"%s\"", file);
+		goto out_error;
+	}
+
+	if (rd == buf_len) {
+		errmsg("contents of \"%s\" is too long", file);
+		errno = EINVAL;
+		goto out_error;
+	}
+
+	((char *)buf)[rd] = '\0';
+
+	/* Make sure all data is read */
+	tmp1 = read(fd, &tmp, 1);
+	if (tmp1 == 1) {
+		sys_errmsg("cannot read \"%s\"", file);
+		goto out_error;
+	}
+	if (tmp1) {
+		errmsg("file \"%s\" contains too much data (> %d bytes)",
+		       file, buf_len);
+		errno = EINVAL;
+		goto out_error;
+	}
+
+	if (close(fd)) {
+		sys_errmsg("close failed on \"%s\"", file);
+		return -1;
+	}
+
+	return rd;
+
+out_error:
+	close(fd);
+	return -1;
+}
+
+/**
+ * read_major - read major and minor numbers from a file.
+ * @file: name of the file to read from
+ * @major: major number is returned here
+ * @minor: minor number is returned here
+ *
+ * This function returns % in case of success, and %-1 in case of failure.
+ */
+static int read_major(const char *file, int *major, int *minor)
+{
+	int ret;
+	char buf[50];
+
+	ret = read_data(file, buf, 50);
+	if (ret < 0)
+		return ret;
+
+	ret = sscanf(buf, "%d:%d\n", major, minor);
+	if (ret != 2) {
+		errno = EINVAL;
+		return errmsg("\"%s\" does not have major:minor format", file);
+	}
+
+	if (*major < 0 || *minor < 0) {
+		errno = EINVAL;
+		return errmsg("bad major:minor %d:%d in \"%s\"",
+			      *major, *minor, file);
+	}
+
+	return 0;
+}
+
+/**
+ * dev_get_major - get major and minor numbers of an MTD device.
+ * @lib: libmtd descriptor
+ * @mtd_num: MTD device number
+ * @major: major number is returned here
+ * @minor: minor number is returned here
+ *
+ * This function returns zero in case of success and %-1 in case of failure.
+ */
+static int dev_get_major(struct libmtd *lib, int mtd_num, int *major, int *minor)
+{
+	char file[strlen(lib->mtd_dev) + 50];
+
+	sprintf(file, lib->mtd_dev, mtd_num);
+	return read_major(file, major, minor);
+}
+
+/**
+ * dev_read_data - read data from an MTD device's sysfs file.
+ * @patt: file pattern to read from
+ * @mtd_num: MTD device number
+ * @buf: buffer to read to
+ * @buf_len: buffer length
+ *
+ * This function returns number of read bytes in case of success and %-1 in
+ * case of failure.
+ */
+static int dev_read_data(const char *patt, int mtd_num, void *buf, int buf_len)
+{
+	char file[strlen(patt) + 100];
+
+	sprintf(file, patt, mtd_num);
+	return read_data(file, buf, buf_len);
+}
+
+/**
+ * read_hex_ll - read a hex 'long long' value from a file.
+ * @file: the file to read from
+ * @value: the result is stored here
+ *
+ * This function reads file @file and interprets its contents as hexadecimal
+ * 'long long' integer. If this is not true, it fails with %EINVAL error code.
+ * Returns %0 in case of success and %-1 in case of failure.
+ */
+static int read_hex_ll(const char *file, long long *value)
+{
+	int fd, rd;
+	char buf[50];
+
+	fd = open(file, O_RDONLY);
+	if (fd == -1)
+		return -1;
+
+	rd = read(fd, buf, sizeof(buf));
+	if (rd == -1) {
+		sys_errmsg("cannot read \"%s\"", file);
+		goto out_error;
+	}
+	if (rd == sizeof(buf)) {
+		errmsg("contents of \"%s\" is too long", file);
+		errno = EINVAL;
+		goto out_error;
+	}
+	buf[rd] = '\0';
+
+	if (sscanf(buf, "%llx\n", value) != 1) {
+		errmsg("cannot read integer from \"%s\"\n", file);
+		errno = EINVAL;
+		goto out_error;
+	}
+
+	if (*value < 0) {
+		errmsg("negative value %lld in \"%s\"", *value, file);
+		errno = EINVAL;
+		goto out_error;
+	}
+
+	if (close(fd))
+		return sys_errmsg("close failed on \"%s\"", file);
+
+	return 0;
+
+out_error:
+	close(fd);
+	return -1;
+}
+
+/**
+ * read_pos_ll - read a positive 'long long' value from a file.
+ * @file: the file to read from
+ * @value: the result is stored here
+ *
+ * This function reads file @file and interprets its contents as a positive
+ * 'long long' integer. If this is not true, it fails with %EINVAL error code.
+ * Returns %0 in case of success and %-1 in case of failure.
+ */
+static int read_pos_ll(const char *file, long long *value)
+{
+	int fd, rd;
+	char buf[50];
+
+	fd = open(file, O_RDONLY);
+	if (fd == -1)
+		return -1;
+
+	rd = read(fd, buf, 50);
+	if (rd == -1) {
+		sys_errmsg("cannot read \"%s\"", file);
+		goto out_error;
+	}
+	if (rd == 50) {
+		errmsg("contents of \"%s\" is too long", file);
+		errno = EINVAL;
+		goto out_error;
+	}
+
+	if (sscanf(buf, "%lld\n", value) != 1) {
+		errmsg("cannot read integer from \"%s\"\n", file);
+		errno = EINVAL;
+		goto out_error;
+	}
+
+	if (*value < 0) {
+		errmsg("negative value %lld in \"%s\"", *value, file);
+		errno = EINVAL;
+		goto out_error;
+	}
+
+	if (close(fd))
+		return sys_errmsg("close failed on \"%s\"", file);
+
+	return 0;
+
+out_error:
+	close(fd);
+	return -1;
+}
+
+/**
+ * read_hex_int - read an 'int' value from a file.
+ * @file: the file to read from
+ * @value: the result is stored here
+ *
+ * This function is the same as 'read_pos_ll()', but it reads an 'int'
+ * value, not 'long long'.
+ */
+static int read_hex_int(const char *file, int *value)
+{
+	long long res;
+
+	if (read_hex_ll(file, &res))
+		return -1;
+
+	/* Make sure the value has correct range */
+	if (res > INT_MAX || res < INT_MIN) {
+		errmsg("value %lld read from file \"%s\" is out of range",
+		       res, file);
+		errno = EINVAL;
+		return -1;
+	}
+
+	*value = res;
+	return 0;
+}
+
+/**
+ * read_pos_int - read a positive 'int' value from a file.
+ * @file: the file to read from
+ * @value: the result is stored here
+ *
+ * This function is the same as 'read_pos_ll()', but it reads an 'int'
+ * value, not 'long long'.
+ */
+static int read_pos_int(const char *file, int *value)
+{
+	long long res;
+
+	if (read_pos_ll(file, &res))
+		return -1;
+
+	/* Make sure the value is not too big */
+	if (res > INT_MAX) {
+		errmsg("value %lld read from file \"%s\" is out of range",
+		       res, file);
+		errno = EINVAL;
+		return -1;
+	}
+
+	*value = res;
+	return 0;
+}
+
+/**
+ * dev_read_hex_int - read an hex 'int' value from an MTD device sysfs file.
+ * @patt: file pattern to read from
+ * @mtd_num: MTD device number
+ * @value: the result is stored here
+ *
+ * This function returns %0 in case of success and %-1 in case of failure.
+ */
+static int dev_read_hex_int(const char *patt, int mtd_num, int *value)
+{
+	char file[strlen(patt) + 50];
+
+	sprintf(file, patt, mtd_num);
+	return read_hex_int(file, value);
+}
+
+/**
+ * dev_read_pos_int - read a positive 'int' value from an MTD device sysfs file.
+ * @patt: file pattern to read from
+ * @mtd_num: MTD device number
+ * @value: the result is stored here
+ *
+ * This function returns %0 in case of success and %-1 in case of failure.
+ */
+static int dev_read_pos_int(const char *patt, int mtd_num, int *value)
+{
+	char file[strlen(patt) + 50];
+
+	sprintf(file, patt, mtd_num);
+	return read_pos_int(file, value);
+}
+
+/**
+ * dev_read_pos_ll - read a positive 'long long' value from an MTD device sysfs file.
+ * @patt: file pattern to read from
+ * @mtd_num: MTD device number
+ * @value: the result is stored here
+ *
+ * This function returns %0 in case of success and %-1 in case of failure.
+ */
+static int dev_read_pos_ll(const char *patt, int mtd_num, long long *value)
+{
+	char file[strlen(patt) + 50];
+
+	sprintf(file, patt, mtd_num);
+	return read_pos_ll(file, value);
+}
+
+/**
+ * type_str2int - convert MTD device type to integer.
+ * @str: MTD device type string to convert
+ *
+ * This function converts MTD device type string @str, read from sysfs, into an
+ * integer.
+ */
+static int type_str2int(const char *str)
+{
+	if (!strcmp(str, "nand"))
+		return MTD_NANDFLASH;
+	if (!strcmp(str, "nor"))
+		return MTD_NORFLASH;
+	if (!strcmp(str, "rom"))
+		return MTD_ROM;
+	if (!strcmp(str, "absent"))
+		return MTD_ABSENT;
+	if (!strcmp(str, "dataflash"))
+		return MTD_DATAFLASH;
+	if (!strcmp(str, "ram"))
+		return MTD_RAM;
+	if (!strcmp(str, "ubi"))
+		return MTD_UBIVOLUME;
+	return -1;
+}
+
+/**
+ * dev_node2num - find UBI device number by its character device node.
+ * @lib: MTD library descriptor
+ * @node: name of the MTD device node
+ * @mtd_num: MTD device number is returned here
+ *
+ * This function returns %0 in case of success and %-1 in case of failure.
+ */
+static int dev_node2num(struct libmtd *lib, const char *node, int *mtd_num)
+{
+	struct stat st;
+	int i, major, minor;
+	struct mtd_info info;
+
+	if (stat(node, &st))
+		return sys_errmsg("cannot get information about \"%s\"", node);
+
+	if (!S_ISCHR(st.st_mode)) {
+		errmsg("\"%s\" is not a character device", node);
+		errno = EINVAL;
+		return -1;
+	}
+
+	major = major(st.st_rdev);
+	minor = minor(st.st_rdev);
+
+	if (mtd_get_info((libmtd_t *)lib, &info))
+		return -1;
+
+	for (i = info.lowest_mtd_num; i <= info.highest_mtd_num; i++) {
+		int major1, minor1, ret;
+
+		ret = dev_get_major(lib, i, &major1, &minor1);
+		if (ret) {
+			if (errno == ENOENT)
+				continue;
+			if (!errno)
+				break;
+			return -1;
+		}
+
+		if (major1 == major && minor1 == minor) {
+			errno = 0;
+			*mtd_num = i;
+			return 0;
+		}
+	}
+
+	errno = ENODEV;
+	return -1;
+}
+
+/**
+ * sysfs_is_supported - check whether the MTD sub-system supports MTD.
+ * @lib: MTD library descriptor
+ *
+ * The Linux kernel MTD subsystem gained MTD support starting from kernel
+ * 2.6.30 and libmtd tries to use sysfs interface if possible, because the NAND
+ * sub-page size is available there (and not available at all in pre-sysfs
+ * kernels).
+ *
+ * Very old kernels did not have "/sys/class/mtd" directory. Not very old
+ * kernels (e.g., 2.6.29) did have "/sys/class/mtd/mtdX" directories, by there
+ * were no files there, e.g., the "name" file was not present. So all we can do
+ * is to check for a "/sys/class/mtd/mtdX/name" file. But this is not a
+ * reliable check, because if this is a new system with no MTD devices - we'll
+ * treat it as a pre-sysfs system.
+ */
+static int sysfs_is_supported(struct libmtd *lib)
+{
+	int fd, num = -1;
+	DIR *sysfs_mtd;
+	char file[strlen(lib->mtd_name) + 10];
+
+	sysfs_mtd = opendir(lib->sysfs_mtd);
+	if (!sysfs_mtd) {
+		if (errno == ENOENT) {
+			errno = 0;
+			return 0;
+		}
+		return sys_errmsg("cannot open \"%s\"", lib->sysfs_mtd);
+	}
+
+	/*
+	 * First of all find an "mtdX" directory. This is needed because there
+	 * may be, for example, mtd1 but no mtd0.
+	 */
+	while (1) {
+		int ret, mtd_num;
+		char tmp_buf[256];
+		struct dirent *dirent;
+
+		dirent = readdir(sysfs_mtd);
+		if (!dirent)
+			break;
+
+		if (strlen(dirent->d_name) >= 255) {
+			errmsg("invalid entry in %s: \"%s\"",
+			       lib->sysfs_mtd, dirent->d_name);
+			errno = EINVAL;
+			closedir(sysfs_mtd);
+			return -1;
+		}
+
+		ret = sscanf(dirent->d_name, MTD_NAME_PATT"%s",
+			     &mtd_num, tmp_buf);
+		if (ret == 1) {
+			num = mtd_num;
+			break;
+		}
+	}
+
+	if (closedir(sysfs_mtd))
+		return sys_errmsg("closedir failed on \"%s\"", lib->sysfs_mtd);
+
+	if (num == -1)
+		/* No mtd device, treat this as pre-sysfs system */
+		return 0;
+
+	sprintf(file, lib->mtd_name, num);
+	fd = open(file, O_RDONLY);
+	if (fd == -1)
+		return 0;
+
+	if (close(fd)) {
+		sys_errmsg("close failed on \"%s\"", file);
+		return -1;
+	}
+
+	return 1;
+}
+
+libmtd_t libmtd_open(void)
+{
+	struct libmtd *lib;
+
+	lib = calloc(1, sizeof(struct libmtd));
+	if (!lib)
+		return NULL;
+
+	lib->sysfs_mtd = mkpath("/sys", SYSFS_MTD);
+	if (!lib->sysfs_mtd)
+		goto out_error;
+
+	lib->mtd = mkpath(lib->sysfs_mtd, MTD_NAME_PATT);
+	if (!lib->mtd)
+		goto out_error;
+
+	lib->mtd_name = mkpath(lib->mtd, MTD_NAME);
+	if (!lib->mtd_name)
+		goto out_error;
+
+	if (!sysfs_is_supported(lib)) {
+		free(lib->mtd);
+		free(lib->sysfs_mtd);
+		free(lib->mtd_name);
+		lib->mtd_name = lib->mtd = lib->sysfs_mtd = NULL;
+		return lib;
+	}
+
+	lib->mtd_dev = mkpath(lib->mtd, MTD_DEV);
+	if (!lib->mtd_dev)
+		goto out_error;
+
+	lib->mtd_type = mkpath(lib->mtd, MTD_TYPE);
+	if (!lib->mtd_type)
+		goto out_error;
+
+	lib->mtd_eb_size = mkpath(lib->mtd, MTD_EB_SIZE);
+	if (!lib->mtd_eb_size)
+		goto out_error;
+
+	lib->mtd_size = mkpath(lib->mtd, MTD_SIZE);
+	if (!lib->mtd_size)
+		goto out_error;
+
+	lib->mtd_min_io_size = mkpath(lib->mtd, MTD_MIN_IO_SIZE);
+	if (!lib->mtd_min_io_size)
+		goto out_error;
+
+	lib->mtd_subpage_size = mkpath(lib->mtd, MTD_SUBPAGE_SIZE);
+	if (!lib->mtd_subpage_size)
+		goto out_error;
+
+	lib->mtd_oob_size = mkpath(lib->mtd, MTD_OOB_SIZE);
+	if (!lib->mtd_oob_size)
+		goto out_error;
+
+	lib->mtd_region_cnt = mkpath(lib->mtd, MTD_REGION_CNT);
+	if (!lib->mtd_region_cnt)
+		goto out_error;
+
+	lib->mtd_flags = mkpath(lib->mtd, MTD_FLAGS);
+	if (!lib->mtd_flags)
+		goto out_error;
+
+	lib->sysfs_supported = 1;
+	return lib;
+
+out_error:
+	libmtd_close((libmtd_t)lib);
+	return NULL;
+}
+
+void libmtd_close(libmtd_t desc)
+{
+	struct libmtd *lib = (struct libmtd *)desc;
+
+	free(lib->mtd_flags);
+	free(lib->mtd_region_cnt);
+	free(lib->mtd_oob_size);
+	free(lib->mtd_subpage_size);
+	free(lib->mtd_min_io_size);
+	free(lib->mtd_size);
+	free(lib->mtd_eb_size);
+	free(lib->mtd_type);
+	free(lib->mtd_dev);
+	free(lib->mtd_name);
+	free(lib->mtd);
+	free(lib->sysfs_mtd);
+	free(lib);
+}
+
+int mtd_get_info(libmtd_t desc, struct mtd_info *info)
+{
+	DIR *sysfs_mtd;
+	struct dirent *dirent;
+	struct libmtd *lib = (struct libmtd *)desc;
+
+	memset(info, 0, sizeof(struct mtd_info));
+
+	if (!lib->sysfs_supported)
+		return legacy_mtd_get_info(info);
+
+	info->sysfs_supported = 1;
+
+	/*
+	 * We have to scan the MTD sysfs directory to identify how many MTD
+	 * devices are present.
+	 */
+	sysfs_mtd = opendir(lib->sysfs_mtd);
+	if (!sysfs_mtd) {
+		if (errno == ENOENT) {
+			errno = ENODEV;
+			return -1;
+		}
+		return sys_errmsg("cannot open \"%s\"", lib->sysfs_mtd);
+	}
+
+	info->lowest_mtd_num = INT_MAX;
+	while (1) {
+		int mtd_num, ret;
+		char tmp_buf[256];
+
+		errno = 0;
+		dirent = readdir(sysfs_mtd);
+		if (!dirent)
+			break;
+
+		if (strlen(dirent->d_name) >= 255) {
+			errmsg("invalid entry in %s: \"%s\"",
+			       lib->sysfs_mtd, dirent->d_name);
+			errno = EINVAL;
+			goto out_close;
+		}
+
+		ret = sscanf(dirent->d_name, MTD_NAME_PATT"%s",
+			     &mtd_num, tmp_buf);
+		if (ret == 1) {
+			info->mtd_dev_cnt += 1;
+			if (mtd_num > info->highest_mtd_num)
+				info->highest_mtd_num = mtd_num;
+			if (mtd_num < info->lowest_mtd_num)
+				info->lowest_mtd_num = mtd_num;
+		}
+	}
+
+	if (!dirent && errno) {
+		sys_errmsg("readdir failed on \"%s\"", lib->sysfs_mtd);
+		goto out_close;
+	}
+
+	if (closedir(sysfs_mtd))
+		return sys_errmsg("closedir failed on \"%s\"", lib->sysfs_mtd);
+
+	if (info->lowest_mtd_num == INT_MAX)
+		info->lowest_mtd_num = 0;
+
+	return 0;
+
+out_close:
+	closedir(sysfs_mtd);
+	return -1;
+}
+
+int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd)
+{
+	int ret;
+	struct stat st;
+	struct libmtd *lib = (struct libmtd *)desc;
+
+	memset(mtd, 0, sizeof(struct mtd_dev_info));
+	mtd->mtd_num = mtd_num;
+
+	if (!lib->sysfs_supported)
+		return legacy_get_dev_info1(mtd_num, mtd);
+	else {
+		char file[strlen(lib->mtd) + 10];
+
+		sprintf(file, lib->mtd, mtd_num);
+		if (stat(file, &st)) {
+			if (errno == ENOENT)
+				errno = ENODEV;
+			return -1;
+		}
+	}
+
+	if (dev_get_major(lib, mtd_num, &mtd->major, &mtd->minor))
+		return -1;
+
+	ret = dev_read_data(lib->mtd_name, mtd_num, &mtd->name,
+			    MTD_NAME_MAX + 1);
+	if (ret < 0)
+		return -1;
+	((char *)mtd->name)[ret - 1] = '\0';
+
+	ret = dev_read_data(lib->mtd_type, mtd_num, &mtd->type_str,
+			    MTD_TYPE_MAX + 1);
+	if (ret < 0)
+		return -1;
+	((char *)mtd->type_str)[ret - 1] = '\0';
+
+	if (dev_read_pos_int(lib->mtd_eb_size, mtd_num, &mtd->eb_size))
+		return -1;
+	if (dev_read_pos_ll(lib->mtd_size, mtd_num, &mtd->size))
+		return -1;
+	if (dev_read_pos_int(lib->mtd_min_io_size, mtd_num, &mtd->min_io_size))
+		return -1;
+	if (dev_read_pos_int(lib->mtd_subpage_size, mtd_num, &mtd->subpage_size))
+		return -1;
+	if (dev_read_pos_int(lib->mtd_oob_size, mtd_num, &mtd->oob_size))
+		return -1;
+	if (dev_read_pos_int(lib->mtd_region_cnt, mtd_num, &mtd->region_cnt))
+		return -1;
+	if (dev_read_hex_int(lib->mtd_flags, mtd_num, &ret))
+		return -1;
+	mtd->writable = !!(ret & MTD_WRITEABLE);
+
+	mtd->eb_cnt = mtd->size / mtd->eb_size;
+	mtd->type = type_str2int(mtd->type_str);
+	mtd->bb_allowed = !!(mtd->type == MTD_NANDFLASH);
+
+	return 0;
+}
+
+int mtd_get_dev_info(libmtd_t desc, const char *node, struct mtd_dev_info *mtd)
+{
+	int mtd_num;
+	struct libmtd *lib = (struct libmtd *)desc;
+
+	if (!lib->sysfs_supported)
+		return legacy_get_dev_info(node, mtd);
+
+	if (dev_node2num(lib, node, &mtd_num))
+		return -1;
+
+	return mtd_get_dev_info1(desc, mtd_num, mtd);
+}
+
+int mtd_erase(const struct mtd_dev_info *mtd, int fd, int eb)
+{
+	struct erase_info_user ei;
+
+	ei.start = eb * mtd->eb_size;;
+	ei.length = mtd->eb_size;
+	return ioctl(fd, MEMERASE, &ei);
+}
+
+/* Patterns to write to a physical eraseblock when torturing it */
+static uint8_t patterns[] = {0xa5, 0x5a, 0x0};
+
+/**
+ * check_pattern - check if buffer contains only a certain byte pattern.
+ * @buf: buffer to check
+ * @patt: the pattern to check
+ * @size: buffer size in bytes
+ *
+ * This function returns %1 in there are only @patt bytes in @buf, and %0 if
+ * something else was also found.
+ */
+static int check_pattern(const void *buf, uint8_t patt, int size)
+{
+	int i;
+
+	for (i = 0; i < size; i++)
+		if (((const uint8_t *)buf)[i] != patt)
+			return 0;
+	return 1;
+}
+
+int mtd_torture(const struct mtd_dev_info *mtd, int fd, int eb)
+{
+	int err, i, patt_count;
+	void *buf;
+
+	normsg("run torture test for PEB %d", eb);
+	patt_count = ARRAY_SIZE(patterns);
+
+	buf = malloc(mtd->eb_size);
+	if (!buf) {
+		errmsg("cannot allocate %d bytes of memory", mtd->eb_size);
+		return -1;
+	}
+
+	for (i = 0; i < patt_count; i++) {
+		err = mtd_erase(mtd, fd, eb);
+		if (err)
+			goto out;
+
+		/* Make sure the PEB contains only 0xFF bytes */
+		err = mtd_read(mtd, fd, eb, 0, buf, mtd->eb_size);
+		if (err)
+			goto out;
+
+		err = check_pattern(buf, 0xFF, mtd->eb_size);
+		if (err == 0) {
+			errmsg("erased PEB %d, but a non-0xFF byte found", eb);
+			errno = EIO;
+			goto out;
+		}
+
+		/* Write a pattern and check it */
+		memset(buf, patterns[i], mtd->eb_size);
+		err = mtd_write(mtd, fd, eb, 0, buf, mtd->eb_size);
+		if (err)
+			goto out;
+
+		memset(buf, ~patterns[i], mtd->eb_size);
+		err = mtd_read(mtd, fd, eb, 0, buf, mtd->eb_size);
+		if (err)
+			goto out;
+
+		err = check_pattern(buf, patterns[i], mtd->eb_size);
+		if (err == 0) {
+			errmsg("pattern %x checking failed for PEB %d",
+				patterns[i], eb);
+			errno = EIO;
+			goto out;
+		}
+	}
+
+	err = 0;
+	normsg("PEB %d passed torture test, do not mark it a bad", eb);
+
+out:
+	free(buf);
+	return -1;
+}
+
+int mtd_is_bad(const struct mtd_dev_info *mtd, int fd, int eb)
+{
+	int ret;
+	loff_t seek;
+
+	if (eb < 0 || eb >= mtd->eb_cnt) {
+		errmsg("bad eraseblock number %d, mtd%d has %d eraseblocks",
+		       eb, mtd->mtd_num, mtd->eb_cnt);
+		errno = EINVAL;
+		return -1;
+	}
+
+	if (!mtd->bb_allowed)
+		return 0;
+
+	seek = (loff_t)eb * mtd->eb_size;
+	ret = ioctl(fd, MEMGETBADBLOCK, &seek);
+	if (ret == -1)
+		return sys_errmsg("MEMGETBADBLOCK ioctl failed for "
+				  "eraseblock %d (mtd%d)", eb, mtd->mtd_num);
+	return ret;
+}
+
+int mtd_mark_bad(const struct mtd_dev_info *mtd, int fd, int eb)
+{
+	int ret;
+	loff_t seek;
+
+	if (!mtd->bb_allowed) {
+		errno = EINVAL;
+		return -1;
+	}
+
+	if (eb < 0 || eb >= mtd->eb_cnt) {
+		errmsg("bad eraseblock number %d, mtd%d has %d eraseblocks",
+		       eb, mtd->mtd_num, mtd->eb_cnt);
+		errno = EINVAL;
+		return -1;
+	}
+
+	seek = (loff_t)eb * mtd->eb_size;
+	ret = ioctl(fd, MEMSETBADBLOCK, &seek);
+	if (ret == -1)
+		return sys_errmsg("MEMSETBADBLOCK ioctl failed for "
+			          "eraseblock %d (mtd%d)", eb, mtd->mtd_num);
+	return 0;
+}
+
+int mtd_read(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
+	     void *buf, int len)
+{
+	int ret, rd = 0;
+	off_t seek;
+
+	if (eb < 0 || eb >= mtd->eb_cnt) {
+		errmsg("bad eraseblock number %d, mtd%d has %d eraseblocks",
+		       eb, mtd->mtd_num, mtd->eb_cnt);
+		errno = EINVAL;
+		return -1;
+	}
+	if (offs < 0 || offs + len > mtd->eb_size) {
+		errmsg("bad offset %d or length %d, mtd%d eraseblock size is %d",
+		       offs, len, mtd->mtd_num, mtd->eb_size);
+		errno = EINVAL;
+		return -1;
+	}
+
+	/* Seek to the beginning of the eraseblock */
+	seek = (off_t)eb * mtd->eb_size + offs;
+	if (lseek(fd, seek, SEEK_SET) != seek)
+		return sys_errmsg("cannot seek mtd%d to offset %llu",
+				  mtd->mtd_num, (unsigned long long)seek);
+
+	while (rd < len) {
+		ret = read(fd, buf, len);
+		if (ret < 0)
+			return sys_errmsg("cannot read %d bytes from mtd%d (eraseblock %d, offset %d)",
+					  len, mtd->mtd_num, eb, offs);
+		rd += ret;
+	}
+
+	return 0;
+}
+
+int mtd_write(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
+	      void *buf, int len)
+{
+	int ret;
+	off_t seek;
+
+	if (eb < 0 || eb >= mtd->eb_cnt) {
+		errmsg("bad eraseblock number %d, mtd%d has %d eraseblocks",
+		       eb, mtd->mtd_num, mtd->eb_cnt);
+		errno = EINVAL;
+		return -1;
+	}
+	if (offs < 0 || offs + len > mtd->eb_size) {
+		errmsg("bad offset %d or length %d, mtd%d eraseblock size is %d",
+		       offs, len, mtd->mtd_num, mtd->eb_size);
+		errno = EINVAL;
+		return -1;
+	}
+	if (offs % mtd->subpage_size) {
+		errmsg("write offset %d is not aligned to mtd%d min. I/O size %d",
+		       offs, mtd->mtd_num, mtd->subpage_size);
+		errno = EINVAL;
+		return -1;
+	}
+	if (len % mtd->subpage_size) {
+		errmsg("write length %d is not aligned to mtd%d min. I/O size %d",
+		       len, mtd->mtd_num, mtd->subpage_size);
+		errno = EINVAL;
+		return -1;
+	}
+
+	/* Seek to the beginning of the eraseblock */
+	seek = (off_t)eb * mtd->eb_size + offs;
+	if (lseek(fd, seek, SEEK_SET) != seek)
+		return sys_errmsg("cannot seek mtd%d to offset %llu",
+				  mtd->mtd_num, (unsigned long long)seek);
+
+	ret = write(fd, buf, len);
+	if (ret != len)
+		return sys_errmsg("cannot write %d bytes to mtd%d (eraseblock %d, offset %d)",
+				  len, mtd->mtd_num, eb, offs);
+
+	return 0;
+}
+
+int mtd_write_img(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
+		  const char *img_name)
+{
+	int tmp, ret, in_fd, len, written = 0;
+	off_t seek;
+	struct stat st;
+	char *buf;
+
+	if (eb < 0 || eb >= mtd->eb_cnt) {
+		errmsg("bad eraseblock number %d, mtd%d has %d eraseblocks",
+		       eb, mtd->mtd_num, mtd->eb_cnt);
+		errno = EINVAL;
+		return -1;
+	}
+	if (offs < 0 || offs >= mtd->eb_size) {
+		errmsg("bad offset %d, mtd%d eraseblock size is %d",
+		       offs, mtd->mtd_num, mtd->eb_size);
+		errno = EINVAL;
+		return -1;
+	}
+	if (offs % mtd->subpage_size) {
+		errmsg("write offset %d is not aligned to mtd%d min. I/O size %d",
+		       offs, mtd->mtd_num, mtd->subpage_size);
+		errno = EINVAL;
+		return -1;
+	}
+
+	in_fd = open(img_name, O_RDONLY);
+	if (in_fd == -1)
+		return sys_errmsg("cannot open %s", img_name);
+
+	if (fstat(in_fd, &st)) {
+		sys_errmsg("cannot stat %s", img_name);
+		goto out_close;
+	}
+
+	len = st.st_size;
+	if (len % mtd->subpage_size) {
+		errmsg("size of \"%s\" is %d byte, which is not aligned to "
+		       "mtd%d min. I/O size %d", img_name, len, mtd->mtd_num,
+		       mtd->subpage_size);
+		errno = EINVAL;
+		goto out_close;
+	}
+	tmp = (offs + len + mtd->eb_size - 1) / mtd->eb_size;
+	if (eb + tmp > mtd->eb_cnt) {
+		errmsg("\"%s\" image size is %d bytes, mtd%d size is %d "
+		       "eraseblocks, the image does not fit if we write it "
+		       "starting from eraseblock %d, offset %d",
+		       img_name, len, mtd->mtd_num, mtd->eb_cnt, eb, offs);
+		errno = EINVAL;
+		goto out_close;
+	}
+
+	/* Seek to the beginning of the eraseblock */
+	seek = (off_t)eb * mtd->eb_size + offs;
+	if (lseek(fd, seek, SEEK_SET) != seek) {
+		sys_errmsg("cannot seek mtd%d to offset %llu",
+			    mtd->mtd_num, (unsigned long long)seek);
+		goto out_close;
+	}
+
+	buf = malloc(mtd->eb_size);
+	if (!buf) {
+		sys_errmsg("cannot allocate %d bytes of memory", mtd->eb_size);
+		goto out_close;
+	}
+
+	while (written < len) {
+		int rd = 0;
+
+		do {
+			ret = read(in_fd, buf, mtd->eb_size - offs - rd);
+			if (ret == -1) {
+				sys_errmsg("cannot read from %s", img_name);
+				goto out_free;
+			}
+			rd += ret;
+		} while (ret && rd < mtd->eb_size - offs);
+
+		ret = write(fd, buf, rd);
+		if (ret != rd) {
+			sys_errmsg("cannot write %d bytes to mtd%d (eraseblock %d, offset %d)",
+				   len, mtd->mtd_num, eb, offs);
+			goto out_free;
+		}
+
+		offs = 0;
+		eb += 1;
+		written += rd;
+	}
+
+	free(buf);
+	close(in_fd);
+	return 0;
+
+out_free:
+	free(buf);
+out_close:
+	close(in_fd);
+	return -1;
+}
+
+int mtd_probe_node(libmtd_t desc, const char *node)
+{
+	struct stat st;
+	struct mtd_info info;
+	int i, major, minor;
+	struct libmtd *lib = (struct libmtd *)desc;
+
+	if (stat(node, &st))
+		return sys_errmsg("cannot get information about \"%s\"", node);
+
+	if (!S_ISCHR(st.st_mode)) {
+		errmsg("\"%s\" is not a character device", node);
+		errno = EINVAL;
+		return -1;
+	}
+
+	major = major(st.st_rdev);
+	minor = minor(st.st_rdev);
+
+	if (mtd_get_info((libmtd_t *)lib, &info))
+		return -1;
+
+	if (!lib->sysfs_supported)
+		return 0;
+
+	for (i = info.lowest_mtd_num; i <= info.highest_mtd_num; i++) {
+		int major1, minor1, ret;
+
+		ret = dev_get_major(lib, i, &major1, &minor1);
+		if (ret) {
+			if (errno == ENOENT)
+				continue;
+			if (!errno)
+				break;
+			return -1;
+		}
+
+		if (major1 == major && minor1 == minor)
+			return 1;
+	}
+
+	errno = 0;
+	return -1;
+}
diff --git a/lib/libmtd_int.h b/lib/libmtd_int.h
new file mode 100644
index 0000000..7de4b42
--- /dev/null
+++ b/lib/libmtd_int.h
@@ -0,0 +1,88 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ * Copyright (C) 2009 Nokia Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *
+ * Author: Artem Bityutskiy
+ *
+ * MTD library.
+ */
+
+#ifndef __LIBMTD_INT_H__
+#define __LIBMTD_INT_H__
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+#define PROGRAM_NAME "libmtd"
+
+#define SYSFS_MTD        "class/mtd"
+#define MTD_NAME_PATT    "mtd%d"
+#define MTD_DEV          "dev"
+#define MTD_NAME         "name"
+#define MTD_TYPE         "type"
+#define MTD_EB_SIZE      "erasesize"
+#define MTD_SIZE         "size"
+#define MTD_MIN_IO_SIZE  "writesize"
+#define MTD_SUBPAGE_SIZE "subpagesize"
+#define MTD_OOB_SIZE     "oobsize"
+#define MTD_REGION_CNT   "numeraseregions"
+#define MTD_FLAGS        "flags"
+
+/**
+ * libmtd - MTD library description data structure.
+ * @sysfs_mtd: MTD directory in sysfs
+ * @mtd: MTD device sysfs directory pattern
+ * @mtd_dev: MTD device major/minor numbers file pattern
+ * @mtd_name: MTD device name file pattern
+ * @mtd_type: MTD device type file pattern
+ * @mtd_eb_size: MTD device eraseblock size file pattern
+ * @mtd_size: MTD device size file pattern
+ * @mtd_min_io_size: minimum I/O unit size file pattern
+ * @mtd_subpage_size: sub-page size file pattern
+ * @mtd_oob_size: MTD device OOB size file pattern
+ * @mtd_region_cnt: count of additional erase regions file pattern
+ * @mtd_flags: MTD device flags file pattern
+ * @sysfs_supported: non-zero if sysfs is supported by MTD
+ */
+struct libmtd
+{
+	char *sysfs_mtd;
+	char *mtd;
+	char *mtd_dev;
+	char *mtd_name;
+	char *mtd_type;
+	char *mtd_eb_size;
+	char *mtd_size;
+	char *mtd_min_io_size;
+	char *mtd_subpage_size;
+	char *mtd_oob_size;
+	char *mtd_region_cnt;
+	char *mtd_flags;
+	unsigned int sysfs_supported:1;
+};
+
+int legacy_libmtd_open(void);
+int legacy_mtd_get_info(struct mtd_info *info);
+int legacy_get_dev_info(const char *node, struct mtd_dev_info *mtd);
+int legacy_get_dev_info1(int dev_num, struct mtd_dev_info *mtd);
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif /* !__LIBMTD_INT_H__ */
diff --git a/lib/libmtd_legacy.c b/lib/libmtd_legacy.c
new file mode 100644
index 0000000..27fb3f8
--- /dev/null
+++ b/lib/libmtd_legacy.c
@@ -0,0 +1,359 @@
+/*
+ * Copyright (C) 2009 Nokia Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *
+ * Author: Artem Bityutskiy
+ *
+ * This file  is part of the MTD library. Implements pre-2.6.30 kernels support,
+ * where MTD did not have sysfs interface. The main limitation of the old
+ * kernels was that the sub-page size was not exported to user-space, so it was
+ * not possible to get sub-page size.
+ */
+
+#include <limits.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <stdlib.h>
+#include <errno.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <sys/ioctl.h>
+#include <mtd/mtd-user.h>
+
+#include <libmtd.h>
+#include "libmtd_int.h"
+#include "common.h"
+
+#define MTD_PROC_FILE "/proc/mtd"
+#define MTD_DEV_PATT  "/dev/mtd%d"
+#define MTD_DEV_MAJOR 90
+
+#define PROC_MTD_FIRST     "dev:    size   erasesize  name\n"
+#define PROC_MTD_FIRST_LEN (sizeof(PROC_MTD_FIRST) - 1)
+#define PROC_MTD_MAX_LEN   4096
+#define PROC_MTD_PATT      "mtd%d: %llx %x"
+
+/**
+ * struct proc_parse_info - /proc/mtd parsing information.
+ * @mtd_num: MTD device number
+ * @size: device size
+ * @eb_size: eraseblock size
+ * @name: device name
+ * @buf: contents of /proc/mtd
+ * @data_size: how much data was read into @buf
+ * @pos: next string in @buf to parse
+ */
+struct proc_parse_info
+{
+	int mtd_num;
+	long long size;
+	char name[MTD_NAME_MAX + 1];
+	int eb_size;
+	char *buf;
+	int data_size;
+	char *next;
+};
+
+static int proc_parse_start(struct proc_parse_info *pi)
+{
+	int fd, ret;
+
+	fd = open(MTD_PROC_FILE, O_RDONLY);
+	if (fd == -1)
+		return -1;
+
+	pi->buf = malloc(PROC_MTD_MAX_LEN);
+	if (!pi->buf) {
+		sys_errmsg("cannot allocate %d bytes of memory",
+			   PROC_MTD_MAX_LEN);
+		goto out_close;
+	}
+
+	ret = read(fd, pi->buf, PROC_MTD_MAX_LEN);
+	if (ret == -1) {
+		sys_errmsg("cannot read \"%s\"", MTD_PROC_FILE);
+		goto out_free;
+	}
+
+	if (ret < PROC_MTD_FIRST_LEN ||
+	    memcmp(pi->buf, PROC_MTD_FIRST, PROC_MTD_FIRST_LEN)) {
+		errmsg("\"%s\" does not start with \"%s\"", MTD_PROC_FILE,
+		       PROC_MTD_FIRST);
+		goto out_free;
+	}
+
+	pi->data_size = ret;
+	pi->next = pi->buf + PROC_MTD_FIRST_LEN;
+
+	close(fd);
+	return 0;
+
+out_free:
+	free(pi->buf);
+out_close:
+	close(fd);
+	return -1;
+}
+
+static int proc_parse_next(struct proc_parse_info *pi)
+{
+	int ret, len, pos = pi->next - pi->buf;
+	char *p, *p1;
+
+	if (pos >= pi->data_size) {
+		free(pi->buf);
+		return 0;
+	}
+
+	ret = sscanf(pi->next, PROC_MTD_PATT, &pi->mtd_num, &pi->size,
+		     &pi->eb_size);
+	if (ret != 3)
+		return errmsg("\"%s\" pattern not found", PROC_MTD_PATT);
+
+	p = memchr(pi->next, '\"', pi->data_size - pos);
+	if (!p)
+		return errmsg("opening \" not fount");
+	p += 1;
+	pos = p - pi->buf;
+	if (pos >= pi->data_size)
+		return errmsg("opening \" not fount");
+
+	p1 = memchr(p, '\"', pi->data_size - pos);
+	if (!p1)
+		return errmsg("closing \" not fount");
+	pos = p1 - pi->buf;
+	if (pos >= pi->data_size)
+		return errmsg("closing \" not fount");
+
+	len = p1 - p;
+	if (len > MTD_NAME_MAX)
+		return errmsg("too long mtd%d device name", pi->mtd_num);
+
+	memcpy(pi->name, p, len);
+	pi->name[len] = '\0';
+
+	if (p1[1] != '\n')
+		return errmsg("opening \"\n\" not fount");
+	pi->next = p1 + 2;
+	return 1;
+}
+
+/**
+ * legacy_libmtd_open - legacy version of 'libmtd_open()'.
+ *
+ * This function is just checks that MTD is present in the system. Returns
+ * zero in case of success and %-1 in case of failure. In case of failure,
+ * errno contains zero if MTD is not present in the system, or contains the
+ * error code if a real error happened. This is similar to the 'libmtd_open()'
+ * return conventions.
+ */
+int legacy_libmtd_open(void)
+{
+	int fd;
+
+	fd = open(MTD_PROC_FILE, O_RDONLY);
+	if (fd == -1) {
+		if (errno == ENOENT)
+			errno = 0;
+		return -1;
+	}
+
+	close(fd);
+	return 0;
+}
+
+/**
+ * legacy_mtd_get_info - legacy version of 'mtd_get_info()'.
+ * @info: the MTD device information is returned here
+ *
+ * This function is similar to 'mtd_get_info()' and has the same conventions.
+ */
+int legacy_mtd_get_info(struct mtd_info *info)
+{
+	int ret;
+	struct proc_parse_info pi;
+
+	ret = proc_parse_start(&pi);
+	if (ret)
+		return -1;
+
+	info->lowest_mtd_num = INT_MAX;
+	while (proc_parse_next(&pi)) {
+		info->mtd_dev_cnt += 1;
+		if (pi.mtd_num > info->highest_mtd_num)
+			info->highest_mtd_num = pi.mtd_num;
+		if (pi.mtd_num < info->lowest_mtd_num)
+			info->lowest_mtd_num = pi.mtd_num;
+	}
+
+	return 0;
+}
+
+/**
+ * legacy_get_dev_info - legacy version of 'mtd_get_dev_info()'.
+ * @node: name of the MTD device node
+ * @mtd: the MTD device information is returned here
+ *
+ * This function is similar to 'mtd_get_dev_info()' and has the same
+ * conventions.
+ */
+int legacy_get_dev_info(const char *node, struct mtd_dev_info *mtd)
+{
+	struct stat st;
+	struct mtd_info_user ui;
+	int fd, ret;
+	loff_t offs = 0;
+	struct proc_parse_info pi;
+
+	if (stat(node, &st)) {
+		sys_errmsg("cannot open \"%s\"", node);
+		if (errno == ENOENT)
+			normsg("MTD subsystem is old and does not support "
+			       "sysfs, so MTD character device nodes have "
+			       "to exist");
+	}
+
+	if (!S_ISCHR(st.st_mode)) {
+		errno = EINVAL;
+		return errmsg("\"%s\" is not a character device", node);
+	}
+
+	memset(mtd, '\0', sizeof(struct mtd_dev_info));
+	mtd->major = major(st.st_rdev);
+	mtd->minor = minor(st.st_rdev);
+
+	if (mtd->major != MTD_DEV_MAJOR) {
+		errno = EINVAL;
+		return errmsg("\"%s\" has major number %d, MTD devices have "
+			      "major %d", node, mtd->major, MTD_DEV_MAJOR);
+	}
+
+	mtd->mtd_num = mtd->minor / 2;
+
+	fd = open(node, O_RDWR);
+	if (fd == -1)
+		return sys_errmsg("cannot open \"%s\"", node);
+
+	if (ioctl(fd, MEMGETINFO, &ui)) {
+		sys_errmsg("MEMGETINFO ioctl request failed");
+		goto out_close;
+	}
+
+	ret = ioctl(fd, MEMGETBADBLOCK, &offs);
+	if (ret == -1) {
+		if (errno != EOPNOTSUPP) {
+			sys_errmsg("MEMGETBADBLOCK ioctl failed");
+			goto out_close;
+		}
+		errno = 0;
+		mtd->bb_allowed = 0;
+	} else
+		mtd->bb_allowed = 1;
+
+	mtd->type = ui.type;
+	mtd->size = ui.size;
+	mtd->eb_size = ui.erasesize;
+	mtd->min_io_size = ui.writesize;
+
+	if (mtd->min_io_size <= 0) {
+		errmsg("mtd%d (%s) has insane min. I/O unit size %d",
+		       mtd->mtd_num, node, mtd->min_io_size);
+		goto out_close;
+	}
+	if (mtd->eb_size <= 0 || mtd->eb_size < mtd->min_io_size) {
+		errmsg("mtd%d (%s) has insane eraseblock size %d",
+		       mtd->mtd_num, node, mtd->eb_size);
+		goto out_close;
+	}
+	if (mtd->size <= 0 || mtd->size < mtd->eb_size) {
+		errmsg("mtd%d (%s) has insane size %lld",
+		       mtd->mtd_num, node, mtd->size);
+		goto out_close;
+	}
+	mtd->eb_cnt = mtd->size / mtd->eb_size;
+
+	switch(mtd->type) {
+	case MTD_ABSENT:
+		errmsg("mtd%d (%s) is removable and is not present",
+		       mtd->mtd_num, node);
+		goto out_close;
+	case MTD_RAM:
+		strcpy((char *)mtd->type_str, "ram");
+		break;
+	case MTD_ROM:
+		strcpy((char *)mtd->type_str, "rom");
+		break;
+	case MTD_NORFLASH:
+		strcpy((char *)mtd->type_str, "nor");
+		break;
+	case MTD_NANDFLASH:
+		strcpy((char *)mtd->type_str, "nand");
+		break;
+	case MTD_DATAFLASH:
+		strcpy((char *)mtd->type_str, "dataflash");
+		break;
+	case MTD_UBIVOLUME:
+		strcpy((char *)mtd->type_str, "ubi");
+		break;
+	default:
+		goto out_close;
+	}
+
+	if (ui.flags & MTD_WRITEABLE)
+		mtd->writable = 1;
+	mtd->subpage_size = mtd->min_io_size;
+
+	close(fd);
+
+	/*
+	 * Unfortunately, the device name is not available via ioctl, and
+	 * we have to parse /proc/mtd to get it.
+	 */
+	ret = proc_parse_start(&pi);
+	if (ret)
+		return -1;
+
+	while (proc_parse_next(&pi)) {
+		if (pi.mtd_num == mtd->mtd_num) {
+			strcpy((char *)mtd->name, pi.name);
+			return 0;
+		}
+	}
+
+	errmsg("mtd%d not found in \"%s\"", mtd->mtd_num, MTD_PROC_FILE);
+	errno = ENOENT;
+	return -1;
+
+out_close:
+	close(fd);
+	return -1;
+}
+
+/**
+ * legacy_get_dev_info1 - legacy version of 'mtd_get_dev_info1()'.
+ * @node: name of the MTD device node
+ * @mtd: the MTD device information is returned here
+ *
+ * This function is similar to 'mtd_get_dev_info1()' and has the same
+ * conventions.
+ */
+int legacy_get_dev_info1(int mtd_num, struct mtd_dev_info *mtd)
+{
+	char node[sizeof(MTD_DEV_PATT) + 20];
+
+	sprintf(node, MTD_DEV_PATT, mtd_num);
+	return legacy_get_dev_info(node, mtd);
+}
diff --git a/mkfs.ubifs/crc32.c b/mkfs.ubifs/crc32.c
deleted file mode 100644
index 6b1e50c..0000000
--- a/mkfs.ubifs/crc32.c
+++ /dev/null
@@ -1,95 +0,0 @@
-/*
- *  COPYRIGHT (C) 1986 Gary S. Brown.  You may use this program, or
- *  code or tables extracted from it, as desired without restriction.
- *
- *  First, the polynomial itself and its table of feedback terms.  The
- *  polynomial is
- *  X^32+X^26+X^23+X^22+X^16+X^12+X^11+X^10+X^8+X^7+X^5+X^4+X^2+X^1+X^0
- *
- *  Note that we take it "backwards" and put the highest-order term in
- *  the lowest-order bit.  The X^32 term is "implied"; the LSB is the
- *  X^31 term, etc.  The X^0 term (usually shown as "+1") results in
- *  the MSB being 1
- *
- *  Note that the usual hardware shift register implementation, which
- *  is what we're using (we're merely optimizing it by doing eight-bit
- *  chunks at a time) shifts bits into the lowest-order term.  In our
- *  implementation, that means shifting towards the right.  Why do we
- *  do it this way?  Because the calculated CRC must be transmitted in
- *  order from highest-order term to lowest-order term.  UARTs transmit
- *  characters in order from LSB to MSB.  By storing the CRC this way
- *  we hand it to the UART in the order low-byte to high-byte; the UART
- *  sends each low-bit to hight-bit; and the result is transmission bit
- *  by bit from highest- to lowest-order term without requiring any bit
- *  shuffling on our part.  Reception works similarly
- *
- *  The feedback terms table consists of 256, 32-bit entries.  Notes
- *
- *      The table can be generated at runtime if desired; code to do so
- *      is shown later.  It might not be obvious, but the feedback
- *      terms simply represent the results of eight shift/xor opera
- *      tions for all combinations of data and CRC register values
- *
- *      The values must be right-shifted by eight bits by the "updcrc
- *      logic; the shift must be unsigned (bring in zeroes).  On some
- *      hardware you could probably optimize the shift in assembler by
- *      using byte-swap instructions
- *      polynomial $edb88320
- */
-
-#include <stdint.h>
-
-const uint32_t crc32_table[256] = {
-	0x00000000L, 0x77073096L, 0xee0e612cL, 0x990951baL, 0x076dc419L,
-	0x706af48fL, 0xe963a535L, 0x9e6495a3L, 0x0edb8832L, 0x79dcb8a4L,
-	0xe0d5e91eL, 0x97d2d988L, 0x09b64c2bL, 0x7eb17cbdL, 0xe7b82d07L,
-	0x90bf1d91L, 0x1db71064L, 0x6ab020f2L, 0xf3b97148L, 0x84be41deL,
-	0x1adad47dL, 0x6ddde4ebL, 0xf4d4b551L, 0x83d385c7L, 0x136c9856L,
-	0x646ba8c0L, 0xfd62f97aL, 0x8a65c9ecL, 0x14015c4fL, 0x63066cd9L,
-	0xfa0f3d63L, 0x8d080df5L, 0x3b6e20c8L, 0x4c69105eL, 0xd56041e4L,
-	0xa2677172L, 0x3c03e4d1L, 0x4b04d447L, 0xd20d85fdL, 0xa50ab56bL,
-	0x35b5a8faL, 0x42b2986cL, 0xdbbbc9d6L, 0xacbcf940L, 0x32d86ce3L,
-	0x45df5c75L, 0xdcd60dcfL, 0xabd13d59L, 0x26d930acL, 0x51de003aL,
-	0xc8d75180L, 0xbfd06116L, 0x21b4f4b5L, 0x56b3c423L, 0xcfba9599L,
-	0xb8bda50fL, 0x2802b89eL, 0x5f058808L, 0xc60cd9b2L, 0xb10be924L,
-	0x2f6f7c87L, 0x58684c11L, 0xc1611dabL, 0xb6662d3dL, 0x76dc4190L,
-	0x01db7106L, 0x98d220bcL, 0xefd5102aL, 0x71b18589L, 0x06b6b51fL,
-	0x9fbfe4a5L, 0xe8b8d433L, 0x7807c9a2L, 0x0f00f934L, 0x9609a88eL,
-	0xe10e9818L, 0x7f6a0dbbL, 0x086d3d2dL, 0x91646c97L, 0xe6635c01L,
-	0x6b6b51f4L, 0x1c6c6162L, 0x856530d8L, 0xf262004eL, 0x6c0695edL,
-	0x1b01a57bL, 0x8208f4c1L, 0xf50fc457L, 0x65b0d9c6L, 0x12b7e950L,
-	0x8bbeb8eaL, 0xfcb9887cL, 0x62dd1ddfL, 0x15da2d49L, 0x8cd37cf3L,
-	0xfbd44c65L, 0x4db26158L, 0x3ab551ceL, 0xa3bc0074L, 0xd4bb30e2L,
-	0x4adfa541L, 0x3dd895d7L, 0xa4d1c46dL, 0xd3d6f4fbL, 0x4369e96aL,
-	0x346ed9fcL, 0xad678846L, 0xda60b8d0L, 0x44042d73L, 0x33031de5L,
-	0xaa0a4c5fL, 0xdd0d7cc9L, 0x5005713cL, 0x270241aaL, 0xbe0b1010L,
-	0xc90c2086L, 0x5768b525L, 0x206f85b3L, 0xb966d409L, 0xce61e49fL,
-	0x5edef90eL, 0x29d9c998L, 0xb0d09822L, 0xc7d7a8b4L, 0x59b33d17L,
-	0x2eb40d81L, 0xb7bd5c3bL, 0xc0ba6cadL, 0xedb88320L, 0x9abfb3b6L,
-	0x03b6e20cL, 0x74b1d29aL, 0xead54739L, 0x9dd277afL, 0x04db2615L,
-	0x73dc1683L, 0xe3630b12L, 0x94643b84L, 0x0d6d6a3eL, 0x7a6a5aa8L,
-	0xe40ecf0bL, 0x9309ff9dL, 0x0a00ae27L, 0x7d079eb1L, 0xf00f9344L,
-	0x8708a3d2L, 0x1e01f268L, 0x6906c2feL, 0xf762575dL, 0x806567cbL,
-	0x196c3671L, 0x6e6b06e7L, 0xfed41b76L, 0x89d32be0L, 0x10da7a5aL,
-	0x67dd4accL, 0xf9b9df6fL, 0x8ebeeff9L, 0x17b7be43L, 0x60b08ed5L,
-	0xd6d6a3e8L, 0xa1d1937eL, 0x38d8c2c4L, 0x4fdff252L, 0xd1bb67f1L,
-	0xa6bc5767L, 0x3fb506ddL, 0x48b2364bL, 0xd80d2bdaL, 0xaf0a1b4cL,
-	0x36034af6L, 0x41047a60L, 0xdf60efc3L, 0xa867df55L, 0x316e8eefL,
-	0x4669be79L, 0xcb61b38cL, 0xbc66831aL, 0x256fd2a0L, 0x5268e236L,
-	0xcc0c7795L, 0xbb0b4703L, 0x220216b9L, 0x5505262fL, 0xc5ba3bbeL,
-	0xb2bd0b28L, 0x2bb45a92L, 0x5cb36a04L, 0xc2d7ffa7L, 0xb5d0cf31L,
-	0x2cd99e8bL, 0x5bdeae1dL, 0x9b64c2b0L, 0xec63f226L, 0x756aa39cL,
-	0x026d930aL, 0x9c0906a9L, 0xeb0e363fL, 0x72076785L, 0x05005713L,
-	0x95bf4a82L, 0xe2b87a14L, 0x7bb12baeL, 0x0cb61b38L, 0x92d28e9bL,
-	0xe5d5be0dL, 0x7cdcefb7L, 0x0bdbdf21L, 0x86d3d2d4L, 0xf1d4e242L,
-	0x68ddb3f8L, 0x1fda836eL, 0x81be16cdL, 0xf6b9265bL, 0x6fb077e1L,
-	0x18b74777L, 0x88085ae6L, 0xff0f6a70L, 0x66063bcaL, 0x11010b5cL,
-	0x8f659effL, 0xf862ae69L, 0x616bffd3L, 0x166ccf45L, 0xa00ae278L,
-	0xd70dd2eeL, 0x4e048354L, 0x3903b3c2L, 0xa7672661L, 0xd06016f7L,
-	0x4969474dL, 0x3e6e77dbL, 0xaed16a4aL, 0xd9d65adcL, 0x40df0b66L,
-	0x37d83bf0L, 0xa9bcae53L, 0xdebb9ec5L, 0x47b2cf7fL, 0x30b5ffe9L,
-	0xbdbdf21cL, 0xcabac28aL, 0x53b39330L, 0x24b4a3a6L, 0xbad03605L,
-	0xcdd70693L, 0x54de5729L, 0x23d967bfL, 0xb3667a2eL, 0xc4614ab8L,
-	0x5d681b02L, 0x2a6f2b94L, 0xb40bbe37L, 0xc30c8ea1L, 0x5a05df1bL,
-	0x2d02ef8dL
-};
diff --git a/mkfs.ubifs/crc32.h b/mkfs.ubifs/crc32.h
deleted file mode 100644
index 86fc841..0000000
--- a/mkfs.ubifs/crc32.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/*
- * This code was taken from the linux kernel. The license is GPL Version 2.
- */
-
-#ifndef __CRC32_H__
-#define __CRC32_H__
-
-#include <stdint.h>
-
-extern const uint32_t crc32_table[256];
-
-/* Return a 32-bit CRC of the contents of the buffer. */
-static inline uint32_t ubifs_crc32(uint32_t val, const void *ss, int len)
-{
-	const unsigned char *s = ss;
-
-	while (--len >= 0)
-		val = crc32_table[(val ^ *s++) & 0xff] ^ (val >> 8);
-	return val;
-}
-
-#endif /* __CRC32_H__ */
diff --git a/ubi-utils/include/libmtd.h b/ubi-utils/include/libmtd.h
deleted file mode 100644
index 0aea966..0000000
--- a/ubi-utils/include/libmtd.h
+++ /dev/null
@@ -1,246 +0,0 @@
-/*
- * Copyright (C) 2008, 2009 Nokia Corporation
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- *
- * Author: Artem Bityutskiy
- *
- * MTD library.
- */
-
-#ifndef __LIBMTD_H__
-#define __LIBMTD_H__
-
-#ifdef __cplusplus
-extern "C" {
-#endif
-
-/* Maximum MTD device name length */
-#define MTD_NAME_MAX 127
-/* Maximum MTD device type string length */
-#define MTD_TYPE_MAX 64
-
-/* MTD library descriptor */
-typedef void * libmtd_t;
-
-/**
- * @mtd_dev_cnt: count of MTD devices in system
- * @lowest_mtd_num: lowest MTD device number in system
- * @highest_mtd_num: highest MTD device number in system
- * @sysfs_supported: non-zero if sysfs is supported by MTD
- */
-struct mtd_info
-{
-	int mtd_dev_cnt;
-	int lowest_mtd_num;
-	int highest_mtd_num;
-	unsigned int sysfs_supported:1;
-};
-
-/**
- * struct mtd_dev_info - information about an MTD device.
- * @mtd_num: MTD device number
- * @major: major number of corresponding character device
- * @minor: minor number of corresponding character device
- * @type: flash type (constants like %MTD_NANDFLASH defined in mtd-abi.h)
- * @type_str: static R/O flash type string
- * @name: device name
- * @size: device size in bytes
- * @eb_cnt: count of eraseblocks
- * @eb_size: eraseblock size
- * @min_io_size: minimum input/output unit size
- * @subpage_size: sub-page size
- * @oob_size: OOB size (zero if the device does not have OOB area)
- * @region_cnt: count of additional erase regions
- * @writable: zero if the device is read-only
- * @bb_allowed: non-zero if the MTD device may have bad eraseblocks
- */
-struct mtd_dev_info
-{
-	int mtd_num;
-	int major;
-	int minor;
-	int type;
-	const char type_str[MTD_TYPE_MAX + 1];
-	const char name[MTD_NAME_MAX + 1];
-	long long size;
-	int eb_cnt;
-	int eb_size;
-	int min_io_size;
-	int subpage_size;
-	int oob_size;
-	int region_cnt;
-	unsigned int writable:1;
-	unsigned int bb_allowed:1;
-};
-
-/**
- * libmtd_open - open MTD library.
- *
- * This function initializes and opens the MTD library and returns MTD library
- * descriptor in case of success and %NULL in case of failure. In case of
- * failure, errno contains zero if MTD is not present in the system, or
- * contains the error code if a real error happened.
- */
-libmtd_t libmtd_open(void);
-
-/**
- * libmtd_close - close MTD library.
- * @desc: MTD library descriptor
- */
-void libmtd_close(libmtd_t desc);
-
-/**
- * mtd_get_info - get general MTD information.
- * @desc: MTD library descriptor
- * @info: the MTD device information is returned here
- *
- * This function fills the passed @info object with general MTD information and
- * returns %0 in case of success and %-1 in case of failure. If MTD subsystem is
- * not present in the system, errno is set to @ENODEV.
- */
-int mtd_get_info(libmtd_t desc, struct mtd_info *info);
-
-/**
- * mtd_get_dev_info - get information about an MTD device.
- * @desc: MTD library descriptor
- * @node: name of the MTD device node
- * @mtd: the MTD device information is returned here
- *
- * This function gets information about MTD device defined by the @node device
- * node file and saves this information in the @mtd object. Returns %0 in case
- * of success and %-1 in case of failure. If MTD subsystem is not present in the
- * system, or the MTD device does not exist, errno is set to @ENODEV.
- */
-int mtd_get_dev_info(libmtd_t desc, const char *node, struct mtd_dev_info *mtd);
-
-/**
- * mtd_get_dev_info1 - get information about an MTD device.
- * @desc: MTD library descriptor
- * @mtd_num: MTD device number to fetch information about
- * @mtd: the MTD device information is returned here
- *
- * This function is identical to 'mtd_get_dev_info()' except that it accepts
- * MTD device number, not MTD character device.
- */
-int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd);
-
-/**
- * mtd_erase - erase an eraseblock.
- * @mtd: MTD device description object
- * @fd: MTD device node file descriptor
- * @eb: eraseblock to erase
- *
- * This function erases eraseblock @eb of MTD device described by @fd. Returns
- * %0 in case of success and %-1 in case of failure.
- */
-int mtd_erase(const struct mtd_dev_info *mtd, int fd, int eb);
-
-/**
- * mtd_torture - torture an eraseblock.
- * @mtd: MTD device description object
- * @fd: MTD device node file descriptor
- * @eb: eraseblock to torture
- *
- * This function tortures eraseblock @eb. Returns %0 in case of success and %-1
- * in case of failure.
- */
-int mtd_torture(const struct mtd_dev_info *mtd, int fd, int eb);
-
-/**
- * mtd_is_bad - check if eraseblock is bad.
- * @mtd: MTD device description object
- * @fd: MTD device node file descriptor
- * @eb: eraseblock to check
- *
- * This function checks if eraseblock @eb is bad. Returns %0 if not, %1 if yes,
- * and %-1 in case of failure.
- */
-int mtd_is_bad(const struct mtd_dev_info *mtd, int fd, int eb);
-
-/**
- * mtd_mark_bad - mark an eraseblock as bad.
- * @mtd: MTD device description object
- * @fd: MTD device node file descriptor
- * @eb: eraseblock to mark as bad
- *
- * This function marks eraseblock @eb as bad. Returns %0 in case of success and
- * %-1 in case of failure.
- */
-int mtd_mark_bad(const struct mtd_dev_info *mtd, int fd, int eb);
-
-/**
- * mtd_read - read data from an MTD device.
- * @mtd: MTD device description object
- * @fd: MTD device node file descriptor
- * @eb: eraseblock to read from
- * @offs: offset withing the eraseblock to read from
- * @buf: buffer to read data to
- * @len: how many bytes to read
- *
- * This function reads @len bytes of data from eraseblock @eb and offset @offs
- * of the MTD device defined by @mtd and stores the read data at buffer @buf.
- * Returns %0 in case of success and %-1 in case of failure.
- */
-int mtd_read(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
-	     void *buf, int len);
-
-/**
- * mtd_write - write data to an MTD device.
- * @mtd: MTD device description object
- * @fd: MTD device node file descriptor
- * @eb: eraseblock to write to
- * @offs: offset withing the eraseblock to write to
- * @buf: buffer to write
- * @len: how many bytes to write
- *
- * This function writes @len bytes of data to eraseblock @eb and offset @offs
- * of the MTD device defined by @mtd. Returns %0 in case of success and %-1 in
- * case of failure.
- */
-int mtd_write(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
-	      void *buf, int len);
-
-/**
- * mtd_write_img - write a file to MTD device.
- * @mtd: MTD device description object
- * @fd: MTD device node file descriptor
- * @eb: eraseblock to write to
- * @offs: offset withing the eraseblock to write to
- * @img_name: the file to write
- *
- * This function writes an image @img_name the MTD device defined by @mtd. @eb
- * and @offs are the starting eraseblock and offset on the MTD device. Returns
- * %0 in case of success and %-1 in case of failure.
- */
-int mtd_write_img(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
-		  const char *img_name);
-
-/**
- * mtd_probe_node - test MTD node.
- * @desc: MTD library descriptor
- * @node: the node to test
- *
- * This function tests whether @node is an MTD device node and returns %1 if it
- * is, and %-1 if it is not (errno is ENODEV in this case) or if an error
- * occurred.
- */
-int mtd_probe_node(libmtd_t desc, const char *node);
-
-#ifdef __cplusplus
-}
-#endif
-
-#endif /* __LIBMTD_H__ */
diff --git a/ubi-utils/src/common.h b/ubi-utils/src/common.h
deleted file mode 100644
index d14cb48..0000000
--- a/ubi-utils/src/common.h
+++ /dev/null
@@ -1,87 +0,0 @@
-/*
- * Copyright (c) Artem Bityutskiy, 2007, 2008
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- */
-
-#ifndef __UBI_UTILS_COMMON_H__
-#define __UBI_UTILS_COMMON_H__
-
-#include <stdio.h>
-#include <ctype.h>
-#include <string.h>
-#include <errno.h>
-
-#ifdef __cplusplus
-extern "C" {
-#endif
-
-#define MIN(a ,b) ((a) < (b) ? (a) : (b))
-#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
-
-/* Verbose messages */
-#define verbose(verbose, fmt, ...) do {                            \
-	if (verbose)                                               \
-		printf(PROGRAM_NAME ": " fmt "\n", ##__VA_ARGS__); \
-} while(0)
-
-/* Normal messages */
-#define normsg(fmt, ...) do {                              \
-	printf(PROGRAM_NAME ": " fmt "\n", ##__VA_ARGS__); \
-} while(0)
-#define normsg_cont(fmt, ...) do {                    \
-	printf(PROGRAM_NAME ": " fmt, ##__VA_ARGS__); \
-} while(0)
-#define normsg_cont(fmt, ...) do {                         \
-	printf(PROGRAM_NAME ": " fmt, ##__VA_ARGS__);      \
-} while(0)
-
-/* Error messages */
-#define errmsg(fmt, ...)  ({                                                \
-	fprintf(stderr, PROGRAM_NAME ": error!: " fmt "\n", ##__VA_ARGS__); \
-	-1;                                                                 \
-})
-
-/* System error messages */
-#define sys_errmsg(fmt, ...)  ({                                            \
-	int _err = errno;                                                   \
-	size_t _i;                                                           \
-	fprintf(stderr, PROGRAM_NAME ": error!: " fmt "\n", ##__VA_ARGS__); \
-	for (_i = 0; _i < sizeof(PROGRAM_NAME) + 1; _i++)                   \
-		fprintf(stderr, " ");                                       \
-	fprintf(stderr, "error %d (%s)\n", _err, strerror(_err));           \
-	-1;                                                                 \
-})
-
-/* Warnings */
-#define warnmsg(fmt, ...) do {                                                \
-	fprintf(stderr, PROGRAM_NAME ": warning!: " fmt "\n", ##__VA_ARGS__); \
-} while(0)
-
-static inline int is_power_of_2(unsigned long long n)
-{
-	        return (n != 0 && ((n & (n - 1)) == 0));
-}
-
-long long ubiutils_get_bytes(const char *str);
-void ubiutils_print_bytes(long long bytes, int bracket);
-void ubiutils_print_text(FILE *stream, const char *txt, int len);
-int ubiutils_srand(void);
-
-#ifdef __cplusplus
-}
-#endif
-
-#endif /* !__UBI_UTILS_COMMON_H__ */
diff --git a/ubi-utils/src/crc32.c b/ubi-utils/src/crc32.c
deleted file mode 100644
index 6b1e50c..0000000
--- a/ubi-utils/src/crc32.c
+++ /dev/null
@@ -1,95 +0,0 @@
-/*
- *  COPYRIGHT (C) 1986 Gary S. Brown.  You may use this program, or
- *  code or tables extracted from it, as desired without restriction.
- *
- *  First, the polynomial itself and its table of feedback terms.  The
- *  polynomial is
- *  X^32+X^26+X^23+X^22+X^16+X^12+X^11+X^10+X^8+X^7+X^5+X^4+X^2+X^1+X^0
- *
- *  Note that we take it "backwards" and put the highest-order term in
- *  the lowest-order bit.  The X^32 term is "implied"; the LSB is the
- *  X^31 term, etc.  The X^0 term (usually shown as "+1") results in
- *  the MSB being 1
- *
- *  Note that the usual hardware shift register implementation, which
- *  is what we're using (we're merely optimizing it by doing eight-bit
- *  chunks at a time) shifts bits into the lowest-order term.  In our
- *  implementation, that means shifting towards the right.  Why do we
- *  do it this way?  Because the calculated CRC must be transmitted in
- *  order from highest-order term to lowest-order term.  UARTs transmit
- *  characters in order from LSB to MSB.  By storing the CRC this way
- *  we hand it to the UART in the order low-byte to high-byte; the UART
- *  sends each low-bit to hight-bit; and the result is transmission bit
- *  by bit from highest- to lowest-order term without requiring any bit
- *  shuffling on our part.  Reception works similarly
- *
- *  The feedback terms table consists of 256, 32-bit entries.  Notes
- *
- *      The table can be generated at runtime if desired; code to do so
- *      is shown later.  It might not be obvious, but the feedback
- *      terms simply represent the results of eight shift/xor opera
- *      tions for all combinations of data and CRC register values
- *
- *      The values must be right-shifted by eight bits by the "updcrc
- *      logic; the shift must be unsigned (bring in zeroes).  On some
- *      hardware you could probably optimize the shift in assembler by
- *      using byte-swap instructions
- *      polynomial $edb88320
- */
-
-#include <stdint.h>
-
-const uint32_t crc32_table[256] = {
-	0x00000000L, 0x77073096L, 0xee0e612cL, 0x990951baL, 0x076dc419L,
-	0x706af48fL, 0xe963a535L, 0x9e6495a3L, 0x0edb8832L, 0x79dcb8a4L,
-	0xe0d5e91eL, 0x97d2d988L, 0x09b64c2bL, 0x7eb17cbdL, 0xe7b82d07L,
-	0x90bf1d91L, 0x1db71064L, 0x6ab020f2L, 0xf3b97148L, 0x84be41deL,
-	0x1adad47dL, 0x6ddde4ebL, 0xf4d4b551L, 0x83d385c7L, 0x136c9856L,
-	0x646ba8c0L, 0xfd62f97aL, 0x8a65c9ecL, 0x14015c4fL, 0x63066cd9L,
-	0xfa0f3d63L, 0x8d080df5L, 0x3b6e20c8L, 0x4c69105eL, 0xd56041e4L,
-	0xa2677172L, 0x3c03e4d1L, 0x4b04d447L, 0xd20d85fdL, 0xa50ab56bL,
-	0x35b5a8faL, 0x42b2986cL, 0xdbbbc9d6L, 0xacbcf940L, 0x32d86ce3L,
-	0x45df5c75L, 0xdcd60dcfL, 0xabd13d59L, 0x26d930acL, 0x51de003aL,
-	0xc8d75180L, 0xbfd06116L, 0x21b4f4b5L, 0x56b3c423L, 0xcfba9599L,
-	0xb8bda50fL, 0x2802b89eL, 0x5f058808L, 0xc60cd9b2L, 0xb10be924L,
-	0x2f6f7c87L, 0x58684c11L, 0xc1611dabL, 0xb6662d3dL, 0x76dc4190L,
-	0x01db7106L, 0x98d220bcL, 0xefd5102aL, 0x71b18589L, 0x06b6b51fL,
-	0x9fbfe4a5L, 0xe8b8d433L, 0x7807c9a2L, 0x0f00f934L, 0x9609a88eL,
-	0xe10e9818L, 0x7f6a0dbbL, 0x086d3d2dL, 0x91646c97L, 0xe6635c01L,
-	0x6b6b51f4L, 0x1c6c6162L, 0x856530d8L, 0xf262004eL, 0x6c0695edL,
-	0x1b01a57bL, 0x8208f4c1L, 0xf50fc457L, 0x65b0d9c6L, 0x12b7e950L,
-	0x8bbeb8eaL, 0xfcb9887cL, 0x62dd1ddfL, 0x15da2d49L, 0x8cd37cf3L,
-	0xfbd44c65L, 0x4db26158L, 0x3ab551ceL, 0xa3bc0074L, 0xd4bb30e2L,
-	0x4adfa541L, 0x3dd895d7L, 0xa4d1c46dL, 0xd3d6f4fbL, 0x4369e96aL,
-	0x346ed9fcL, 0xad678846L, 0xda60b8d0L, 0x44042d73L, 0x33031de5L,
-	0xaa0a4c5fL, 0xdd0d7cc9L, 0x5005713cL, 0x270241aaL, 0xbe0b1010L,
-	0xc90c2086L, 0x5768b525L, 0x206f85b3L, 0xb966d409L, 0xce61e49fL,
-	0x5edef90eL, 0x29d9c998L, 0xb0d09822L, 0xc7d7a8b4L, 0x59b33d17L,
-	0x2eb40d81L, 0xb7bd5c3bL, 0xc0ba6cadL, 0xedb88320L, 0x9abfb3b6L,
-	0x03b6e20cL, 0x74b1d29aL, 0xead54739L, 0x9dd277afL, 0x04db2615L,
-	0x73dc1683L, 0xe3630b12L, 0x94643b84L, 0x0d6d6a3eL, 0x7a6a5aa8L,
-	0xe40ecf0bL, 0x9309ff9dL, 0x0a00ae27L, 0x7d079eb1L, 0xf00f9344L,
-	0x8708a3d2L, 0x1e01f268L, 0x6906c2feL, 0xf762575dL, 0x806567cbL,
-	0x196c3671L, 0x6e6b06e7L, 0xfed41b76L, 0x89d32be0L, 0x10da7a5aL,
-	0x67dd4accL, 0xf9b9df6fL, 0x8ebeeff9L, 0x17b7be43L, 0x60b08ed5L,
-	0xd6d6a3e8L, 0xa1d1937eL, 0x38d8c2c4L, 0x4fdff252L, 0xd1bb67f1L,
-	0xa6bc5767L, 0x3fb506ddL, 0x48b2364bL, 0xd80d2bdaL, 0xaf0a1b4cL,
-	0x36034af6L, 0x41047a60L, 0xdf60efc3L, 0xa867df55L, 0x316e8eefL,
-	0x4669be79L, 0xcb61b38cL, 0xbc66831aL, 0x256fd2a0L, 0x5268e236L,
-	0xcc0c7795L, 0xbb0b4703L, 0x220216b9L, 0x5505262fL, 0xc5ba3bbeL,
-	0xb2bd0b28L, 0x2bb45a92L, 0x5cb36a04L, 0xc2d7ffa7L, 0xb5d0cf31L,
-	0x2cd99e8bL, 0x5bdeae1dL, 0x9b64c2b0L, 0xec63f226L, 0x756aa39cL,
-	0x026d930aL, 0x9c0906a9L, 0xeb0e363fL, 0x72076785L, 0x05005713L,
-	0x95bf4a82L, 0xe2b87a14L, 0x7bb12baeL, 0x0cb61b38L, 0x92d28e9bL,
-	0xe5d5be0dL, 0x7cdcefb7L, 0x0bdbdf21L, 0x86d3d2d4L, 0xf1d4e242L,
-	0x68ddb3f8L, 0x1fda836eL, 0x81be16cdL, 0xf6b9265bL, 0x6fb077e1L,
-	0x18b74777L, 0x88085ae6L, 0xff0f6a70L, 0x66063bcaL, 0x11010b5cL,
-	0x8f659effL, 0xf862ae69L, 0x616bffd3L, 0x166ccf45L, 0xa00ae278L,
-	0xd70dd2eeL, 0x4e048354L, 0x3903b3c2L, 0xa7672661L, 0xd06016f7L,
-	0x4969474dL, 0x3e6e77dbL, 0xaed16a4aL, 0xd9d65adcL, 0x40df0b66L,
-	0x37d83bf0L, 0xa9bcae53L, 0xdebb9ec5L, 0x47b2cf7fL, 0x30b5ffe9L,
-	0xbdbdf21cL, 0xcabac28aL, 0x53b39330L, 0x24b4a3a6L, 0xbad03605L,
-	0xcdd70693L, 0x54de5729L, 0x23d967bfL, 0xb3667a2eL, 0xc4614ab8L,
-	0x5d681b02L, 0x2a6f2b94L, 0xb40bbe37L, 0xc30c8ea1L, 0x5a05df1bL,
-	0x2d02ef8dL
-};
diff --git a/ubi-utils/src/crc32.h b/ubi-utils/src/crc32.h
deleted file mode 100644
index c001fcf..0000000
--- a/ubi-utils/src/crc32.h
+++ /dev/null
@@ -1,17 +0,0 @@
-#ifndef __CRC32_H__
-#define __CRC32_H__
-
-#include <stdint.h>
-
-extern const uint32_t crc32_table[256];
-
-/* Returns a 32-bit CRC of the contents of the buffer */
-static inline uint32_t crc32(uint32_t val, const void *ss, int len)
-{
-	const unsigned char *s = ss;
-	while (--len >= 0)
-		val = crc32_table[(val ^ *s++) & 0xff] ^ (val >> 8);
-	return val;
-}
-
-#endif
diff --git a/ubi-utils/src/libmtd.c b/ubi-utils/src/libmtd.c
deleted file mode 100644
index 3ff031c..0000000
--- a/ubi-utils/src/libmtd.c
+++ /dev/null
@@ -1,1157 +0,0 @@
-/*
- * Copyright (c) International Business Machines Corp., 2006
- * Copyright (C) 2009 Nokia Corporation
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- *
- * Author: Artem Bityutskiy
- *
- * MTD library.
- */
-
-#include <limits.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <errno.h>
-#include <unistd.h>
-#include <fcntl.h>
-#include <dirent.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <mtd/mtd-user.h>
-
-#include <libmtd.h>
-#include "libmtd_int.h"
-#include "common.h"
-
-/**
- * mkpath - compose full path from 2 given components.
- * @path: the first component
- * @name: the second component
- *
- * This function returns the resulting path in case of success and %NULL in
- * case of failure.
- */
-static char *mkpath(const char *path, const char *name)
-{
-	char *n;
-	int len1 = strlen(path);
-	int len2 = strlen(name);
-
-	n = malloc(len1 + len2 + 2);
-	if (!n) {
-		sys_errmsg("cannot allocate %d bytes", len1 + len2 + 2);
-		return NULL;
-	}
-
-	memcpy(n, path, len1);
-	if (n[len1 - 1] != '/')
-		n[len1++] = '/';
-
-	memcpy(n + len1, name, len2 + 1);
-	return n;
-}
-
-/**
- * read_data - read data from a file.
- * @file: the file to read from
- * @buf: the buffer to read to
- * @buf_len: buffer length
- *
- * This function returns number of read bytes in case of success and %-1 in
- * case of failure. Note, if the file contains more then @buf_len bytes of
- * date, this function fails with %EINVAL error code.
- */
-static int read_data(const char *file, void *buf, int buf_len)
-{
-	int fd, rd, tmp, tmp1;
-
-	fd = open(file, O_RDONLY);
-	if (fd == -1)
-		return -1;
-
-	rd = read(fd, buf, buf_len);
-	if (rd == -1) {
-		sys_errmsg("cannot read \"%s\"", file);
-		goto out_error;
-	}
-
-	if (rd == buf_len) {
-		errmsg("contents of \"%s\" is too long", file);
-		errno = EINVAL;
-		goto out_error;
-	}
-
-	((char *)buf)[rd] = '\0';
-
-	/* Make sure all data is read */
-	tmp1 = read(fd, &tmp, 1);
-	if (tmp1 == 1) {
-		sys_errmsg("cannot read \"%s\"", file);
-		goto out_error;
-	}
-	if (tmp1) {
-		errmsg("file \"%s\" contains too much data (> %d bytes)",
-		       file, buf_len);
-		errno = EINVAL;
-		goto out_error;
-	}
-
-	if (close(fd)) {
-		sys_errmsg("close failed on \"%s\"", file);
-		return -1;
-	}
-
-	return rd;
-
-out_error:
-	close(fd);
-	return -1;
-}
-
-/**
- * read_major - read major and minor numbers from a file.
- * @file: name of the file to read from
- * @major: major number is returned here
- * @minor: minor number is returned here
- *
- * This function returns % in case of success, and %-1 in case of failure.
- */
-static int read_major(const char *file, int *major, int *minor)
-{
-	int ret;
-	char buf[50];
-
-	ret = read_data(file, buf, 50);
-	if (ret < 0)
-		return ret;
-
-	ret = sscanf(buf, "%d:%d\n", major, minor);
-	if (ret != 2) {
-		errno = EINVAL;
-		return errmsg("\"%s\" does not have major:minor format", file);
-	}
-
-	if (*major < 0 || *minor < 0) {
-		errno = EINVAL;
-		return errmsg("bad major:minor %d:%d in \"%s\"",
-			      *major, *minor, file);
-	}
-
-	return 0;
-}
-
-/**
- * dev_get_major - get major and minor numbers of an MTD device.
- * @lib: libmtd descriptor
- * @mtd_num: MTD device number
- * @major: major number is returned here
- * @minor: minor number is returned here
- *
- * This function returns zero in case of success and %-1 in case of failure.
- */
-static int dev_get_major(struct libmtd *lib, int mtd_num, int *major, int *minor)
-{
-	char file[strlen(lib->mtd_dev) + 50];
-
-	sprintf(file, lib->mtd_dev, mtd_num);
-	return read_major(file, major, minor);
-}
-
-/**
- * dev_read_data - read data from an MTD device's sysfs file.
- * @patt: file pattern to read from
- * @mtd_num: MTD device number
- * @buf: buffer to read to
- * @buf_len: buffer length
- *
- * This function returns number of read bytes in case of success and %-1 in
- * case of failure.
- */
-static int dev_read_data(const char *patt, int mtd_num, void *buf, int buf_len)
-{
-	char file[strlen(patt) + 100];
-
-	sprintf(file, patt, mtd_num);
-	return read_data(file, buf, buf_len);
-}
-
-/**
- * read_hex_ll - read a hex 'long long' value from a file.
- * @file: the file to read from
- * @value: the result is stored here
- *
- * This function reads file @file and interprets its contents as hexadecimal
- * 'long long' integer. If this is not true, it fails with %EINVAL error code.
- * Returns %0 in case of success and %-1 in case of failure.
- */
-static int read_hex_ll(const char *file, long long *value)
-{
-	int fd, rd;
-	char buf[50];
-
-	fd = open(file, O_RDONLY);
-	if (fd == -1)
-		return -1;
-
-	rd = read(fd, buf, sizeof(buf));
-	if (rd == -1) {
-		sys_errmsg("cannot read \"%s\"", file);
-		goto out_error;
-	}
-	if (rd == sizeof(buf)) {
-		errmsg("contents of \"%s\" is too long", file);
-		errno = EINVAL;
-		goto out_error;
-	}
-	buf[rd] = '\0';
-
-	if (sscanf(buf, "%llx\n", value) != 1) {
-		errmsg("cannot read integer from \"%s\"\n", file);
-		errno = EINVAL;
-		goto out_error;
-	}
-
-	if (*value < 0) {
-		errmsg("negative value %lld in \"%s\"", *value, file);
-		errno = EINVAL;
-		goto out_error;
-	}
-
-	if (close(fd))
-		return sys_errmsg("close failed on \"%s\"", file);
-
-	return 0;
-
-out_error:
-	close(fd);
-	return -1;
-}
-
-/**
- * read_pos_ll - read a positive 'long long' value from a file.
- * @file: the file to read from
- * @value: the result is stored here
- *
- * This function reads file @file and interprets its contents as a positive
- * 'long long' integer. If this is not true, it fails with %EINVAL error code.
- * Returns %0 in case of success and %-1 in case of failure.
- */
-static int read_pos_ll(const char *file, long long *value)
-{
-	int fd, rd;
-	char buf[50];
-
-	fd = open(file, O_RDONLY);
-	if (fd == -1)
-		return -1;
-
-	rd = read(fd, buf, 50);
-	if (rd == -1) {
-		sys_errmsg("cannot read \"%s\"", file);
-		goto out_error;
-	}
-	if (rd == 50) {
-		errmsg("contents of \"%s\" is too long", file);
-		errno = EINVAL;
-		goto out_error;
-	}
-
-	if (sscanf(buf, "%lld\n", value) != 1) {
-		errmsg("cannot read integer from \"%s\"\n", file);
-		errno = EINVAL;
-		goto out_error;
-	}
-
-	if (*value < 0) {
-		errmsg("negative value %lld in \"%s\"", *value, file);
-		errno = EINVAL;
-		goto out_error;
-	}
-
-	if (close(fd))
-		return sys_errmsg("close failed on \"%s\"", file);
-
-	return 0;
-
-out_error:
-	close(fd);
-	return -1;
-}
-
-/**
- * read_hex_int - read an 'int' value from a file.
- * @file: the file to read from
- * @value: the result is stored here
- *
- * This function is the same as 'read_pos_ll()', but it reads an 'int'
- * value, not 'long long'.
- */
-static int read_hex_int(const char *file, int *value)
-{
-	long long res;
-
-	if (read_hex_ll(file, &res))
-		return -1;
-
-	/* Make sure the value has correct range */
-	if (res > INT_MAX || res < INT_MIN) {
-		errmsg("value %lld read from file \"%s\" is out of range",
-		       res, file);
-		errno = EINVAL;
-		return -1;
-	}
-
-	*value = res;
-	return 0;
-}
-
-/**
- * read_pos_int - read a positive 'int' value from a file.
- * @file: the file to read from
- * @value: the result is stored here
- *
- * This function is the same as 'read_pos_ll()', but it reads an 'int'
- * value, not 'long long'.
- */
-static int read_pos_int(const char *file, int *value)
-{
-	long long res;
-
-	if (read_pos_ll(file, &res))
-		return -1;
-
-	/* Make sure the value is not too big */
-	if (res > INT_MAX) {
-		errmsg("value %lld read from file \"%s\" is out of range",
-		       res, file);
-		errno = EINVAL;
-		return -1;
-	}
-
-	*value = res;
-	return 0;
-}
-
-/**
- * dev_read_hex_int - read an hex 'int' value from an MTD device sysfs file.
- * @patt: file pattern to read from
- * @mtd_num: MTD device number
- * @value: the result is stored here
- *
- * This function returns %0 in case of success and %-1 in case of failure.
- */
-static int dev_read_hex_int(const char *patt, int mtd_num, int *value)
-{
-	char file[strlen(patt) + 50];
-
-	sprintf(file, patt, mtd_num);
-	return read_hex_int(file, value);
-}
-
-/**
- * dev_read_pos_int - read a positive 'int' value from an MTD device sysfs file.
- * @patt: file pattern to read from
- * @mtd_num: MTD device number
- * @value: the result is stored here
- *
- * This function returns %0 in case of success and %-1 in case of failure.
- */
-static int dev_read_pos_int(const char *patt, int mtd_num, int *value)
-{
-	char file[strlen(patt) + 50];
-
-	sprintf(file, patt, mtd_num);
-	return read_pos_int(file, value);
-}
-
-/**
- * dev_read_pos_ll - read a positive 'long long' value from an MTD device sysfs file.
- * @patt: file pattern to read from
- * @mtd_num: MTD device number
- * @value: the result is stored here
- *
- * This function returns %0 in case of success and %-1 in case of failure.
- */
-static int dev_read_pos_ll(const char *patt, int mtd_num, long long *value)
-{
-	char file[strlen(patt) + 50];
-
-	sprintf(file, patt, mtd_num);
-	return read_pos_ll(file, value);
-}
-
-/**
- * type_str2int - convert MTD device type to integer.
- * @str: MTD device type string to convert
- *
- * This function converts MTD device type string @str, read from sysfs, into an
- * integer.
- */
-static int type_str2int(const char *str)
-{
-	if (!strcmp(str, "nand"))
-		return MTD_NANDFLASH;
-	if (!strcmp(str, "nor"))
-		return MTD_NORFLASH;
-	if (!strcmp(str, "rom"))
-		return MTD_ROM;
-	if (!strcmp(str, "absent"))
-		return MTD_ABSENT;
-	if (!strcmp(str, "dataflash"))
-		return MTD_DATAFLASH;
-	if (!strcmp(str, "ram"))
-		return MTD_RAM;
-	if (!strcmp(str, "ubi"))
-		return MTD_UBIVOLUME;
-	return -1;
-}
-
-/**
- * dev_node2num - find UBI device number by its character device node.
- * @lib: MTD library descriptor
- * @node: name of the MTD device node
- * @mtd_num: MTD device number is returned here
- *
- * This function returns %0 in case of success and %-1 in case of failure.
- */
-static int dev_node2num(struct libmtd *lib, const char *node, int *mtd_num)
-{
-	struct stat st;
-	int i, major, minor;
-	struct mtd_info info;
-
-	if (stat(node, &st))
-		return sys_errmsg("cannot get information about \"%s\"", node);
-
-	if (!S_ISCHR(st.st_mode)) {
-		errmsg("\"%s\" is not a character device", node);
-		errno = EINVAL;
-		return -1;
-	}
-
-	major = major(st.st_rdev);
-	minor = minor(st.st_rdev);
-
-	if (mtd_get_info((libmtd_t *)lib, &info))
-		return -1;
-
-	for (i = info.lowest_mtd_num; i <= info.highest_mtd_num; i++) {
-		int major1, minor1, ret;
-
-		ret = dev_get_major(lib, i, &major1, &minor1);
-		if (ret) {
-			if (errno == ENOENT)
-				continue;
-			if (!errno)
-				break;
-			return -1;
-		}
-
-		if (major1 == major && minor1 == minor) {
-			errno = 0;
-			*mtd_num = i;
-			return 0;
-		}
-	}
-
-	errno = ENODEV;
-	return -1;
-}
-
-/**
- * sysfs_is_supported - check whether the MTD sub-system supports MTD.
- * @lib: MTD library descriptor
- *
- * The Linux kernel MTD subsystem gained MTD support starting from kernel
- * 2.6.30 and libmtd tries to use sysfs interface if possible, because the NAND
- * sub-page size is available there (and not available at all in pre-sysfs
- * kernels).
- *
- * Very old kernels did not have "/sys/class/mtd" directory. Not very old
- * kernels (e.g., 2.6.29) did have "/sys/class/mtd/mtdX" directories, by there
- * were no files there, e.g., the "name" file was not present. So all we can do
- * is to check for a "/sys/class/mtd/mtdX/name" file. But this is not a
- * reliable check, because if this is a new system with no MTD devices - we'll
- * treat it as a pre-sysfs system.
- */
-static int sysfs_is_supported(struct libmtd *lib)
-{
-	int fd, num = -1;
-	DIR *sysfs_mtd;
-	char file[strlen(lib->mtd_name) + 10];
-
-	sysfs_mtd = opendir(lib->sysfs_mtd);
-	if (!sysfs_mtd) {
-		if (errno == ENOENT) {
-			errno = 0;
-			return 0;
-		}
-		return sys_errmsg("cannot open \"%s\"", lib->sysfs_mtd);
-	}
-
-	/*
-	 * First of all find an "mtdX" directory. This is needed because there
-	 * may be, for example, mtd1 but no mtd0.
-	 */
-	while (1) {
-		int ret, mtd_num;
-		char tmp_buf[256];
-		struct dirent *dirent;
-
-		dirent = readdir(sysfs_mtd);
-		if (!dirent)
-			break;
-
-		if (strlen(dirent->d_name) >= 255) {
-			errmsg("invalid entry in %s: \"%s\"",
-			       lib->sysfs_mtd, dirent->d_name);
-			errno = EINVAL;
-			closedir(sysfs_mtd);
-			return -1;
-		}
-
-		ret = sscanf(dirent->d_name, MTD_NAME_PATT"%s",
-			     &mtd_num, tmp_buf);
-		if (ret == 1) {
-			num = mtd_num;
-			break;
-		}
-	}
-
-	if (closedir(sysfs_mtd))
-		return sys_errmsg("closedir failed on \"%s\"", lib->sysfs_mtd);
-
-	if (num == -1)
-		/* No mtd device, treat this as pre-sysfs system */
-		return 0;
-
-	sprintf(file, lib->mtd_name, num);
-	fd = open(file, O_RDONLY);
-	if (fd == -1)
-		return 0;
-
-	if (close(fd)) {
-		sys_errmsg("close failed on \"%s\"", file);
-		return -1;
-	}
-
-	return 1;
-}
-
-libmtd_t libmtd_open(void)
-{
-	struct libmtd *lib;
-
-	lib = calloc(1, sizeof(struct libmtd));
-	if (!lib)
-		return NULL;
-
-	lib->sysfs_mtd = mkpath("/sys", SYSFS_MTD);
-	if (!lib->sysfs_mtd)
-		goto out_error;
-
-	lib->mtd = mkpath(lib->sysfs_mtd, MTD_NAME_PATT);
-	if (!lib->mtd)
-		goto out_error;
-
-	lib->mtd_name = mkpath(lib->mtd, MTD_NAME);
-	if (!lib->mtd_name)
-		goto out_error;
-
-	if (!sysfs_is_supported(lib)) {
-		free(lib->mtd);
-		free(lib->sysfs_mtd);
-		free(lib->mtd_name);
-		lib->mtd_name = lib->mtd = lib->sysfs_mtd = NULL;
-		return lib;
-	}
-
-	lib->mtd_dev = mkpath(lib->mtd, MTD_DEV);
-	if (!lib->mtd_dev)
-		goto out_error;
-
-	lib->mtd_type = mkpath(lib->mtd, MTD_TYPE);
-	if (!lib->mtd_type)
-		goto out_error;
-
-	lib->mtd_eb_size = mkpath(lib->mtd, MTD_EB_SIZE);
-	if (!lib->mtd_eb_size)
-		goto out_error;
-
-	lib->mtd_size = mkpath(lib->mtd, MTD_SIZE);
-	if (!lib->mtd_size)
-		goto out_error;
-
-	lib->mtd_min_io_size = mkpath(lib->mtd, MTD_MIN_IO_SIZE);
-	if (!lib->mtd_min_io_size)
-		goto out_error;
-
-	lib->mtd_subpage_size = mkpath(lib->mtd, MTD_SUBPAGE_SIZE);
-	if (!lib->mtd_subpage_size)
-		goto out_error;
-
-	lib->mtd_oob_size = mkpath(lib->mtd, MTD_OOB_SIZE);
-	if (!lib->mtd_oob_size)
-		goto out_error;
-
-	lib->mtd_region_cnt = mkpath(lib->mtd, MTD_REGION_CNT);
-	if (!lib->mtd_region_cnt)
-		goto out_error;
-
-	lib->mtd_flags = mkpath(lib->mtd, MTD_FLAGS);
-	if (!lib->mtd_flags)
-		goto out_error;
-
-	lib->sysfs_supported = 1;
-	return lib;
-
-out_error:
-	libmtd_close((libmtd_t)lib);
-	return NULL;
-}
-
-void libmtd_close(libmtd_t desc)
-{
-	struct libmtd *lib = (struct libmtd *)desc;
-
-	free(lib->mtd_flags);
-	free(lib->mtd_region_cnt);
-	free(lib->mtd_oob_size);
-	free(lib->mtd_subpage_size);
-	free(lib->mtd_min_io_size);
-	free(lib->mtd_size);
-	free(lib->mtd_eb_size);
-	free(lib->mtd_type);
-	free(lib->mtd_dev);
-	free(lib->mtd_name);
-	free(lib->mtd);
-	free(lib->sysfs_mtd);
-	free(lib);
-}
-
-int mtd_get_info(libmtd_t desc, struct mtd_info *info)
-{
-	DIR *sysfs_mtd;
-	struct dirent *dirent;
-	struct libmtd *lib = (struct libmtd *)desc;
-
-	memset(info, 0, sizeof(struct mtd_info));
-
-	if (!lib->sysfs_supported)
-		return legacy_mtd_get_info(info);
-
-	info->sysfs_supported = 1;
-
-	/*
-	 * We have to scan the MTD sysfs directory to identify how many MTD
-	 * devices are present.
-	 */
-	sysfs_mtd = opendir(lib->sysfs_mtd);
-	if (!sysfs_mtd) {
-		if (errno == ENOENT) {
-			errno = ENODEV;
-			return -1;
-		}
-		return sys_errmsg("cannot open \"%s\"", lib->sysfs_mtd);
-	}
-
-	info->lowest_mtd_num = INT_MAX;
-	while (1) {
-		int mtd_num, ret;
-		char tmp_buf[256];
-
-		errno = 0;
-		dirent = readdir(sysfs_mtd);
-		if (!dirent)
-			break;
-
-		if (strlen(dirent->d_name) >= 255) {
-			errmsg("invalid entry in %s: \"%s\"",
-			       lib->sysfs_mtd, dirent->d_name);
-			errno = EINVAL;
-			goto out_close;
-		}
-
-		ret = sscanf(dirent->d_name, MTD_NAME_PATT"%s",
-			     &mtd_num, tmp_buf);
-		if (ret == 1) {
-			info->mtd_dev_cnt += 1;
-			if (mtd_num > info->highest_mtd_num)
-				info->highest_mtd_num = mtd_num;
-			if (mtd_num < info->lowest_mtd_num)
-				info->lowest_mtd_num = mtd_num;
-		}
-	}
-
-	if (!dirent && errno) {
-		sys_errmsg("readdir failed on \"%s\"", lib->sysfs_mtd);
-		goto out_close;
-	}
-
-	if (closedir(sysfs_mtd))
-		return sys_errmsg("closedir failed on \"%s\"", lib->sysfs_mtd);
-
-	if (info->lowest_mtd_num == INT_MAX)
-		info->lowest_mtd_num = 0;
-
-	return 0;
-
-out_close:
-	closedir(sysfs_mtd);
-	return -1;
-}
-
-int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd)
-{
-	int ret;
-	struct stat st;
-	struct libmtd *lib = (struct libmtd *)desc;
-
-	memset(mtd, 0, sizeof(struct mtd_dev_info));
-	mtd->mtd_num = mtd_num;
-
-	if (!lib->sysfs_supported)
-		return legacy_get_dev_info1(mtd_num, mtd);
-	else {
-		char file[strlen(lib->mtd) + 10];
-
-		sprintf(file, lib->mtd, mtd_num);
-		if (stat(file, &st)) {
-			if (errno == ENOENT)
-				errno = ENODEV;
-			return -1;
-		}
-	}
-
-	if (dev_get_major(lib, mtd_num, &mtd->major, &mtd->minor))
-		return -1;
-
-	ret = dev_read_data(lib->mtd_name, mtd_num, &mtd->name,
-			    MTD_NAME_MAX + 1);
-	if (ret < 0)
-		return -1;
-	((char *)mtd->name)[ret - 1] = '\0';
-
-	ret = dev_read_data(lib->mtd_type, mtd_num, &mtd->type_str,
-			    MTD_TYPE_MAX + 1);
-	if (ret < 0)
-		return -1;
-	((char *)mtd->type_str)[ret - 1] = '\0';
-
-	if (dev_read_pos_int(lib->mtd_eb_size, mtd_num, &mtd->eb_size))
-		return -1;
-	if (dev_read_pos_ll(lib->mtd_size, mtd_num, &mtd->size))
-		return -1;
-	if (dev_read_pos_int(lib->mtd_min_io_size, mtd_num, &mtd->min_io_size))
-		return -1;
-	if (dev_read_pos_int(lib->mtd_subpage_size, mtd_num, &mtd->subpage_size))
-		return -1;
-	if (dev_read_pos_int(lib->mtd_oob_size, mtd_num, &mtd->oob_size))
-		return -1;
-	if (dev_read_pos_int(lib->mtd_region_cnt, mtd_num, &mtd->region_cnt))
-		return -1;
-	if (dev_read_hex_int(lib->mtd_flags, mtd_num, &ret))
-		return -1;
-	mtd->writable = !!(ret & MTD_WRITEABLE);
-
-	mtd->eb_cnt = mtd->size / mtd->eb_size;
-	mtd->type = type_str2int(mtd->type_str);
-	mtd->bb_allowed = !!(mtd->type == MTD_NANDFLASH);
-
-	return 0;
-}
-
-int mtd_get_dev_info(libmtd_t desc, const char *node, struct mtd_dev_info *mtd)
-{
-	int mtd_num;
-	struct libmtd *lib = (struct libmtd *)desc;
-
-	if (!lib->sysfs_supported)
-		return legacy_get_dev_info(node, mtd);
-
-	if (dev_node2num(lib, node, &mtd_num))
-		return -1;
-
-	return mtd_get_dev_info1(desc, mtd_num, mtd);
-}
-
-int mtd_erase(const struct mtd_dev_info *mtd, int fd, int eb)
-{
-	struct erase_info_user ei;
-
-	ei.start = eb * mtd->eb_size;;
-	ei.length = mtd->eb_size;
-	return ioctl(fd, MEMERASE, &ei);
-}
-
-/* Patterns to write to a physical eraseblock when torturing it */
-static uint8_t patterns[] = {0xa5, 0x5a, 0x0};
-
-/**
- * check_pattern - check if buffer contains only a certain byte pattern.
- * @buf: buffer to check
- * @patt: the pattern to check
- * @size: buffer size in bytes
- *
- * This function returns %1 in there are only @patt bytes in @buf, and %0 if
- * something else was also found.
- */
-static int check_pattern(const void *buf, uint8_t patt, int size)
-{
-	int i;
-
-	for (i = 0; i < size; i++)
-		if (((const uint8_t *)buf)[i] != patt)
-			return 0;
-	return 1;
-}
-
-int mtd_torture(const struct mtd_dev_info *mtd, int fd, int eb)
-{
-	int err, i, patt_count;
-	void *buf;
-
-	normsg("run torture test for PEB %d", eb);
-	patt_count = ARRAY_SIZE(patterns);
-
-	buf = malloc(mtd->eb_size);
-	if (!buf) {
-		errmsg("cannot allocate %d bytes of memory", mtd->eb_size);
-		return -1;
-	}
-
-	for (i = 0; i < patt_count; i++) {
-		err = mtd_erase(mtd, fd, eb);
-		if (err)
-			goto out;
-
-		/* Make sure the PEB contains only 0xFF bytes */
-		err = mtd_read(mtd, fd, eb, 0, buf, mtd->eb_size);
-		if (err)
-			goto out;
-
-		err = check_pattern(buf, 0xFF, mtd->eb_size);
-		if (err == 0) {
-			errmsg("erased PEB %d, but a non-0xFF byte found", eb);
-			errno = EIO;
-			goto out;
-		}
-
-		/* Write a pattern and check it */
-		memset(buf, patterns[i], mtd->eb_size);
-		err = mtd_write(mtd, fd, eb, 0, buf, mtd->eb_size);
-		if (err)
-			goto out;
-
-		memset(buf, ~patterns[i], mtd->eb_size);
-		err = mtd_read(mtd, fd, eb, 0, buf, mtd->eb_size);
-		if (err)
-			goto out;
-
-		err = check_pattern(buf, patterns[i], mtd->eb_size);
-		if (err == 0) {
-			errmsg("pattern %x checking failed for PEB %d",
-				patterns[i], eb);
-			errno = EIO;
-			goto out;
-		}
-	}
-
-	err = 0;
-	normsg("PEB %d passed torture test, do not mark it a bad", eb);
-
-out:
-	free(buf);
-	return -1;
-}
-
-int mtd_is_bad(const struct mtd_dev_info *mtd, int fd, int eb)
-{
-	int ret;
-	loff_t seek;
-
-	if (eb < 0 || eb >= mtd->eb_cnt) {
-		errmsg("bad eraseblock number %d, mtd%d has %d eraseblocks",
-		       eb, mtd->mtd_num, mtd->eb_cnt);
-		errno = EINVAL;
-		return -1;
-	}
-
-	if (!mtd->bb_allowed)
-		return 0;
-
-	seek = (loff_t)eb * mtd->eb_size;
-	ret = ioctl(fd, MEMGETBADBLOCK, &seek);
-	if (ret == -1)
-		return sys_errmsg("MEMGETBADBLOCK ioctl failed for "
-				  "eraseblock %d (mtd%d)", eb, mtd->mtd_num);
-	return ret;
-}
-
-int mtd_mark_bad(const struct mtd_dev_info *mtd, int fd, int eb)
-{
-	int ret;
-	loff_t seek;
-
-	if (!mtd->bb_allowed) {
-		errno = EINVAL;
-		return -1;
-	}
-
-	if (eb < 0 || eb >= mtd->eb_cnt) {
-		errmsg("bad eraseblock number %d, mtd%d has %d eraseblocks",
-		       eb, mtd->mtd_num, mtd->eb_cnt);
-		errno = EINVAL;
-		return -1;
-	}
-
-	seek = (loff_t)eb * mtd->eb_size;
-	ret = ioctl(fd, MEMSETBADBLOCK, &seek);
-	if (ret == -1)
-		return sys_errmsg("MEMSETBADBLOCK ioctl failed for "
-			          "eraseblock %d (mtd%d)", eb, mtd->mtd_num);
-	return 0;
-}
-
-int mtd_read(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
-	     void *buf, int len)
-{
-	int ret, rd = 0;
-	off_t seek;
-
-	if (eb < 0 || eb >= mtd->eb_cnt) {
-		errmsg("bad eraseblock number %d, mtd%d has %d eraseblocks",
-		       eb, mtd->mtd_num, mtd->eb_cnt);
-		errno = EINVAL;
-		return -1;
-	}
-	if (offs < 0 || offs + len > mtd->eb_size) {
-		errmsg("bad offset %d or length %d, mtd%d eraseblock size is %d",
-		       offs, len, mtd->mtd_num, mtd->eb_size);
-		errno = EINVAL;
-		return -1;
-	}
-
-	/* Seek to the beginning of the eraseblock */
-	seek = (off_t)eb * mtd->eb_size + offs;
-	if (lseek(fd, seek, SEEK_SET) != seek)
-		return sys_errmsg("cannot seek mtd%d to offset %llu",
-				  mtd->mtd_num, (unsigned long long)seek);
-
-	while (rd < len) {
-		ret = read(fd, buf, len);
-		if (ret < 0)
-			return sys_errmsg("cannot read %d bytes from mtd%d (eraseblock %d, offset %d)",
-					  len, mtd->mtd_num, eb, offs);
-		rd += ret;
-	}
-
-	return 0;
-}
-
-int mtd_write(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
-	      void *buf, int len)
-{
-	int ret;
-	off_t seek;
-
-	if (eb < 0 || eb >= mtd->eb_cnt) {
-		errmsg("bad eraseblock number %d, mtd%d has %d eraseblocks",
-		       eb, mtd->mtd_num, mtd->eb_cnt);
-		errno = EINVAL;
-		return -1;
-	}
-	if (offs < 0 || offs + len > mtd->eb_size) {
-		errmsg("bad offset %d or length %d, mtd%d eraseblock size is %d",
-		       offs, len, mtd->mtd_num, mtd->eb_size);
-		errno = EINVAL;
-		return -1;
-	}
-	if (offs % mtd->subpage_size) {
-		errmsg("write offset %d is not aligned to mtd%d min. I/O size %d",
-		       offs, mtd->mtd_num, mtd->subpage_size);
-		errno = EINVAL;
-		return -1;
-	}
-	if (len % mtd->subpage_size) {
-		errmsg("write length %d is not aligned to mtd%d min. I/O size %d",
-		       len, mtd->mtd_num, mtd->subpage_size);
-		errno = EINVAL;
-		return -1;
-	}
-
-	/* Seek to the beginning of the eraseblock */
-	seek = (off_t)eb * mtd->eb_size + offs;
-	if (lseek(fd, seek, SEEK_SET) != seek)
-		return sys_errmsg("cannot seek mtd%d to offset %llu",
-				  mtd->mtd_num, (unsigned long long)seek);
-
-	ret = write(fd, buf, len);
-	if (ret != len)
-		return sys_errmsg("cannot write %d bytes to mtd%d (eraseblock %d, offset %d)",
-				  len, mtd->mtd_num, eb, offs);
-
-	return 0;
-}
-
-int mtd_write_img(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
-		  const char *img_name)
-{
-	int tmp, ret, in_fd, len, written = 0;
-	off_t seek;
-	struct stat st;
-	char *buf;
-
-	if (eb < 0 || eb >= mtd->eb_cnt) {
-		errmsg("bad eraseblock number %d, mtd%d has %d eraseblocks",
-		       eb, mtd->mtd_num, mtd->eb_cnt);
-		errno = EINVAL;
-		return -1;
-	}
-	if (offs < 0 || offs >= mtd->eb_size) {
-		errmsg("bad offset %d, mtd%d eraseblock size is %d",
-		       offs, mtd->mtd_num, mtd->eb_size);
-		errno = EINVAL;
-		return -1;
-	}
-	if (offs % mtd->subpage_size) {
-		errmsg("write offset %d is not aligned to mtd%d min. I/O size %d",
-		       offs, mtd->mtd_num, mtd->subpage_size);
-		errno = EINVAL;
-		return -1;
-	}
-
-	in_fd = open(img_name, O_RDONLY);
-	if (in_fd == -1)
-		return sys_errmsg("cannot open %s", img_name);
-
-	if (fstat(in_fd, &st)) {
-		sys_errmsg("cannot stat %s", img_name);
-		goto out_close;
-	}
-
-	len = st.st_size;
-	if (len % mtd->subpage_size) {
-		errmsg("size of \"%s\" is %d byte, which is not aligned to "
-		       "mtd%d min. I/O size %d", img_name, len, mtd->mtd_num,
-		       mtd->subpage_size);
-		errno = EINVAL;
-		goto out_close;
-	}
-	tmp = (offs + len + mtd->eb_size - 1) / mtd->eb_size;
-	if (eb + tmp > mtd->eb_cnt) {
-		errmsg("\"%s\" image size is %d bytes, mtd%d size is %d "
-		       "eraseblocks, the image does not fit if we write it "
-		       "starting from eraseblock %d, offset %d",
-		       img_name, len, mtd->mtd_num, mtd->eb_cnt, eb, offs);
-		errno = EINVAL;
-		goto out_close;
-	}
-
-	/* Seek to the beginning of the eraseblock */
-	seek = (off_t)eb * mtd->eb_size + offs;
-	if (lseek(fd, seek, SEEK_SET) != seek) {
-		sys_errmsg("cannot seek mtd%d to offset %llu",
-			    mtd->mtd_num, (unsigned long long)seek);
-		goto out_close;
-	}
-
-	buf = malloc(mtd->eb_size);
-	if (!buf) {
-		sys_errmsg("cannot allocate %d bytes of memory", mtd->eb_size);
-		goto out_close;
-	}
-
-	while (written < len) {
-		int rd = 0;
-
-		do {
-			ret = read(in_fd, buf, mtd->eb_size - offs - rd);
-			if (ret == -1) {
-				sys_errmsg("cannot read from %s", img_name);
-				goto out_free;
-			}
-			rd += ret;
-		} while (ret && rd < mtd->eb_size - offs);
-
-		ret = write(fd, buf, rd);
-		if (ret != rd) {
-			sys_errmsg("cannot write %d bytes to mtd%d (eraseblock %d, offset %d)",
-				   len, mtd->mtd_num, eb, offs);
-			goto out_free;
-		}
-
-		offs = 0;
-		eb += 1;
-		written += rd;
-	}
-
-	free(buf);
-	close(in_fd);
-	return 0;
-
-out_free:
-	free(buf);
-out_close:
-	close(in_fd);
-	return -1;
-}
-
-int mtd_probe_node(libmtd_t desc, const char *node)
-{
-	struct stat st;
-	struct mtd_info info;
-	int i, major, minor;
-	struct libmtd *lib = (struct libmtd *)desc;
-
-	if (stat(node, &st))
-		return sys_errmsg("cannot get information about \"%s\"", node);
-
-	if (!S_ISCHR(st.st_mode)) {
-		errmsg("\"%s\" is not a character device", node);
-		errno = EINVAL;
-		return -1;
-	}
-
-	major = major(st.st_rdev);
-	minor = minor(st.st_rdev);
-
-	if (mtd_get_info((libmtd_t *)lib, &info))
-		return -1;
-
-	if (!lib->sysfs_supported)
-		return 0;
-
-	for (i = info.lowest_mtd_num; i <= info.highest_mtd_num; i++) {
-		int major1, minor1, ret;
-
-		ret = dev_get_major(lib, i, &major1, &minor1);
-		if (ret) {
-			if (errno == ENOENT)
-				continue;
-			if (!errno)
-				break;
-			return -1;
-		}
-
-		if (major1 == major && minor1 == minor)
-			return 1;
-	}
-
-	errno = 0;
-	return -1;
-}
diff --git a/ubi-utils/src/libmtd_int.h b/ubi-utils/src/libmtd_int.h
deleted file mode 100644
index 7de4b42..0000000
--- a/ubi-utils/src/libmtd_int.h
+++ /dev/null
@@ -1,88 +0,0 @@
-/*
- * Copyright (c) International Business Machines Corp., 2006
- * Copyright (C) 2009 Nokia Corporation
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- *
- * Author: Artem Bityutskiy
- *
- * MTD library.
- */
-
-#ifndef __LIBMTD_INT_H__
-#define __LIBMTD_INT_H__
-
-#ifdef __cplusplus
-extern "C" {
-#endif
-
-#define PROGRAM_NAME "libmtd"
-
-#define SYSFS_MTD        "class/mtd"
-#define MTD_NAME_PATT    "mtd%d"
-#define MTD_DEV          "dev"
-#define MTD_NAME         "name"
-#define MTD_TYPE         "type"
-#define MTD_EB_SIZE      "erasesize"
-#define MTD_SIZE         "size"
-#define MTD_MIN_IO_SIZE  "writesize"
-#define MTD_SUBPAGE_SIZE "subpagesize"
-#define MTD_OOB_SIZE     "oobsize"
-#define MTD_REGION_CNT   "numeraseregions"
-#define MTD_FLAGS        "flags"
-
-/**
- * libmtd - MTD library description data structure.
- * @sysfs_mtd: MTD directory in sysfs
- * @mtd: MTD device sysfs directory pattern
- * @mtd_dev: MTD device major/minor numbers file pattern
- * @mtd_name: MTD device name file pattern
- * @mtd_type: MTD device type file pattern
- * @mtd_eb_size: MTD device eraseblock size file pattern
- * @mtd_size: MTD device size file pattern
- * @mtd_min_io_size: minimum I/O unit size file pattern
- * @mtd_subpage_size: sub-page size file pattern
- * @mtd_oob_size: MTD device OOB size file pattern
- * @mtd_region_cnt: count of additional erase regions file pattern
- * @mtd_flags: MTD device flags file pattern
- * @sysfs_supported: non-zero if sysfs is supported by MTD
- */
-struct libmtd
-{
-	char *sysfs_mtd;
-	char *mtd;
-	char *mtd_dev;
-	char *mtd_name;
-	char *mtd_type;
-	char *mtd_eb_size;
-	char *mtd_size;
-	char *mtd_min_io_size;
-	char *mtd_subpage_size;
-	char *mtd_oob_size;
-	char *mtd_region_cnt;
-	char *mtd_flags;
-	unsigned int sysfs_supported:1;
-};
-
-int legacy_libmtd_open(void);
-int legacy_mtd_get_info(struct mtd_info *info);
-int legacy_get_dev_info(const char *node, struct mtd_dev_info *mtd);
-int legacy_get_dev_info1(int dev_num, struct mtd_dev_info *mtd);
-
-#ifdef __cplusplus
-}
-#endif
-
-#endif /* !__LIBMTD_INT_H__ */
diff --git a/ubi-utils/src/libmtd_legacy.c b/ubi-utils/src/libmtd_legacy.c
deleted file mode 100644
index 27fb3f8..0000000
--- a/ubi-utils/src/libmtd_legacy.c
+++ /dev/null
@@ -1,359 +0,0 @@
-/*
- * Copyright (C) 2009 Nokia Corporation
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- *
- * Author: Artem Bityutskiy
- *
- * This file  is part of the MTD library. Implements pre-2.6.30 kernels support,
- * where MTD did not have sysfs interface. The main limitation of the old
- * kernels was that the sub-page size was not exported to user-space, so it was
- * not possible to get sub-page size.
- */
-
-#include <limits.h>
-#include <fcntl.h>
-#include <unistd.h>
-#include <stdlib.h>
-#include <errno.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <mtd/mtd-user.h>
-
-#include <libmtd.h>
-#include "libmtd_int.h"
-#include "common.h"
-
-#define MTD_PROC_FILE "/proc/mtd"
-#define MTD_DEV_PATT  "/dev/mtd%d"
-#define MTD_DEV_MAJOR 90
-
-#define PROC_MTD_FIRST     "dev:    size   erasesize  name\n"
-#define PROC_MTD_FIRST_LEN (sizeof(PROC_MTD_FIRST) - 1)
-#define PROC_MTD_MAX_LEN   4096
-#define PROC_MTD_PATT      "mtd%d: %llx %x"
-
-/**
- * struct proc_parse_info - /proc/mtd parsing information.
- * @mtd_num: MTD device number
- * @size: device size
- * @eb_size: eraseblock size
- * @name: device name
- * @buf: contents of /proc/mtd
- * @data_size: how much data was read into @buf
- * @pos: next string in @buf to parse
- */
-struct proc_parse_info
-{
-	int mtd_num;
-	long long size;
-	char name[MTD_NAME_MAX + 1];
-	int eb_size;
-	char *buf;
-	int data_size;
-	char *next;
-};
-
-static int proc_parse_start(struct proc_parse_info *pi)
-{
-	int fd, ret;
-
-	fd = open(MTD_PROC_FILE, O_RDONLY);
-	if (fd == -1)
-		return -1;
-
-	pi->buf = malloc(PROC_MTD_MAX_LEN);
-	if (!pi->buf) {
-		sys_errmsg("cannot allocate %d bytes of memory",
-			   PROC_MTD_MAX_LEN);
-		goto out_close;
-	}
-
-	ret = read(fd, pi->buf, PROC_MTD_MAX_LEN);
-	if (ret == -1) {
-		sys_errmsg("cannot read \"%s\"", MTD_PROC_FILE);
-		goto out_free;
-	}
-
-	if (ret < PROC_MTD_FIRST_LEN ||
-	    memcmp(pi->buf, PROC_MTD_FIRST, PROC_MTD_FIRST_LEN)) {
-		errmsg("\"%s\" does not start with \"%s\"", MTD_PROC_FILE,
-		       PROC_MTD_FIRST);
-		goto out_free;
-	}
-
-	pi->data_size = ret;
-	pi->next = pi->buf + PROC_MTD_FIRST_LEN;
-
-	close(fd);
-	return 0;
-
-out_free:
-	free(pi->buf);
-out_close:
-	close(fd);
-	return -1;
-}
-
-static int proc_parse_next(struct proc_parse_info *pi)
-{
-	int ret, len, pos = pi->next - pi->buf;
-	char *p, *p1;
-
-	if (pos >= pi->data_size) {
-		free(pi->buf);
-		return 0;
-	}
-
-	ret = sscanf(pi->next, PROC_MTD_PATT, &pi->mtd_num, &pi->size,
-		     &pi->eb_size);
-	if (ret != 3)
-		return errmsg("\"%s\" pattern not found", PROC_MTD_PATT);
-
-	p = memchr(pi->next, '\"', pi->data_size - pos);
-	if (!p)
-		return errmsg("opening \" not fount");
-	p += 1;
-	pos = p - pi->buf;
-	if (pos >= pi->data_size)
-		return errmsg("opening \" not fount");
-
-	p1 = memchr(p, '\"', pi->data_size - pos);
-	if (!p1)
-		return errmsg("closing \" not fount");
-	pos = p1 - pi->buf;
-	if (pos >= pi->data_size)
-		return errmsg("closing \" not fount");
-
-	len = p1 - p;
-	if (len > MTD_NAME_MAX)
-		return errmsg("too long mtd%d device name", pi->mtd_num);
-
-	memcpy(pi->name, p, len);
-	pi->name[len] = '\0';
-
-	if (p1[1] != '\n')
-		return errmsg("opening \"\n\" not fount");
-	pi->next = p1 + 2;
-	return 1;
-}
-
-/**
- * legacy_libmtd_open - legacy version of 'libmtd_open()'.
- *
- * This function is just checks that MTD is present in the system. Returns
- * zero in case of success and %-1 in case of failure. In case of failure,
- * errno contains zero if MTD is not present in the system, or contains the
- * error code if a real error happened. This is similar to the 'libmtd_open()'
- * return conventions.
- */
-int legacy_libmtd_open(void)
-{
-	int fd;
-
-	fd = open(MTD_PROC_FILE, O_RDONLY);
-	if (fd == -1) {
-		if (errno == ENOENT)
-			errno = 0;
-		return -1;
-	}
-
-	close(fd);
-	return 0;
-}
-
-/**
- * legacy_mtd_get_info - legacy version of 'mtd_get_info()'.
- * @info: the MTD device information is returned here
- *
- * This function is similar to 'mtd_get_info()' and has the same conventions.
- */
-int legacy_mtd_get_info(struct mtd_info *info)
-{
-	int ret;
-	struct proc_parse_info pi;
-
-	ret = proc_parse_start(&pi);
-	if (ret)
-		return -1;
-
-	info->lowest_mtd_num = INT_MAX;
-	while (proc_parse_next(&pi)) {
-		info->mtd_dev_cnt += 1;
-		if (pi.mtd_num > info->highest_mtd_num)
-			info->highest_mtd_num = pi.mtd_num;
-		if (pi.mtd_num < info->lowest_mtd_num)
-			info->lowest_mtd_num = pi.mtd_num;
-	}
-
-	return 0;
-}
-
-/**
- * legacy_get_dev_info - legacy version of 'mtd_get_dev_info()'.
- * @node: name of the MTD device node
- * @mtd: the MTD device information is returned here
- *
- * This function is similar to 'mtd_get_dev_info()' and has the same
- * conventions.
- */
-int legacy_get_dev_info(const char *node, struct mtd_dev_info *mtd)
-{
-	struct stat st;
-	struct mtd_info_user ui;
-	int fd, ret;
-	loff_t offs = 0;
-	struct proc_parse_info pi;
-
-	if (stat(node, &st)) {
-		sys_errmsg("cannot open \"%s\"", node);
-		if (errno == ENOENT)
-			normsg("MTD subsystem is old and does not support "
-			       "sysfs, so MTD character device nodes have "
-			       "to exist");
-	}
-
-	if (!S_ISCHR(st.st_mode)) {
-		errno = EINVAL;
-		return errmsg("\"%s\" is not a character device", node);
-	}
-
-	memset(mtd, '\0', sizeof(struct mtd_dev_info));
-	mtd->major = major(st.st_rdev);
-	mtd->minor = minor(st.st_rdev);
-
-	if (mtd->major != MTD_DEV_MAJOR) {
-		errno = EINVAL;
-		return errmsg("\"%s\" has major number %d, MTD devices have "
-			      "major %d", node, mtd->major, MTD_DEV_MAJOR);
-	}
-
-	mtd->mtd_num = mtd->minor / 2;
-
-	fd = open(node, O_RDWR);
-	if (fd == -1)
-		return sys_errmsg("cannot open \"%s\"", node);
-
-	if (ioctl(fd, MEMGETINFO, &ui)) {
-		sys_errmsg("MEMGETINFO ioctl request failed");
-		goto out_close;
-	}
-
-	ret = ioctl(fd, MEMGETBADBLOCK, &offs);
-	if (ret == -1) {
-		if (errno != EOPNOTSUPP) {
-			sys_errmsg("MEMGETBADBLOCK ioctl failed");
-			goto out_close;
-		}
-		errno = 0;
-		mtd->bb_allowed = 0;
-	} else
-		mtd->bb_allowed = 1;
-
-	mtd->type = ui.type;
-	mtd->size = ui.size;
-	mtd->eb_size = ui.erasesize;
-	mtd->min_io_size = ui.writesize;
-
-	if (mtd->min_io_size <= 0) {
-		errmsg("mtd%d (%s) has insane min. I/O unit size %d",
-		       mtd->mtd_num, node, mtd->min_io_size);
-		goto out_close;
-	}
-	if (mtd->eb_size <= 0 || mtd->eb_size < mtd->min_io_size) {
-		errmsg("mtd%d (%s) has insane eraseblock size %d",
-		       mtd->mtd_num, node, mtd->eb_size);
-		goto out_close;
-	}
-	if (mtd->size <= 0 || mtd->size < mtd->eb_size) {
-		errmsg("mtd%d (%s) has insane size %lld",
-		       mtd->mtd_num, node, mtd->size);
-		goto out_close;
-	}
-	mtd->eb_cnt = mtd->size / mtd->eb_size;
-
-	switch(mtd->type) {
-	case MTD_ABSENT:
-		errmsg("mtd%d (%s) is removable and is not present",
-		       mtd->mtd_num, node);
-		goto out_close;
-	case MTD_RAM:
-		strcpy((char *)mtd->type_str, "ram");
-		break;
-	case MTD_ROM:
-		strcpy((char *)mtd->type_str, "rom");
-		break;
-	case MTD_NORFLASH:
-		strcpy((char *)mtd->type_str, "nor");
-		break;
-	case MTD_NANDFLASH:
-		strcpy((char *)mtd->type_str, "nand");
-		break;
-	case MTD_DATAFLASH:
-		strcpy((char *)mtd->type_str, "dataflash");
-		break;
-	case MTD_UBIVOLUME:
-		strcpy((char *)mtd->type_str, "ubi");
-		break;
-	default:
-		goto out_close;
-	}
-
-	if (ui.flags & MTD_WRITEABLE)
-		mtd->writable = 1;
-	mtd->subpage_size = mtd->min_io_size;
-
-	close(fd);
-
-	/*
-	 * Unfortunately, the device name is not available via ioctl, and
-	 * we have to parse /proc/mtd to get it.
-	 */
-	ret = proc_parse_start(&pi);
-	if (ret)
-		return -1;
-
-	while (proc_parse_next(&pi)) {
-		if (pi.mtd_num == mtd->mtd_num) {
-			strcpy((char *)mtd->name, pi.name);
-			return 0;
-		}
-	}
-
-	errmsg("mtd%d not found in \"%s\"", mtd->mtd_num, MTD_PROC_FILE);
-	errno = ENOENT;
-	return -1;
-
-out_close:
-	close(fd);
-	return -1;
-}
-
-/**
- * legacy_get_dev_info1 - legacy version of 'mtd_get_dev_info1()'.
- * @node: name of the MTD device node
- * @mtd: the MTD device information is returned here
- *
- * This function is similar to 'mtd_get_dev_info1()' and has the same
- * conventions.
- */
-int legacy_get_dev_info1(int mtd_num, struct mtd_dev_info *mtd)
-{
-	char node[sizeof(MTD_DEV_PATT) + 20];
-
-	sprintf(node, MTD_DEV_PATT, mtd_num);
-	return legacy_get_dev_info(node, mtd);
-}
-- 
1.6.5
