Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fI9Ey-0006MB-AN
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 08:54:07 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 3/3] mtd-utils: make sure pkg-config is installed in configure
 script
Date: Mon, 14 May 2018 10:53:25 +0200
Message-Id: <20180514085325.6793-4-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20180514085325.6793-1-david.oberhollenzer@sigma-star.at>
References: <20180514085325.6793-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds a check to configure.ac that tests if pkg-config
is available on the system.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 configure.ac | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/configure.ac b/configure.ac
index 1ac45c7..f5538a0 100644
--- a/configure.ac
+++ b/configure.ac
@@ -24,6 +24,15 @@ AC_DISABLE_STATIC
 AC_PROG_CC
 AC_PROG_INSTALL
 
+
+m4_ifndef([PKG_PROG_PKG_CONFIG],
+  [m4_fatal([Could not locate the pkg-config autoconf
+    macros. These are usually located in /usr/share/aclocal/pkg.m4.
+    If your macros are in a different location, try setting the
+    environment variable AL_OPTS="-I/other/macro/dir" before running
+    ./autogen.sh or autoreconf again. Make sure pkg-config is installed.])])
+PKG_PROG_PKG_CONFIG
+
 ## compiler warnings
 UL_WARN_ADD([-Wall])
 UL_WARN_ADD([-Wextra])
-- 
2.17.0
