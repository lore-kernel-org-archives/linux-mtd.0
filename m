Received: from mail-ie0-x234.google.com ([2607:f8b0:4001:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIUES-0007Lo-PT
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2014 02:28:25 +0000
Received: by mail-ie0-f180.google.com with SMTP id ar20so173226iec.11
 for <linux-mtd@lists.infradead.org>; Tue, 25 Feb 2014 18:28:03 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] jffs2: fix unbalanced locking
Date: Tue, 25 Feb 2014 18:27:40 -0800
Message-Id: <1393381660-26150-1-git-send-email-computersforpeace@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Li Zefan <lizefan@huawei.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Li Zefan reported an unbalanced locking issue, found by his
internal debugging feature on runtime. The particular case he was
looking at doesn't lead to a deadlock, as the structure that this lock
is embedded in is freed on error. But we should straighten out the error
handling.

Because several callers of jffs2_do_read_inode_internal() /
jffs2_do_read_inode() already handle the locking/unlocking and inode
clearing at their own level, let's just push any unlocks/clearing down
to the caller. This consistency is much easier to verify.

Reported-by: Li Zefan <lizefan@huawei.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Not CC'd to -stable this time, since the bug seems non-critical, and it has
only limited testing (I did a few quick sanity tests, and Li tested an earlier
revision)

 fs/jffs2/fs.c        |  7 ++-----
 fs/jffs2/readinode.c | 27 ++++-----------------------
 2 files changed, 6 insertions(+), 28 deletions(-)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 560821bff038..ea753a2a893e 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -272,12 +272,9 @@ struct inode *jffs2_iget(struct super_block *sb, unsigned long ino)
 	mutex_lock(&f->sem);
 
 	ret = jffs2_do_read_inode(c, f, inode->i_ino, &latest_node);
+	if (ret)
+		goto error;
 
-	if (ret) {
-		mutex_unlock(&f->sem);
-		iget_failed(inode);
-		return ERR_PTR(ret);
-	}
 	inode->i_mode = jemode_to_cpu(latest_node.mode);
 	i_uid_write(inode, je16_to_cpu(latest_node.uid));
 	i_gid_write(inode, je16_to_cpu(latest_node.gid));
diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 386303dca382..5539ed46e89b 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -1203,17 +1203,13 @@ static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c,
 		JFFS2_ERROR("failed to read from flash: error %d, %zd of %zd bytes read\n",
 			ret, retlen, sizeof(*latest_node));
 		/* FIXME: If this fails, there seems to be a memory leak. Find it. */
-		mutex_unlock(&f->sem);
-		jffs2_do_clear_inode(c, f);
-		return ret?ret:-EIO;
+		return ret ? ret : -EIO;
 	}
 
 	crc = crc32(0, latest_node, sizeof(*latest_node)-8);
 	if (crc != je32_to_cpu(latest_node->node_crc)) {
 		JFFS2_ERROR("CRC failed for read_inode of inode %u at physical location 0x%x\n",
 			f->inocache->ino, ref_offset(rii.latest_ref));
-		mutex_unlock(&f->sem);
-		jffs2_do_clear_inode(c, f);
 		return -EIO;
 	}
 
@@ -1250,16 +1246,11 @@ static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c,
 			 * keep in RAM to facilitate quick follow symlink
 			 * operation. */
 			uint32_t csize = je32_to_cpu(latest_node->csize);
-			if (csize > JFFS2_MAX_NAME_LEN) {
-				mutex_unlock(&f->sem);
-				jffs2_do_clear_inode(c, f);
+			if (csize > JFFS2_MAX_NAME_LEN)
 				return -ENAMETOOLONG;
-			}
 			f->target = kmalloc(csize + 1, GFP_KERNEL);
 			if (!f->target) {
 				JFFS2_ERROR("can't allocate %u bytes of memory for the symlink target path cache\n", csize);
-				mutex_unlock(&f->sem);
-				jffs2_do_clear_inode(c, f);
 				return -ENOMEM;
 			}
 
@@ -1271,8 +1262,6 @@ static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c,
 					ret = -EIO;
 				kfree(f->target);
 				f->target = NULL;
-				mutex_unlock(&f->sem);
-				jffs2_do_clear_inode(c, f);
 				return ret;
 			}
 
@@ -1289,15 +1278,11 @@ static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c,
 		if (f->metadata) {
 			JFFS2_ERROR("Argh. Special inode #%u with mode 0%o had metadata node\n",
 			       f->inocache->ino, jemode_to_cpu(latest_node->mode));
-			mutex_unlock(&f->sem);
-			jffs2_do_clear_inode(c, f);
 			return -EIO;
 		}
 		if (!frag_first(&f->fragtree)) {
 			JFFS2_ERROR("Argh. Special inode #%u with mode 0%o has no fragments\n",
 			       f->inocache->ino, jemode_to_cpu(latest_node->mode));
-			mutex_unlock(&f->sem);
-			jffs2_do_clear_inode(c, f);
 			return -EIO;
 		}
 		/* ASSERT: f->fraglist != NULL */
@@ -1305,8 +1290,6 @@ static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c,
 			JFFS2_ERROR("Argh. Special inode #%u with mode 0x%x had more than one node\n",
 			       f->inocache->ino, jemode_to_cpu(latest_node->mode));
 			/* FIXME: Deal with it - check crc32, check for duplicate node, check times and discard the older one */
-			mutex_unlock(&f->sem);
-			jffs2_do_clear_inode(c, f);
 			return -EIO;
 		}
 		/* OK. We're happy */
@@ -1400,10 +1383,8 @@ int jffs2_do_crccheck_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *i
 	f->inocache = ic;
 
 	ret = jffs2_do_read_inode_internal(c, f, &n);
-	if (!ret) {
-		mutex_unlock(&f->sem);
-		jffs2_do_clear_inode(c, f);
-	}
+	mutex_unlock(&f->sem);
+	jffs2_do_clear_inode(c, f);
 	jffs2_xattr_do_crccheck_inode(c, ic);
 	kfree (f);
 	return ret;
-- 
1.8.3.2
