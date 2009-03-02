Received: from zelda.netsplit.com ([87.194.19.211])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lh5a3-0006eQ-2N
	for linux-mtd@lists.infradead.org; Tue, 10 Mar 2009 17:17:29 +0000
Message-Id: <e0ea71d3322d398cf06fa8560a41230803b5925b.1236702228.git.scott@canonical.com>
In-Reply-To: <cover.1236702228.git.scott@canonical.com>
References: <cover.1236702228.git.scott@canonical.com>
From: Scott James Remnant <scott@canonical.com>
Date: Mon, 2 Mar 2009 17:38:30 +0000
Subject: [PATCH 08/31] mtd: Auto-load ftl module when device opened.
To: linux-kernel@vger.kernel.org
Sender: Scott James Remnant <scott@zelda.netsplit.com>
Cc: linux-mtd@lists.infradead.org, joern@lazybastard.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ftl module is missing the block-major-44-* alias that would cause it
to be auto-loaded when a device of that type is opened.  This patch adds
the alias.

Signed-off-by: Scott James Remnant <scott@canonical.com>
Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
---
 drivers/mtd/ftl.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index a790c06..0af7eee 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -69,6 +69,7 @@
 #include <linux/init.h>
 #include <linux/hdreg.h>
 #include <linux/vmalloc.h>
+#include <linux/blkdev.h>
 #include <linux/blkpg.h>
 #include <asm/uaccess.h>
 
@@ -1116,3 +1117,4 @@ module_exit(cleanup_ftl);
 MODULE_LICENSE("Dual MPL/GPL");
 MODULE_AUTHOR("David Hinds <dahinds@users.sourceforge.net>");
 MODULE_DESCRIPTION("Support code for Flash Translation Layer, used on PCMCIA devices");
+MODULE_ALIAS_BLOCKDEV_MAJOR(FTL_MAJOR);
-- 
1.6.0.5
