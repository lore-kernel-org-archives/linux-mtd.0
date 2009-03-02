Received: from zelda.netsplit.com ([87.194.19.211])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lh5Zd-0006d5-Cf
	for linux-mtd@lists.infradead.org; Tue, 10 Mar 2009 17:17:04 +0000
Message-Id: <6a809405735d17d1183aa585314ff55b516a48b0.1236702228.git.scott@canonical.com>
In-Reply-To: <cover.1236702228.git.scott@canonical.com>
References: <cover.1236702228.git.scott@canonical.com>
From: Scott James Remnant <scott@canonical.com>
Date: Mon, 2 Mar 2009 17:43:04 +0000
Subject: [PATCH 11/31] mtd: Auto-load nftl module when device opened.
To: linux-kernel@vger.kernel.org
Sender: Scott James Remnant <scott@zelda.netsplit.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The nftl module is missing the block-major-93-* alias that would cause
it to be auto-loaded when a nftl of that type is opened.  This patch
adds the alias.

Signed-off-by: Scott James Remnant <scott@canonical.com>
Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
---
 drivers/mtd/nftlcore.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index d1c4546..ff0a249 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 #include <linux/init.h>
 #include <linux/hdreg.h>
+#include <linux/blkdev.h>
 
 #include <linux/kmod.h>
 #include <linux/mtd/mtd.h>
@@ -818,3 +819,4 @@ module_exit(cleanup_nftl);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>, Fabrice Bellard <fabrice.bellard@netgem.com> et al.");
 MODULE_DESCRIPTION("Support code for NAND Flash Translation Layer, used on M-Systems DiskOnChip 2000 and Millennium");
+MODULE_ALIAS_BLOCKDEV_MAJOR(NFTL_MAJOR);
-- 
1.6.0.5
