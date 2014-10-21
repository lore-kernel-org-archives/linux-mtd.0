Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgUSA-0000DM-IF
 for linux-mtd@lists.infradead.org; Tue, 21 Oct 2014 08:06:03 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <nicolas.ferre@atmel.com>
Subject: [PATCH 2/2] jffs2: fix buffer dump debug output
Date: Tue, 21 Oct 2014 10:05:00 +0200
Message-ID: <21ad981db8c65d3f00be3d9a254cae78cf40b96d.1413878259.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1413878259.git.cyrille.pitchen@atmel.com>
References: <cover.1413878259.git.cyrille.pitchen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes __jffs2_dbg_dump_buffer(): this function prints a message
claiming to dump len bytes. However, depending on the start offset, the former
code drops up to 31 (JFFS2_BUFDUMP_BYTES_PER_LINE - 1) bytes.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 fs/jffs2/debug.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/fs/jffs2/debug.c b/fs/jffs2/debug.c
index 07bd5bc..1b515b2 100644
--- a/fs/jffs2/debug.c
+++ b/fs/jffs2/debug.c
@@ -736,30 +736,25 @@ void
 __jffs2_dbg_dump_buffer(unsigned char *buf, int len, uint32_t offs)
 {
 	int skip;
-	int i;
+	int i, pos;
 
 	printk(JFFS2_DBG_MSG_PREFIX " dump from offset %#08x to offset %#08x (%x bytes).\n",
 		offs, offs + len, len);
-	i = skip = offs % JFFS2_BUFDUMP_BYTES_PER_LINE;
+	i = skip = offs & (JFFS2_BUFDUMP_BYTES_PER_LINE - 1);
 	offs = offs & ~(JFFS2_BUFDUMP_BYTES_PER_LINE - 1);
 
-	if (skip != 0)
-		printk(JFFS2_DBG "%#08x: ", offs);
-
+	printk(JFFS2_DBG "%#08x: ", offs);
 	while (skip--)
 		printk("   ");
 
-	while (i < len) {
-		if ((i % JFFS2_BUFDUMP_BYTES_PER_LINE) == 0 && i != len -1) {
-			if (i != 0)
-				printk("\n");
+	for (pos = 0; pos < len; ++pos, ++i) {
+		if (i == JFFS2_BUFDUMP_BYTES_PER_LINE) {
 			offs += JFFS2_BUFDUMP_BYTES_PER_LINE;
-			printk(JFFS2_DBG "%0#8x: ", offs);
+			printk(JFFS2_DBG "\n%0#8x: ", offs);
+			i = 0;
 		}
 
-		printk("%02x ", buf[i]);
-
-		i += 1;
+		printk("%02x ", buf[pos]);
 	}
 
 	printk("\n");
-- 
1.8.2.2
