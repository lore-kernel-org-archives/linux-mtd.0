Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C9XlM-0001Kr-KL
	for linux-mtd@lists.infradead.org; Mon, 20 Sep 2004 19:40:08 -0400
Date: Tue, 21 Sep 2004 00:40:02 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20040920234002.GA17073@home.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Ben Dooks <ben@fluff.org>
Cc: ben@fluff.org
Subject: Incorrect word calculation in some configs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There seems to be a problem with map_words() if there are
types longer than `unsigned long` enabled at the same time
as anything shorted than an `unsigned long`

Tested on an EB2410ITX (ARM9 SoC)
Patch against 2.6.9-rc2 patched with 19th September CVS

Signed-off-by: Ben Dooks <ben-mtd@fluff.org>

--- linux-2.6.9-rc2-bk6-mtd20040919/include/linux/mtd/map.h	2004-09-20 13:02:46.000000000 +0100
+++ linux-2.6.9-rc2-bk6-mtd20040919-work/include/linux/mtd/map.h	2004-09-21 00:25:47.000000000 +0100
@@ -56,6 +56,11 @@
 #define map_bankwidth_is_4(map) (0)
 #endif
 
+/* ensure we never evaluate anything shorted than an unsigned long
+ * to zero, and ensure we'll never miss the end of an comparison (bjd) */
+
+#define map_calc_words(map) ((map_bankwidth(map) + (sizeof(unsigned long)-1))/ sizeof(unsigned long))
+
 #ifdef CONFIG_MTD_MAP_BANK_WIDTH_8
 # ifdef map_bankwidth
 #  undef map_bankwidth
@@ -64,12 +69,12 @@
 #   undef map_bankwidth_is_large
 #   define map_bankwidth_is_large(map) (map_bankwidth(map) > BITS_PER_LONG/8)
 #   undef map_words
-#   define map_words(map) (map_bankwidth(map) / sizeof(unsigned long))
+#   define map_words(map) map_calc_words(map)
 #  endif
 # else
 #  define map_bankwidth(map) 8
 #  define map_bankwidth_is_large(map) (BITS_PER_LONG < 64)
-#  define map_words(map) (map_bankwidth(map) / sizeof(unsigned long))
+#  define map_words(map) map_calc_words(map)
 # endif
 #define map_bankwidth_is_8(map) (map_bankwidth(map) == 8)
 #undef MAX_MAP_BANKWIDTH
@@ -85,11 +90,11 @@
 #  undef map_bankwidth_is_large
 #  define map_bankwidth_is_large(map) (map_bankwidth(map) > BITS_PER_LONG/8)
 #  undef map_words
-#  define map_words(map) (map_bankwidth(map) / sizeof(unsigned long))
+#  define map_words(map) map_calc_words(map)
 # else
 #  define map_bankwidth(map) 16
 #  define map_bankwidth_is_large(map) (1)
-#  define map_words(map) (map_bankwidth(map) / sizeof(unsigned long))
+#  define map_words(map) map_calc_words(map)
 # endif
 #define map_bankwidth_is_16(map) (map_bankwidth(map) == 16)
 #undef MAX_MAP_BANKWIDTH
@@ -105,11 +110,11 @@
 #  undef map_bankwidth_is_large
 #  define map_bankwidth_is_large(map) (map_bankwidth(map) > BITS_PER_LONG/8)
 #  undef map_words
-#  define map_words(map) (map_bankwidth(map) / sizeof(unsigned long))
+#  define map_words(map) map_calc_words(map)
 # else
 #  define map_bankwidth(map) 32
 #  define map_bankwidth_is_large(map) (1)
-#  define map_words(map) (map_bankwidth(map) / sizeof(unsigned long))
+#  define map_words(map) map_calc_words(map)
 # endif
 #define map_bankwidth_is_32(map) (map_bankwidth(map) == 32)
 #undef MAX_MAP_BANKWIDTH
