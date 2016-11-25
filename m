Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAKL9-0001bG-FT
 for linux-mtd@lists.infradead.org; Fri, 25 Nov 2016 17:31:18 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 1/2] common: Fix PRI{x,d}off definitions for x86_64 platform
Date: Fri, 25 Nov 2016 18:30:40 +0100
Message-Id: <1480095041-25627-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1480095041-25627-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1480095041-25627-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Compiling for x86_64 generates a lot of warning because the PRIxoff_t and
PRIdoff_t are not properly defined, which comes from the missing
SIZEOF_LONG definition.

Use the autotools to generate a config.h header, include this header from
common.h and ask autoheader to generate the SIZEOF_LONG and SIZEOF_LOFF_T
definitions.
Use these new definitions to assign the proper descriptors to PRIxoff_t
and PRIdoff_t.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 .gitignore       | 3 +++
 configure.ac     | 5 +++++
 include/common.h | 4 +++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index c11a45ee1575..a5547d5d4578 100644
--- a/.gitignore
+++ b/.gitignore
@@ -124,6 +124,9 @@ tests/ubi-tests/ubi-stress-test.sh
 /missing
 /stamp-h?
 /compile
+/include/config.h
+/include/config.h.in
+/include/stamp-h1
 
 #
 # Top-level generic files
diff --git a/configure.ac b/configure.ac
index 18ff9affaf5d..d46776864b1d 100644
--- a/configure.ac
+++ b/configure.ac
@@ -4,6 +4,7 @@ m4_define([RELEASE], 1.5.2)
 
 AC_INIT([mtd-utils], [RELEASE], [linux-mtd@lists.infradead.org], mtd-utils)
 
+AC_CONFIG_HEADERS([include/config.h])
 
 AC_ARG_ENABLE([unit-tests],
 	[AS_HELP_STRING([--enable-unit-tests], [Compile unit test programs])],
@@ -106,4 +107,8 @@ AM_COND_IF([WITHOUT_LZO], [], [
 	test "${have_lzo}" != "yes" && AC_MSG_ERROR([lzo missing])
 ])
 
+AC_CHECK_SIZEOF([long])
+
+AC_CHECK_SIZEOF([loff_t])
+
 AC_OUTPUT([Makefile])
diff --git a/include/common.h b/include/common.h
index 4f0bb9bb8fb6..93ef7f347ffb 100644
--- a/include/common.h
+++ b/include/common.h
@@ -30,6 +30,8 @@
 #include <inttypes.h>
 #include <sys/sysmacros.h>
 
+#include "config.h"
+
 #ifndef PROGRAM_NAME
 # error "You must define PROGRAM_NAME before including this header"
 #endif
@@ -71,7 +73,7 @@ extern "C" {
 #define PRIxoff_t PRIx64
 #define PRIdoff_t PRId64
 #else
-#if (SIZEOF_LONG >= 8)
+#if (SIZEOF_LONG == SIZEOF_LOFF_T)
 #define PRIxoff_t "l"PRIx32
 #define PRIdoff_t "l"PRId32
 #else
-- 
2.7.4
