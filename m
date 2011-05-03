Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QH9Kc-000579-6J
	for linux-mtd@lists.infradead.org; Tue, 03 May 2011 06:43:39 +0000
Received: by vxd2 with SMTP id 2so5937802vxd.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 02 May 2011 23:43:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1303804811.2778.37.camel@localhost>
References: <BANLkTi=CNSd8JrWPL-o-WHe-kS-L7pFNqg@mail.gmail.com>
	<1303804811.2778.37.camel@localhost>
Date: Tue, 3 May 2011 02:43:35 -0400
Message-ID: <BANLkTimaW4hu6QrPEyMcCVWDzHd+5hVo+A@mail.gmail.com>
Subject: Re: Programming ubinized images
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: bengardiner@nanometrics.ca, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 26, 2011 at 4:00 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>
> We could teach the UBIFS tools and the kernel to deal with these things.
> It is possible to do with a special flag in the UBIFS superblock which
> would say - this FS has been just flashed, do not use space in
> half-filled eraseblocks! Then probably we could go through these
> half-filled eraseblocks and fix them up, and then remove that flag.
>

Hi Artem, could you take a look at this patch when you get a chance?

My method for finding & cleaning the in-use LEBs is hacky: I just loop
through all the LEBs in the FS, look up each one in the LPT, and
"recover" anything not flagged as empty.  I *think* that should result
in LEBs that have trailing empty space (SCANNED_EMPTY_SPACE) being
re-mapped to a new PEB (via fix_unclean_leb()), which would clean up
the empty pages.  So far I haven't gotten that condition to trigger
with a real UBIFS image, so I'm not sure if it works correctly yet.

I may be way off on the wrong track though, so I just wanted to see if
you think this seems like a reasonable way of doing it.  Thanks!


diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index f7515bd..fc2c48b 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -316,6 +316,8 @@ void dbg_dump_node(const struct ubifs_info *c,
const void *node)
 		printk(KERN_DEBUG "\tflags          %#x\n", sup_flags);
 		printk(KERN_DEBUG "\t  big_lpt      %u\n",
 		       !!(sup_flags & UBIFS_FLG_BIGLPT));
+		printk(KERN_DEBUG "\t  leb_fixup    %u\n",
+		       !!(sup_flags & UBIFS_FLG_LEB_FIXUP));
 		printk(KERN_DEBUG "\tmin_io_size    %u\n",
 		       le32_to_cpu(sup->min_io_size));
 		printk(KERN_DEBUG "\tleb_size       %u\n",
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index bf31b47..1977ed2 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -80,7 +80,8 @@ static int create_default_filesystem(struct ubifs_info *c)
 	struct ubifs_cs_node *cs;
 	union ubifs_key key;
 	int err, tmp, jnl_lebs, log_lebs, max_buds, main_lebs, main_first;
-	int lpt_lebs, lpt_first, orph_lebs, big_lpt, ino_waste, sup_flags = 0;
+	int lpt_lebs, lpt_first, orph_lebs, big_lpt, leb_fixup, ino_waste;
+	int sup_flags = 0;
 	int min_leb_cnt = UBIFS_MIN_LEB_CNT;
 	long long tmp64, main_bytes;
 	__le64 tmp_le64;
@@ -155,6 +156,7 @@ static int create_default_filesystem(struct ubifs_info *c)
 		lpt_first + lpt_lebs - 1);

 	main_first = c->leb_cnt - main_lebs;
+	leb_fixup = 0; /* Normally no need to fixup a fresh [empty] FS */

 	/* Create default superblock */
 	tmp = ALIGN(UBIFS_SB_NODE_SZ, c->min_io_size);
@@ -165,6 +167,8 @@ static int create_default_filesystem(struct ubifs_info *c)
 	tmp64 = (long long)max_buds * c->leb_size;
 	if (big_lpt)
 		sup_flags |= UBIFS_FLG_BIGLPT;
+	if (leb_fixup)
+		sup_flags |= UBIFS_FLG_LEB_FIXUP;

 	sup->ch.node_type  = UBIFS_SB_NODE;
 	sup->key_hash      = UBIFS_KEY_HASH_R5;
@@ -616,6 +620,7 @@ int ubifs_read_superblock(struct ubifs_info *c)
 	c->vfs_sb->s_time_gran = le32_to_cpu(sup->time_gran);
 	memcpy(&c->uuid, &sup->uuid, 16);
 	c->big_lpt = !!(sup_flags & UBIFS_FLG_BIGLPT);
+	c->leb_fixup = !!(sup_flags & UBIFS_FLG_LEB_FIXUP);

 	/* Automatically increase file system size to the maximum size */
 	c->old_leb_cnt = c->leb_cnt;
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 1f049ae..8345517 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1153,6 +1153,78 @@ static int check_free_space(struct ubifs_info *c)
 }

 /**
+ * ubifs_mount_fixup_lebs - erase empty pages on first mount (for NAND)
+ * @c: UBIFS file-system description object
+ *
+ * This function fixes up LEBs on first mount, if the appropriate flag was set
+ * when the FS was created.  Each LEB with trailing "empty" (all-0xff) pages
+ * is re-written, to make sure the empty space is actually erased.  This is
+ * necessary for some NAND chips, since the 0xff data may have been programmed
+ * like real data (generating a non-0xff ECC), causing future writes to the
+ * not-really-erased pages to behave badly.
+ */
+static int ubifs_mount_fixup_lebs(struct ubifs_info *c)
+{
+	int lnum, err = 0;
+	int sup_flags = 0;
+	struct ubifs_sb_node *sup;
+	struct ubifs_scan_leb *sleb;
+
+	ubifs_assert(c->leb_fixup);
+	ubifs_assert(!c->ro_mount);
+
+	ubifs_msg("LEB fixup needed");
+
+	ubifs_get_lprops(c);
+
+	/*
+	 * Try and "recover" any currently-mapped LEB, which will truly erase
+	 * any empty pages (they might currently exist as real 0xff data).
+	 */
+	for (lnum = 2; lnum <= c->leb_cnt; lnum++) {
+		lprops=ubifs_lpt_lookup(c, lnum);
+		if (IS_ERR(lprops)) {
+			err = PTR_ERR(lprops);
+			return err;
+		}
+
+		if (!(lprops->flags & LPROPS_EMPTY)) {
+			sleb = ubifs_recover_leb(c, lnum, 0, c->sbuf, 0);
+			if (IS_ERR(sleb)) {
+				err = PTR_ERR(sleb);
+				return err;
+			}
+			ubifs_scan_destroy(sleb);
+		}
+	}
+
+	ubifs_release_lprops(c);
+
+	sup = ubifs_read_sb_node(c);
+	if (IS_ERR(sup)) {
+		err = PTR_ERR(sup);
+		goto out;
+	}
+
+	/* LEB fixup is no longer required */
+	c->leb_fixup = 0;
+
+	/* Set new flags, omitting LEB fixup */
+	sup_flags = 0;
+	if (c->big_lpt)
+		sup_flags |= UBIFS_FLG_BIGLPT;
+	sup->flags = cpu_to_le32(sup_flags);
+
+	err = ubifs_write_sb_node(c, sup);
+	if (err)
+		goto out;
+
+	ubifs_msg("LEB fixup complete");
+out:
+	return err;
+}
+
+/**
  * mount_ubifs - mount UBIFS file-system.
  * @c: UBIFS file-system description object
  *
@@ -1396,6 +1468,12 @@ static int mount_ubifs(struct ubifs_info *c)
 	} else
 		ubifs_assert(c->lst.taken_empty_lebs > 0);

+	if (!c->ro_mount && c->leb_fixup) {
+		err = ubifs_mount_fixup_lebs(c);
+		if (err)
+			goto out_infos;
+	}
+
 	err = dbg_check_filesystem(c);
 	if (err)
 		goto out_infos;
@@ -1684,7 +1762,16 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 		 * because, for example, the old index size was imprecise.
 		 */
 		err = dbg_check_space_info(c);
+		if (err)
+			goto out;
 	}
+
+	if (c->leb_fixup) {
+		err = ubifs_mount_fixup_lebs(c);
+		if (err)
+			goto out;
+	}
+
 	mutex_unlock(&c->umount_mutex);
 	return err;

diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
index b922f03..dfffa5a 100644
--- a/fs/ubifs/ubifs-media.h
+++ b/fs/ubifs/ubifs-media.h
@@ -408,9 +408,11 @@ enum {
  * Superblock flags.
  *
  * UBIFS_FLG_BIGLPT: if "big" LPT model is used if set
+ * UBIFS_FLG_LEB_FIXUP: first-mount "fixup" of empty pages in LEBs needed
  */
 enum {
 	UBIFS_FLG_BIGLPT = 0x02,
+	UBIFS_FLG_LEB_FIXUP = 0x04,
 };

 /**
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 26a7ebe..c3d5544 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1254,6 +1254,7 @@ struct ubifs_info {
 	wait_queue_head_t cmt_wq;

 	unsigned int big_lpt:1;
+	unsigned int leb_fixup:1;
 	unsigned int no_chk_data_crc:1;
 	unsigned int bulk_read:1;
 	unsigned int default_compr:2;

-- 
Matthew L. Creech
