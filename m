Received: from mx7.zte.com.cn ([202.103.147.169] helo=zte.com.cn)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoRhU-00016N-Mk
 for linux-mtd@lists.infradead.org; Wed, 12 Nov 2014 06:46:47 +0000
In-Reply-To: <20141105114500.GM22361@norris-Latitude-E6410>
References: <OFA26F19B7.DF3A70A5-ON48257D7B.00265361-48257D7B.0033C198@zte.com.cn>
 <20141105114500.GM22361@norris-Latitude-E6410>
Subject: Re: [PATCH]jffs2:bugfix for should not appeared directory hard link
To: Brian Norris <computersforpeace@gmail.com>
Message-ID: <OFC7724A44.98471338-ON48257D8E.00241A97-48257D8E.00250734@zte.com.cn>
From: "Liu Song"<liu.song11@zte.com.cn>
Date: Wed, 12 Nov 2014 14:45:09 +0800
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: cui.yunfeng@zte.com.cn, linux-mtd@lists.infradead.org,
 jiang.xuexin@zte.com.cn, wang.bo116@zte.com.cn, dwmw2@infradead.org,
 deng.chao1@zte.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian Norris <computersforpeace@gmail.com> wrote on 2014-11-05 19:45:00:

> From: Brian Norris <computersforpeace@gmail.com>
> To: liu.song11@zte.com.cn,
> Cc: jiang.xuexin@zte.com.cn, linux-mtd@lists.infradead.org, cui.yunfeng@zte.com.cn, wang.bo116@zte.com.cn, dwmw2@infradead.org, deng.chao1@zte.com.cn
> Date: 2014-11-05 19:45
> Subject: Re: [PATCH]jffs2:bugfix for should not appeared directory hard link
>
> On Fri, Oct 24, 2014 at 05:26:05PM +0800, liu.song11@zte.com.cn wrote:
> > hi everyone
>
> Hi!
>
> > When jffs2 with summary, during the mounting period, in
> > jffs2_build_remove_unlinked_inode will
> > handle unlinke inode, but this will cause unlinked directory's deletion
> > dirent erased before
> > it's obsoleted dirent.So if the directory has renamed, then could cause a
> > hard link when we
> > remount jffs2.
> > We can stable reproduce the hard link only by following process.
> > 1. we mount jffs2 in /mnt
> > 2. create directories /mnt/SW1/, /mnt/SW2/
> > 3. create directory /mnt/old/
> > 4. rename /mnt/SW1/ to /mnt/old/SW1/, /mnt/SW2/ to /mnt/old/SW2/
> > 5. do some data write. don't touch these directories.
> > 6. rename /mnt/old/SW1/ to /mnt/SW1/, /mnt/old/SW2/ to /mnt/SW2/
> > 7. delete /mnt/old/
> >
> > do above process 3 - 7 several times, then reboot, during the mounting
> > process, we could found
> > /mnt/SW1/ and /mnt/old/SW1/ become hard link,/mnt/SW2/ and /mnt/old/SW2/
> > become hard link. So we
> > do some job to fix this bug.We have tested this patch and the hard link
> > error will never occur.
> > Thanks!
> > Best Regards
>
> This only describes the problem, but it doesn't describe the fix at all.
> Please provide a proper commit description.
>
> Also, your patch is very big and line-wrapped, so it's very hard to
> figure out what it's doing, and it won't apply to my git tree. Please
> check your mailer settings.
>
> All this is addressed in Documentation/SubmittingPatches, which I
> suggest you read.
>
> Regards,
> Brian

Hi, Brian

Thanks a lot for your attention and suggestions. Follow the guide, patch had checked by checkpatch.pl,
but there also had warnings about line over 80 characters, I had no idea to fix that except remove the
code indentations, but i'm afraid that would make codes hard to read. However, if there are any
suggestions to fix this I would try. Patch has really long print notice in summary.c, we remove them
from this patch.

The following is the description about this patch.

The patch is focus on jffs2 with summary. We check deletion dirent's crc in "jffs2_sum_process_sum_data"
so could make its ref flag REF_NORMAL. After this process, all crc correct deletion dirents' ref flag
are REF_NORMAL then could separate from other nodes(REF_UNCHECKED).We use this flag to protect unlinked
deletion dirent directly turned to obsoleted in "jffs2_build_remove_unlinked_inode", because deletion dirents
maybe still useful if it's obsoleted dirent remain in flash. These unlinked deletion dirents will be checked
whether still useful in gc time.

These unlinked deletion dirents in "jffs2_garbage_collect_pass" will skip to check, because its
"jffs2_inode_cache"'s pino_nlink is zero. Then in "jffs2_garbage_collect_pass", unlinked deletion dirents' "ic->state"
is INO_STATE_UNCHECKED, but we had checked the crc during scan. So we give its a new state which is INO_STATE_DELETION.
If gc find current node's "ic->state" is INO_STATE_DELETION will know it's an unlinked deletion dirent, then will check
whether its still useful in "jffs2_garbage_collect_unlinked_dirent" which is similar to "jffs2_garbage_collect_deletion_dirent"
but use different parameters. If the unlinked deletion dirent is still useful, we copy it, else, we could safely mark it obsoleted.

In "jffs2_do_unlink", there also has the same problem, it will obsolete the unlinked directory's child dirents
which include deletion dirent, so we should also protect the deletion dirent.

The main purpose of this patch is to prevent unlinked deletion direct directly turn to obsolete and handle it
during gc time. We had do many tests on this patch and it worked properly, the directory hard link couldn't occured.
We had also test the deletion dirents' crc in scan time whether cost a lot,the result is check 81809 deletion dirents' crc
could within one second, so it will not extend the mounting time.

Thanks
Best Regards
Liu Song
-------------------------------------------------------------------------------------------------------------------------------------------------------------

diff --git a/build.c b/build.c
index a3750f9..ad7b8a6 100644
--- a/build.c
+++ b/build.c
@@ -205,7 +205,9 @@ static void jffs2_build_remove_unlinked_inode(struct jffs2_sb_info *c,
 	while (raw != (void *)ic) {
 		struct jffs2_raw_node_ref *next = raw->next_in_ino;
 		dbg_fsbuild("obsoleting node at 0x%08x\n", ref_offset(raw));
-		jffs2_mark_node_obsolete(c, raw);
+		/* prevent make deletion dirent obsolete directly*/
+		if (ref_flags(raw) != REF_NORMAL)
+			jffs2_mark_node_obsolete(c, raw);
 		raw = next;
 	}

diff --git a/fs.c b/fs.c
index 601afd1..ac3abe0 100644
--- a/fs.c
+++ b/fs.c
@@ -657,6 +657,7 @@ struct jffs2_inode_info *jffs2_gc_fetch_inode(struct jffs2_sb_info *c,
 					  ic->ino, ic->state);
 				sleep_on_spinunlock(&c->inocache_wq, &c->inocache_lock);
 			} else {
+				ic->state = INO_STATE_DELETION;
 				spin_unlock(&c->inocache_lock);
 			}

diff --git a/gc.c b/gc.c
index 5a2dec2..2b931f7 100644
--- a/gc.c
+++ b/gc.c
@@ -39,6 +39,14 @@ static int jffs2_garbage_collect_dnode(struct jffs2_sb_info *c, struct jffs2_era
 				       uint32_t start, uint32_t end);
 static int jffs2_garbage_collect_live(struct jffs2_sb_info *c,  struct jffs2_eraseblock *jeb,
 			       struct jffs2_raw_node_ref *raw, struct jffs2_inode_info *f);
+static int jffs2_garbage_collect_unlinked_deletion(struct jffs2_sb_info *c,
+					struct jffs2_inode_cache *ic,
+					struct jffs2_raw_node_ref *raw,
+					struct jffs2_raw_dirent *rd);
+static int jffs2_garbage_collect_unlinked_dirent(struct jffs2_sb_info *c,
+					struct jffs2_eraseblock *jeb,
+					struct jffs2_raw_node_ref *raw_suspect,
+					struct jffs2_inode_cache *ic);

 /* Called with erase_completion_lock held */
 static struct jffs2_eraseblock *jffs2_find_gc_block(struct jffs2_sb_info *c)
@@ -169,6 +177,7 @@ int jffs2_garbage_collect_pass(struct jffs2_sb_info *c)
 		if (!ic->pino_nlink) {
 			jffs2_dbg(1, "Skipping check of ino #%d with nlink/pino zero\n",
 				  ic->ino);
+			ic->state = INO_STATE_DELETION;
 			spin_unlock(&c->inocache_lock);
 			jffs2_xattr_delete_inode(c, ic);
 			continue;
@@ -358,9 +367,14 @@ int jffs2_garbage_collect_pass(struct jffs2_sb_info *c)

 	case INO_STATE_PRESENT:
 		/* It's in-core. GC must iget() it. */
+	case INO_STATE_DELETION:
+		/* Unlinked node. GC must check deletion dirent. */
 		break;

 	case INO_STATE_UNCHECKED:
+		ic->state = INO_STATE_DELETION;
+		break;
+
 	case INO_STATE_CHECKING:
 	case INO_STATE_GC:
 		/* Should never happen. We should have finished checking
@@ -431,19 +445,26 @@ int jffs2_garbage_collect_pass(struct jffs2_sb_info *c)
 	nlink = ic->pino_nlink;
 	spin_unlock(&c->inocache_lock);

-	f = jffs2_gc_fetch_inode(c, inum, !nlink);
+	if (ic->state == INO_STATE_DELETION)
+		f = NULL;
+	else
+		f = jffs2_gc_fetch_inode(c, inum, !nlink);
+
 	if (IS_ERR(f)) {
 		ret = PTR_ERR(f);
 		goto release_sem;
 	}
-	if (!f) {
+	if (!f && ic->state != INO_STATE_DELETION) {
 		ret = 0;
 		goto release_sem;
 	}

-	ret = jffs2_garbage_collect_live(c, jeb, raw, f);
-
-	jffs2_gc_release_inode(c, f);
+	if (ic->state == INO_STATE_DELETION) {
+		ret = jffs2_garbage_collect_unlinked_dirent(c, jeb, raw, ic);
+	} else {
+		ret = jffs2_garbage_collect_live(c, jeb, raw, f);
+		jffs2_gc_release_inode(c, f);
+	}

  test_gcnode:
 	if (jeb->dirty_size == gcblock_dirty && !ref_obsolete(jeb->gc_node)) {
@@ -990,6 +1011,235 @@ static int jffs2_garbage_collect_deletion_dirent(struct jffs2_sb_info *c, struct
 	return 0;
 }

+static int jffs2_garbage_collect_unlinked_deletion(struct jffs2_sb_info *c,
+					  struct jffs2_inode_cache *ic,
+					  struct jffs2_raw_node_ref *raw,
+					  struct jffs2_raw_dirent *rd)
+{
+	size_t retlen;
+	int ret;
+	uint32_t phys_ofs, alloclen;
+	uint32_t rawlen;
+	int retried = 0;
+
+	jffs2_dbg(1, "Going to GC REF_DELETION node at 0x%08x\n",
+		  ref_offset(raw));
+	alloclen = rawlen = ref_totlen(c, c->gcblock, raw);
+
+	/* Ask for a small amount of space (or the totlen if smaller) because we
+	   don't want to force wastage of the end of a block if splitting would
+	   work. */
+	if (ic && alloclen > sizeof(struct jffs2_raw_inode) + JFFS2_MIN_DATA_LEN)
+		alloclen = sizeof(struct jffs2_raw_inode) + JFFS2_MIN_DATA_LEN;
+
+	ret = jffs2_reserve_space_gc(c, alloclen, &alloclen, rawlen);
+
+	if (ret)
+		goto out_node;
+
+	if (alloclen < rawlen) {
+		ret = -EBADFD;
+		goto out_node;
+	}
+
+ retry:
+	phys_ofs = write_ofs(c);
+
+	ret = jffs2_flash_write(c, phys_ofs, rawlen, &retlen, (char *)rd);
+
+	if (ret || (retlen != rawlen)) {
+		pr_notice("Write of %d bytes at 0x%08x failed. returned %d, retlen %zd\n",
+			  rawlen, phys_ofs, ret, retlen);
+		if (retlen)
+			jffs2_add_physical_node_ref(c, phys_ofs | REF_OBSOLETE, rawlen, NULL);
+		else
+			pr_notice("Not marking the space at 0x%08x as dirty because retlen zero\n",
+				  phys_ofs);
+		if (!retried) {
+			/* Try to reallocate space and retry */
+			uint32_t dummy;
+			struct jffs2_eraseblock *jeb = &c->blocks[phys_ofs / c->sector_size];
+
+			retried = 1;
+
+			jffs2_dbg(1, "Retrying failed write of REF_DELETION node.\n");
+
+			jffs2_dbg_acct_sanity_check(c, jeb);
+			jffs2_dbg_acct_paranoia_check(c, jeb);
+
+			ret = jffs2_reserve_space_gc(c, rawlen, &dummy, rawlen);
+
+			if (!ret) {
+				jffs2_dbg(1, "Allocated space at 0x%08x to retry failed write.\n",
+					  phys_ofs);
+
+				jffs2_dbg_acct_sanity_check(c, jeb);
+				jffs2_dbg_acct_paranoia_check(c, jeb);
+
+				goto retry;
+			}
+			jffs2_dbg(1, "Failed to allocate space to retry failed write: %d!\n",
+				  ret);
+		}
+
+		if (!ret)
+			ret = -EIO;
+		goto out_node;
+	}
+	jffs2_add_physical_node_ref(c, phys_ofs | REF_NORMAL, rawlen, ic);
+
+	jffs2_mark_node_obsolete(c, raw);
+	jffs2_dbg(1, "WHEEE! GC REF_DELETION node at 0x%08x succeeded\n",
+		  ref_offset(raw));
+ out_node:
+	kfree(rd);
+	return ret;
+}
+
+static int jffs2_garbage_collect_unlinked_dirent(struct jffs2_sb_info *c,
+				struct jffs2_eraseblock *jeb,
+				struct jffs2_raw_node_ref *raw_suspect,
+				struct jffs2_inode_cache *ic)
+{
+	struct jffs2_full_dirent *fd = NULL;
+	struct jffs2_raw_dirent *rd = NULL;
+	struct jffs2_raw_dirent *rd_suspect = NULL;
+
+	if (!jffs2_can_mark_obsolete(c)) {
+		int ret;
+		int name_len;
+		size_t retlen;
+		uint32_t checkedlen;
+		uint32_t name_crc;
+		uint32_t raw_len;
+		struct jffs2_raw_node_ref *raw;
+
+		raw_len = ref_totlen(c, jeb, raw_suspect);
+		rd_suspect = kmalloc(raw_len, GFP_KERNEL);
+		if (!rd_suspect)
+			return -ENOMEM;
+
+		ret = jffs2_flash_read(c, ref_offset(raw_suspect),
+			raw_len, &retlen, (char *)rd_suspect);
+
+		if (ret) {
+			pr_warn("%s(): Read error (%d) reading deletion dirent node at %08x\n",
+				__func__, ret, ref_offset(raw_suspect));
+			kfree(rd_suspect);
+			return -EIO;
+		}
+
+		if (je16_to_cpu(rd_suspect->nodetype) != JFFS2_NODETYPE_DIRENT) {
+			pr_warn("%s(): ofs(%08x) nodetype(%04x) is not expected\n",
+				__func__, ref_offset(raw_suspect),
+				je16_to_cpu(rd_suspect->nodetype));
+			kfree(rd_suspect);
+			BUG();
+		}
+
+		if (je32_to_cpu(rd_suspect->ino)) {
+			jffs2_dbg(1, "%s(): ino %d not deletion dirent\n",
+				__func__, je32_to_cpu(rd_suspect->ino));
+			goto obsolete;
+		}
+
+		checkedlen = strnlen(rd_suspect->name, rd_suspect->nsize);
+		fd = jffs2_alloc_full_dirent(checkedlen+1);
+		if (!fd) {
+			kfree(rd_suspect);
+			return -ENOMEM;
+		}
+
+		memcpy(&fd->name, rd_suspect->name, checkedlen);
+		fd->name[checkedlen] = 0;
+		fd->raw = raw_suspect;
+		name_len = strlen(fd->name);
+		name_crc = crc32(0, fd->name, name_len);
+		rd = kmalloc(raw_len, GFP_KERNEL);
+		if (!rd) {
+			kfree(rd_suspect);
+			jffs2_free_full_dirent(fd);
+			return -ENOMEM;
+		}
+
+		/* Prevent the erase code from nicking the obsolete node refs
+		while we're looking at them. I really don't like this extra lock but
+		can't see any alternative. Suggestions on a postcard to... */
+		mutex_lock(&c->erase_free_sem);
+		for (raw = ic->nodes; raw != (void *)ic; raw = raw->next_in_ino) {
+
+			cond_resched();
+
+			/* We only care about obsolete ones */
+			if (!(ref_obsolete(raw)))
+				continue;
+
+			/* Any dirent with the same name is going to have the same length... */
+			if (ref_totlen(c, NULL, raw) != raw_len)
+				continue;
+
+			/* Doesn't matter if there's one in the same erase block. We're going to
+			 delete it too at the same time. */
+			if (SECTOR_ADDR(raw->flash_offset) == SECTOR_ADDR(fd->raw->flash_offset))
+				continue;
+
+			jffs2_dbg(1, "Check potential deletion dirent at %08x\n",
+				  ref_offset(raw));
+
+			/* This is an obsolete node belonging to the same directory, and it's of the right
+			   length. We need to take a closer look...*/
+			ret = jffs2_flash_read(c, ref_offset(raw), raw_len, &retlen, (char *)rd);
+			if (ret) {
+				pr_warn("%s(): Read error (%d) reading obsolete node at %08x\n",
+					__func__, ret, ref_offset(raw));
+				/* If we can't read it, we don't need to continue to obsolete it. Continue */
+				continue;
+			}
+			if (retlen != raw_len) {
+				pr_warn("%s(): Short read (%zd not %u) reading header from obsolete node at %08x\n",
+					__func__, retlen, raw_len,
+					ref_offset(raw));
+				continue;
+			}
+
+			if (je16_to_cpu(rd->nodetype) != JFFS2_NODETYPE_DIRENT)
+				continue;
+
+			/* If the name CRC doesn't match, skip */
+			if (je32_to_cpu(rd->name_crc) != name_crc)
+				continue;
+
+			/* If the name length doesn't match, or it's another deletion dirent, skip */
+			if (rd->nsize != name_len || !je32_to_cpu(rd->ino))
+				continue;
+
+			/* OK, check the actual name now */
+			if (memcmp(rd->name, fd->name, name_len))
+				continue;
+
+			/* OK. The name really does match. There really is still an older node on
+			   the flash which our deletion dirent obsoletes. So we have to write out
+			   a new deletion dirent to replace it */
+			mutex_unlock(&c->erase_free_sem);
+
+			jffs2_dbg(1, "Deletion dirent at %08x still obsoletes real dirent \"%s\" at %08x for ino #%u\n",
+				  ref_offset(fd->raw), fd->name,
+				  ref_offset(raw), je32_to_cpu(rd->ino));
+			kfree(rd);
+			jffs2_free_full_dirent(fd);
+			return jffs2_garbage_collect_unlinked_deletion(c, ic, raw_suspect, rd_suspect);
+		}
+		mutex_unlock(&c->erase_free_sem);
+	}
+obsolete:
+	jffs2_mark_node_obsolete(c, raw_suspect);
+	if (fd)
+		jffs2_free_full_dirent(fd);
+	kfree(rd);
+	kfree(rd_suspect);
+	return 0;
+}
+
 static int jffs2_garbage_collect_hole(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
 				      struct jffs2_inode_info *f, struct jffs2_full_dnode *fn,
 				      uint32_t start, uint32_t end)
diff --git a/nodelist.h b/nodelist.h
index fa35ff7..e8e282a 100644
--- a/nodelist.h
+++ b/nodelist.h
@@ -192,6 +192,7 @@ struct jffs2_inode_cache {
 #define INO_STATE_GC		4	/* GCing a 'pristine' node */
 #define INO_STATE_READING	5	/* In read_inode() */
 #define INO_STATE_CLEARING	6	/* In clear_inode() */
+#define INO_STATE_DELETION	7	/* Unlinked inode */

 #define INO_FLAGS_XATTR_CHECKED	0x01	/* has no duplicate xattr_ref */

diff --git a/summary.c b/summary.c
index c522d09..fd58537 100644
--- a/summary.c
+++ b/summary.c
@@ -470,17 +470,73 @@ static int jffs2_sum_process_sum_data(struct jffs2_sb_info *c, struct jffs2_eras
 					return -ENOMEM;
 				}

-				fd->raw = sum_link_node_ref(c, jeb,  je32_to_cpu(spd->offset) | REF_UNCHECKED,
-							    PAD(je32_to_cpu(spd->totlen)), ic);
-
+				fd->ino = je32_to_cpu(spd->ino);
+				if (fd->ino != 0) {
+					fd->raw = sum_link_node_ref(c, jeb,
+						je32_to_cpu(spd->offset) | REF_UNCHECKED,
+						PAD(je32_to_cpu(spd->totlen)), ic);
+				} else {
+					int ret;
+					size_t retlen;
+					uint32_t hdr_crc, crc;
+					struct jffs2_raw_dirent *rd;
+					uint32_t rd_totlen = je32_to_cpu(spd->totlen);
+
+					rd = kmalloc(rd_totlen, GFP_KERNEL);
+					if (!rd) {
+						jffs2_free_full_dirent(fd);
+						return -ENOMEM;
+					}
+					ret = jffs2_flash_read(c, jeb->offset + je32_to_cpu(spd->offset),
+						rd_totlen, &retlen, (char *)rd);
+					if (!ret && retlen != rd_totlen) {
+						pr_err("Dirent at %08x has read problem. Aborting mount.\n",
+							jeb->offset + je32_to_cpu(spd->offset));
+						jffs2_free_full_dirent(fd);
+						kfree(rd);
+						return -EIO;
+					}
+					hdr_crc = crc32(0, rd, sizeof(struct jffs2_unknown_node)-4);
+					if (hdr_crc != je32_to_cpu(rd->hdr_crc)) {
+						jffs2_free_full_dirent(fd);
+						kfree(rd);
+						err = jffs2_scan_dirty_space(c, jeb, PAD(rd_totlen));
+						if (err)
+							return err;
+						goto out;
+					}
+					crc = crc32(0, rd, sizeof(*rd)-8);
+					if (crc != je32_to_cpu(rd->node_crc)) {
+						jffs2_free_full_dirent(fd);
+						kfree(rd);
+						err = jffs2_scan_dirty_space(c, jeb, PAD(rd_totlen));
+						if (err)
+							return err;
+						goto out;
+					}
+					crc = crc32(0, fd->name, rd->nsize);
+					if (crc != je32_to_cpu(rd->name_crc)) {
+						jffs2_dbg(1, "Name for which CRC failed is (now) '%s', ino #%d\n",
+							  fd->name, je32_to_cpu(rd->ino));
+						jffs2_free_full_dirent(fd);
+						kfree(rd);
+						err = jffs2_scan_dirty_space(c, jeb, PAD(rd_totlen));
+						if (err)
+							return err;
+						goto out;
+					}
+					kfree(rd);
+					fd->raw = sum_link_node_ref(c, jeb,
+						je32_to_cpu(spd->offset) | REF_NORMAL,
+						PAD(je32_to_cpu(spd->totlen)), ic);
+				}
 				fd->next = NULL;
 				fd->version = je32_to_cpu(spd->version);
-				fd->ino = je32_to_cpu(spd->ino);
 				fd->nhash = full_name_hash(fd->name, checkedlen);
 				fd->type = spd->type;

 				jffs2_add_fd_to_list(c, fd, &ic->scan_dents);
-
+out:
 				*pseudo_random += je32_to_cpu(spd->version);

 				sp += JFFS2_SUMMARY_DIRENT_SIZE(spd->nsize);
diff --git a/write.c b/write.c
index b634de4..750257a 100644
--- a/write.c
+++ b/write.c
@@ -648,7 +648,7 @@ int jffs2_do_unlink(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f,
 						  fd->name,
 						  dead_f->inocache->ino);
 				}
-				if (fd->raw)
+				if (fd->raw && fd->ino)
 					jffs2_mark_node_obsolete(c, fd->raw);
 				jffs2_free_full_dirent(fd);
 			}
Signed-off-by: Liu Song <liu.song11@zte.com.cn>

--------------------------------------------------------
ZTE Information Security Notice: The information contained in this mail (and any attachment transmitted herewith) is privileged and confidential and is intended for the exclusive use of the addressee(s).  If you are not an intended recipient, any disclosure, reproduction, distribution or other dissemination or use of the information contained is strictly prohibited.  If you have received this mail in error, please delete it and notify us immediately.
