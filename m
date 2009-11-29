Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NEoBm-0003dO-NC
	for linux-mtd@lists.infradead.org; Sun, 29 Nov 2009 18:08:07 +0000
Date: Sun, 29 Nov 2009 19:07:57 +0100
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: [PATCH] mtd/nandsim: add support for 4KiB pages
Message-ID: <20091129180757.GA30617@Chamillionaire.breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I was going to play with a faulty nand image from real flash and noticed
that nandsim does not work with:
first_id_byte=0xec second_id_byte=0xd5 third_id_byte=0x51 fourth_id_byte=0xa6

This patch seems to fix it.

Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
---
 drivers/mtd/nand/nandsim.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index cd0711b..7281000 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -161,7 +161,7 @@ MODULE_PARM_DESC(overridesize,   "Specifies the NAND Flash size overriding the I
 MODULE_PARM_DESC(cache_file,     "File to use to cache nand pages instead of memory");
 
 /* The largest possible page size */
-#define NS_LARGEST_PAGE_SIZE	2048
+#define NS_LARGEST_PAGE_SIZE	4096
 
 /* The prefix for simulator output */
 #define NS_OUTPUT_PREFIX "[nandsim]"
@@ -259,7 +259,8 @@ MODULE_PARM_DESC(cache_file,     "File to use to cache nand pages instead of mem
 #define OPT_SMARTMEDIA   0x00000010 /* SmartMedia technology chips */
 #define OPT_AUTOINCR     0x00000020 /* page number auto inctimentation is possible */
 #define OPT_PAGE512_8BIT 0x00000040 /* 512-byte page chips with 8-bit bus width */
-#define OPT_LARGEPAGE    (OPT_PAGE2048) /* 2048-byte page chips */
+#define OPT_PAGE4096     0x00000080 /* 4096-byte page chips */
+#define OPT_LARGEPAGE    (OPT_PAGE2048 | OPT_PAGE4096) /* 2048 & 4096-byte page chips */
 #define OPT_SMALLPAGE    (OPT_PAGE256  | OPT_PAGE512)  /* 256 and 512-byte page chips */
 
 /* Remove action bits ftom state */
@@ -588,6 +589,8 @@ static int init_nandsim(struct mtd_info *mtd)
 			ns->options |= OPT_PAGE512_8BIT;
 	} else if (ns->geom.pgsz == 2048) {
 		ns->options |= OPT_PAGE2048;
+	} else if (ns->geom.pgsz == 4096) {
+		ns->options |= OPT_PAGE4096;
 	} else {
 		NS_ERR("init_nandsim: unknown page size %u\n", ns->geom.pgsz);
 		return -EIO;
-- 
1.6.2.5
