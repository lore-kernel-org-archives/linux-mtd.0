Received: from mail-qc0-f177.google.com ([209.85.216.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN7Dh-00038i-Dr
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 18:45:41 +0000
Received: by qcsu28 with SMTP id u28so314153qcs.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 11:45:39 -0700 (PDT)
From: Xi Wang <xi.wang@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 1/2] jffs2: validate symlink size in
 jffs2_do_read_inode_internal()
Date: Wed, 25 Apr 2012 14:45:22 -0400
Message-Id: <1335379523-31415-1-git-send-email-xi.wang@gmail.com>
Cc: linux-mtd@lists.infradead.org, Xi Wang <xi.wang@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

`csize' is read from disk and thus needs validation.  Otherwise a bogus
value 0xffffffff would turn the subsequent kmalloc(csize + 1, ...) into
kmalloc(0, ...), leading to out-of-bounds write.

This patch limits `csize' to JFFS2_MAX_NAME_LEN, which is also used
in jffs2_symlink().

Signed-off-by: Xi Wang <xi.wang@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
---
 fs/jffs2/readinode.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index dc0437e..9897f38 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -1266,6 +1266,12 @@ static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c,
 			/* Symlink's inode data is the target path. Read it and
 			 * keep in RAM to facilitate quick follow symlink
 			 * operation. */
+			uint32_t csize = je32_to_cpu(latest_node->csize);
+			if (csize > JFFS2_MAX_NAME_LEN) {
+				mutex_unlock(&f->sem);
+				jffs2_do_clear_inode(c, f);
+				return -ENAMETOOLONG;
+			}
 			f->target = kmalloc(je32_to_cpu(latest_node->csize) + 1, GFP_KERNEL);
 			if (!f->target) {
 				JFFS2_ERROR("can't allocate %d bytes of memory for the symlink target path cache\n", je32_to_cpu(latest_node->csize));
-- 
1.7.5.4
