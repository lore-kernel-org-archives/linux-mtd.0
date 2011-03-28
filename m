Received: from rcsinet10.oracle.com ([148.87.113.121])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q4JEg-0007g8-24
	for linux-mtd@lists.infradead.org; Mon, 28 Mar 2011 20:40:28 +0000
Date: Mon, 28 Mar 2011 13:40:16 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] ubifs: fix kconfig dependency warning
Message-Id: <20110328134016.deb5d0c8.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Adrian Hunter <adrian.hunter@nokia.com>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix another kconfig dependency warning, this time in ubifs.

warning: (UBIFS_FS_DEBUG && LOCKDEP && LATENCYTOP) selects KALLSYMS_ALL which has unmet direct dependencies (DEBUG_KERNEL && KALLSYMS)

Without this patch, we can have:
# CONFIG_KALLSYMS is not set
CONFIG_KALLSYMS_ALL=y
which is useless (does nothing unless KALLSYMS is enabled).

However, ubifs builds successfully with or without this patch,
and it builds with this line completely deleted,
so what was this 'select' for?  Just developer convenience?

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc:      Artem Bityutskiy <dedekind1@gmail.com>
Cc:      Adrian Hunter <adrian.hunter@nokia.com>
Cc:      linux-mtd@lists.infradead.org
---
 fs/ubifs/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-2.6.38-git18.orig/fs/ubifs/Kconfig
+++ linux-2.6.38-git18/fs/ubifs/Kconfig
@@ -47,7 +47,7 @@ config UBIFS_FS_DEBUG
 	bool "Enable debugging support"
 	depends on UBIFS_FS
 	select DEBUG_FS
-	select KALLSYMS_ALL
+	select KALLSYMS_ALL if DEBUG_KERNEL && KALLSYMS
 	help
 	  This option enables UBIFS debugging support. It makes sure various
 	  assertions, self-checks, debugging messages and test modes are compiled
