Date: Thu, 12 Aug 2010 12:10:59 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
To: linux-mtd@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] ubi: fix kconfig unmet dependency
Message-Id: <20100812121059.e1d40380.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
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

warning: (OPTPROBES && KPROBES && HAVE_OPTPROBES && !PREEMPT && DEBUG_KERNEL || MTD_UBI_DEBUG && MTD && SYSFS && MTD_UBI || UBIFS_FS_DEBUG && MISC_FILESYSTEMS && UBIFS_FS || LOCKDEP && DEBUG_KERNEL && TRACE_IRQFLAGS_SUPPORT && STACKTRACE_SUPPORT && LOCKDEP_SUPPORT || LATENCYTOP && HAVE_LATENCYTOP_SUPPORT && DEBUG_KERNEL && STACKTRACE_SUPPORT && PROC_FS) selects KALLSYMS_ALL which has unmet direct dependencies (DEBUG_KERNEL && KALLSYMS)

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc:	Artem Bityutskiy <dedekind1@gmail.com>
Cc:	linux-mtd@lists.infradead.org
---
 drivers/mtd/ubi/Kconfig.debug |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

This builds cleanly.  Will it execute OK?
or we can make MTD_UBI_DEBUG depend on KALLSYMS_ALL.

--- linux-next-20100810.orig/drivers/mtd/ubi/Kconfig.debug
+++ linux-next-20100810/drivers/mtd/ubi/Kconfig.debug
@@ -6,7 +6,7 @@ config MTD_UBI_DEBUG
 	depends on SYSFS
 	depends on MTD_UBI
 	select DEBUG_FS
-	select KALLSYMS_ALL
+	select KALLSYMS_ALL if KALLSYMS && DEBUG_KERNEL
 	help
 	  This option enables UBI debugging.
 
