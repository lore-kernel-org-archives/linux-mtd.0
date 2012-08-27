Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T5yWF-0003T0-6b
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2012 12:34:21 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/3] UBIFS: use pr_ helper instead of printk
Date: Mon, 27 Aug 2012 15:34:20 +0300
Message-Id: <1346070860-17573-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1346070860-17573-1-git-send-email-dedekind1@gmail.com>
References: <1346070860-17573-1-git-send-email-dedekind1@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Use 'pr_err()' instead of 'printk(KERN_ERR', etc.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/debug.c      |  482 ++++++++++++++++++++++---------------------------
 fs/ubifs/debug.h      |    6 +-
 fs/ubifs/lpt_commit.c |   36 ++--
 fs/ubifs/ubifs.h      |   13 +-
 4 files changed, 235 insertions(+), 302 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 1e41f2c..3a7dfd9 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -219,15 +219,15 @@ const char *dbg_jhead(int jhead)
 
 static void dump_ch(const struct ubifs_ch *ch)
 {
-	printk(KERN_ERR "\tmagic          %#x\n", le32_to_cpu(ch->magic));
-	printk(KERN_ERR "\tcrc            %#x\n", le32_to_cpu(ch->crc));
-	printk(KERN_ERR "\tnode_type      %d (%s)\n", ch->node_type,
+	pr_err("\tmagic          %#x\n", le32_to_cpu(ch->magic));
+	pr_err("\tcrc            %#x\n", le32_to_cpu(ch->crc));
+	pr_err("\tnode_type      %d (%s)\n", ch->node_type,
 	       dbg_ntype(ch->node_type));
-	printk(KERN_ERR "\tgroup_type     %d (%s)\n", ch->group_type,
+	pr_err("\tgroup_type     %d (%s)\n", ch->group_type,
 	       dbg_gtype(ch->group_type));
-	printk(KERN_ERR "\tsqnum          %llu\n",
+	pr_err("\tsqnum          %llu\n",
 	       (unsigned long long)le64_to_cpu(ch->sqnum));
-	printk(KERN_ERR "\tlen            %u\n", le32_to_cpu(ch->len));
+	pr_err("\tlen            %u\n", le32_to_cpu(ch->len));
 }
 
 void ubifs_dump_inode(struct ubifs_info *c, const struct inode *inode)
@@ -238,43 +238,43 @@ void ubifs_dump_inode(struct ubifs_info *c, const struct inode *inode)
 	struct ubifs_dent_node *dent, *pdent = NULL;
 	int count = 2;
 
-	printk(KERN_ERR "Dump in-memory inode:");
-	printk(KERN_ERR "\tinode          %lu\n", inode->i_ino);
-	printk(KERN_ERR "\tsize           %llu\n",
+	pr_err("Dump in-memory inode:");
+	pr_err("\tinode          %lu\n", inode->i_ino);
+	pr_err("\tsize           %llu\n",
 	       (unsigned long long)i_size_read(inode));
-	printk(KERN_ERR "\tnlink          %u\n", inode->i_nlink);
-	printk(KERN_ERR "\tuid            %u\n", (unsigned int)inode->i_uid);
-	printk(KERN_ERR "\tgid            %u\n", (unsigned int)inode->i_gid);
-	printk(KERN_ERR "\tatime          %u.%u\n",
+	pr_err("\tnlink          %u\n", inode->i_nlink);
+	pr_err("\tuid            %u\n", (unsigned int)inode->i_uid);
+	pr_err("\tgid            %u\n", (unsigned int)inode->i_gid);
+	pr_err("\tatime          %u.%u\n",
 	       (unsigned int)inode->i_atime.tv_sec,
 	       (unsigned int)inode->i_atime.tv_nsec);
-	printk(KERN_ERR "\tmtime          %u.%u\n",
+	pr_err("\tmtime          %u.%u\n",
 	       (unsigned int)inode->i_mtime.tv_sec,
 	       (unsigned int)inode->i_mtime.tv_nsec);
-	printk(KERN_ERR "\tctime          %u.%u\n",
+	pr_err("\tctime          %u.%u\n",
 	       (unsigned int)inode->i_ctime.tv_sec,
 	       (unsigned int)inode->i_ctime.tv_nsec);
-	printk(KERN_ERR "\tcreat_sqnum    %llu\n", ui->creat_sqnum);
-	printk(KERN_ERR "\txattr_size     %u\n", ui->xattr_size);
-	printk(KERN_ERR "\txattr_cnt      %u\n", ui->xattr_cnt);
-	printk(KERN_ERR "\txattr_names    %u\n", ui->xattr_names);
-	printk(KERN_ERR "\tdirty          %u\n", ui->dirty);
-	printk(KERN_ERR "\txattr          %u\n", ui->xattr);
-	printk(KERN_ERR "\tbulk_read      %u\n", ui->xattr);
-	printk(KERN_ERR "\tsynced_i_size  %llu\n",
+	pr_err("\tcreat_sqnum    %llu\n", ui->creat_sqnum);
+	pr_err("\txattr_size     %u\n", ui->xattr_size);
+	pr_err("\txattr_cnt      %u\n", ui->xattr_cnt);
+	pr_err("\txattr_names    %u\n", ui->xattr_names);
+	pr_err("\tdirty          %u\n", ui->dirty);
+	pr_err("\txattr          %u\n", ui->xattr);
+	pr_err("\tbulk_read      %u\n", ui->xattr);
+	pr_err("\tsynced_i_size  %llu\n",
 	       (unsigned long long)ui->synced_i_size);
-	printk(KERN_ERR "\tui_size        %llu\n",
+	pr_err("\tui_size        %llu\n",
 	       (unsigned long long)ui->ui_size);
-	printk(KERN_ERR "\tflags          %d\n", ui->flags);
-	printk(KERN_ERR "\tcompr_type     %d\n", ui->compr_type);
-	printk(KERN_ERR "\tlast_page_read %lu\n", ui->last_page_read);
-	printk(KERN_ERR "\tread_in_a_row  %lu\n", ui->read_in_a_row);
-	printk(KERN_ERR "\tdata_len       %d\n", ui->data_len);
+	pr_err("\tflags          %d\n", ui->flags);
+	pr_err("\tcompr_type     %d\n", ui->compr_type);
+	pr_err("\tlast_page_read %lu\n", ui->last_page_read);
+	pr_err("\tread_in_a_row  %lu\n", ui->read_in_a_row);
+	pr_err("\tdata_len       %d\n", ui->data_len);
 
 	if (!S_ISDIR(inode->i_mode))
 		return;
 
-	printk(KERN_ERR "List of directory entries:\n");
+	pr_err("List of directory entries:\n");
 	ubifs_assert(!mutex_is_locked(&c->tnc_mutex));
 
 	lowest_dent_key(c, &key, inode->i_ino);
@@ -282,11 +282,11 @@ void ubifs_dump_inode(struct ubifs_info *c, const struct inode *inode)
 		dent = ubifs_tnc_next_ent(c, &key, &nm);
 		if (IS_ERR(dent)) {
 			if (PTR_ERR(dent) != -ENOENT)
-				printk(KERN_ERR "error %ld\n", PTR_ERR(dent));
+				pr_err("error %ld\n", PTR_ERR(dent));
 			break;
 		}
 
-		printk(KERN_ERR "\t%d: %s (%s)\n",
+		pr_err("\t%d: %s (%s)\n",
 		       count++, dent->name, get_dent_type(dent->type));
 
 		nm.name = dent->name;
@@ -307,7 +307,7 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 
 	/* If the magic is incorrect, just hexdump the first bytes */
 	if (le32_to_cpu(ch->magic) != UBIFS_NODE_MAGIC) {
-		printk(KERN_ERR "Not a node, first %zu bytes:", UBIFS_CH_SZ);
+		pr_err("Not a node, first %zu bytes:", UBIFS_CH_SZ);
 		print_hex_dump(KERN_ERR, "", DUMP_PREFIX_OFFSET, 32, 1,
 			       (void *)node, UBIFS_CH_SZ, 1);
 		return;
@@ -321,8 +321,7 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 	{
 		const struct ubifs_pad_node *pad = node;
 
-		printk(KERN_ERR "\tpad_len        %u\n",
-		       le32_to_cpu(pad->pad_len));
+		pr_err("\tpad_len        %u\n", le32_to_cpu(pad->pad_len));
 		break;
 	}
 	case UBIFS_SB_NODE:
@@ -330,112 +329,77 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 		const struct ubifs_sb_node *sup = node;
 		unsigned int sup_flags = le32_to_cpu(sup->flags);
 
-		printk(KERN_ERR "\tkey_hash       %d (%s)\n",
+		pr_err("\tkey_hash       %d (%s)\n",
 		       (int)sup->key_hash, get_key_hash(sup->key_hash));
-		printk(KERN_ERR "\tkey_fmt        %d (%s)\n",
+		pr_err("\tkey_fmt        %d (%s)\n",
 		       (int)sup->key_fmt, get_key_fmt(sup->key_fmt));
-		printk(KERN_ERR "\tflags          %#x\n", sup_flags);
-		printk(KERN_ERR "\t  big_lpt      %u\n",
+		pr_err("\tflags          %#x\n", sup_flags);
+		pr_err("\t  big_lpt      %u\n",
 		       !!(sup_flags & UBIFS_FLG_BIGLPT));
-		printk(KERN_ERR "\t  space_fixup  %u\n",
+		pr_err("\t  space_fixup  %u\n",
 		       !!(sup_flags & UBIFS_FLG_SPACE_FIXUP));
-		printk(KERN_ERR "\tmin_io_size    %u\n",
-		       le32_to_cpu(sup->min_io_size));
-		printk(KERN_ERR "\tleb_size       %u\n",
-		       le32_to_cpu(sup->leb_size));
-		printk(KERN_ERR "\tleb_cnt        %u\n",
-		       le32_to_cpu(sup->leb_cnt));
-		printk(KERN_ERR "\tmax_leb_cnt    %u\n",
-		       le32_to_cpu(sup->max_leb_cnt));
-		printk(KERN_ERR "\tmax_bud_bytes  %llu\n",
+		pr_err("\tmin_io_size    %u\n", le32_to_cpu(sup->min_io_size));
+		pr_err("\tleb_size       %u\n", le32_to_cpu(sup->leb_size));
+		pr_err("\tleb_cnt        %u\n", le32_to_cpu(sup->leb_cnt));
+		pr_err("\tmax_leb_cnt    %u\n", le32_to_cpu(sup->max_leb_cnt));
+		pr_err("\tmax_bud_bytes  %llu\n",
 		       (unsigned long long)le64_to_cpu(sup->max_bud_bytes));
-		printk(KERN_ERR "\tlog_lebs       %u\n",
-		       le32_to_cpu(sup->log_lebs));
-		printk(KERN_ERR "\tlpt_lebs       %u\n",
-		       le32_to_cpu(sup->lpt_lebs));
-		printk(KERN_ERR "\torph_lebs      %u\n",
-		       le32_to_cpu(sup->orph_lebs));
-		printk(KERN_ERR "\tjhead_cnt      %u\n",
-		       le32_to_cpu(sup->jhead_cnt));
-		printk(KERN_ERR "\tfanout         %u\n",
-		       le32_to_cpu(sup->fanout));
-		printk(KERN_ERR "\tlsave_cnt      %u\n",
-		       le32_to_cpu(sup->lsave_cnt));
-		printk(KERN_ERR "\tdefault_compr  %u\n",
+		pr_err("\tlog_lebs       %u\n", le32_to_cpu(sup->log_lebs));
+		pr_err("\tlpt_lebs       %u\n", le32_to_cpu(sup->lpt_lebs));
+		pr_err("\torph_lebs      %u\n", le32_to_cpu(sup->orph_lebs));
+		pr_err("\tjhead_cnt      %u\n", le32_to_cpu(sup->jhead_cnt));
+		pr_err("\tfanout         %u\n", le32_to_cpu(sup->fanout));
+		pr_err("\tlsave_cnt      %u\n", le32_to_cpu(sup->lsave_cnt));
+		pr_err("\tdefault_compr  %u\n",
 		       (int)le16_to_cpu(sup->default_compr));
-		printk(KERN_ERR "\trp_size        %llu\n",
+		pr_err("\trp_size        %llu\n",
 		       (unsigned long long)le64_to_cpu(sup->rp_size));
-		printk(KERN_ERR "\trp_uid         %u\n",
-		       le32_to_cpu(sup->rp_uid));
-		printk(KERN_ERR "\trp_gid         %u\n",
-		       le32_to_cpu(sup->rp_gid));
-		printk(KERN_ERR "\tfmt_version    %u\n",
-		       le32_to_cpu(sup->fmt_version));
-		printk(KERN_ERR "\ttime_gran      %u\n",
-		       le32_to_cpu(sup->time_gran));
-		printk(KERN_ERR "\tUUID           %pUB\n",
-		       sup->uuid);
+		pr_err("\trp_uid         %u\n", le32_to_cpu(sup->rp_uid));
+		pr_err("\trp_gid         %u\n", le32_to_cpu(sup->rp_gid));
+		pr_err("\tfmt_version    %u\n", le32_to_cpu(sup->fmt_version));
+		pr_err("\ttime_gran      %u\n", le32_to_cpu(sup->time_gran));
+		pr_err("\tUUID           %pUB\n", sup->uuid);
 		break;
 	}
 	case UBIFS_MST_NODE:
 	{
 		const struct ubifs_mst_node *mst = node;
 
-		printk(KERN_ERR "\thighest_inum   %llu\n",
+		pr_err("\thighest_inum   %llu\n",
 		       (unsigned long long)le64_to_cpu(mst->highest_inum));
-		printk(KERN_ERR "\tcommit number  %llu\n",
+		pr_err("\tcommit number  %llu\n",
 		       (unsigned long long)le64_to_cpu(mst->cmt_no));
-		printk(KERN_ERR "\tflags          %#x\n",
-		       le32_to_cpu(mst->flags));
-		printk(KERN_ERR "\tlog_lnum       %u\n",
-		       le32_to_cpu(mst->log_lnum));
-		printk(KERN_ERR "\troot_lnum      %u\n",
-		       le32_to_cpu(mst->root_lnum));
-		printk(KERN_ERR "\troot_offs      %u\n",
-		       le32_to_cpu(mst->root_offs));
-		printk(KERN_ERR "\troot_len       %u\n",
-		       le32_to_cpu(mst->root_len));
-		printk(KERN_ERR "\tgc_lnum        %u\n",
-		       le32_to_cpu(mst->gc_lnum));
-		printk(KERN_ERR "\tihead_lnum     %u\n",
-		       le32_to_cpu(mst->ihead_lnum));
-		printk(KERN_ERR "\tihead_offs     %u\n",
-		       le32_to_cpu(mst->ihead_offs));
-		printk(KERN_ERR "\tindex_size     %llu\n",
+		pr_err("\tflags          %#x\n", le32_to_cpu(mst->flags));
+		pr_err("\tlog_lnum       %u\n", le32_to_cpu(mst->log_lnum));
+		pr_err("\troot_lnum      %u\n", le32_to_cpu(mst->root_lnum));
+		pr_err("\troot_offs      %u\n", le32_to_cpu(mst->root_offs));
+		pr_err("\troot_len       %u\n", le32_to_cpu(mst->root_len));
+		pr_err("\tgc_lnum        %u\n", le32_to_cpu(mst->gc_lnum));
+		pr_err("\tihead_lnum     %u\n", le32_to_cpu(mst->ihead_lnum));
+		pr_err("\tihead_offs     %u\n", le32_to_cpu(mst->ihead_offs));
+		pr_err("\tindex_size     %llu\n",
 		       (unsigned long long)le64_to_cpu(mst->index_size));
-		printk(KERN_ERR "\tlpt_lnum       %u\n",
-		       le32_to_cpu(mst->lpt_lnum));
-		printk(KERN_ERR "\tlpt_offs       %u\n",
-		       le32_to_cpu(mst->lpt_offs));
-		printk(KERN_ERR "\tnhead_lnum     %u\n",
-		       le32_to_cpu(mst->nhead_lnum));
-		printk(KERN_ERR "\tnhead_offs     %u\n",
-		       le32_to_cpu(mst->nhead_offs));
-		printk(KERN_ERR "\tltab_lnum      %u\n",
-		       le32_to_cpu(mst->ltab_lnum));
-		printk(KERN_ERR "\tltab_offs      %u\n",
-		       le32_to_cpu(mst->ltab_offs));
-		printk(KERN_ERR "\tlsave_lnum     %u\n",
-		       le32_to_cpu(mst->lsave_lnum));
-		printk(KERN_ERR "\tlsave_offs     %u\n",
-		       le32_to_cpu(mst->lsave_offs));
-		printk(KERN_ERR "\tlscan_lnum     %u\n",
-		       le32_to_cpu(mst->lscan_lnum));
-		printk(KERN_ERR "\tleb_cnt        %u\n",
-		       le32_to_cpu(mst->leb_cnt));
-		printk(KERN_ERR "\tempty_lebs     %u\n",
-		       le32_to_cpu(mst->empty_lebs));
-		printk(KERN_ERR "\tidx_lebs       %u\n",
-		       le32_to_cpu(mst->idx_lebs));
-		printk(KERN_ERR "\ttotal_free     %llu\n",
+		pr_err("\tlpt_lnum       %u\n", le32_to_cpu(mst->lpt_lnum));
+		pr_err("\tlpt_offs       %u\n", le32_to_cpu(mst->lpt_offs));
+		pr_err("\tnhead_lnum     %u\n", le32_to_cpu(mst->nhead_lnum));
+		pr_err("\tnhead_offs     %u\n", le32_to_cpu(mst->nhead_offs));
+		pr_err("\tltab_lnum      %u\n", le32_to_cpu(mst->ltab_lnum));
+		pr_err("\tltab_offs      %u\n", le32_to_cpu(mst->ltab_offs));
+		pr_err("\tlsave_lnum     %u\n", le32_to_cpu(mst->lsave_lnum));
+		pr_err("\tlsave_offs     %u\n", le32_to_cpu(mst->lsave_offs));
+		pr_err("\tlscan_lnum     %u\n", le32_to_cpu(mst->lscan_lnum));
+		pr_err("\tleb_cnt        %u\n", le32_to_cpu(mst->leb_cnt));
+		pr_err("\tempty_lebs     %u\n", le32_to_cpu(mst->empty_lebs));
+		pr_err("\tidx_lebs       %u\n", le32_to_cpu(mst->idx_lebs));
+		pr_err("\ttotal_free     %llu\n",
 		       (unsigned long long)le64_to_cpu(mst->total_free));
-		printk(KERN_ERR "\ttotal_dirty    %llu\n",
+		pr_err("\ttotal_dirty    %llu\n",
 		       (unsigned long long)le64_to_cpu(mst->total_dirty));
-		printk(KERN_ERR "\ttotal_used     %llu\n",
+		pr_err("\ttotal_used     %llu\n",
 		       (unsigned long long)le64_to_cpu(mst->total_used));
-		printk(KERN_ERR "\ttotal_dead     %llu\n",
+		pr_err("\ttotal_dead     %llu\n",
 		       (unsigned long long)le64_to_cpu(mst->total_dead));
-		printk(KERN_ERR "\ttotal_dark     %llu\n",
+		pr_err("\ttotal_dark     %llu\n",
 		       (unsigned long long)le64_to_cpu(mst->total_dark));
 		break;
 	}
@@ -443,12 +407,9 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 	{
 		const struct ubifs_ref_node *ref = node;
 
-		printk(KERN_ERR "\tlnum           %u\n",
-		       le32_to_cpu(ref->lnum));
-		printk(KERN_ERR "\toffs           %u\n",
-		       le32_to_cpu(ref->offs));
-		printk(KERN_ERR "\tjhead          %u\n",
-		       le32_to_cpu(ref->jhead));
+		pr_err("\tlnum           %u\n", le32_to_cpu(ref->lnum));
+		pr_err("\toffs           %u\n", le32_to_cpu(ref->offs));
+		pr_err("\tjhead          %u\n", le32_to_cpu(ref->jhead));
 		break;
 	}
 	case UBIFS_INO_NODE:
@@ -456,41 +417,32 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 		const struct ubifs_ino_node *ino = node;
 
 		key_read(c, &ino->key, &key);
-		printk(KERN_ERR "\tkey            %s\n",
+		pr_err("\tkey            %s\n",
 		       dbg_snprintf_key(c, &key, key_buf, DBG_KEY_BUF_LEN));
-		printk(KERN_ERR "\tcreat_sqnum    %llu\n",
+		pr_err("\tcreat_sqnum    %llu\n",
 		       (unsigned long long)le64_to_cpu(ino->creat_sqnum));
-		printk(KERN_ERR "\tsize           %llu\n",
+		pr_err("\tsize           %llu\n",
 		       (unsigned long long)le64_to_cpu(ino->size));
-		printk(KERN_ERR "\tnlink          %u\n",
-		       le32_to_cpu(ino->nlink));
-		printk(KERN_ERR "\tatime          %lld.%u\n",
+		pr_err("\tnlink          %u\n", le32_to_cpu(ino->nlink));
+		pr_err("\tatime          %lld.%u\n",
 		       (long long)le64_to_cpu(ino->atime_sec),
 		       le32_to_cpu(ino->atime_nsec));
-		printk(KERN_ERR "\tmtime          %lld.%u\n",
+		pr_err("\tmtime          %lld.%u\n",
 		       (long long)le64_to_cpu(ino->mtime_sec),
 		       le32_to_cpu(ino->mtime_nsec));
-		printk(KERN_ERR "\tctime          %lld.%u\n",
+		pr_err("\tctime          %lld.%u\n",
 		       (long long)le64_to_cpu(ino->ctime_sec),
 		       le32_to_cpu(ino->ctime_nsec));
-		printk(KERN_ERR "\tuid            %u\n",
-		       le32_to_cpu(ino->uid));
-		printk(KERN_ERR "\tgid            %u\n",
-		       le32_to_cpu(ino->gid));
-		printk(KERN_ERR "\tmode           %u\n",
-		       le32_to_cpu(ino->mode));
-		printk(KERN_ERR "\tflags          %#x\n",
-		       le32_to_cpu(ino->flags));
-		printk(KERN_ERR "\txattr_cnt      %u\n",
-		       le32_to_cpu(ino->xattr_cnt));
-		printk(KERN_ERR "\txattr_size     %u\n",
-		       le32_to_cpu(ino->xattr_size));
-		printk(KERN_ERR "\txattr_names    %u\n",
-		       le32_to_cpu(ino->xattr_names));
-		printk(KERN_ERR "\tcompr_type     %#x\n",
+		pr_err("\tuid            %u\n", le32_to_cpu(ino->uid));
+		pr_err("\tgid            %u\n", le32_to_cpu(ino->gid));
+		pr_err("\tmode           %u\n", le32_to_cpu(ino->mode));
+		pr_err("\tflags          %#x\n", le32_to_cpu(ino->flags));
+		pr_err("\txattr_cnt      %u\n", le32_to_cpu(ino->xattr_cnt));
+		pr_err("\txattr_size     %u\n", le32_to_cpu(ino->xattr_size));
+		pr_err("\txattr_names    %u\n", le32_to_cpu(ino->xattr_names));
+		pr_err("\tcompr_type     %#x\n",
 		       (int)le16_to_cpu(ino->compr_type));
-		printk(KERN_ERR "\tdata len       %u\n",
-		       le32_to_cpu(ino->data_len));
+		pr_err("\tdata len       %u\n", le32_to_cpu(ino->data_len));
 		break;
 	}
 	case UBIFS_DENT_NODE:
@@ -500,21 +452,21 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 		int nlen = le16_to_cpu(dent->nlen);
 
 		key_read(c, &dent->key, &key);
-		printk(KERN_ERR "\tkey            %s\n",
+		pr_err("\tkey            %s\n",
 		       dbg_snprintf_key(c, &key, key_buf, DBG_KEY_BUF_LEN));
-		printk(KERN_ERR "\tinum           %llu\n",
+		pr_err("\tinum           %llu\n",
 		       (unsigned long long)le64_to_cpu(dent->inum));
-		printk(KERN_ERR "\ttype           %d\n", (int)dent->type);
-		printk(KERN_ERR "\tnlen           %d\n", nlen);
-		printk(KERN_ERR "\tname           ");
+		pr_err("\ttype           %d\n", (int)dent->type);
+		pr_err("\tnlen           %d\n", nlen);
+		pr_err("\tname           ");
 
 		if (nlen > UBIFS_MAX_NLEN)
-			printk(KERN_ERR "(bad name length, not printing, bad or corrupted node)");
+			pr_err("(bad name length, not printing, bad or corrupted node)");
 		else {
 			for (i = 0; i < nlen && dent->name[i]; i++)
-				printk(KERN_CONT "%c", dent->name[i]);
+				pr_cont("%c", dent->name[i]);
 		}
-		printk(KERN_CONT "\n");
+		pr_cont("\n");
 
 		break;
 	}
@@ -524,15 +476,13 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 		int dlen = le32_to_cpu(ch->len) - UBIFS_DATA_NODE_SZ;
 
 		key_read(c, &dn->key, &key);
-		printk(KERN_ERR "\tkey            %s\n",
+		pr_err("\tkey            %s\n",
 		       dbg_snprintf_key(c, &key, key_buf, DBG_KEY_BUF_LEN));
-		printk(KERN_ERR "\tsize           %u\n",
-		       le32_to_cpu(dn->size));
-		printk(KERN_ERR "\tcompr_typ      %d\n",
+		pr_err("\tsize           %u\n", le32_to_cpu(dn->size));
+		pr_err("\tcompr_typ      %d\n",
 		       (int)le16_to_cpu(dn->compr_type));
-		printk(KERN_ERR "\tdata size      %d\n",
-		       dlen);
-		printk(KERN_ERR "\tdata:\n");
+		pr_err("\tdata size      %d\n", dlen);
+		pr_err("\tdata:\n");
 		print_hex_dump(KERN_ERR, "\t", DUMP_PREFIX_OFFSET, 32, 1,
 			       (void *)&dn->data, dlen, 0);
 		break;
@@ -541,11 +491,10 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 	{
 		const struct ubifs_trun_node *trun = node;
 
-		printk(KERN_ERR "\tinum           %u\n",
-		       le32_to_cpu(trun->inum));
-		printk(KERN_ERR "\told_size       %llu\n",
+		pr_err("\tinum           %u\n", le32_to_cpu(trun->inum));
+		pr_err("\told_size       %llu\n",
 		       (unsigned long long)le64_to_cpu(trun->old_size));
-		printk(KERN_ERR "\tnew_size       %llu\n",
+		pr_err("\tnew_size       %llu\n",
 		       (unsigned long long)le64_to_cpu(trun->new_size));
 		break;
 	}
@@ -554,17 +503,16 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 		const struct ubifs_idx_node *idx = node;
 
 		n = le16_to_cpu(idx->child_cnt);
-		printk(KERN_ERR "\tchild_cnt      %d\n", n);
-		printk(KERN_ERR "\tlevel          %d\n",
-		       (int)le16_to_cpu(idx->level));
-		printk(KERN_ERR "\tBranches:\n");
+		pr_err("\tchild_cnt      %d\n", n);
+		pr_err("\tlevel          %d\n", (int)le16_to_cpu(idx->level));
+		pr_err("\tBranches:\n");
 
 		for (i = 0; i < n && i < c->fanout - 1; i++) {
 			const struct ubifs_branch *br;
 
 			br = ubifs_idx_branch(c, idx, i);
 			key_read(c, &br->key, &key);
-			printk(KERN_ERR "\t%d: LEB %d:%d len %d key %s\n",
+			pr_err("\t%d: LEB %d:%d len %d key %s\n",
 			       i, le32_to_cpu(br->lnum), le32_to_cpu(br->offs),
 			       le32_to_cpu(br->len),
 			       dbg_snprintf_key(c, &key, key_buf,
@@ -578,20 +526,20 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 	{
 		const struct ubifs_orph_node *orph = node;
 
-		printk(KERN_ERR "\tcommit number  %llu\n",
+		pr_err("\tcommit number  %llu\n",
 		       (unsigned long long)
 				le64_to_cpu(orph->cmt_no) & LLONG_MAX);
-		printk(KERN_ERR "\tlast node flag %llu\n",
+		pr_err("\tlast node flag %llu\n",
 		       (unsigned long long)(le64_to_cpu(orph->cmt_no)) >> 63);
 		n = (le32_to_cpu(ch->len) - UBIFS_ORPH_NODE_SZ) >> 3;
-		printk(KERN_ERR "\t%d orphan inode numbers:\n", n);
+		pr_err("\t%d orphan inode numbers:\n", n);
 		for (i = 0; i < n; i++)
-			printk(KERN_ERR "\t  ino %llu\n",
+			pr_err("\t  ino %llu\n",
 			       (unsigned long long)le64_to_cpu(orph->inos[i]));
 		break;
 	}
 	default:
-		printk(KERN_ERR "node type %d was not recognized\n",
+		pr_err("node type %d was not recognized\n",
 		       (int)ch->node_type);
 	}
 	spin_unlock(&dbg_lock);
@@ -600,16 +548,16 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 void ubifs_dump_budget_req(const struct ubifs_budget_req *req)
 {
 	spin_lock(&dbg_lock);
-	printk(KERN_ERR "Budgeting request: new_ino %d, dirtied_ino %d\n",
+	pr_err("Budgeting request: new_ino %d, dirtied_ino %d\n",
 	       req->new_ino, req->dirtied_ino);
-	printk(KERN_ERR "\tnew_ino_d   %d, dirtied_ino_d %d\n",
+	pr_err("\tnew_ino_d   %d, dirtied_ino_d %d\n",
 	       req->new_ino_d, req->dirtied_ino_d);
-	printk(KERN_ERR "\tnew_page    %d, dirtied_page %d\n",
+	pr_err("\tnew_page    %d, dirtied_page %d\n",
 	       req->new_page, req->dirtied_page);
-	printk(KERN_ERR "\tnew_dent    %d, mod_dent     %d\n",
+	pr_err("\tnew_dent    %d, mod_dent     %d\n",
 	       req->new_dent, req->mod_dent);
-	printk(KERN_ERR "\tidx_growth  %d\n", req->idx_growth);
-	printk(KERN_ERR "\tdata_growth %d dd_growth     %d\n",
+	pr_err("\tidx_growth  %d\n", req->idx_growth);
+	pr_err("\tdata_growth %d dd_growth     %d\n",
 	       req->data_growth, req->dd_growth);
 	spin_unlock(&dbg_lock);
 }
@@ -617,11 +565,11 @@ void ubifs_dump_budget_req(const struct ubifs_budget_req *req)
 void ubifs_dump_lstats(const struct ubifs_lp_stats *lst)
 {
 	spin_lock(&dbg_lock);
-	printk(KERN_ERR "(pid %d) Lprops statistics: empty_lebs %d, idx_lebs  %d\n",
+	pr_err("(pid %d) Lprops statistics: empty_lebs %d, idx_lebs  %d\n",
 	       current->pid, lst->empty_lebs, lst->idx_lebs);
-	printk(KERN_ERR "\ttaken_empty_lebs %d, total_free %lld, total_dirty %lld\n",
+	pr_err("\ttaken_empty_lebs %d, total_free %lld, total_dirty %lld\n",
 	       lst->taken_empty_lebs, lst->total_free, lst->total_dirty);
-	printk(KERN_ERR "\ttotal_used %lld, total_dark %lld, total_dead %lld\n",
+	pr_err("\ttotal_used %lld, total_dark %lld, total_dead %lld\n",
 	       lst->total_used, lst->total_dark, lst->total_dead);
 	spin_unlock(&dbg_lock);
 }
@@ -636,18 +584,17 @@ void ubifs_dump_budg(struct ubifs_info *c, const struct ubifs_budg_info *bi)
 
 	spin_lock(&c->space_lock);
 	spin_lock(&dbg_lock);
-	printk(KERN_ERR "(pid %d) Budgeting info: data budget sum %lld, total budget sum %lld\n",
+	pr_err("(pid %d) Budgeting info: data budget sum %lld, total budget sum %lld\n",
 	       current->pid, bi->data_growth + bi->dd_growth,
 	       bi->data_growth + bi->dd_growth + bi->idx_growth);
-	printk(KERN_ERR "\tbudg_data_growth %lld, budg_dd_growth %lld, budg_idx_growth %lld\n",
+	pr_err("\tbudg_data_growth %lld, budg_dd_growth %lld, budg_idx_growth %lld\n",
 	       bi->data_growth, bi->dd_growth, bi->idx_growth);
-	printk(KERN_ERR "\tmin_idx_lebs %d, old_idx_sz %llu, uncommitted_idx %lld\n",
+	pr_err("\tmin_idx_lebs %d, old_idx_sz %llu, uncommitted_idx %lld\n",
 	       bi->min_idx_lebs, bi->old_idx_sz, bi->uncommitted_idx);
-	printk(KERN_ERR "\tpage_budget %d, inode_budget %d, dent_budget %d\n",
+	pr_err("\tpage_budget %d, inode_budget %d, dent_budget %d\n",
 	       bi->page_budget, bi->inode_budget, bi->dent_budget);
-	printk(KERN_ERR "\tnospace %u, nospace_rp %u\n",
-	       bi->nospace, bi->nospace_rp);
-	printk(KERN_ERR "\tdark_wm %d, dead_wm %d, max_idx_node_sz %d\n",
+	pr_err("\tnospace %u, nospace_rp %u\n", bi->nospace, bi->nospace_rp);
+	pr_err("\tdark_wm %d, dead_wm %d, max_idx_node_sz %d\n",
 	       c->dark_wm, c->dead_wm, c->max_idx_node_sz);
 
 	if (bi != &c->bi)
@@ -658,38 +605,37 @@ void ubifs_dump_budg(struct ubifs_info *c, const struct ubifs_budg_info *bi)
 		 */
 		goto out_unlock;
 
-	printk(KERN_ERR "\tfreeable_cnt %d, calc_idx_sz %lld, idx_gc_cnt %d\n",
+	pr_err("\tfreeable_cnt %d, calc_idx_sz %lld, idx_gc_cnt %d\n",
 	       c->freeable_cnt, c->calc_idx_sz, c->idx_gc_cnt);
-	printk(KERN_ERR "\tdirty_pg_cnt %ld, dirty_zn_cnt %ld, clean_zn_cnt %ld\n",
+	pr_err("\tdirty_pg_cnt %ld, dirty_zn_cnt %ld, clean_zn_cnt %ld\n",
 	       atomic_long_read(&c->dirty_pg_cnt),
 	       atomic_long_read(&c->dirty_zn_cnt),
 	       atomic_long_read(&c->clean_zn_cnt));
-	printk(KERN_ERR "\tgc_lnum %d, ihead_lnum %d\n",
-	       c->gc_lnum, c->ihead_lnum);
+	pr_err("\tgc_lnum %d, ihead_lnum %d\n", c->gc_lnum, c->ihead_lnum);
 
 	/* If we are in R/O mode, journal heads do not exist */
 	if (c->jheads)
 		for (i = 0; i < c->jhead_cnt; i++)
-			printk(KERN_ERR "\tjhead %s\t LEB %d\n",
+			pr_err("\tjhead %s\t LEB %d\n",
 			       dbg_jhead(c->jheads[i].wbuf.jhead),
 			       c->jheads[i].wbuf.lnum);
 	for (rb = rb_first(&c->buds); rb; rb = rb_next(rb)) {
 		bud = rb_entry(rb, struct ubifs_bud, rb);
-		printk(KERN_ERR "\tbud LEB %d\n", bud->lnum);
+		pr_err("\tbud LEB %d\n", bud->lnum);
 	}
 	list_for_each_entry(bud, &c->old_buds, list)
-		printk(KERN_ERR "\told bud LEB %d\n", bud->lnum);
+		pr_err("\told bud LEB %d\n", bud->lnum);
 	list_for_each_entry(idx_gc, &c->idx_gc, list)
-		printk(KERN_ERR "\tGC'ed idx LEB %d unmap %d\n",
+		pr_err("\tGC'ed idx LEB %d unmap %d\n",
 		       idx_gc->lnum, idx_gc->unmap);
-	printk(KERN_ERR "\tcommit state %d\n", c->cmt_state);
+	pr_err("\tcommit state %d\n", c->cmt_state);
 
 	/* Print budgeting predictions */
 	available = ubifs_calc_available(c, c->bi.min_idx_lebs);
 	outstanding = c->bi.data_growth + c->bi.dd_growth;
 	free = ubifs_get_free_space_nolock(c);
-	printk(KERN_ERR "Budgeting predictions:\n");
-	printk(KERN_ERR "\tavailable: %lld, outstanding %lld, free %lld\n",
+	pr_err("Budgeting predictions:\n");
+	pr_err("\tavailable: %lld, outstanding %lld, free %lld\n",
 	       available, outstanding, free);
 out_unlock:
 	spin_unlock(&dbg_lock);
@@ -709,19 +655,19 @@ void ubifs_dump_lprop(const struct ubifs_info *c, const struct ubifs_lprops *lp)
 		dark = ubifs_calc_dark(c, spc);
 
 	if (lp->flags & LPROPS_INDEX)
-		printk(KERN_ERR "LEB %-7d free %-8d dirty %-8d used %-8d free + dirty %-8d flags %#x (",
+		pr_err("LEB %-7d free %-8d dirty %-8d used %-8d free + dirty %-8d flags %#x (",
 		       lp->lnum, lp->free, lp->dirty, c->leb_size - spc, spc,
 		       lp->flags);
 	else
-		printk(KERN_ERR "LEB %-7d free %-8d dirty %-8d used %-8d free + dirty %-8d dark %-4d dead %-4d nodes fit %-3d flags %#-4x (",
+		pr_err("LEB %-7d free %-8d dirty %-8d used %-8d free + dirty %-8d dark %-4d dead %-4d nodes fit %-3d flags %#-4x (",
 		       lp->lnum, lp->free, lp->dirty, c->leb_size - spc, spc,
 		       dark, dead, (int)(spc / UBIFS_MAX_NODE_SZ), lp->flags);
 
 	if (lp->flags & LPROPS_TAKEN) {
 		if (lp->flags & LPROPS_INDEX)
-			printk(KERN_CONT "index, taken");
+			pr_cont("index, taken");
 		else
-			printk(KERN_CONT "taken");
+			pr_cont("taken");
 	} else {
 		const char *s;
 
@@ -758,7 +704,7 @@ void ubifs_dump_lprop(const struct ubifs_info *c, const struct ubifs_lprops *lp)
 				break;
 			}
 		}
-		printk(KERN_CONT "%s", s);
+		pr_cont("%s", s);
 	}
 
 	for (rb = rb_first((struct rb_root *)&c->buds); rb; rb = rb_next(rb)) {
@@ -773,19 +719,18 @@ void ubifs_dump_lprop(const struct ubifs_info *c, const struct ubifs_lprops *lp)
 				 */
 				if (c->jheads &&
 				    lp->lnum == c->jheads[i].wbuf.lnum) {
-					printk(KERN_CONT ", jhead %s",
-					       dbg_jhead(i));
+					pr_cont(", jhead %s", dbg_jhead(i));
 					head = 1;
 				}
 			}
 			if (!head)
-				printk(KERN_CONT ", bud of jhead %s",
+				pr_cont(", bud of jhead %s",
 				       dbg_jhead(bud->jhead));
 		}
 	}
 	if (lp->lnum == c->gc_lnum)
-		printk(KERN_CONT ", GC LEB");
-	printk(KERN_CONT ")\n");
+		pr_cont(", GC LEB");
+	pr_cont(")\n");
 }
 
 void ubifs_dump_lprops(struct ubifs_info *c)
@@ -794,8 +739,7 @@ void ubifs_dump_lprops(struct ubifs_info *c)
 	struct ubifs_lprops lp;
 	struct ubifs_lp_stats lst;
 
-	printk(KERN_ERR "(pid %d) start dumping LEB properties\n",
-	       current->pid);
+	pr_err("(pid %d) start dumping LEB properties\n", current->pid);
 	ubifs_get_lp_stats(c, &lst);
 	ubifs_dump_lstats(&lst);
 
@@ -806,8 +750,7 @@ void ubifs_dump_lprops(struct ubifs_info *c)
 
 		ubifs_dump_lprop(c, &lp);
 	}
-	printk(KERN_ERR "(pid %d) finish dumping LEB properties\n",
-	       current->pid);
+	pr_err("(pid %d) finish dumping LEB properties\n", current->pid);
 }
 
 void ubifs_dump_lpt_info(struct ubifs_info *c)
@@ -815,35 +758,34 @@ void ubifs_dump_lpt_info(struct ubifs_info *c)
 	int i;
 
 	spin_lock(&dbg_lock);
-	printk(KERN_ERR "(pid %d) dumping LPT information\n", current->pid);
-	printk(KERN_ERR "\tlpt_sz:        %lld\n", c->lpt_sz);
-	printk(KERN_ERR "\tpnode_sz:      %d\n", c->pnode_sz);
-	printk(KERN_ERR "\tnnode_sz:      %d\n", c->nnode_sz);
-	printk(KERN_ERR "\tltab_sz:       %d\n", c->ltab_sz);
-	printk(KERN_ERR "\tlsave_sz:      %d\n", c->lsave_sz);
-	printk(KERN_ERR "\tbig_lpt:       %d\n", c->big_lpt);
-	printk(KERN_ERR "\tlpt_hght:      %d\n", c->lpt_hght);
-	printk(KERN_ERR "\tpnode_cnt:     %d\n", c->pnode_cnt);
-	printk(KERN_ERR "\tnnode_cnt:     %d\n", c->nnode_cnt);
-	printk(KERN_ERR "\tdirty_pn_cnt:  %d\n", c->dirty_pn_cnt);
-	printk(KERN_ERR "\tdirty_nn_cnt:  %d\n", c->dirty_nn_cnt);
-	printk(KERN_ERR "\tlsave_cnt:     %d\n", c->lsave_cnt);
-	printk(KERN_ERR "\tspace_bits:    %d\n", c->space_bits);
-	printk(KERN_ERR "\tlpt_lnum_bits: %d\n", c->lpt_lnum_bits);
-	printk(KERN_ERR "\tlpt_offs_bits: %d\n", c->lpt_offs_bits);
-	printk(KERN_ERR "\tlpt_spc_bits:  %d\n", c->lpt_spc_bits);
-	printk(KERN_ERR "\tpcnt_bits:     %d\n", c->pcnt_bits);
-	printk(KERN_ERR "\tlnum_bits:     %d\n", c->lnum_bits);
-	printk(KERN_ERR "\tLPT root is at %d:%d\n", c->lpt_lnum, c->lpt_offs);
-	printk(KERN_ERR "\tLPT head is at %d:%d\n",
+	pr_err("(pid %d) dumping LPT information\n", current->pid);
+	pr_err("\tlpt_sz:        %lld\n", c->lpt_sz);
+	pr_err("\tpnode_sz:      %d\n", c->pnode_sz);
+	pr_err("\tnnode_sz:      %d\n", c->nnode_sz);
+	pr_err("\tltab_sz:       %d\n", c->ltab_sz);
+	pr_err("\tlsave_sz:      %d\n", c->lsave_sz);
+	pr_err("\tbig_lpt:       %d\n", c->big_lpt);
+	pr_err("\tlpt_hght:      %d\n", c->lpt_hght);
+	pr_err("\tpnode_cnt:     %d\n", c->pnode_cnt);
+	pr_err("\tnnode_cnt:     %d\n", c->nnode_cnt);
+	pr_err("\tdirty_pn_cnt:  %d\n", c->dirty_pn_cnt);
+	pr_err("\tdirty_nn_cnt:  %d\n", c->dirty_nn_cnt);
+	pr_err("\tlsave_cnt:     %d\n", c->lsave_cnt);
+	pr_err("\tspace_bits:    %d\n", c->space_bits);
+	pr_err("\tlpt_lnum_bits: %d\n", c->lpt_lnum_bits);
+	pr_err("\tlpt_offs_bits: %d\n", c->lpt_offs_bits);
+	pr_err("\tlpt_spc_bits:  %d\n", c->lpt_spc_bits);
+	pr_err("\tpcnt_bits:     %d\n", c->pcnt_bits);
+	pr_err("\tlnum_bits:     %d\n", c->lnum_bits);
+	pr_err("\tLPT root is at %d:%d\n", c->lpt_lnum, c->lpt_offs);
+	pr_err("\tLPT head is at %d:%d\n",
 	       c->nhead_lnum, c->nhead_offs);
-	printk(KERN_ERR "\tLPT ltab is at %d:%d\n",
-	       c->ltab_lnum, c->ltab_offs);
+	pr_err("\tLPT ltab is at %d:%d\n", c->ltab_lnum, c->ltab_offs);
 	if (c->big_lpt)
-		printk(KERN_ERR "\tLPT lsave is at %d:%d\n",
+		pr_err("\tLPT lsave is at %d:%d\n",
 		       c->lsave_lnum, c->lsave_offs);
 	for (i = 0; i < c->lpt_lebs; i++)
-		printk(KERN_ERR "\tLPT LEB %d free %d dirty %d tgc %d cmt %d\n",
+		pr_err("\tLPT LEB %d free %d dirty %d tgc %d cmt %d\n",
 		       i + c->lpt_first, c->ltab[i].free, c->ltab[i].dirty,
 		       c->ltab[i].tgc, c->ltab[i].cmt);
 	spin_unlock(&dbg_lock);
@@ -854,12 +796,12 @@ void ubifs_dump_sleb(const struct ubifs_info *c,
 {
 	struct ubifs_scan_node *snod;
 
-	printk(KERN_ERR "(pid %d) start dumping scanned data from LEB %d:%d\n",
+	pr_err("(pid %d) start dumping scanned data from LEB %d:%d\n",
 	       current->pid, sleb->lnum, offs);
 
 	list_for_each_entry(snod, &sleb->nodes, list) {
 		cond_resched();
-		printk(KERN_ERR "Dumping node at LEB %d:%d len %d\n",
+		pr_err("Dumping node at LEB %d:%d len %d\n",
 		       sleb->lnum, snod->offs, snod->len);
 		ubifs_dump_node(c, snod->node);
 	}
@@ -871,8 +813,7 @@ void ubifs_dump_leb(const struct ubifs_info *c, int lnum)
 	struct ubifs_scan_node *snod;
 	void *buf;
 
-	printk(KERN_ERR "(pid %d) start dumping LEB %d\n",
-	       current->pid, lnum);
+	pr_err("(pid %d) start dumping LEB %d\n", current->pid, lnum);
 
 	buf = __vmalloc(c->leb_size, GFP_NOFS, PAGE_KERNEL);
 	if (!buf) {
@@ -886,18 +827,17 @@ void ubifs_dump_leb(const struct ubifs_info *c, int lnum)
 		goto out;
 	}
 
-	printk(KERN_ERR "LEB %d has %d nodes ending at %d\n", lnum,
+	pr_err("LEB %d has %d nodes ending at %d\n", lnum,
 	       sleb->nodes_cnt, sleb->endpt);
 
 	list_for_each_entry(snod, &sleb->nodes, list) {
 		cond_resched();
-		printk(KERN_ERR "Dumping node at LEB %d:%d len %d\n", lnum,
+		pr_err("Dumping node at LEB %d:%d len %d\n", lnum,
 		       snod->offs, snod->len);
 		ubifs_dump_node(c, snod->node);
 	}
 
-	printk(KERN_ERR "(pid %d) finish dumping LEB %d\n",
-	       current->pid, lnum);
+	pr_err("(pid %d) finish dumping LEB %d\n", current->pid, lnum);
 	ubifs_scan_destroy(sleb);
 
 out:
@@ -918,7 +858,7 @@ void ubifs_dump_znode(const struct ubifs_info *c,
 	else
 		zbr = &c->zroot;
 
-	printk(KERN_ERR "znode %p, LEB %d:%d len %d parent %p iip %d level %d child_cnt %d flags %lx\n",
+	pr_err("znode %p, LEB %d:%d len %d parent %p iip %d level %d child_cnt %d flags %lx\n",
 	       znode, zbr->lnum, zbr->offs, zbr->len, znode->parent, znode->iip,
 	       znode->level, znode->child_cnt, znode->flags);
 
@@ -927,16 +867,16 @@ void ubifs_dump_znode(const struct ubifs_info *c,
 		return;
 	}
 
-	printk(KERN_ERR "zbranches:\n");
+	pr_err("zbranches:\n");
 	for (n = 0; n < znode->child_cnt; n++) {
 		zbr = &znode->zbranch[n];
 		if (znode->level > 0)
-			printk(KERN_ERR "\t%d: znode %p LEB %d:%d len %d key %s\n",
+			pr_err("\t%d: znode %p LEB %d:%d len %d key %s\n",
 			       n, zbr->znode, zbr->lnum, zbr->offs, zbr->len,
 			       dbg_snprintf_key(c, &zbr->key, key_buf,
 						DBG_KEY_BUF_LEN));
 		else
-			printk(KERN_ERR "\t%d: LNC %p LEB %d:%d len %d key %s\n",
+			pr_err("\t%d: LNC %p LEB %d:%d len %d key %s\n",
 			       n, zbr->znode, zbr->lnum, zbr->offs, zbr->len,
 			       dbg_snprintf_key(c, &zbr->key, key_buf,
 						DBG_KEY_BUF_LEN));
@@ -948,16 +888,16 @@ void ubifs_dump_heap(struct ubifs_info *c, struct ubifs_lpt_heap *heap, int cat)
 {
 	int i;
 
-	printk(KERN_ERR "(pid %d) start dumping heap cat %d (%d elements)\n",
+	pr_err("(pid %d) start dumping heap cat %d (%d elements)\n",
 	       current->pid, cat, heap->cnt);
 	for (i = 0; i < heap->cnt; i++) {
 		struct ubifs_lprops *lprops = heap->arr[i];
 
-		printk(KERN_ERR "\t%d. LEB %d hpos %d free %d dirty %d flags %d\n",
+		pr_err("\t%d. LEB %d hpos %d free %d dirty %d flags %d\n",
 		       i, lprops->lnum, lprops->hpos, lprops->free,
 		       lprops->dirty, lprops->flags);
 	}
-	printk(KERN_ERR "(pid %d) finish dumping heap\n", current->pid);
+	pr_err("(pid %d) finish dumping heap\n", current->pid);
 }
 
 void ubifs_dump_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
@@ -965,15 +905,15 @@ void ubifs_dump_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
 {
 	int i;
 
-	printk(KERN_ERR "(pid %d) dumping pnode:\n", current->pid);
-	printk(KERN_ERR "\taddress %zx parent %zx cnext %zx\n",
+	pr_err("(pid %d) dumping pnode:\n", current->pid);
+	pr_err("\taddress %zx parent %zx cnext %zx\n",
 	       (size_t)pnode, (size_t)parent, (size_t)pnode->cnext);
-	printk(KERN_ERR "\tflags %lu iip %d level %d num %d\n",
+	pr_err("\tflags %lu iip %d level %d num %d\n",
 	       pnode->flags, iip, pnode->level, pnode->num);
 	for (i = 0; i < UBIFS_LPT_FANOUT; i++) {
 		struct ubifs_lprops *lp = &pnode->lprops[i];
 
-		printk(KERN_ERR "\t%d: free %d dirty %d flags %d lnum %d\n",
+		pr_err("\t%d: free %d dirty %d flags %d lnum %d\n",
 		       i, lp->free, lp->dirty, lp->flags, lp->lnum);
 	}
 }
@@ -983,20 +923,20 @@ void ubifs_dump_tnc(struct ubifs_info *c)
 	struct ubifs_znode *znode;
 	int level;
 
-	printk(KERN_ERR "\n");
-	printk(KERN_ERR "(pid %d) start dumping TNC tree\n", current->pid);
+	pr_err("\n");
+	pr_err("(pid %d) start dumping TNC tree\n", current->pid);
 	znode = ubifs_tnc_levelorder_next(c->zroot.znode, NULL);
 	level = znode->level;
-	printk(KERN_ERR "== Level %d ==\n", level);
+	pr_err("== Level %d ==\n", level);
 	while (znode) {
 		if (level != znode->level) {
 			level = znode->level;
-			printk(KERN_ERR "== Level %d ==\n", level);
+			pr_err("== Level %d ==\n", level);
 		}
 		ubifs_dump_znode(c, znode);
 		znode = ubifs_tnc_levelorder_next(c->zroot.znode, znode);
 	}
-	printk(KERN_ERR "(pid %d) finish dumping TNC tree\n", current->pid);
+	pr_err("(pid %d) finish dumping TNC tree\n", current->pid);
 }
 
 static int dump_znode(struct ubifs_info *c, struct ubifs_znode *znode,
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 46b8dd1..38230b1 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -150,7 +150,7 @@ struct ubifs_global_debug_info {
 
 #define ubifs_assert(expr) do {                                                \
 	if (unlikely(!(expr))) {                                               \
-		printk(KERN_CRIT "UBIFS assert failed in %s at %u (pid %d)\n", \
+		pr_crit("UBIFS assert failed in %s at %u (pid %d)\n",          \
 		       __func__, __LINE__, current->pid);                      \
 		dump_stack();                                                  \
 	}                                                                      \
@@ -159,7 +159,7 @@ struct ubifs_global_debug_info {
 #define ubifs_assert_cmt_locked(c) do {                                        \
 	if (unlikely(down_write_trylock(&(c)->commit_sem))) {                  \
 		up_write(&(c)->commit_sem);                                    \
-		printk(KERN_CRIT "commit lock is not locked!\n");              \
+		pr_crit("commit lock is not locked!\n");                       \
 		ubifs_assert(0);                                               \
 	}                                                                      \
 } while (0)
@@ -178,7 +178,7 @@ struct ubifs_global_debug_info {
 
 /* Just a debugging messages not related to any specific UBIFS subsystem */
 #define dbg_msg(fmt, ...)                                                      \
-	printk(KERN_DEBUG "UBIFS DBG (pid %d): %s: " fmt "\n", current->pid,   \
+	pr_err("UBIFS DBG (pid %d): %s: " fmt "\n", current->pid,              \
 	       __func__, ##__VA_ARGS__)
 
 /* General messages */
diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index 7408255..a1de3cf 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -1886,8 +1886,7 @@ static void dump_lpt_leb(const struct ubifs_info *c, int lnum)
 	int err, len = c->leb_size, node_type, node_num, node_len, offs;
 	void *buf, *p;
 
-	printk(KERN_DEBUG "(pid %d) start dumping LEB %d\n",
-	       current->pid, lnum);
+	pr_err("(pid %d) start dumping LEB %d\n", current->pid, lnum);
 	buf = p = __vmalloc(c->leb_size, GFP_NOFS, PAGE_KERNEL);
 	if (!buf) {
 		ubifs_err("cannot allocate memory to dump LPT");
@@ -1905,14 +1904,14 @@ static void dump_lpt_leb(const struct ubifs_info *c, int lnum)
 
 			pad_len = get_pad_len(c, p, len);
 			if (pad_len) {
-				printk(KERN_DEBUG "LEB %d:%d, pad %d bytes\n",
+				pr_err("LEB %d:%d, pad %d bytes\n",
 				       lnum, offs, pad_len);
 				p += pad_len;
 				len -= pad_len;
 				continue;
 			}
 			if (len)
-				printk(KERN_DEBUG "LEB %d:%d, free %d bytes\n",
+				pr_err("LEB %d:%d, free %d bytes\n",
 				       lnum, offs, len);
 			break;
 		}
@@ -1923,11 +1922,10 @@ static void dump_lpt_leb(const struct ubifs_info *c, int lnum)
 		{
 			node_len = c->pnode_sz;
 			if (c->big_lpt)
-				printk(KERN_DEBUG "LEB %d:%d, pnode num %d\n",
+				pr_err("LEB %d:%d, pnode num %d\n",
 				       lnum, offs, node_num);
 			else
-				printk(KERN_DEBUG "LEB %d:%d, pnode\n",
-				       lnum, offs);
+				pr_err("LEB %d:%d, pnode\n", lnum, offs);
 			break;
 		}
 		case UBIFS_LPT_NNODE:
@@ -1937,29 +1935,28 @@ static void dump_lpt_leb(const struct ubifs_info *c, int lnum)
 
 			node_len = c->nnode_sz;
 			if (c->big_lpt)
-				printk(KERN_DEBUG "LEB %d:%d, nnode num %d, ",
+				pr_err("LEB %d:%d, nnode num %d, ",
 				       lnum, offs, node_num);
 			else
-				printk(KERN_DEBUG "LEB %d:%d, nnode, ",
+				pr_err("LEB %d:%d, nnode, ",
 				       lnum, offs);
 			err = ubifs_unpack_nnode(c, p, &nnode);
 			for (i = 0; i < UBIFS_LPT_FANOUT; i++) {
-				printk(KERN_CONT "%d:%d", nnode.nbranch[i].lnum,
+				pr_cont("%d:%d", nnode.nbranch[i].lnum,
 				       nnode.nbranch[i].offs);
 				if (i != UBIFS_LPT_FANOUT - 1)
-					printk(KERN_CONT ", ");
+					pr_cont(", ");
 			}
-			printk(KERN_CONT "\n");
+			pr_cont("\n");
 			break;
 		}
 		case UBIFS_LPT_LTAB:
 			node_len = c->ltab_sz;
-			printk(KERN_DEBUG "LEB %d:%d, ltab\n",
-			       lnum, offs);
+			pr_err("LEB %d:%d, ltab\n", lnum, offs);
 			break;
 		case UBIFS_LPT_LSAVE:
 			node_len = c->lsave_sz;
-			printk(KERN_DEBUG "LEB %d:%d, lsave len\n", lnum, offs);
+			pr_err("LEB %d:%d, lsave len\n", lnum, offs);
 			break;
 		default:
 			ubifs_err("LPT node type %d not recognized", node_type);
@@ -1970,8 +1967,7 @@ static void dump_lpt_leb(const struct ubifs_info *c, int lnum)
 		len -= node_len;
 	}
 
-	printk(KERN_DEBUG "(pid %d) finish dumping LEB %d\n",
-	       current->pid, lnum);
+	pr_err("(pid %d) finish dumping LEB %d\n", current->pid, lnum);
 out:
 	vfree(buf);
 	return;
@@ -1988,12 +1984,10 @@ void ubifs_dump_lpt_lebs(const struct ubifs_info *c)
 {
 	int i;
 
-	printk(KERN_DEBUG "(pid %d) start dumping all LPT LEBs\n",
-	       current->pid);
+	pr_err("(pid %d) start dumping all LPT LEBs\n", current->pid);
 	for (i = 0; i < c->lpt_lebs; i++)
 		dump_lpt_leb(c, i + c->lpt_first);
-	printk(KERN_DEBUG "(pid %d) finish dumping all LPT LEBs\n",
-	       current->pid);
+	pr_err("(pid %d) finish dumping all LPT LEBs\n", current->pid);
 }
 
 /**
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 1e5a086..e6a9275 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -42,16 +42,15 @@
 #define UBIFS_VERSION 1
 
 /* Normal UBIFS messages */
-#define ubifs_msg(fmt, ...) \
-		printk(KERN_NOTICE "UBIFS: " fmt "\n", ##__VA_ARGS__)
+#define ubifs_msg(fmt, ...) pr_notice("UBIFS: " fmt "\n", ##__VA_ARGS__)
 /* UBIFS error messages */
-#define ubifs_err(fmt, ...)                                                  \
-	printk(KERN_ERR "UBIFS error (pid %d): %s: " fmt "\n", current->pid, \
+#define ubifs_err(fmt, ...)                                         \
+	pr_err("UBIFS error (pid %d): %s: " fmt "\n", current->pid, \
 	       __func__, ##__VA_ARGS__)
 /* UBIFS warning messages */
-#define ubifs_warn(fmt, ...)                                         \
-	printk(KERN_WARNING "UBIFS warning (pid %d): %s: " fmt "\n", \
-	       current->pid, __func__, ##__VA_ARGS__)
+#define ubifs_warn(fmt, ...)                                        \
+	pr_warn("UBIFS warning (pid %d): %s: " fmt "\n",            \
+		current->pid, __func__, ##__VA_ARGS__)
 
 /* UBIFS file system VFS magic number */
 #define UBIFS_SUPER_MAGIC 0x24051905
-- 
1.7.10.4
