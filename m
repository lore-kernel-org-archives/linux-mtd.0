Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dQAqg-0006gF-5e
 for linux-mtd@lists.infradead.org; Wed, 28 Jun 2017 11:09:33 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.sigma-star.at (Postfix) with ESMTP id 5920D24E0012
 for <linux-mtd@lists.infradead.org>; Wed, 28 Jun 2017 13:08:44 +0200 (CEST)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 3/9] Use autoconf header detection correctly for libmissing
Date: Wed, 28 Jun 2017 13:08:13 +0200
Message-Id: <20170628110819.30563-4-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20170628110819.30563-1-david.oberhollenzer@sigma-star.at>
References: <20170628110819.30563-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

AC_CHECK_HEADERS already makes sure our config header contains a
HAVE_$FOO_H macro if a header was found. There is no need to
awkwardly set our own Automake conditionals and check for it all
over the place in the Automake files.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 Makefile.am                  | 4 ----
 configure.ac                 | 3 +--
 include/libmissing.h         | 6 ++++--
 lib/execinfo.c               | 4 ++--
 tests/fs-tests/Makemodule.am | 7 +------
 5 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/Makefile.am b/Makefile.am
index 31b21bc..4c123f2 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -10,10 +10,6 @@ if WITHOUT_LZO
 AM_CPPFLAGS += -DWITHOUT_LZO
 endif
 
-if HAVE_EXECINFO
-AM_CPPFLAGS += -DHAVE_EXECINFO
-endif
-
 sbin_PROGRAMS =
 sbin_SCRIPTS =
 noinst_LIBRARIES =
diff --git a/configure.ac b/configure.ac
index aedbb32..8db281d 100644
--- a/configure.ac
+++ b/configure.ac
@@ -164,7 +164,7 @@ if test "x$need_cmocka" = "xyes"; then
 	PKG_CHECK_MODULES(CMOCKA, [cmocka], [], [cmocka_missing="yes"])
 fi
 
-AC_CHECK_HEADERS([execinfo.h], [execinfo_found=yes])
+AC_CHECK_HEADERS([execinfo.h])
 
 ##### produce summary on dependencies #####
 
@@ -223,7 +223,6 @@ fi
 
 AM_CONDITIONAL([WITHOUT_LZO], [test "x$need_lzo" != "xyes"])
 AM_CONDITIONAL([WITHOUT_XATTR], [test "x$need_xattr" != "xyes"])
-AM_CONDITIONAL([HAVE_EXECINFO], [test "x$execinfo_found" == "xyes"])
 
 AC_CHECK_SIZEOF([off_t])
 AC_CHECK_SIZEOF([loff_t])
diff --git a/include/libmissing.h b/include/libmissing.h
index c765f6d..0196033 100644
--- a/include/libmissing.h
+++ b/include/libmissing.h
@@ -1,11 +1,13 @@
 #ifndef LIBMISSING_H
 #define LIBMISSING_H
 
-#ifdef HAVE_EXECINFO
+#include "config.h"
+
+#ifdef HAVE_EXECINFO_H
 #include <execinfo.h>
 #endif
 
-#ifndef HAVE_EXECINFO
+#ifndef HAVE_EXECINFO_H
 int backtrace(void **buffer, int size);
 char **backtrace_symbols(void *const *buffer, int size);
 void backtrace_symbols_fd(void *const *buffer, int size, int fd);
diff --git a/lib/execinfo.c b/lib/execinfo.c
index a39df83..a59f6a9 100644
--- a/lib/execinfo.c
+++ b/lib/execinfo.c
@@ -1,6 +1,6 @@
 #include "libmissing.h"
 
-#ifndef HAVE_EXECINFO
+#ifndef HAVE_EXECINFO_H
 #define PROGRAM_NAME "libmissing"
 #include "common.h"
 
@@ -22,4 +22,4 @@ void backtrace_symbols_fd(void *const *buffer, int size, int fd)
 {
 	errmsg("backtrace_symbols_fd() is not implemented");
 }
-#endif /* !HAVE_EXECINFO */
+#endif /* !HAVE_EXECINFO_H */
diff --git a/tests/fs-tests/Makemodule.am b/tests/fs-tests/Makemodule.am
index d3acaa5..2eae860 100644
--- a/tests/fs-tests/Makemodule.am
+++ b/tests/fs-tests/Makemodule.am
@@ -1,12 +1,7 @@
 integck_SOURCES = tests/fs-tests/integrity/integck.c
-integck_LDADD = libubi.a
+integck_LDADD = libubi.a libmissing.a
 integck_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
 
-if HAVE_EXECINFO
-else
-integck_LDADD += libmissing.a
-endif
-
 test_1_SOURCES = tests/fs-tests/simple/test_1.c tests/fs-tests/lib/tests.c
 test_1_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/tests/fs-tests/lib
 
-- 
2.12.3
