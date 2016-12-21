Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJjFW-0001SZ-9a
 for linux-mtd@lists.infradead.org; Wed, 21 Dec 2016 15:56:18 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.sigma-star.at (Postfix) with ESMTP id 1103824E0001
 for <linux-mtd@lists.infradead.org>; Wed, 21 Dec 2016 16:55:48 +0100 (CET)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@sigma-star.at,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH] mtd-utils: Add configure switches to disable jffsX or ubifs
 tools
Date: Wed, 21 Dec 2016 16:54:12 +0100
Message-Id: <20161221155412.29706-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For some applications, like building a root filesystem for an embedded
device, it may be desireable to only build and install a subset of the
mtd-utils. This can be done throught the targets of the generated
Makefile and hand picking executables, however the jffsX and ubifs
utilities have external build dependencies that may not be needed.

This patch adds configure switches to disable building the jffsX and
ubifs utilities. Their respective build dependencies (zlib, lzo, uuid)
are only requested if the tools are being built.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 Makefile.am  |  8 +++++++-
 configure.ac | 49 ++++++++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 51 insertions(+), 6 deletions(-)

diff --git a/Makefile.am b/Makefile.am
index 23c1940..31b21bc 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -36,11 +36,17 @@ EXTRA_DIST += $(GLOBAL_HEADER) $(GLOBAL_EXTRA)
 
 include lib/Makemodule.am
 include ubi-utils/Makemodule.am
-include ubifs-utils/Makemodule.am
 include misc-utils/Makemodule.am
 include nand-utils/Makemodule.am
 include nor-utils/Makemodule.am
+
+if BUILD_UBIFS
+include ubifs-utils/Makemodule.am
+endif
+
+if BUILD_JFFSX
 include jffsX-utils/Makemodule.am
+endif
 
 if BUILD_TESTS
 include tests/ubi-tests/Makemodule.am
diff --git a/configure.ac b/configure.ac
index 5196478..be0d17e 100644
--- a/configure.ac
+++ b/configure.ac
@@ -66,6 +66,48 @@ AC_CONFIG_FILES([tests/fs-tests/fs_help_all.sh
 	tests/ubi-tests/ubi-stress-test.sh])
 
 
+need_uuid="no"
+need_zlib="no"
+need_lzo="no"
+
+AC_ARG_WITH([jffs],
+	[AS_HELP_STRING([--without-jffs], [Disable jffsX utilities])],
+	[case "${withval}" in
+	yes) AM_CONDITIONAL([BUILD_JFFSX], [true]) ;;
+	no)  AM_CONDITIONAL([BUILD_JFFSX], [false]) ;;
+	*) AC_MSG_ERROR([bad value ${withval} for --without-jffs]) ;;
+	esac],
+	[AM_CONDITIONAL([BUILD_JFFSX], [true])])
+
+AC_ARG_WITH([ubifs],
+	[AS_HELP_STRING([--without-ubifs], [Disable ubifs utilities])],
+	[case "${withval}" in
+	yes) AM_CONDITIONAL([BUILD_UBIFS], [true]) ;;
+	no)  AM_CONDITIONAL([BUILD_UBIFS], [false]) ;;
+	*) AC_MSG_ERROR([bad value ${withval} for --without-ubifs]) ;;
+	esac],
+	[AM_CONDITIONAL([BUILD_UBIFS], [true])])
+
+AM_COND_IF([BUILD_UBIFS], [
+	need_uuid="yes"
+	need_zlib="yes"
+	need_lzo="yes"
+])
+
+AM_COND_IF([BUILD_JFFSX], [
+	need_zlib="yes"
+	need_lzo="yes"
+])
+
+if test "x$need_zlib" = "xyes"; then
+	PKG_CHECK_MODULES(ZLIB, [zlib])
+fi
+
+if test "x$need_uuid" = "xyes"; then
+	PKG_CHECK_MODULES(UUID, [uuid])
+fi
+
+
 AC_ARG_WITH([xattr],
 	[AS_HELP_STRING([--without-xattr],
 		[Disable support forextended file attributes])],
@@ -83,19 +125,16 @@ AC_CHECK_HEADER(sys/acl.h, [], [AM_CONDITIONAL([WITHOUT_XATTR], [true])])
 AC_ARG_WITH([lzo],
 	[AS_HELP_STRING([--without-lzo], [Disable support for LZO compression])],
 	[case "${withval}" in
-	yes) AM_CONDITIONAL([WITHOUT_LZO], [false]) ;;
+	yes) AM_CONDITIONAL([WITHOUT_LZO], [test "x$need_lzo" != "xyes"]) ;;
 	no)  AM_CONDITIONAL([WITHOUT_LZO], [true]) ;;
 	*) AC_MSG_ERROR([bad value ${withval} for --without-lzo]) ;;
 	esac],
-	[AM_CONDITIONAL([WITHOUT_LZO], [false])])
+	[AM_CONDITIONAL([WITHOUT_LZO], [test "x$need_lzo" != "xyes"])])
 
 
 AC_CHECK_HEADERS([execinfo.h], [execinfo_found=yes])
 AM_CONDITIONAL([HAVE_EXECINFO], [test "x$execinfo_found" == "xyes"])
 
-PKG_CHECK_MODULES(ZLIB, [ zlib ])
-PKG_CHECK_MODULES(UUID, [ uuid ])
-
 AM_COND_IF([UNIT_TESTS], [PKG_CHECK_MODULES(CMOCKA, [ cmocka ])], [])
 
 AM_COND_IF([WITHOUT_LZO], [], [
-- 
2.11.0
