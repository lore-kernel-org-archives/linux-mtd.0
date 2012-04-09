Received: from mail-qa0-f49.google.com ([209.85.216.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SHNIk-000662-Ou
 for linux-mtd@lists.infradead.org; Mon, 09 Apr 2012 22:43:11 +0000
Received: by qafi29 with SMTP id i29so1764972qaf.15
 for <linux-mtd@lists.infradead.org>; Mon, 09 Apr 2012 15:43:08 -0700 (PDT)
From: Xi Wang <xi.wang@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] jffs2: refactor csize in jffs2_do_read_inode_internal()
Date: Mon,  9 Apr 2012 18:42:59 -0400
Message-Id: <1334011379-24445-1-git-send-email-xi.wang@gmail.com>
Cc: linux-mtd@lists.infradead.org, Xi Wang <xi.wang@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace the verbose `je32_to_cpu(latest_node->csize)' with a shorter
variable `csize'.

Also check for a bogus `csize' value 0xffffffff, which would turn the
subsequent kmalloc(cisze + 1, ...) into kmalloc(0, ...).

Signed-off-by: Xi Wang <xi.wang@gmail.com>
---
 fs/jffs2/readinode.c |   17 +++++++++++------
 1 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index dc0437e..2be7a8e 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -1266,19 +1266,24 @@ static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c,
 			/* Symlink's inode data is the target path. Read it and
 			 * keep in RAM to facilitate quick follow symlink
 			 * operation. */
-			f->target = kmalloc(je32_to_cpu(latest_node->csize) + 1, GFP_KERNEL);
+			uint32_t csize = je32_to_cpu(latest_node->csize);
+			/* Avoid overflowing csize + 1. */
+			if (csize > INT_MAX)
+				f->target = 0;
+			else
+				f->target = kmalloc(csize + 1, GFP_KERNEL);
 			if (!f->target) {
-				JFFS2_ERROR("can't allocate %d bytes of memory for the symlink target path cache\n", je32_to_cpu(latest_node->csize));
+				JFFS2_ERROR("can't allocate %u bytes of memory for the symlink target path cache\n", csize);
 				mutex_unlock(&f->sem);
 				jffs2_do_clear_inode(c, f);
 				return -ENOMEM;
 			}
 
 			ret = jffs2_flash_read(c, ref_offset(rii.latest_ref) + sizeof(*latest_node),
-						je32_to_cpu(latest_node->csize), &retlen, (char *)f->target);
+					       csize, &retlen, (char *)f->target);
 
-			if (ret  || retlen != je32_to_cpu(latest_node->csize)) {
-				if (retlen != je32_to_cpu(latest_node->csize))
+			if (ret || retlen != csize) {
+				if (retlen != csize)
 					ret = -EIO;
 				kfree(f->target);
 				f->target = NULL;
@@ -1287,7 +1292,7 @@ static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c,
 				return ret;
 			}
 
-			f->target[je32_to_cpu(latest_node->csize)] = '\0';
+			f->target[csize] = '\0';
 			dbg_readinode("symlink's target '%s' cached\n", f->target);
 		}
 
-- 
1.7.5.4
