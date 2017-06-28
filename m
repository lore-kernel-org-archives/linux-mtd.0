Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dQAqJ-0006a6-Rp
 for linux-mtd@lists.infradead.org; Wed, 28 Jun 2017 11:09:13 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.sigma-star.at (Postfix) with ESMTP id C7C4524E001D
 for <linux-mtd@lists.infradead.org>; Wed, 28 Jun 2017 13:08:43 +0200 (CEST)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 2/9] Restructure autoconf configure.ac
Date: Wed, 28 Jun 2017 13:08:12 +0200
Message-Id: <20170628110819.30563-3-david.oberhollenzer@sigma-star.at>
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

This patch attempts to cleanly seperate configure switches,
dependency checking and generating of output files inside
the autoconf configure.ac file.

Also, instead of aborting immediately if a dependency is missing,
the configure script now completes dependency checking and then
lists ALL dependencies that are missing for the selected build
options. In addition, suggestions on how to disable some features
that require the missing dependencies are printed out.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 configure.ac | 180 +++++++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 132 insertions(+), 48 deletions(-)

diff --git a/configure.ac b/configure.ac
index fbef15c..aedbb32 100644
--- a/configure.ac
+++ b/configure.ac
@@ -4,8 +4,6 @@ m4_define([RELEASE], 2.0.0)
 
 AC_INIT([mtd-utils], [RELEASE], [linux-mtd@lists.infradead.org], mtd-utils)
 
-AC_CONFIG_HEADERS([include/config.h])
-
 AC_ARG_ENABLE([unit-tests],
 	[AS_HELP_STRING([--enable-unit-tests], [Compile unit test programs])],
 	[case "${enableval}" in
@@ -26,9 +24,21 @@ AC_DISABLE_STATIC
 AC_PROG_CC
 AC_PROG_INSTALL
 
+###### handle configure switches, select dependencies ######
+
+need_clock_gettime="no"
+need_pthread="no"
+need_uuid="no"
+need_zlib="no"
+need_lzo="no"
+need_xattr="no"
+need_cmocka="no"
+
+
+AM_COND_IF([UNIT_TESTS], [
+	need_cmocka="yes"
+])
 
-AC_SEARCH_LIBS([clock_gettime],[rt posix4])
-AC_CHECK_FUNCS([clock_gettime])
 
 AC_ARG_ENABLE([tests],
 	[AS_HELP_STRING([--disable-tests], [Compile test programs])],
@@ -39,8 +49,10 @@ AC_ARG_ENABLE([tests],
 	esac],
 	[AM_CONDITIONAL([BUILD_TESTS], [true])])
 
-AM_COND_IF([BUILD_TESTS],
-	[AX_PTHREAD([], [AC_MSG_ERROR([pthread missing])])])
+AM_COND_IF([BUILD_TESTS], [
+	need_clock_gettime="yes"
+	need_pthread="yes"
+])
 
 
 AC_ARG_ENABLE([install-tests],
@@ -58,18 +70,6 @@ AM_COND_IF([INSTALL_TESTS],
 	[AC_SUBST(testbindir, ["\".\""])])
 
 
-AC_CONFIG_FILES([tests/fs-tests/fs_help_all.sh
-	tests/fs-tests/fs_run_all.sh
-	tests/fs-tests/stress/fs_stress00.sh
-	tests/fs-tests/stress/fs_stress01.sh
-	tests/ubi-tests/runubitests.sh
-	tests/ubi-tests/ubi-stress-test.sh])
-
-
-need_uuid="no"
-need_zlib="no"
-need_lzo="no"
-
 AC_ARG_WITH([jffs],
 	[AS_HELP_STRING([--without-jffs], [Disable jffsX utilities])],
 	[case "${withval}" in
@@ -90,67 +90,151 @@ AC_ARG_WITH([ubifs],
 
 AM_COND_IF([BUILD_UBIFS], [
 	need_uuid="yes"
+	need_xattr="yes"
 	need_zlib="yes"
 	need_lzo="yes"
 ])
 
 AM_COND_IF([BUILD_JFFSX], [
+	need_xattr="yes"
 	need_zlib="yes"
 	need_lzo="yes"
 ])
 
-if test "x$need_zlib" = "xyes"; then
-	PKG_CHECK_MODULES(ZLIB, [zlib])
-fi
-
-if test "x$need_uuid" = "xyes"; then
-	PKG_CHECK_MODULES(UUID, [uuid])
-fi
-
-
 AC_ARG_WITH([xattr],
 	[AS_HELP_STRING([--without-xattr],
 		[Disable support forextended file attributes])],
 	[case "${withval}" in
-	yes) AM_CONDITIONAL([WITHOUT_XATTR], [false]) ;;
-	no)  AM_CONDITIONAL([WITHOUT_XATTR], [true]) ;;
+	yes) ;;
+	no) need_xattr="no" ;;
 	*) AC_MSG_ERROR([bad value ${withval} for --without-xattr]) ;;
-	esac],
-	[AM_CONDITIONAL([WITHOUT_XATTR], [false])])
-
-AC_CHECK_HEADER(sys/xattr.h, [], [AM_CONDITIONAL([WITHOUT_XATTR], [true])])
-AC_CHECK_HEADER(sys/acl.h, [], [AM_CONDITIONAL([WITHOUT_XATTR], [true])])
-
+	esac])
 
 AC_ARG_WITH([lzo],
 	[AS_HELP_STRING([--without-lzo], [Disable support for LZO compression])],
 	[case "${withval}" in
-	yes) AM_CONDITIONAL([WITHOUT_LZO], [test "x$need_lzo" != "xyes"]) ;;
-	no)  AM_CONDITIONAL([WITHOUT_LZO], [true]) ;;
+	yes) ;;
+	no) need_lzo="no" ;;
 	*) AC_MSG_ERROR([bad value ${withval} for --without-lzo]) ;;
-	esac],
-	[AM_CONDITIONAL([WITHOUT_LZO], [test "x$need_lzo" != "xyes"])])
+	esac])
 
+##### search for dependencies #####
 
-AC_CHECK_HEADERS([execinfo.h], [execinfo_found=yes])
-AM_CONDITIONAL([HAVE_EXECINFO], [test "x$execinfo_found" == "xyes"])
+clock_gettime_missing="no"
+pthread_missing="no"
+uuid_missing="no"
+zlib_missing="no"
+lzo_missing="no"
+xattr_missing="no"
+cmocka_missing="no"
+
+if test "x$need_zlib" = "xyes"; then
+	PKG_CHECK_MODULES(ZLIB, [zlib], [], [zlib_missing="yes"])
+fi
 
-AM_COND_IF([UNIT_TESTS], [PKG_CHECK_MODULES(CMOCKA, [ cmocka ])], [])
+if test "x$need_uuid" = "xyes"; then
+	PKG_CHECK_MODULES(UUID, [uuid], [], [uuid_missing="yes"])
+fi
+
+if test "x$need_clock_gettime" = "xyes"; then
+	AC_SEARCH_LIBS([clock_gettime], [rt posix4])
+	AC_CHECK_FUNCS([clock_gettime], [], [clock_gettime_missing="yes"])
+fi
 
-AM_COND_IF([WITHOUT_LZO], [], [
-	have_lzo="yes"
+if test "x$need_pthread" = "xyes"; then
+	AX_PTHREAD([], [pthread_missing="yes"])
+fi
+
+if test "x$need_lzo" = "xyes"; then
 	AC_ARG_VAR([LZO_CFLAGS], [C compiler flags for lzo])
 	AC_ARG_VAR([LZO_LIBS], [linker flags for lzo])
 	AC_CHECK_LIB([lzo2], [lzo1x_1_15_compress], [LZO_LIBS="-llzo2"],
 		[AC_CHECK_LIB([lzo],[lzo1x_1_15_compress],[LZO_LIBS="-llzo"],
-			[have_lzo="no"]
+			[lzo_missing="yes"]
 		)]
 	)
-	test "${have_lzo}" != "yes" && AC_MSG_ERROR([lzo missing])
-])
+fi
 
-AC_CHECK_SIZEOF([off_t])
+if test "x$need_xattr" = "xyes"; then
+	AC_CHECK_HEADERS([sys/xattr.h], [], [xattr_missing="yes"])
+	AC_CHECK_HEADERS([sys/acl.h], [], [xattr_missing="yes"])
+fi
+
+if test "x$need_cmocka" = "xyes"; then
+	PKG_CHECK_MODULES(CMOCKA, [cmocka], [], [cmocka_missing="yes"])
+fi
+
+AC_CHECK_HEADERS([execinfo.h], [execinfo_found=yes])
+
+##### produce summary on dependencies #####
 
+dep_missing="no"
+
+if test "x$clock_gettime_missing" = "xyes"; then
+	AC_MSG_WARN([cannot find clock_gettime function required for MTD tests])
+	AC_MSG_NOTICE([building test programs can optionally be dissabled])
+	dep_missing="yes"
+fi
+
+if test "x$pthread_missing" = "xyes"; then
+	AC_MSG_WARN([cannot find pthread support required for test programs])
+	AC_MSG_NOTICE([building test programs can optionally be dissabled])
+	dep_missing="yes"
+fi
+
+if test "x$uuid_missing" = "xyes"; then
+	AC_MSG_WARN([cannot find uuid library required for mkfs.ubifs])
+	AC_MSG_NOTICE([mtd-utils can optionally be built without mkfs.ubifs])
+	dep_missing="yes"
+fi
+
+if test "x$zlib_missing" = "xyes"; then
+	AC_MSG_WARN([cannot find ZLIB library required for mkfs programs])
+	AC_MSG_NOTICE([mtd-utils can optionally be built without mkfs.ubifs])
+	AC_MSG_NOTICE([mtd-utils can optionally be built without mkfs.jffs2])
+	dep_missing="yes"
+fi
+
+if test "x$lzo_missing" = "xyes"; then
+	AC_MSG_WARN([cannot find LZO library required for mkfs programs])
+	AC_MSG_NOTICE([mtd-utils can optionally be built without mkfs.ubifs])
+	AC_MSG_NOTICE([mtd-utils can optionally be built without mkfs.jffs2])
+	AC_MSG_NOTICE([mtd-utils can optionally be built without LZO support])
+	dep_missing="yes"
+fi
+
+if test "x$xattr_missing" = "xyes"; then
+	AC_MSG_WARN([cannot find headers for extended attributes])
+	AC_MSG_WARN([disabling XATTR support])
+	need_xattr="no"
+fi
+
+if test "x$cmocka_missing" = "xyes"; then
+	AC_MSG_WARN([cannot find CMocka library required for unit tests])
+	AC_MSG_NOTICE([unit tests can optionally be disabled])
+	dep_missing="yes"
+fi
+
+if test "x$dep_missing" = "xyes"; then
+	AC_MSG_ERROR([missing one or more dependencies])
+fi
+
+##### generate output #####
+
+AM_CONDITIONAL([WITHOUT_LZO], [test "x$need_lzo" != "xyes"])
+AM_CONDITIONAL([WITHOUT_XATTR], [test "x$need_xattr" != "xyes"])
+AM_CONDITIONAL([HAVE_EXECINFO], [test "x$execinfo_found" == "xyes"])
+
+AC_CHECK_SIZEOF([off_t])
 AC_CHECK_SIZEOF([loff_t])
 
+AC_CONFIG_HEADERS([include/config.h])
+
+AC_CONFIG_FILES([tests/fs-tests/fs_help_all.sh
+	tests/fs-tests/fs_run_all.sh
+	tests/fs-tests/stress/fs_stress00.sh
+	tests/fs-tests/stress/fs_stress01.sh
+	tests/ubi-tests/runubitests.sh
+	tests/ubi-tests/ubi-stress-test.sh])
+
 AC_OUTPUT([Makefile])
-- 
2.12.3
