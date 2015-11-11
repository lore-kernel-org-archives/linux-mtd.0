Received: from mout3.freenet.de ([2001:748:100:40::2:5])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zwc38-0000Ev-5E
 for linux-mtd@lists.infradead.org; Wed, 11 Nov 2015 20:31:24 +0000
From: Thomas Betker <thomas.betker@freenet.de>
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Thomas Betker <thomas.betker@rohde-schwarz.com>
Subject: [PATCH] jffs2: Don't add summary entry when MTD write fails
Date: Wed, 11 Nov 2015 21:27:46 +0100
Message-Id: <1447273666-2679-1-git-send-email-thomas.betker@freenet.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Thomas Betker <thomas.betker@rohde-schwarz.com>

jffs2_flash_direct_writev() always invokes jffs2_sum_add_kvec(), even
if mtd_writev() fails. Usually, this results in an extra summary entry
pointing to dirty node space, which should be ignored -- it is a bit of
a waste, but harmless.

When mtd_writev() returns *retlen == 0, though, the node space is not
reserved as dirty, but re-used; the extra summary entry then points
into the space of the next node. After the erase block has been closed,
we get the following messages on remount:

    jffs2: error: (79) jffs2_link_node_ref:
        Adding new ref c3048d18 at (0x00ec5b88-0x00ec6bcc)
        not immediately after previous (0x00ec5b88-0x00ec5b88)
    ...
    jffs2: Checked all inodes but still 0x2088 bytes of unchecked space?
    jffs2: No space for garbage collection. Aborting GC thread

The extra summary entries amount to "unchecked space", so that
jffs2_garbage_collect_pass() returns -ENOSPC. And without garbage
collection, the filesystem becomes unuseable over time as the erase
blocks fill up.

Fix this by skipping jffs2_sum_add_kvec() when the MTD write fails. We
don't need the summary entry anyway, and the behaviour matches that of
jffs2_flash_writev() in wbuf.c (with write buffering enabled).

Signed-off-by: Thomas Betker <thomas.betker@rohde-schwarz.com>
---
 fs/jffs2/writev.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/fs/jffs2/writev.c b/fs/jffs2/writev.c
index a1bda9d..eec4197 100644
--- a/fs/jffs2/writev.c
+++ b/fs/jffs2/writev.c
@@ -16,9 +16,18 @@
 int jffs2_flash_direct_writev(struct jffs2_sb_info *c, const struct kvec *vecs,
 			      unsigned long count, loff_t to, size_t *retlen)
 {
+	int ret;
+
+	ret = mtd_writev(c->mtd, vecs, count, to, retlen);
+
 	if (!jffs2_is_writebuffered(c)) {
 		if (jffs2_sum_active()) {
 			int res;
+
+			if (ret ||
+			    *retlen != iov_length((struct iovec *) vecs, count))
+				return ret;
+
 			res = jffs2_sum_add_kvec(c, vecs, count, (uint32_t) to);
 			if (res) {
 				return res;
@@ -26,19 +35,23 @@ int jffs2_flash_direct_writev(struct jffs2_sb_info *c, const struct kvec *vecs,
 		}
 	}
 
-	return mtd_writev(c->mtd, vecs, count, to, retlen);
+	return ret;
 }
 
 int jffs2_flash_direct_write(struct jffs2_sb_info *c, loff_t ofs, size_t len,
 			size_t *retlen, const u_char *buf)
 {
 	int ret;
+
 	ret = mtd_write(c->mtd, ofs, len, retlen, buf);
 
 	if (jffs2_sum_active()) {
 		struct kvec vecs[1];
 		int res;
 
+		if (ret || *retlen != len)
+			return ret;
+
 		vecs[0].iov_base = (unsigned char *) buf;
 		vecs[0].iov_len = len;
 
@@ -47,5 +60,6 @@ int jffs2_flash_direct_write(struct jffs2_sb_info *c, loff_t ofs, size_t len,
 			return res;
 		}
 	}
+
 	return ret;
 }
-- 
2.6.3
