Received: from mailout04.t-online.de ([194.25.134.18])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccamR-0003bh-Rn
 for linux-mtd@lists.infradead.org; Sat, 11 Feb 2017 16:44:16 +0000
From: torfl@t-online.de
To: linux-mtd@lists.infradead.org
Cc: Torsten Fleischer <torfl@t-online.de>,
 Torsten Fleischer <torfl6749@gmail.com>
Subject: [PATCH 1/2] mtd-utils: Fix format specifier definitions for off_t and
 loff_t.
Date: Sat, 11 Feb 2017 17:43:31 +0100
Message-Id: <1486831412-30409-2-git-send-email-torfl@t-online.de>
In-Reply-To: <1486831412-30409-1-git-send-email-torfl@t-online.de>
References: <1486831412-30409-1-git-send-email-torfl@t-online.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Torsten Fleischer <torfl@t-online.de>

On 32bit systems (e.g. ARM) the size of off_t can be 4 byte and the size of loff_t 8 byte.

This causes compiler warnings like the following:

flash_erase.c: In function 'show_progress':
flash_erase.c:56:22: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'off_t {aka long int}' [-Wformat=]
  bareverbose(!quiet, "\rErasing %d Kibyte @ %"PRIxoff_t" -- %2i %% complete ",

and an output like this:

~# flash_erase /dev/mtd2 0 1
Erasing 64 Kibyte @ 6400000000 -- 0 % complete

~#

Since the size of off_t and loff_t can differ from each other, the
printf format specifier should be determined separately for both.
Further the format specifiers should be based directly on the size of the
particular data type.

Signed-off-by: Torsten Fleischer <torfl6749@gmail.com>
---
 configure.ac                   |  2 +-
 include/common.h               | 14 +++++++++-----
 tests/mtd-tests/nandpagetest.c |  2 +-
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/configure.ac b/configure.ac
index a5fc3a5..fbef15c 100644
--- a/configure.ac
+++ b/configure.ac
@@ -149,7 +149,7 @@ AM_COND_IF([WITHOUT_LZO], [], [
 	test "${have_lzo}" != "yes" && AC_MSG_ERROR([lzo missing])
 ])
 
-AC_CHECK_SIZEOF([long])
+AC_CHECK_SIZEOF([off_t])
 
 AC_CHECK_SIZEOF([loff_t])
 
diff --git a/include/common.h b/include/common.h
index 2812f49..d0c706d 100644
--- a/include/common.h
+++ b/include/common.h
@@ -70,17 +70,21 @@ extern "C" {
 #endif
 
 /* define a print format specifier for off_t */
-#ifdef __USE_FILE_OFFSET64
+#if (SIZEOF_OFF_T >= 8)
 #define PRIxoff_t PRIx64
 #define PRIdoff_t PRId64
 #else
-#if (SIZEOF_LONG == SIZEOF_LOFF_T)
 #define PRIxoff_t "l"PRIx32
 #define PRIdoff_t "l"PRId32
-#else
-#define PRIxoff_t "ll"PRIx32
-#define PRIdoff_t "ll"PRId32
 #endif
+
+/* define a print format specifier for loff_t */
+#if (SIZEOF_LOFF_T >= 8)
+#define PRIxloff_t PRIx64
+#define PRIdloff_t PRId64
+#else
+#define PRIxloff_t "l"PRIx32
+#define PRIdloff_t "l"PRId32
 #endif
 
 /* Verbose messages */
diff --git a/tests/mtd-tests/nandpagetest.c b/tests/mtd-tests/nandpagetest.c
index faf5fe3..4145ef7 100644
--- a/tests/mtd-tests/nandpagetest.c
+++ b/tests/mtd-tests/nandpagetest.c
@@ -230,7 +230,7 @@ static int verify_eraseblock(int ebnum)
 			return err;
 
 		if (lseek(fd, addr, SEEK_SET) != addr) {
-			fprintf(stderr, "cannot seek mtd%d to offset %"PRIdoff_t,
+			fprintf(stderr, "cannot seek mtd%d to offset %"PRIdloff_t,
 	 				mtd.mtd_num, addr);
 			return -1;
 		}
-- 
2.1.4
