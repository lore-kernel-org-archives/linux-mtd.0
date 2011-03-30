Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q4qtp-0004Eu-90
	for linux-mtd@lists.infradead.org; Wed, 30 Mar 2011 08:37:10 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH 2/2] UBI: do not select KALLSYMS_ALL
Date: Wed, 30 Mar 2011 11:40:16 +0300
Message-Id: <1301474416-8202-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1301474416-8202-1-git-send-email-dedekind1@gmail.com>
References: <1301474416-8202-1-git-send-email-dedekind1@gmail.com>
Cc: MTD list <linux-mtd@lists.infradead.org>,
	lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

All UBI needs is to make sure we stacktraces when UBI debugging
is enabled. It is enough to select KALLSYMS for this, KALLSYMS_ALL
is not necessary.

And the current Kconfig line we have:

select KALLSYMS_ALL if KALLSYMS && DEBUG_KERNEL

is just too complex to be sane and right. But this "if" part there
is needed to prevent "unmet direct dependency" warnings, because
KALLSYMS_ALL depends on KALLSYMS and DEBUG_KERNEL, so we cannot
just select KALLSYMS_ALL.

Anyway, this feels messy, and we do not seem to really need KALLSYMS_ALL,
so select KALLSYMS instead.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 6abeb4f..4dcc752 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -56,7 +56,7 @@ config MTD_UBI_DEBUG
 	bool "UBI debugging"
 	depends on SYSFS
 	select DEBUG_FS
-	select KALLSYMS_ALL if KALLSYMS && DEBUG_KERNEL
+	select KALLSYMS
 	help
 	  This option enables UBI debugging.
 
-- 
1.7.2.3
