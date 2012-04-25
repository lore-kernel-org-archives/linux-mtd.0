Received: from mail-qc0-f177.google.com ([209.85.216.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN7Dh-00038j-Ob
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 18:45:42 +0000
Received: by qcsu28 with SMTP id u28so314167qcs.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 11:45:40 -0700 (PDT)
From: Xi Wang <xi.wang@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 2/2] jffs2: refactor csize usage in
 jffs2_do_read_inode_internal()
Date: Wed, 25 Apr 2012 14:45:23 -0400
Message-Id: <1335379523-31415-2-git-send-email-xi.wang@gmail.com>
In-Reply-To: <1335379523-31415-1-git-send-email-xi.wang@gmail.com>
References: <1335379523-31415-1-git-send-email-xi.wang@gmail.com>
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

Replace the verbose `je32_to_cpu(latest_node->csize)' with a shorter
`csize'.

Signed-off-by: Xi Wang <xi.wang@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
---
 fs/jffs2/readinode.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 9897f38..3833d74 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -1272,19 +1272,19 @@ static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c,
 				jffs2_do_clear_inode(c, f);
 				return -ENAMETOOLONG;
 			}
-			f->target = kmalloc(je32_to_cpu(latest_node->csize) + 1, GFP_KERNEL);
+			f->target = kmalloc(csize + 1, GFP_KERNEL);
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
@@ -1293,7 +1293,7 @@ static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c,
 				return ret;
 			}
 
-			f->target[je32_to_cpu(latest_node->csize)] = '\0';
+			f->target[csize] = '\0';
 			dbg_readinode("symlink's target '%s' cached\n", f->target);
 		}
 
-- 
1.7.5.4
