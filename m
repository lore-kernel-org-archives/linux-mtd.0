Received: from rcsinet10.oracle.com ([148.87.113.121])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ox3Ts-0005yB-Ok
	for linux-mtd@lists.infradead.org; Sat, 18 Sep 2010 19:53:54 +0000
Date: Sat, 18 Sep 2010 12:53:40 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] usibfs: fix kconfig dependency warning
Message-Id: <20100918125340.7a2cbb8b.randy.dunlap@oracle.com>
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

warning: (MTD_UBI_DEBUG && MTD && SYSFS && MTD_UBI && KALLSYMS && DEBUG_KERNEL || UBIFS_FS_DEBUG && MISC_FILESYSTEMS && UBIFS_FS || LOCKDEP && DEBUG_KERNEL && TRACE_IRQFLAGS_SUPPORT && STACKTRACE_SUPPORT && LOCKDEP_SUPPORT || LATENCYTOP && HAVE_LATENCYTOP_SUPPORT && DEBUG_KERNEL && STACKTRACE_SUPPORT && PROC_FS) selects KALLSYMS_ALL which has unmet direct dependencies (DEBUG_KERNEL && KALLSYMS)

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc:      Artem Bityutskiy <dedekind1@gmail.com>
Cc:      Adrian Hunter <adrian.hunter@nokia.com>
Cc:      linux-mtd@lists.infradead.org
---
 fs/ubifs/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20100917.orig/fs/ubifs/Kconfig
+++ linux-next-20100917/fs/ubifs/Kconfig
@@ -47,7 +47,7 @@ config UBIFS_FS_DEBUG
 	bool "Enable debugging"
 	depends on UBIFS_FS
 	select DEBUG_FS
-	select KALLSYMS_ALL
+	select KALLSYMS_ALL if DEBUG_KERNEL && KALLSYMS
 	help
 	  This option enables UBIFS debugging.
 
