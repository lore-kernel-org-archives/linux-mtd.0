Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAYoc-0005il-Ep
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2018 11:07:53 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, stable@vger.kernel.org,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ivan Djelic <ivan.djelic@parrot.com>
Subject: [PATCH 2/2] [v2] lib/bch: fix possible stack overrun
Date: Thu, 11 Oct 2018 13:06:17 +0200
Message-Id: <20181011110639.2649053-2-arnd@arndb.de>
In-Reply-To: <20181011110639.2649053-1-arnd@arndb.de>
References: <20181011110639.2649053-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The previous patch introduced very large kernel stack usage and a Makefile
change to hide the warning about it.

>From what I can tell, a number of things went wrong here:

- The BCH_MAX_T constant was set to the maximum value for 'n',
  not the maximum for 't', which is much smaller.

- The stack usage is actually larger than the entire kernel stack
  on some architectures that can use 4KB stacks (m68k, sh, c6x), which
  leads to an immediate overrun.

- The justification in the patch description claimed that nothing
  changed, however that is not the case even without the two points above:
  the configuration is machine specific, and most boards  never use the
  maximum BCH_ECC_WORDS() length but instead have something much smaller.
  That maximum would only apply to machines that use both the maximum
  block size and the maximum ECC strength.

The largest value for 't' that I could find is '32', which in turn leads
to a 60 byte array instead of 2048 bytes. Making it '64' for future
extension seems also worthwhile, with 120 bytes for the array. Anything
larger won't fit into the OOB area on NAND flash.

With that changed, the warning can be enabled again.

Only linux-4.19+ contains the breakage, so this is only needed
as a stable backport if it does not make it into the release.

Fixes: 02361bc77888 ("lib/bch: Remove VLA usage")
Reported-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: stable@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: use larget MAX_T, and add a check to init_bch, as suggested
by Boris
---
 lib/Makefile |  1 -
 lib/bch.c    | 17 +++++++++++++----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/lib/Makefile b/lib/Makefile
index 37fbf6f23148..a74986ff2f73 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -122,7 +122,6 @@ obj-$(CONFIG_ZLIB_INFLATE) += zlib_inflate/
 obj-$(CONFIG_ZLIB_DEFLATE) += zlib_deflate/
 obj-$(CONFIG_REED_SOLOMON) += reed_solomon/
 obj-$(CONFIG_BCH) += bch.o
-CFLAGS_bch.o := $(call cc-option,-Wframe-larger-than=4500)
 obj-$(CONFIG_LZO_COMPRESS) += lzo/
 obj-$(CONFIG_LZO_DECOMPRESS) += lzo/
 obj-$(CONFIG_LZ4_COMPRESS) += lz4/
diff --git a/lib/bch.c b/lib/bch.c
index 7b0f2006698b..5db6d3a4c8a6 100644
--- a/lib/bch.c
+++ b/lib/bch.c
@@ -79,20 +79,19 @@
 #define GF_T(_p)               (CONFIG_BCH_CONST_T)
 #define GF_N(_p)               ((1 << (CONFIG_BCH_CONST_M))-1)
 #define BCH_MAX_M              (CONFIG_BCH_CONST_M)
+#define BCH_MAX_T	       (CONFIG_BCH_CONST_T)
 #else
 #define GF_M(_p)               ((_p)->m)
 #define GF_T(_p)               ((_p)->t)
 #define GF_N(_p)               ((_p)->n)
-#define BCH_MAX_M              15
+#define BCH_MAX_M              15 /* 2KB */
+#define BCH_MAX_T              64 /* 64 bit correction */
 #endif
 
-#define BCH_MAX_T              (((1 << BCH_MAX_M) - 1) / BCH_MAX_M)
-
 #define BCH_ECC_WORDS(_p)      DIV_ROUND_UP(GF_M(_p)*GF_T(_p), 32)
 #define BCH_ECC_BYTES(_p)      DIV_ROUND_UP(GF_M(_p)*GF_T(_p), 8)
 
 #define BCH_ECC_MAX_WORDS      DIV_ROUND_UP(BCH_MAX_M * BCH_MAX_T, 32)
-#define BCH_ECC_MAX_BYTES      DIV_ROUND_UP(BCH_MAX_M * BCH_MAX_T, 8)
 
 #ifndef dbg
 #define dbg(_fmt, args...)     do {} while (0)
@@ -202,6 +201,9 @@ void encode_bch(struct bch_control *bch, const uint8_t *data,
 	const uint32_t * const tab3 = tab2 + 256*(l+1);
 	const uint32_t *pdata, *p0, *p1, *p2, *p3;
 
+	if (WARN_ON(r_bytes > sizeof(r)))
+		return;
+
 	if (ecc) {
 		/* load ecc parity bytes into internal 32-bit buffer */
 		load_ecc8(bch, bch->ecc_buf, ecc);
@@ -1285,6 +1287,13 @@ struct bch_control *init_bch(int m, int t, unsigned int prim_poly)
 		 */
 		goto fail;
 
+	if (t > BCH_MAX_T)
+		/*
+		 * we can support larger than 64 bits if necessary, at the
+		 * cost of higher stack usage.
+		 */
+		goto fail;
+
 	/* sanity checks */
 	if ((t < 1) || (m*t >= ((1 << m)-1)))
 		/* invalid t value */
-- 
2.18.0
