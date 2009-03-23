Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Llsqb-0001p5-VK
	for linux-mtd@lists.infradead.org; Mon, 23 Mar 2009 22:42:28 +0000
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: linux-mtd@lists.infradead.org
Subject: [RFC/PATCH] flash_eraseall: extra care if NOR flash is not
	BIT_WRITEABLE
Date: Mon, 23 Mar 2009 23:42:18 +0100
Message-Id: <1237848138-18157-4-git-send-email-sebastian@breakpoint.cc>
In-Reply-To: <1237848138-18157-1-git-send-email-sebastian@breakpoint.cc>
References: <1237848138-18157-1-git-send-email-sebastian@breakpoint.cc>
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

this is difficult because it depends on CONFIG_JFFS2_FS_WRITEBUFFER

Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
---
 flash_eraseall.c |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/flash_eraseall.c b/flash_eraseall.c
index 0a4010e..3591db5 100644
--- a/flash_eraseall.c
+++ b/flash_eraseall.c
@@ -64,12 +64,24 @@ static int prepare_clean_marker(mtd_info_t *meminfo)
 
 	cleanmarker.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
 	cleanmarker.nodetype = cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER);
+	cleanmarker.totlen = cpu_to_je32(sizeof(struct jffs2_unknown_node));
 
 	switch (meminfo->type) {
 	case MTD_ROM:
 	case MTD_RAM:
+		break;
+
 	case MTD_NORFLASH:
-		cleanmarker.totlen = cpu_to_je32(sizeof(struct jffs2_unknown_node));
+		/* only if the kernel is compiled with
+		 * CONFIG_JFFS2_FS_WRITEBUFFER
+		 * Now, how to check that?
+		 */
+		if (!(meminfo->flags & MTD_BIT_WRITEABLE)) {
+			int l;
+
+			l = meminfo->writesize > 16 ? meminfo->writesize : 16;
+			cleanmarker.totlen = cpu_to_je32(l);
+		}
 		break;
 
 	case MTD_DATAFLASH:
-- 
1.6.0.6
