Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RnWsA-0003U3-O7
 for linux-mtd@lists.infradead.org; Wed, 18 Jan 2012 14:52:26 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] UBIFS: increase dumps loglevel
Date: Wed, 18 Jan 2012 16:54:13 +0200
Message-Id: <1326898454-1957-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1326898454-1957-1-git-send-email-dedekind1@gmail.com>
References: <1326898454-1957-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Most of the time we use the dumping function to dump something in case
of error. We use 'KERN_DEBUG' printk level, and the drawback is that users
do not see them in the console, while they see the other error messages
in the console. The result is that they send bug reports which does not
contain a lot of useful information. This patch changes the printk level
of the dump functions to 'KERN_ERR' to correct the situation.

I documented it in the MTD web site that people have to send the 'dmesg' output
when submitting bug reposts - it did not help.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/debug.c |  408 +++++++++++++++++++++++++++---------------------------
 1 files changed, 204 insertions(+), 204 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index f922cba..3050628 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -221,15 +221,15 @@ const char *dbg_jhead(int jhead)
 
 static void dump_ch(const struct ubifs_ch *ch)
 {
-	printk(KERN_DEBUG "\tmagic          %#x\n", le32_to_cpu(ch->magic));
-	printk(KERN_DEBUG "\tcrc            %#x\n", le32_to_cpu(ch->crc));
-	printk(KERN_DEBUG "\tnode_type      %d (%s)\n", ch->node_type,
+	printk(KERN_ERR "\tmagic          %#x\n", le32_to_cpu(ch->magic));
+	printk(KERN_ERR "\tcrc            %#x\n", le32_to_cpu(ch->crc));
+	printk(KERN_ERR "\tnode_type      %d (%s)\n", ch->node_type,
 	       dbg_ntype(ch->node_type));
-	printk(KERN_DEBUG "\tgroup_type     %d (%s)\n", ch->group_type,
+	printk(KERN_ERR "\tgroup_type     %d (%s)\n", ch->group_type,
 	       dbg_gtype(ch->group_type));
-	printk(KERN_DEBUG "\tsqnum          %llu\n",
+	printk(KERN_ERR "\tsqnum          %llu\n",
 	       (unsigned long long)le64_to_cpu(ch->sqnum));
-	printk(KERN_DEBUG "\tlen            %u\n", le32_to_cpu(ch->len));
+	printk(KERN_ERR "\tlen            %u\n", le32_to_cpu(ch->len));
 }
 
 void dbg_dump_inode(struct ubifs_info *c, const struct inode *inode)
@@ -240,43 +240,43 @@ void dbg_dump_inode(struct ubifs_info *c, const struct inode *inode)
 	struct ubifs_dent_node *dent, *pdent = NULL;
 	int count = 2;
 
-	printk(KERN_DEBUG "Dump in-memory inode:");
-	printk(KERN_DEBUG "\tinode          %lu\n", inode->i_ino);
-	printk(KERN_DEBUG "\tsize           %llu\n",
+	printk(KERN_ERR "Dump in-memory inode:");
+	printk(KERN_ERR "\tinode          %lu\n", inode->i_ino);
+	printk(KERN_ERR "\tsize           %llu\n",
 	       (unsigned long long)i_size_read(inode));
-	printk(KERN_DEBUG "\tnlink          %u\n", inode->i_nlink);
-	printk(KERN_DEBUG "\tuid            %u\n", (unsigned int)inode->i_uid);
-	printk(KERN_DEBUG "\tgid            %u\n", (unsigned int)inode->i_gid);
-	printk(KERN_DEBUG "\tatime          %u.%u\n",
+	printk(KERN_ERR "\tnlink          %u\n", inode->i_nlink);
+	printk(KERN_ERR "\tuid            %u\n", (unsigned int)inode->i_uid);
+	printk(KERN_ERR "\tgid            %u\n", (unsigned int)inode->i_gid);
+	printk(KERN_ERR "\tatime          %u.%u\n",
 	       (unsigned int)inode->i_atime.tv_sec,
 	       (unsigned int)inode->i_atime.tv_nsec);
-	printk(KERN_DEBUG "\tmtime          %u.%u\n",
+	printk(KERN_ERR "\tmtime          %u.%u\n",
 	       (unsigned int)inode->i_mtime.tv_sec,
 	       (unsigned int)inode->i_mtime.tv_nsec);
-	printk(KERN_DEBUG "\tctime          %u.%u\n",
+	printk(KERN_ERR "\tctime          %u.%u\n",
 	       (unsigned int)inode->i_ctime.tv_sec,
 	       (unsigned int)inode->i_ctime.tv_nsec);
-	printk(KERN_DEBUG "\tcreat_sqnum    %llu\n", ui->creat_sqnum);
-	printk(KERN_DEBUG "\txattr_size     %u\n", ui->xattr_size);
-	printk(KERN_DEBUG "\txattr_cnt      %u\n", ui->xattr_cnt);
-	printk(KERN_DEBUG "\txattr_names    %u\n", ui->xattr_names);
-	printk(KERN_DEBUG "\tdirty          %u\n", ui->dirty);
-	printk(KERN_DEBUG "\txattr          %u\n", ui->xattr);
-	printk(KERN_DEBUG "\tbulk_read      %u\n", ui->xattr);
-	printk(KERN_DEBUG "\tsynced_i_size  %llu\n",
+	printk(KERN_ERR "\tcreat_sqnum    %llu\n", ui->creat_sqnum);
+	printk(KERN_ERR "\txattr_size     %u\n", ui->xattr_size);
+	printk(KERN_ERR "\txattr_cnt      %u\n", ui->xattr_cnt);
+	printk(KERN_ERR "\txattr_names    %u\n", ui->xattr_names);
+	printk(KERN_ERR "\tdirty          %u\n", ui->dirty);
+	printk(KERN_ERR "\txattr          %u\n", ui->xattr);
+	printk(KERN_ERR "\tbulk_read      %u\n", ui->xattr);
+	printk(KERN_ERR "\tsynced_i_size  %llu\n",
 	       (unsigned long long)ui->synced_i_size);
-	printk(KERN_DEBUG "\tui_size        %llu\n",
+	printk(KERN_ERR "\tui_size        %llu\n",
 	       (unsigned long long)ui->ui_size);
-	printk(KERN_DEBUG "\tflags          %d\n", ui->flags);
-	printk(KERN_DEBUG "\tcompr_type     %d\n", ui->compr_type);
-	printk(KERN_DEBUG "\tlast_page_read %lu\n", ui->last_page_read);
-	printk(KERN_DEBUG "\tread_in_a_row  %lu\n", ui->read_in_a_row);
-	printk(KERN_DEBUG "\tdata_len       %d\n", ui->data_len);
+	printk(KERN_ERR "\tflags          %d\n", ui->flags);
+	printk(KERN_ERR "\tcompr_type     %d\n", ui->compr_type);
+	printk(KERN_ERR "\tlast_page_read %lu\n", ui->last_page_read);
+	printk(KERN_ERR "\tread_in_a_row  %lu\n", ui->read_in_a_row);
+	printk(KERN_ERR "\tdata_len       %d\n", ui->data_len);
 
 	if (!S_ISDIR(inode->i_mode))
 		return;
 
-	printk(KERN_DEBUG "List of directory entries:\n");
+	printk(KERN_ERR "List of directory entries:\n");
 	ubifs_assert(!mutex_is_locked(&c->tnc_mutex));
 
 	lowest_dent_key(c, &key, inode->i_ino);
@@ -284,11 +284,11 @@ void dbg_dump_inode(struct ubifs_info *c, const struct inode *inode)
 		dent = ubifs_tnc_next_ent(c, &key, &nm);
 		if (IS_ERR(dent)) {
 			if (PTR_ERR(dent) != -ENOENT)
-				printk(KERN_DEBUG "error %ld\n", PTR_ERR(dent));
+				printk(KERN_ERR "error %ld\n", PTR_ERR(dent));
 			break;
 		}
 
-		printk(KERN_DEBUG "\t%d: %s (%s)\n",
+		printk(KERN_ERR "\t%d: %s (%s)\n",
 		       count++, dent->name, get_dent_type(dent->type));
 
 		nm.name = dent->name;
@@ -312,8 +312,8 @@ void dbg_dump_node(const struct ubifs_info *c, const void *node)
 
 	/* If the magic is incorrect, just hexdump the first bytes */
 	if (le32_to_cpu(ch->magic) != UBIFS_NODE_MAGIC) {
-		printk(KERN_DEBUG "Not a node, first %zu bytes:", UBIFS_CH_SZ);
-		print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1,
+		printk(KERN_ERR "Not a node, first %zu bytes:", UBIFS_CH_SZ);
+		print_hex_dump(KERN_ERR, "", DUMP_PREFIX_OFFSET, 32, 1,
 			       (void *)node, UBIFS_CH_SZ, 1);
 		return;
 	}
@@ -326,7 +326,7 @@ void dbg_dump_node(const struct ubifs_info *c, const void *node)
 	{
 		const struct ubifs_pad_node *pad = node;
 
-		printk(KERN_DEBUG "\tpad_len        %u\n",
+		printk(KERN_ERR "\tpad_len        %u\n",
 		       le32_to_cpu(pad->pad_len));
 		break;
 	}
@@ -335,50 +335,50 @@ void dbg_dump_node(const struct ubifs_info *c, const void *node)
 		const struct ubifs_sb_node *sup = node;
 		unsigned int sup_flags = le32_to_cpu(sup->flags);
 
-		printk(KERN_DEBUG "\tkey_hash       %d (%s)\n",
+		printk(KERN_ERR "\tkey_hash       %d (%s)\n",
 		       (int)sup->key_hash, get_key_hash(sup->key_hash));
-		printk(KERN_DEBUG "\tkey_fmt        %d (%s)\n",
+		printk(KERN_ERR "\tkey_fmt        %d (%s)\n",
 		       (int)sup->key_fmt, get_key_fmt(sup->key_fmt));
-		printk(KERN_DEBUG "\tflags          %#x\n", sup_flags);
-		printk(KERN_DEBUG "\t  big_lpt      %u\n",
+		printk(KERN_ERR "\tflags          %#x\n", sup_flags);
+		printk(KERN_ERR "\t  big_lpt      %u\n",
 		       !!(sup_flags & UBIFS_FLG_BIGLPT));
-		printk(KERN_DEBUG "\t  space_fixup  %u\n",
+		printk(KERN_ERR "\t  space_fixup  %u\n",
 		       !!(sup_flags & UBIFS_FLG_SPACE_FIXUP));
-		printk(KERN_DEBUG "\tmin_io_size    %u\n",
+		printk(KERN_ERR "\tmin_io_size    %u\n",
 		       le32_to_cpu(sup->min_io_size));
-		printk(KERN_DEBUG "\tleb_size       %u\n",
+		printk(KERN_ERR "\tleb_size       %u\n",
 		       le32_to_cpu(sup->leb_size));
-		printk(KERN_DEBUG "\tleb_cnt        %u\n",
+		printk(KERN_ERR "\tleb_cnt        %u\n",
 		       le32_to_cpu(sup->leb_cnt));
-		printk(KERN_DEBUG "\tmax_leb_cnt    %u\n",
+		printk(KERN_ERR "\tmax_leb_cnt    %u\n",
 		       le32_to_cpu(sup->max_leb_cnt));
-		printk(KERN_DEBUG "\tmax_bud_bytes  %llu\n",
+		printk(KERN_ERR "\tmax_bud_bytes  %llu\n",
 		       (unsigned long long)le64_to_cpu(sup->max_bud_bytes));
-		printk(KERN_DEBUG "\tlog_lebs       %u\n",
+		printk(KERN_ERR "\tlog_lebs       %u\n",
 		       le32_to_cpu(sup->log_lebs));
-		printk(KERN_DEBUG "\tlpt_lebs       %u\n",
+		printk(KERN_ERR "\tlpt_lebs       %u\n",
 		       le32_to_cpu(sup->lpt_lebs));
-		printk(KERN_DEBUG "\torph_lebs      %u\n",
+		printk(KERN_ERR "\torph_lebs      %u\n",
 		       le32_to_cpu(sup->orph_lebs));
-		printk(KERN_DEBUG "\tjhead_cnt      %u\n",
+		printk(KERN_ERR "\tjhead_cnt      %u\n",
 		       le32_to_cpu(sup->jhead_cnt));
-		printk(KERN_DEBUG "\tfanout         %u\n",
+		printk(KERN_ERR "\tfanout         %u\n",
 		       le32_to_cpu(sup->fanout));
-		printk(KERN_DEBUG "\tlsave_cnt      %u\n",
+		printk(KERN_ERR "\tlsave_cnt      %u\n",
 		       le32_to_cpu(sup->lsave_cnt));
-		printk(KERN_DEBUG "\tdefault_compr  %u\n",
+		printk(KERN_ERR "\tdefault_compr  %u\n",
 		       (int)le16_to_cpu(sup->default_compr));
-		printk(KERN_DEBUG "\trp_size        %llu\n",
+		printk(KERN_ERR "\trp_size        %llu\n",
 		       (unsigned long long)le64_to_cpu(sup->rp_size));
-		printk(KERN_DEBUG "\trp_uid         %u\n",
+		printk(KERN_ERR "\trp_uid         %u\n",
 		       le32_to_cpu(sup->rp_uid));
-		printk(KERN_DEBUG "\trp_gid         %u\n",
+		printk(KERN_ERR "\trp_gid         %u\n",
 		       le32_to_cpu(sup->rp_gid));
-		printk(KERN_DEBUG "\tfmt_version    %u\n",
+		printk(KERN_ERR "\tfmt_version    %u\n",
 		       le32_to_cpu(sup->fmt_version));
-		printk(KERN_DEBUG "\ttime_gran      %u\n",
+		printk(KERN_ERR "\ttime_gran      %u\n",
 		       le32_to_cpu(sup->time_gran));
-		printk(KERN_DEBUG "\tUUID           %pUB\n",
+		printk(KERN_ERR "\tUUID           %pUB\n",
 		       sup->uuid);
 		break;
 	}
@@ -386,61 +386,61 @@ void dbg_dump_node(const struct ubifs_info *c, const void *node)
 	{
 		const struct ubifs_mst_node *mst = node;
 
-		printk(KERN_DEBUG "\thighest_inum   %llu\n",
+		printk(KERN_ERR "\thighest_inum   %llu\n",
 		       (unsigned long long)le64_to_cpu(mst->highest_inum));
-		printk(KERN_DEBUG "\tcommit number  %llu\n",
+		printk(KERN_ERR "\tcommit number  %llu\n",
 		       (unsigned long long)le64_to_cpu(mst->cmt_no));
-		printk(KERN_DEBUG "\tflags          %#x\n",
+		printk(KERN_ERR "\tflags          %#x\n",
 		       le32_to_cpu(mst->flags));
-		printk(KERN_DEBUG "\tlog_lnum       %u\n",
+		printk(KERN_ERR "\tlog_lnum       %u\n",
 		       le32_to_cpu(mst->log_lnum));
-		printk(KERN_DEBUG "\troot_lnum      %u\n",
+		printk(KERN_ERR "\troot_lnum      %u\n",
 		       le32_to_cpu(mst->root_lnum));
-		printk(KERN_DEBUG "\troot_offs      %u\n",
+		printk(KERN_ERR "\troot_offs      %u\n",
 		       le32_to_cpu(mst->root_offs));
-		printk(KERN_DEBUG "\troot_len       %u\n",
+		printk(KERN_ERR "\troot_len       %u\n",
 		       le32_to_cpu(mst->root_len));
-		printk(KERN_DEBUG "\tgc_lnum        %u\n",
+		printk(KERN_ERR "\tgc_lnum        %u\n",
 		       le32_to_cpu(mst->gc_lnum));
-		printk(KERN_DEBUG "\tihead_lnum     %u\n",
+		printk(KERN_ERR "\tihead_lnum     %u\n",
 		       le32_to_cpu(mst->ihead_lnum));
-		printk(KERN_DEBUG "\tihead_offs     %u\n",
+		printk(KERN_ERR "\tihead_offs     %u\n",
 		       le32_to_cpu(mst->ihead_offs));
-		printk(KERN_DEBUG "\tindex_size     %llu\n",
+		printk(KERN_ERR "\tindex_size     %llu\n",
 		       (unsigned long long)le64_to_cpu(mst->index_size));
-		printk(KERN_DEBUG "\tlpt_lnum       %u\n",
+		printk(KERN_ERR "\tlpt_lnum       %u\n",
 		       le32_to_cpu(mst->lpt_lnum));
-		printk(KERN_DEBUG "\tlpt_offs       %u\n",
+		printk(KERN_ERR "\tlpt_offs       %u\n",
 		       le32_to_cpu(mst->lpt_offs));
-		printk(KERN_DEBUG "\tnhead_lnum     %u\n",
+		printk(KERN_ERR "\tnhead_lnum     %u\n",
 		       le32_to_cpu(mst->nhead_lnum));
-		printk(KERN_DEBUG "\tnhead_offs     %u\n",
+		printk(KERN_ERR "\tnhead_offs     %u\n",
 		       le32_to_cpu(mst->nhead_offs));
-		printk(KERN_DEBUG "\tltab_lnum      %u\n",
+		printk(KERN_ERR "\tltab_lnum      %u\n",
 		       le32_to_cpu(mst->ltab_lnum));
-		printk(KERN_DEBUG "\tltab_offs      %u\n",
+		printk(KERN_ERR "\tltab_offs      %u\n",
 		       le32_to_cpu(mst->ltab_offs));
-		printk(KERN_DEBUG "\tlsave_lnum     %u\n",
+		printk(KERN_ERR "\tlsave_lnum     %u\n",
 		       le32_to_cpu(mst->lsave_lnum));
-		printk(KERN_DEBUG "\tlsave_offs     %u\n",
+		printk(KERN_ERR "\tlsave_offs     %u\n",
 		       le32_to_cpu(mst->lsave_offs));
-		printk(KERN_DEBUG "\tlscan_lnum     %u\n",
+		printk(KERN_ERR "\tlscan_lnum     %u\n",
 		       le32_to_cpu(mst->lscan_lnum));
-		printk(KERN_DEBUG "\tleb_cnt        %u\n",
+		printk(KERN_ERR "\tleb_cnt        %u\n",
 		       le32_to_cpu(mst->leb_cnt));
-		printk(KERN_DEBUG "\tempty_lebs     %u\n",
+		printk(KERN_ERR "\tempty_lebs     %u\n",
 		       le32_to_cpu(mst->empty_lebs));
-		printk(KERN_DEBUG "\tidx_lebs       %u\n",
+		printk(KERN_ERR "\tidx_lebs       %u\n",
 		       le32_to_cpu(mst->idx_lebs));
-		printk(KERN_DEBUG "\ttotal_free     %llu\n",
+		printk(KERN_ERR "\ttotal_free     %llu\n",
 		       (unsigned long long)le64_to_cpu(mst->total_free));
-		printk(KERN_DEBUG "\ttotal_dirty    %llu\n",
+		printk(KERN_ERR "\ttotal_dirty    %llu\n",
 		       (unsigned long long)le64_to_cpu(mst->total_dirty));
-		printk(KERN_DEBUG "\ttotal_used     %llu\n",
+		printk(KERN_ERR "\ttotal_used     %llu\n",
 		       (unsigned long long)le64_to_cpu(mst->total_used));
-		printk(KERN_DEBUG "\ttotal_dead     %llu\n",
+		printk(KERN_ERR "\ttotal_dead     %llu\n",
 		       (unsigned long long)le64_to_cpu(mst->total_dead));
-		printk(KERN_DEBUG "\ttotal_dark     %llu\n",
+		printk(KERN_ERR "\ttotal_dark     %llu\n",
 		       (unsigned long long)le64_to_cpu(mst->total_dark));
 		break;
 	}
@@ -448,11 +448,11 @@ void dbg_dump_node(const struct ubifs_info *c, const void *node)
 	{
 		const struct ubifs_ref_node *ref = node;
 
-		printk(KERN_DEBUG "\tlnum           %u\n",
+		printk(KERN_ERR "\tlnum           %u\n",
 		       le32_to_cpu(ref->lnum));
-		printk(KERN_DEBUG "\toffs           %u\n",
+		printk(KERN_ERR "\toffs           %u\n",
 		       le32_to_cpu(ref->offs));
-		printk(KERN_DEBUG "\tjhead          %u\n",
+		printk(KERN_ERR "\tjhead          %u\n",
 		       le32_to_cpu(ref->jhead));
 		break;
 	}
@@ -461,40 +461,40 @@ void dbg_dump_node(const struct ubifs_info *c, const void *node)
 		const struct ubifs_ino_node *ino = node;
 
 		key_read(c, &ino->key, &key);
-		printk(KERN_DEBUG "\tkey            %s\n",
+		printk(KERN_ERR "\tkey            %s\n",
 		       dbg_snprintf_key(c, &key, key_buf, DBG_KEY_BUF_LEN));
-		printk(KERN_DEBUG "\tcreat_sqnum    %llu\n",
+		printk(KERN_ERR "\tcreat_sqnum    %llu\n",
 		       (unsigned long long)le64_to_cpu(ino->creat_sqnum));
-		printk(KERN_DEBUG "\tsize           %llu\n",
+		printk(KERN_ERR "\tsize           %llu\n",
 		       (unsigned long long)le64_to_cpu(ino->size));
-		printk(KERN_DEBUG "\tnlink          %u\n",
+		printk(KERN_ERR "\tnlink          %u\n",
 		       le32_to_cpu(ino->nlink));
-		printk(KERN_DEBUG "\tatime          %lld.%u\n",
+		printk(KERN_ERR "\tatime          %lld.%u\n",
 		       (long long)le64_to_cpu(ino->atime_sec),
 		       le32_to_cpu(ino->atime_nsec));
-		printk(KERN_DEBUG "\tmtime          %lld.%u\n",
+		printk(KERN_ERR "\tmtime          %lld.%u\n",
 		       (long long)le64_to_cpu(ino->mtime_sec),
 		       le32_to_cpu(ino->mtime_nsec));
-		printk(KERN_DEBUG "\tctime          %lld.%u\n",
+		printk(KERN_ERR "\tctime          %lld.%u\n",
 		       (long long)le64_to_cpu(ino->ctime_sec),
 		       le32_to_cpu(ino->ctime_nsec));
-		printk(KERN_DEBUG "\tuid            %u\n",
+		printk(KERN_ERR "\tuid            %u\n",
 		       le32_to_cpu(ino->uid));
-		printk(KERN_DEBUG "\tgid            %u\n",
+		printk(KERN_ERR "\tgid            %u\n",
 		       le32_to_cpu(ino->gid));
-		printk(KERN_DEBUG "\tmode           %u\n",
+		printk(KERN_ERR "\tmode           %u\n",
 		       le32_to_cpu(ino->mode));
-		printk(KERN_DEBUG "\tflags          %#x\n",
+		printk(KERN_ERR "\tflags          %#x\n",
 		       le32_to_cpu(ino->flags));
-		printk(KERN_DEBUG "\txattr_cnt      %u\n",
+		printk(KERN_ERR "\txattr_cnt      %u\n",
 		       le32_to_cpu(ino->xattr_cnt));
-		printk(KERN_DEBUG "\txattr_size     %u\n",
+		printk(KERN_ERR "\txattr_size     %u\n",
 		       le32_to_cpu(ino->xattr_size));
-		printk(KERN_DEBUG "\txattr_names    %u\n",
+		printk(KERN_ERR "\txattr_names    %u\n",
 		       le32_to_cpu(ino->xattr_names));
-		printk(KERN_DEBUG "\tcompr_type     %#x\n",
+		printk(KERN_ERR "\tcompr_type     %#x\n",
 		       (int)le16_to_cpu(ino->compr_type));
-		printk(KERN_DEBUG "\tdata len       %u\n",
+		printk(KERN_ERR "\tdata len       %u\n",
 		       le32_to_cpu(ino->data_len));
 		break;
 	}
@@ -505,16 +505,16 @@ void dbg_dump_node(const struct ubifs_info *c, const void *node)
 		int nlen = le16_to_cpu(dent->nlen);
 
 		key_read(c, &dent->key, &key);
-		printk(KERN_DEBUG "\tkey            %s\n",
+		printk(KERN_ERR "\tkey            %s\n",
 		       dbg_snprintf_key(c, &key, key_buf, DBG_KEY_BUF_LEN));
-		printk(KERN_DEBUG "\tinum           %llu\n",
+		printk(KERN_ERR "\tinum           %llu\n",
 		       (unsigned long long)le64_to_cpu(dent->inum));
-		printk(KERN_DEBUG "\ttype           %d\n", (int)dent->type);
-		printk(KERN_DEBUG "\tnlen           %d\n", nlen);
-		printk(KERN_DEBUG "\tname           ");
+		printk(KERN_ERR "\ttype           %d\n", (int)dent->type);
+		printk(KERN_ERR "\tnlen           %d\n", nlen);
+		printk(KERN_ERR "\tname           ");
 
 		if (nlen > UBIFS_MAX_NLEN)
-			printk(KERN_DEBUG "(bad name length, not printing, "
+			printk(KERN_ERR "(bad name length, not printing, "
 					  "bad or corrupted node)");
 		else {
 			for (i = 0; i < nlen && dent->name[i]; i++)
@@ -530,16 +530,16 @@ void dbg_dump_node(const struct ubifs_info *c, const void *node)
 		int dlen = le32_to_cpu(ch->len) - UBIFS_DATA_NODE_SZ;
 
 		key_read(c, &dn->key, &key);
-		printk(KERN_DEBUG "\tkey            %s\n",
+		printk(KERN_ERR "\tkey            %s\n",
 		       dbg_snprintf_key(c, &key, key_buf, DBG_KEY_BUF_LEN));
-		printk(KERN_DEBUG "\tsize           %u\n",
+		printk(KERN_ERR "\tsize           %u\n",
 		       le32_to_cpu(dn->size));
-		printk(KERN_DEBUG "\tcompr_typ      %d\n",
+		printk(KERN_ERR "\tcompr_typ      %d\n",
 		       (int)le16_to_cpu(dn->compr_type));
-		printk(KERN_DEBUG "\tdata size      %d\n",
+		printk(KERN_ERR "\tdata size      %d\n",
 		       dlen);
-		printk(KERN_DEBUG "\tdata:\n");
-		print_hex_dump(KERN_DEBUG, "\t", DUMP_PREFIX_OFFSET, 32, 1,
+		printk(KERN_ERR "\tdata:\n");
+		print_hex_dump(KERN_ERR, "\t", DUMP_PREFIX_OFFSET, 32, 1,
 			       (void *)&dn->data, dlen, 0);
 		break;
 	}
@@ -547,11 +547,11 @@ void dbg_dump_node(const struct ubifs_info *c, const void *node)
 	{
 		const struct ubifs_trun_node *trun = node;
 
-		printk(KERN_DEBUG "\tinum           %u\n",
+		printk(KERN_ERR "\tinum           %u\n",
 		       le32_to_cpu(trun->inum));
-		printk(KERN_DEBUG "\told_size       %llu\n",
+		printk(KERN_ERR "\told_size       %llu\n",
 		       (unsigned long long)le64_to_cpu(trun->old_size));
-		printk(KERN_DEBUG "\tnew_size       %llu\n",
+		printk(KERN_ERR "\tnew_size       %llu\n",
 		       (unsigned long long)le64_to_cpu(trun->new_size));
 		break;
 	}
@@ -560,17 +560,17 @@ void dbg_dump_node(const struct ubifs_info *c, const void *node)
 		const struct ubifs_idx_node *idx = node;
 
 		n = le16_to_cpu(idx->child_cnt);
-		printk(KERN_DEBUG "\tchild_cnt      %d\n", n);
-		printk(KERN_DEBUG "\tlevel          %d\n",
+		printk(KERN_ERR "\tchild_cnt      %d\n", n);
+		printk(KERN_ERR "\tlevel          %d\n",
 		       (int)le16_to_cpu(idx->level));
-		printk(KERN_DEBUG "\tBranches:\n");
+		printk(KERN_ERR "\tBranches:\n");
 
 		for (i = 0; i < n && i < c->fanout - 1; i++) {
 			const struct ubifs_branch *br;
 
 			br = ubifs_idx_branch(c, idx, i);
 			key_read(c, &br->key, &key);
-			printk(KERN_DEBUG "\t%d: LEB %d:%d len %d key %s\n",
+			printk(KERN_ERR "\t%d: LEB %d:%d len %d key %s\n",
 			       i, le32_to_cpu(br->lnum), le32_to_cpu(br->offs),
 			       le32_to_cpu(br->len),
 			       dbg_snprintf_key(c, &key, key_buf,
@@ -584,20 +584,20 @@ void dbg_dump_node(const struct ubifs_info *c, const void *node)
 	{
 		const struct ubifs_orph_node *orph = node;
 
-		printk(KERN_DEBUG "\tcommit number  %llu\n",
+		printk(KERN_ERR "\tcommit number  %llu\n",
 		       (unsigned long long)
 				le64_to_cpu(orph->cmt_no) & LLONG_MAX);
-		printk(KERN_DEBUG "\tlast node flag %llu\n",
+		printk(KERN_ERR "\tlast node flag %llu\n",
 		       (unsigned long long)(le64_to_cpu(orph->cmt_no)) >> 63);
 		n = (le32_to_cpu(ch->len) - UBIFS_ORPH_NODE_SZ) >> 3;
-		printk(KERN_DEBUG "\t%d orphan inode numbers:\n", n);
+		printk(KERN_ERR "\t%d orphan inode numbers:\n", n);
 		for (i = 0; i < n; i++)
-			printk(KERN_DEBUG "\t  ino %llu\n",
+			printk(KERN_ERR "\t  ino %llu\n",
 			       (unsigned long long)le64_to_cpu(orph->inos[i]));
 		break;
 	}
 	default:
-		printk(KERN_DEBUG "node type %d was not recognized\n",
+		printk(KERN_ERR "node type %d was not recognized\n",
 		       (int)ch->node_type);
 	}
 	spin_unlock(&dbg_lock);
@@ -606,16 +606,16 @@ void dbg_dump_node(const struct ubifs_info *c, const void *node)
 void dbg_dump_budget_req(const struct ubifs_budget_req *req)
 {
 	spin_lock(&dbg_lock);
-	printk(KERN_DEBUG "Budgeting request: new_ino %d, dirtied_ino %d\n",
+	printk(KERN_ERR "Budgeting request: new_ino %d, dirtied_ino %d\n",
 	       req->new_ino, req->dirtied_ino);
-	printk(KERN_DEBUG "\tnew_ino_d   %d, dirtied_ino_d %d\n",
+	printk(KERN_ERR "\tnew_ino_d   %d, dirtied_ino_d %d\n",
 	       req->new_ino_d, req->dirtied_ino_d);
-	printk(KERN_DEBUG "\tnew_page    %d, dirtied_page %d\n",
+	printk(KERN_ERR "\tnew_page    %d, dirtied_page %d\n",
 	       req->new_page, req->dirtied_page);
-	printk(KERN_DEBUG "\tnew_dent    %d, mod_dent     %d\n",
+	printk(KERN_ERR "\tnew_dent    %d, mod_dent     %d\n",
 	       req->new_dent, req->mod_dent);
-	printk(KERN_DEBUG "\tidx_growth  %d\n", req->idx_growth);
-	printk(KERN_DEBUG "\tdata_growth %d dd_growth     %d\n",
+	printk(KERN_ERR "\tidx_growth  %d\n", req->idx_growth);
+	printk(KERN_ERR "\tdata_growth %d dd_growth     %d\n",
 	       req->data_growth, req->dd_growth);
 	spin_unlock(&dbg_lock);
 }
@@ -623,12 +623,12 @@ void dbg_dump_budget_req(const struct ubifs_budget_req *req)
 void dbg_dump_lstats(const struct ubifs_lp_stats *lst)
 {
 	spin_lock(&dbg_lock);
-	printk(KERN_DEBUG "(pid %d) Lprops statistics: empty_lebs %d, "
+	printk(KERN_ERR "(pid %d) Lprops statistics: empty_lebs %d, "
 	       "idx_lebs  %d\n", current->pid, lst->empty_lebs, lst->idx_lebs);
-	printk(KERN_DEBUG "\ttaken_empty_lebs %d, total_free %lld, "
+	printk(KERN_ERR "\ttaken_empty_lebs %d, total_free %lld, "
 	       "total_dirty %lld\n", lst->taken_empty_lebs, lst->total_free,
 	       lst->total_dirty);
-	printk(KERN_DEBUG "\ttotal_used %lld, total_dark %lld, "
+	printk(KERN_ERR "\ttotal_used %lld, total_dark %lld, "
 	       "total_dead %lld\n", lst->total_used, lst->total_dark,
 	       lst->total_dead);
 	spin_unlock(&dbg_lock);
@@ -644,21 +644,21 @@ void dbg_dump_budg(struct ubifs_info *c, const struct ubifs_budg_info *bi)
 
 	spin_lock(&c->space_lock);
 	spin_lock(&dbg_lock);
-	printk(KERN_DEBUG "(pid %d) Budgeting info: data budget sum %lld, "
+	printk(KERN_ERR "(pid %d) Budgeting info: data budget sum %lld, "
 	       "total budget sum %lld\n", current->pid,
 	       bi->data_growth + bi->dd_growth,
 	       bi->data_growth + bi->dd_growth + bi->idx_growth);
-	printk(KERN_DEBUG "\tbudg_data_growth %lld, budg_dd_growth %lld, "
+	printk(KERN_ERR "\tbudg_data_growth %lld, budg_dd_growth %lld, "
 	       "budg_idx_growth %lld\n", bi->data_growth, bi->dd_growth,
 	       bi->idx_growth);
-	printk(KERN_DEBUG "\tmin_idx_lebs %d, old_idx_sz %llu, "
+	printk(KERN_ERR "\tmin_idx_lebs %d, old_idx_sz %llu, "
 	       "uncommitted_idx %lld\n", bi->min_idx_lebs, bi->old_idx_sz,
 	       bi->uncommitted_idx);
-	printk(KERN_DEBUG "\tpage_budget %d, inode_budget %d, dent_budget %d\n",
+	printk(KERN_ERR "\tpage_budget %d, inode_budget %d, dent_budget %d\n",
 	       bi->page_budget, bi->inode_budget, bi->dent_budget);
-	printk(KERN_DEBUG "\tnospace %u, nospace_rp %u\n",
+	printk(KERN_ERR "\tnospace %u, nospace_rp %u\n",
 	       bi->nospace, bi->nospace_rp);
-	printk(KERN_DEBUG "\tdark_wm %d, dead_wm %d, max_idx_node_sz %d\n",
+	printk(KERN_ERR "\tdark_wm %d, dead_wm %d, max_idx_node_sz %d\n",
 	       c->dark_wm, c->dead_wm, c->max_idx_node_sz);
 
 	if (bi != &c->bi)
@@ -669,38 +669,38 @@ void dbg_dump_budg(struct ubifs_info *c, const struct ubifs_budg_info *bi)
 		 */
 		goto out_unlock;
 
-	printk(KERN_DEBUG "\tfreeable_cnt %d, calc_idx_sz %lld, idx_gc_cnt %d\n",
+	printk(KERN_ERR "\tfreeable_cnt %d, calc_idx_sz %lld, idx_gc_cnt %d\n",
 	       c->freeable_cnt, c->calc_idx_sz, c->idx_gc_cnt);
-	printk(KERN_DEBUG "\tdirty_pg_cnt %ld, dirty_zn_cnt %ld, "
+	printk(KERN_ERR "\tdirty_pg_cnt %ld, dirty_zn_cnt %ld, "
 	       "clean_zn_cnt %ld\n", atomic_long_read(&c->dirty_pg_cnt),
 	       atomic_long_read(&c->dirty_zn_cnt),
 	       atomic_long_read(&c->clean_zn_cnt));
-	printk(KERN_DEBUG "\tgc_lnum %d, ihead_lnum %d\n",
+	printk(KERN_ERR "\tgc_lnum %d, ihead_lnum %d\n",
 	       c->gc_lnum, c->ihead_lnum);
 
 	/* If we are in R/O mode, journal heads do not exist */
 	if (c->jheads)
 		for (i = 0; i < c->jhead_cnt; i++)
-			printk(KERN_DEBUG "\tjhead %s\t LEB %d\n",
+			printk(KERN_ERR "\tjhead %s\t LEB %d\n",
 			       dbg_jhead(c->jheads[i].wbuf.jhead),
 			       c->jheads[i].wbuf.lnum);
 	for (rb = rb_first(&c->buds); rb; rb = rb_next(rb)) {
 		bud = rb_entry(rb, struct ubifs_bud, rb);
-		printk(KERN_DEBUG "\tbud LEB %d\n", bud->lnum);
+		printk(KERN_ERR "\tbud LEB %d\n", bud->lnum);
 	}
 	list_for_each_entry(bud, &c->old_buds, list)
-		printk(KERN_DEBUG "\told bud LEB %d\n", bud->lnum);
+		printk(KERN_ERR "\told bud LEB %d\n", bud->lnum);
 	list_for_each_entry(idx_gc, &c->idx_gc, list)
-		printk(KERN_DEBUG "\tGC'ed idx LEB %d unmap %d\n",
+		printk(KERN_ERR "\tGC'ed idx LEB %d unmap %d\n",
 		       idx_gc->lnum, idx_gc->unmap);
-	printk(KERN_DEBUG "\tcommit state %d\n", c->cmt_state);
+	printk(KERN_ERR "\tcommit state %d\n", c->cmt_state);
 
 	/* Print budgeting predictions */
 	available = ubifs_calc_available(c, c->bi.min_idx_lebs);
 	outstanding = c->bi.data_growth + c->bi.dd_growth;
 	free = ubifs_get_free_space_nolock(c);
-	printk(KERN_DEBUG "Budgeting predictions:\n");
-	printk(KERN_DEBUG "\tavailable: %lld, outstanding %lld, free %lld\n",
+	printk(KERN_ERR "Budgeting predictions:\n");
+	printk(KERN_ERR "\tavailable: %lld, outstanding %lld, free %lld\n",
 	       available, outstanding, free);
 out_unlock:
 	spin_unlock(&dbg_lock);
@@ -720,11 +720,11 @@ void dbg_dump_lprop(const struct ubifs_info *c, const struct ubifs_lprops *lp)
 		dark = ubifs_calc_dark(c, spc);
 
 	if (lp->flags & LPROPS_INDEX)
-		printk(KERN_DEBUG "LEB %-7d free %-8d dirty %-8d used %-8d "
+		printk(KERN_ERR "LEB %-7d free %-8d dirty %-8d used %-8d "
 		       "free + dirty %-8d flags %#x (", lp->lnum, lp->free,
 		       lp->dirty, c->leb_size - spc, spc, lp->flags);
 	else
-		printk(KERN_DEBUG "LEB %-7d free %-8d dirty %-8d used %-8d "
+		printk(KERN_ERR "LEB %-7d free %-8d dirty %-8d used %-8d "
 		       "free + dirty %-8d dark %-4d dead %-4d nodes fit %-3d "
 		       "flags %#-4x (", lp->lnum, lp->free, lp->dirty,
 		       c->leb_size - spc, spc, dark, dead,
@@ -807,7 +807,7 @@ void dbg_dump_lprops(struct ubifs_info *c)
 	struct ubifs_lprops lp;
 	struct ubifs_lp_stats lst;
 
-	printk(KERN_DEBUG "(pid %d) start dumping LEB properties\n",
+	printk(KERN_ERR "(pid %d) start dumping LEB properties\n",
 	       current->pid);
 	ubifs_get_lp_stats(c, &lst);
 	dbg_dump_lstats(&lst);
@@ -819,7 +819,7 @@ void dbg_dump_lprops(struct ubifs_info *c)
 
 		dbg_dump_lprop(c, &lp);
 	}
-	printk(KERN_DEBUG "(pid %d) finish dumping LEB properties\n",
+	printk(KERN_ERR "(pid %d) finish dumping LEB properties\n",
 	       current->pid);
 }
 
@@ -828,35 +828,35 @@ void dbg_dump_lpt_info(struct ubifs_info *c)
 	int i;
 
 	spin_lock(&dbg_lock);
-	printk(KERN_DEBUG "(pid %d) dumping LPT information\n", current->pid);
-	printk(KERN_DEBUG "\tlpt_sz:        %lld\n", c->lpt_sz);
-	printk(KERN_DEBUG "\tpnode_sz:      %d\n", c->pnode_sz);
-	printk(KERN_DEBUG "\tnnode_sz:      %d\n", c->nnode_sz);
-	printk(KERN_DEBUG "\tltab_sz:       %d\n", c->ltab_sz);
-	printk(KERN_DEBUG "\tlsave_sz:      %d\n", c->lsave_sz);
-	printk(KERN_DEBUG "\tbig_lpt:       %d\n", c->big_lpt);
-	printk(KERN_DEBUG "\tlpt_hght:      %d\n", c->lpt_hght);
-	printk(KERN_DEBUG "\tpnode_cnt:     %d\n", c->pnode_cnt);
-	printk(KERN_DEBUG "\tnnode_cnt:     %d\n", c->nnode_cnt);
-	printk(KERN_DEBUG "\tdirty_pn_cnt:  %d\n", c->dirty_pn_cnt);
-	printk(KERN_DEBUG "\tdirty_nn_cnt:  %d\n", c->dirty_nn_cnt);
-	printk(KERN_DEBUG "\tlsave_cnt:     %d\n", c->lsave_cnt);
-	printk(KERN_DEBUG "\tspace_bits:    %d\n", c->space_bits);
-	printk(KERN_DEBUG "\tlpt_lnum_bits: %d\n", c->lpt_lnum_bits);
-	printk(KERN_DEBUG "\tlpt_offs_bits: %d\n", c->lpt_offs_bits);
-	printk(KERN_DEBUG "\tlpt_spc_bits:  %d\n", c->lpt_spc_bits);
-	printk(KERN_DEBUG "\tpcnt_bits:     %d\n", c->pcnt_bits);
-	printk(KERN_DEBUG "\tlnum_bits:     %d\n", c->lnum_bits);
-	printk(KERN_DEBUG "\tLPT root is at %d:%d\n", c->lpt_lnum, c->lpt_offs);
-	printk(KERN_DEBUG "\tLPT head is at %d:%d\n",
+	printk(KERN_ERR "(pid %d) dumping LPT information\n", current->pid);
+	printk(KERN_ERR "\tlpt_sz:        %lld\n", c->lpt_sz);
+	printk(KERN_ERR "\tpnode_sz:      %d\n", c->pnode_sz);
+	printk(KERN_ERR "\tnnode_sz:      %d\n", c->nnode_sz);
+	printk(KERN_ERR "\tltab_sz:       %d\n", c->ltab_sz);
+	printk(KERN_ERR "\tlsave_sz:      %d\n", c->lsave_sz);
+	printk(KERN_ERR "\tbig_lpt:       %d\n", c->big_lpt);
+	printk(KERN_ERR "\tlpt_hght:      %d\n", c->lpt_hght);
+	printk(KERN_ERR "\tpnode_cnt:     %d\n", c->pnode_cnt);
+	printk(KERN_ERR "\tnnode_cnt:     %d\n", c->nnode_cnt);
+	printk(KERN_ERR "\tdirty_pn_cnt:  %d\n", c->dirty_pn_cnt);
+	printk(KERN_ERR "\tdirty_nn_cnt:  %d\n", c->dirty_nn_cnt);
+	printk(KERN_ERR "\tlsave_cnt:     %d\n", c->lsave_cnt);
+	printk(KERN_ERR "\tspace_bits:    %d\n", c->space_bits);
+	printk(KERN_ERR "\tlpt_lnum_bits: %d\n", c->lpt_lnum_bits);
+	printk(KERN_ERR "\tlpt_offs_bits: %d\n", c->lpt_offs_bits);
+	printk(KERN_ERR "\tlpt_spc_bits:  %d\n", c->lpt_spc_bits);
+	printk(KERN_ERR "\tpcnt_bits:     %d\n", c->pcnt_bits);
+	printk(KERN_ERR "\tlnum_bits:     %d\n", c->lnum_bits);
+	printk(KERN_ERR "\tLPT root is at %d:%d\n", c->lpt_lnum, c->lpt_offs);
+	printk(KERN_ERR "\tLPT head is at %d:%d\n",
 	       c->nhead_lnum, c->nhead_offs);
-	printk(KERN_DEBUG "\tLPT ltab is at %d:%d\n",
+	printk(KERN_ERR "\tLPT ltab is at %d:%d\n",
 	       c->ltab_lnum, c->ltab_offs);
 	if (c->big_lpt)
-		printk(KERN_DEBUG "\tLPT lsave is at %d:%d\n",
+		printk(KERN_ERR "\tLPT lsave is at %d:%d\n",
 		       c->lsave_lnum, c->lsave_offs);
 	for (i = 0; i < c->lpt_lebs; i++)
-		printk(KERN_DEBUG "\tLPT LEB %d free %d dirty %d tgc %d "
+		printk(KERN_ERR "\tLPT LEB %d free %d dirty %d tgc %d "
 		       "cmt %d\n", i + c->lpt_first, c->ltab[i].free,
 		       c->ltab[i].dirty, c->ltab[i].tgc, c->ltab[i].cmt);
 	spin_unlock(&dbg_lock);
@@ -867,12 +867,12 @@ void dbg_dump_sleb(const struct ubifs_info *c,
 {
 	struct ubifs_scan_node *snod;
 
-	printk(KERN_DEBUG "(pid %d) start dumping scanned data from LEB %d:%d\n",
+	printk(KERN_ERR "(pid %d) start dumping scanned data from LEB %d:%d\n",
 	       current->pid, sleb->lnum, offs);
 
 	list_for_each_entry(snod, &sleb->nodes, list) {
 		cond_resched();
-		printk(KERN_DEBUG "Dumping node at LEB %d:%d len %d\n", sleb->lnum,
+		printk(KERN_ERR "Dumping node at LEB %d:%d len %d\n", sleb->lnum,
 		       snod->offs, snod->len);
 		dbg_dump_node(c, snod->node);
 	}
@@ -887,7 +887,7 @@ void dbg_dump_leb(const struct ubifs_info *c, int lnum)
 	if (dbg_is_tst_rcvry(c))
 		return;
 
-	printk(KERN_DEBUG "(pid %d) start dumping LEB %d\n",
+	printk(KERN_ERR "(pid %d) start dumping LEB %d\n",
 	       current->pid, lnum);
 
 	buf = __vmalloc(c->leb_size, GFP_NOFS, PAGE_KERNEL);
@@ -902,17 +902,17 @@ void dbg_dump_leb(const struct ubifs_info *c, int lnum)
 		goto out;
 	}
 
-	printk(KERN_DEBUG "LEB %d has %d nodes ending at %d\n", lnum,
+	printk(KERN_ERR "LEB %d has %d nodes ending at %d\n", lnum,
 	       sleb->nodes_cnt, sleb->endpt);
 
 	list_for_each_entry(snod, &sleb->nodes, list) {
 		cond_resched();
-		printk(KERN_DEBUG "Dumping node at LEB %d:%d len %d\n", lnum,
+		printk(KERN_ERR "Dumping node at LEB %d:%d len %d\n", lnum,
 		       snod->offs, snod->len);
 		dbg_dump_node(c, snod->node);
 	}
 
-	printk(KERN_DEBUG "(pid %d) finish dumping LEB %d\n",
+	printk(KERN_ERR "(pid %d) finish dumping LEB %d\n",
 	       current->pid, lnum);
 	ubifs_scan_destroy(sleb);
 
@@ -934,7 +934,7 @@ void dbg_dump_znode(const struct ubifs_info *c,
 	else
 		zbr = &c->zroot;
 
-	printk(KERN_DEBUG "znode %p, LEB %d:%d len %d parent %p iip %d level %d"
+	printk(KERN_ERR "znode %p, LEB %d:%d len %d parent %p iip %d level %d"
 	       " child_cnt %d flags %lx\n", znode, zbr->lnum, zbr->offs,
 	       zbr->len, znode->parent, znode->iip, znode->level,
 	       znode->child_cnt, znode->flags);
@@ -944,18 +944,18 @@ void dbg_dump_znode(const struct ubifs_info *c,
 		return;
 	}
 
-	printk(KERN_DEBUG "zbranches:\n");
+	printk(KERN_ERR "zbranches:\n");
 	for (n = 0; n < znode->child_cnt; n++) {
 		zbr = &znode->zbranch[n];
 		if (znode->level > 0)
-			printk(KERN_DEBUG "\t%d: znode %p LEB %d:%d len %d key "
+			printk(KERN_ERR "\t%d: znode %p LEB %d:%d len %d key "
 					  "%s\n", n, zbr->znode, zbr->lnum,
 					  zbr->offs, zbr->len,
 					  dbg_snprintf_key(c, &zbr->key,
 							   key_buf,
 							   DBG_KEY_BUF_LEN));
 		else
-			printk(KERN_DEBUG "\t%d: LNC %p LEB %d:%d len %d key "
+			printk(KERN_ERR "\t%d: LNC %p LEB %d:%d len %d key "
 					  "%s\n", n, zbr->znode, zbr->lnum,
 					  zbr->offs, zbr->len,
 					  dbg_snprintf_key(c, &zbr->key,
@@ -969,16 +969,16 @@ void dbg_dump_heap(struct ubifs_info *c, struct ubifs_lpt_heap *heap, int cat)
 {
 	int i;
 
-	printk(KERN_DEBUG "(pid %d) start dumping heap cat %d (%d elements)\n",
+	printk(KERN_ERR "(pid %d) start dumping heap cat %d (%d elements)\n",
 	       current->pid, cat, heap->cnt);
 	for (i = 0; i < heap->cnt; i++) {
 		struct ubifs_lprops *lprops = heap->arr[i];
 
-		printk(KERN_DEBUG "\t%d. LEB %d hpos %d free %d dirty %d "
+		printk(KERN_ERR "\t%d. LEB %d hpos %d free %d dirty %d "
 		       "flags %d\n", i, lprops->lnum, lprops->hpos,
 		       lprops->free, lprops->dirty, lprops->flags);
 	}
-	printk(KERN_DEBUG "(pid %d) finish dumping heap\n", current->pid);
+	printk(KERN_ERR "(pid %d) finish dumping heap\n", current->pid);
 }
 
 void dbg_dump_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
@@ -986,15 +986,15 @@ void dbg_dump_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
 {
 	int i;
 
-	printk(KERN_DEBUG "(pid %d) dumping pnode:\n", current->pid);
-	printk(KERN_DEBUG "\taddress %zx parent %zx cnext %zx\n",
+	printk(KERN_ERR "(pid %d) dumping pnode:\n", current->pid);
+	printk(KERN_ERR "\taddress %zx parent %zx cnext %zx\n",
 	       (size_t)pnode, (size_t)parent, (size_t)pnode->cnext);
-	printk(KERN_DEBUG "\tflags %lu iip %d level %d num %d\n",
+	printk(KERN_ERR "\tflags %lu iip %d level %d num %d\n",
 	       pnode->flags, iip, pnode->level, pnode->num);
 	for (i = 0; i < UBIFS_LPT_FANOUT; i++) {
 		struct ubifs_lprops *lp = &pnode->lprops[i];
 
-		printk(KERN_DEBUG "\t%d: free %d dirty %d flags %d lnum %d\n",
+		printk(KERN_ERR "\t%d: free %d dirty %d flags %d lnum %d\n",
 		       i, lp->free, lp->dirty, lp->flags, lp->lnum);
 	}
 }
@@ -1004,20 +1004,20 @@ void dbg_dump_tnc(struct ubifs_info *c)
 	struct ubifs_znode *znode;
 	int level;
 
-	printk(KERN_DEBUG "\n");
-	printk(KERN_DEBUG "(pid %d) start dumping TNC tree\n", current->pid);
+	printk(KERN_ERR "\n");
+	printk(KERN_ERR "(pid %d) start dumping TNC tree\n", current->pid);
 	znode = ubifs_tnc_levelorder_next(c->zroot.znode, NULL);
 	level = znode->level;
-	printk(KERN_DEBUG "== Level %d ==\n", level);
+	printk(KERN_ERR "== Level %d ==\n", level);
 	while (znode) {
 		if (level != znode->level) {
 			level = znode->level;
-			printk(KERN_DEBUG "== Level %d ==\n", level);
+			printk(KERN_ERR "== Level %d ==\n", level);
 		}
 		dbg_dump_znode(c, znode);
 		znode = ubifs_tnc_levelorder_next(c->zroot.znode, znode);
 	}
-	printk(KERN_DEBUG "(pid %d) finish dumping TNC tree\n", current->pid);
+	printk(KERN_ERR "(pid %d) finish dumping TNC tree\n", current->pid);
 }
 
 static int dump_znode(struct ubifs_info *c, struct ubifs_znode *znode,
-- 
1.7.7.5
