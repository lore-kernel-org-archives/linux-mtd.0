Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QHOUk-000493-7B
	for linux-mtd@lists.infradead.org; Tue, 03 May 2011 22:55:07 +0000
Received: by mail-vx0-f177.google.com with SMTP id 2so681073vxd.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 03 May 2011 15:55:06 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 3 May 2011 18:55:05 -0400
Message-ID: <BANLkTin-7YDkQ+k8bD1E2D8Qa-VsNyoK-Q@mail.gmail.com>
Subject: [PATCH 2/3] ubifs: add ubifs_mount_fixup_lebs()
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This call scans all LEBs in the filesystem for those that are in-use but have
one or more empty pages at the end, then re-maps the LEBs in order to erase the
empty portions.  Afterward it removes the "leb_fixup" flag from the UBIFS
superblock.

Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
---
 fs/ubifs/sb.c    |  136 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/ubifs.h |    1 +
 2 files changed, 137 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index e3777d0..2afc3ad 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -652,3 +652,139 @@ out:
 	kfree(sup);
 	return err;
 }
+
+/**
+ * ubifs_fixup_leb - scan LEB for empty pages & remap if needed
+ * @c: UBIFS file-system description object
+ * @lnum: LEB number
+ * @nfree: Number of free bytes at the end of the LEB
+ *
+ * This function reads the contents of the given LEB, then remaps it to a
+ * new PEB, so that any empty pages are actually erased on flash (rather than
+ * being just all-0xff real data).
+ */
+static int ubifs_fixup_leb(struct ubifs_info *c, int lnum, int nfree)
+{
+	int err = 0, aligned_len;
+	int len = c->leb_size - nfree;
+	void *sbuf = c->sbuf;
+
+	if (unlikely(len<=0))
+		return 0;
+
+	dbg_mnt("fixup LEB %d (len %d)", lnum, len);
+
+	/* Read the existing valid data for this LEB */
+	err = ubi_read(c->ubi, lnum, sbuf, 0, len);
+	if (err && err != -EBADMSG) {
+		ubifs_err("cannot read %d bytes from LEB %d, error %d",
+			  len, lnum, err);
+		goto out;
+	}
+
+	/* Pad if necessary */
+	aligned_len = ALIGN(len, c->min_io_size);
+	if (aligned_len > len) {
+		int pad_len = aligned_len - ALIGN(len, 8);
+
+		if (pad_len > 0) {
+			void *buf = sbuf + aligned_len - pad_len;
+
+			ubifs_pad(c, buf, pad_len);
+		}
+	}
+
+	/* Atomically change this LEB's mapping */
+	err = ubi_leb_change(c->ubi, lnum, sbuf, aligned_len, UBI_UNKNOWN);
+out:
+	return err;
+}
+
+/**
+ * ubifs_fixup_all_lebs - find & remap all LEBs with trailing empty pages
+ * @c: UBIFS file-system description object
+ *
+ * This function walks through all LEBs in the filesystem and remaps those
+ * which are in-use and have trailing empty pages.
+ */
+static int ubifs_fixup_all_lebs(struct ubifs_info *c)
+{
+	int lnum, err = 0;
+	struct ubifs_lprops *lprops;
+
+	ubifs_get_lprops(c);
+
+	/*
+	 * Find all in-use LEBs and remap them to new PEBs, which will erase
+	 * any "empty" pages (they might currently exist as real 0xff data).
+	 */
+	for (lnum = 2; lnum <= c->leb_cnt; lnum++) {
+		lprops=ubifs_lpt_lookup(c, lnum);
+		if (IS_ERR(lprops)) {
+			err = PTR_ERR(lprops);
+			goto out;
+		}
+
+		if (!(lprops->flags & LPROPS_EMPTY) &&
+		    (lprops->free>=c->min_io_size)) {
+			/* Non-empty LEB with at least 1 free page */
+			err = ubifs_fixup_leb(c, lnum, lprops->free);
+			if (err)
+				goto out;
+		}
+	}
+
+out:
+	ubifs_release_lprops(c);
+	return err;
+}
+
+/**
+ * ubifs_mount_fixup_lebs - erase empty pages on first mount (for NAND)
+ * @c: UBIFS file-system description object
+ *
+ * This function fixes up LEBs on first mount, if the appropriate flag was set
+ * when the FS was created.  Each LEB with trailing "empty" (all-0xff) pages
+ * is re-written, to make sure the empty space is actually erased.  This is
+ * necessary for some NAND chips, since the 0xff data may have been programmed
+ * like real data (generating a non-0xff ECC), causing future writes to the
+ * not-really-erased pages to behave badly.  After fixup, the superblock flag
+ * is removed so that this is skipped for all future mounts.
+ */
+int ubifs_mount_fixup_lebs(struct ubifs_info *c)
+{
+	int err = 0, sup_flags = 0;
+	struct ubifs_sb_node *sup;
+
+	ubifs_assert(c->leb_fixup);
+	ubifs_assert(!c->ro_mount);
+
+	ubifs_msg("LEB fixup needed");
+
+	err = ubifs_fixup_all_lebs(c);
+	if (err)
+		goto out;
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
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 03e08ea..376d565 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1635,6 +1635,7 @@ int ubifs_write_master(struct ubifs_info *c);
 int ubifs_read_superblock(struct ubifs_info *c);
 struct ubifs_sb_node *ubifs_read_sb_node(struct ubifs_info *c);
 int ubifs_write_sb_node(struct ubifs_info *c, struct ubifs_sb_node *sup);
+int ubifs_mount_fixup_lebs(struct ubifs_info *c);

 /* replay.c */
 int ubifs_validate_entry(struct ubifs_info *c,
-- 
1.6.3.3


-- 
Matthew L. Creech
