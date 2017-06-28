Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dQAqJ-0006a5-Rq
 for linux-mtd@lists.infradead.org; Wed, 28 Jun 2017 11:09:13 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.sigma-star.at (Postfix) with ESMTP id 9454824E0011
 for <linux-mtd@lists.infradead.org>; Wed, 28 Jun 2017 13:08:43 +0200 (CEST)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 5/9] Enable compiler warnings
Date: Wed, 28 Jun 2017 13:08:15 +0200
Message-Id: <20170628110819.30563-6-david.oberhollenzer@sigma-star.at>
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

This patch borrows the compiler.m4 script from util-linux to check
for compiler support of a number of warning flags and sets them if
they are supported.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 Makefile.am    |  2 +-
 configure.ac   | 22 ++++++++++++++++++++++
 m4/compiler.m4 | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 m4/compiler.m4

diff --git a/Makefile.am b/Makefile.am
index 4c123f2..e9c1608 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -1,6 +1,6 @@
 ACLOCAL_AMFLAGS = -I m4
 
-AM_CPPFLAGS = -D_GNU_SOURCE -I$(top_srcdir)/include
+AM_CPPFLAGS = $(WARN_CFLAGS) -D_GNU_SOURCE -std=gnu99 -I$(top_srcdir)/include
 
 if WITHOUT_XATTR
 AM_CPPFLAGS += -DWITHOUT_XATTR
diff --git a/configure.ac b/configure.ac
index 8db281d..c1cf1d1 100644
--- a/configure.ac
+++ b/configure.ac
@@ -24,6 +24,28 @@ AC_DISABLE_STATIC
 AC_PROG_CC
 AC_PROG_INSTALL
 
+## compiler warnings
+UL_WARN_ADD([-Wall])
+UL_WARN_ADD([-Wextra])
+UL_WARN_ADD([-Wunused])
+UL_WARN_ADD([-Wmissing-prototypes])
+UL_WARN_ADD([-Wmissing-declarations])
+UL_WARN_ADD([-Wwrite-strings])
+UL_WARN_ADD([-Wjump-misses-init])
+UL_WARN_ADD([-Wuninitialized])
+UL_WARN_ADD([-Winit-self])
+UL_WARN_ADD([-Wlogical-op])
+UL_WARN_ADD([-Wunused-but-set-parameter])
+UL_WARN_ADD([-Wunused-but-set-variable])
+UL_WARN_ADD([-Wunused-parameter])
+UL_WARN_ADD([-Wunused-result])
+UL_WARN_ADD([-Wunused-variable])
+
+UL_WARN_ADD([-Wno-shadow])
+UL_WARN_ADD([-Wno-sign-compare])
+
+AC_SUBST([WARN_CFLAGS])
+
 ###### handle configure switches, select dependencies ######
 
 need_clock_gettime="no"
diff --git a/m4/compiler.m4 b/m4/compiler.m4
new file mode 100644
index 0000000..058c73f
--- /dev/null
+++ b/m4/compiler.m4
@@ -0,0 +1,40 @@
+dnl Copyright (C) 2008-2011 Free Software Foundation, Inc.
+dnl This file is free software; the Free Software Foundation
+dnl gives unlimited permission to copy and/or distribute it,
+dnl with or without modifications, as long as this notice is preserved.
+
+dnl From Simon Josefsson
+dnl -- derivated from coreutils m4/warnings.m4
+
+# UL_AS_VAR_APPEND(VAR, VALUE)
+# ----------------------------
+# Provide the functionality of AS_VAR_APPEND if Autoconf does not have it.
+m4_ifdef([AS_VAR_APPEND],
+[m4_copy([AS_VAR_APPEND], [UL_AS_VAR_APPEND])],
+[m4_define([UL_AS_VAR_APPEND],
+[AS_VAR_SET([$1], [AS_VAR_GET([$1])$2])])])
+
+# UL_ADD_WARN(COMPILER_OPTION [, VARNAME])
+# ------------------------
+# Adds parameter to WARN_CFLAGS (or to $VARNAME) if the compiler supports it.
+AC_DEFUN([UL_WARN_ADD], [
+  m4_define([warnvarname], m4_default([$2],WARN_CFLAGS))
+  AS_VAR_PUSHDEF([ul_Warn], [ul_cv_warn_$1])dnl
+  AC_CACHE_CHECK([whether compiler handles $1], m4_defn([ul_Warn]), [
+    # store AC_LANG_WERROR status, then turn it on
+    save_ac_[]_AC_LANG_ABBREV[]_werror_flag="${ac_[]_AC_LANG_ABBREV[]_werror_flag}"
+    AC_LANG_WERROR
+
+    ul_save_CPPFLAGS="$CPPFLAGS"
+    CPPFLAGS="-Werror ${CPPFLAGS} $1"
+    AC_PREPROC_IFELSE([AC_LANG_PROGRAM([])],
+                      [AS_VAR_SET(ul_Warn, [yes])],
+                      [AS_VAR_SET(ul_Warn, [no])])
+    # restore AC_LANG_WERROR
+    ac_[]_AC_LANG_ABBREV[]_werror_flag="${save_ac_[]_AC_LANG_ABBREV[]_werror_flag}"
+
+    CPPFLAGS="$ul_save_CPPFLAGS"
+  ])
+  AS_VAR_IF(ul_Warn, [yes], [UL_AS_VAR_APPEND(warnvarname, [" $1"])])
+])
+
-- 
2.12.3
