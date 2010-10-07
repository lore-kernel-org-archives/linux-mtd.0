Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P3tyQ-0003mq-4i
	for linux-mtd@lists.infradead.org; Thu, 07 Oct 2010 17:09:42 +0000
Received: from sesr04.transmode.se (sesr04.transmode.se [192.168.201.15])
	by gw1.transmode.se (Postfix) with ESMTP id AB5842597D6
	for <linux-mtd@lists.infradead.org>;
	Thu,  7 Oct 2010 19:09:39 +0200 (CEST)
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] jffs2: Reduce excessive scan of empty blocks
Date: Thu, 7 Oct 2010 19:09:34 +0200
Message-Id: <1286471374-25840-1-git-send-email-Joakim.Tjernlund@transmode.se>
Cc: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Scanning 1024 bytes to see if an EB is empty is a bit much.
Lower it to 256 bytes and make sure the while loop is
optimized.

Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
---
 fs/jffs2/scan.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 3131860..4657918 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -20,7 +20,7 @@
 #include "summary.h"
 #include "debug.h"
 
-#define DEFAULT_EMPTY_SCAN_SIZE 1024
+#define DEFAULT_EMPTY_SCAN_SIZE 256
 
 #define noisy_printk(noise, args...) do { \
 	if (*(noise)) { \
@@ -435,7 +435,7 @@ static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct jffs2_eraseblo
 				  unsigned char *buf, uint32_t buf_size, struct jffs2_summary *s) {
 	struct jffs2_unknown_node *node;
 	struct jffs2_unknown_node crcnode;
-	uint32_t ofs, prevofs;
+	uint32_t ofs, prevofs, max_ofs;
 	uint32_t hdr_crc, buf_ofs, buf_len;
 	int err;
 	int noise = 0;
@@ -550,12 +550,12 @@ static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct jffs2_eraseblo
 
 	/* We temporarily use 'ofs' as a pointer into the buffer/jeb */
 	ofs = 0;
-
-	/* Scan only 4KiB of 0xFF before declaring it's empty */
-	while(ofs < EMPTY_SCAN_SIZE(c->sector_size) && *(uint32_t *)(&buf[ofs]) == 0xFFFFFFFF)
+	max_ofs = EMPTY_SCAN_SIZE(c->sector_size);
+	/* Scan only EMPTY_SCAN_SIZE of 0xFF before declaring it's empty */
+	while(ofs < max_ofs && *(uint32_t *)(&buf[ofs]) == 0xFFFFFFFF)
 		ofs += 4;
 
-	if (ofs == EMPTY_SCAN_SIZE(c->sector_size)) {
+	if (ofs == max_ofs) {
 #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 		if (jffs2_cleanmarker_oob(c)) {
 			/* scan oob, take care of cleanmarker */
-- 
1.7.2.2
