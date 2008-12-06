Received: from smtp.zeuux.org ([210.51.160.52] helo=z.billxu.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L8x3J-0006As-MT
	for linux-mtd@lists.infradead.org; Sat, 06 Dec 2008 13:18:34 +0000
Date: Sat, 6 Dec 2008 21:18:19 +0800
From: Jianjun Kong <jianjun@zeuux.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] fs: cleanup for fs/jffs2/compr_rubin.c
Message-ID: <20081206131819.GA23873@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: David Howells <dhowells@redhat.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


fs/jffs2/compr_rubin.c:
remove duplicated #include and other cleanup

Signed-off-by: Jianjun Kong <jianjun@zeuux.org>
---
 fs/jffs2/compr_rubin.c |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/jffs2/compr_rubin.c b/fs/jffs2/compr_rubin.c
index c73fa89..cb02050 100644
--- a/fs/jffs2/compr_rubin.c
+++ b/fs/jffs2/compr_rubin.c
@@ -24,8 +24,6 @@
 #define BIT_DIVIDER_MIPS 1043
 static int bits_mips[8] = { 277,249,290,267,229,341,212,241}; /* mips32 */
 
-#include <linux/errno.h>
-
 struct pushpull {
 	unsigned char *buf;
 	unsigned int buflen;
@@ -157,7 +155,8 @@ static void init_decode(struct rubin_state *rs, int div, int *bits)
 	/* behalve lower */
 	rs->rec_q = 0;
 
-	for (rs->bit_number = 0; rs->bit_number++ < RUBIN_REG_SIZE; rs->rec_q = rs->rec_q * 2 + (long) (pullbit(&rs->pp)))
+	for (rs->bit_number = 0; rs->bit_number++ < RUBIN_REG_SIZE;
+		rs->rec_q = rs->rec_q * 2 + (long) (pullbit(&rs->pp)))
 		;
 }
 
@@ -234,14 +233,14 @@ static int out_byte(struct rubin_state *rs, unsigned char byte)
 	struct rubin_state rs_copy;
 	rs_copy = *rs;
 
-	for (i=0;i<8;i++) {
-		ret = encode(rs, rs->bit_divider-rs->bits[i],rs->bits[i],byte&1);
+	for (i=0; i<8; i++) {
+		ret = encode(rs, rs->bit_divider-rs->bits[i], rs->bits[i], byte&1);
 		if (ret) {
 			/* Failed. Restore old state */
 			*rs = rs_copy;
 			return ret;
 		}
-		byte=byte>>1;
+		byte >>= 1;
 	}
 	return 0;
 }
-- 
1.5.6.3

-- 
Jianjun Kong | Happy Hacking
HOMEPAGE: http://kongove.cn/
GTALK: kongjianjun@gmail.com
