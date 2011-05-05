Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QI5Ei-0001L0-V1
	for linux-mtd@lists.infradead.org; Thu, 05 May 2011 20:33:29 +0000
Received: by qyl38 with SMTP id 38so2264576qyl.15
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 May 2011 13:33:24 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 5 May 2011 16:33:23 -0400
Message-ID: <BANLkTinVHD1QYpqSTG0_WcLy-aA1ere34g@mail.gmail.com>
Subject: [PATCH v3 2/3] ubifs: add ubifs_fixup_free_space()
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
one or more empty pages, then re-maps the LEBs in order to erase the empty
portions.  Afterward it removes the "space_fixup" flag from the UBIFS
superblock.

Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
---
 fs/ubifs/sb.c    |  157 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/ubifs.h |    1 +
 2 files changed, 158 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 291f051..c11236b 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -651,3 +651,160 @@ out:
 	kfree(sup);
 	return err;
 }
+
+/**
+ * fixup_leb_free_space - remap/unmap a LEB containing free space.
+ * @c: UBIFS file-system description object
+ * @lnum: LEB number
+ * @len: number of used bytes in LEB (starting at offset 0)
+ *
+ * This function reads the contents of the given LEB, then remaps it to a
+ * new PEB, so that any empty pages are actually erased on flash (rather than
+ * being just all-0xff real data).  If the LEB is completely empty, it is
+ * simply unmappped.
+ */
+static int fixup_leb_free_space(struct ubifs_info *c, int lnum, int len)
+{
+	int err = 0, aligned_len;
+	void *sbuf = c->sbuf;
+
+	ubifs_assert(len >= 0);
+	ubifs_assert(len % c->min_io_size == 0);
+	ubifs_assert(len < c->leb_size);
+
+	if (len == 0) {
+		/* LEB has no valid data, unmap it (no-op if it's unused) */
+		dbg_mnt("unmap empty LEB %d", lnum);
+		return ubi_leb_unmap(c->ubi, lnum);
+	}
+
+	dbg_mnt("fixup partially-empty LEB %d (len %d)", lnum, len);
+
+	/* Read the existing valid data for this LEB */
+	err = ubi_read(c->ubi, lnum, sbuf, 0, len);
+	if (err && err != -EBADMSG)
+		return err;
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
+	return ubi_leb_change(c->ubi, lnum, sbuf, aligned_len, UBI_UNKNOWN);
+}
+
+/**
+ * fixup_free_space - find & remap all LEBs containing free space.
+ * @c: UBIFS file-system description object
+ *
+ * This function walks through all LEBs in the filesystem and remaps those
+ * containing free/empty space.
+ */
+static int fixup_free_space(struct ubifs_info *c)
+{
+	int lnum, err = 0;
+	struct ubifs_lprops *lprops;
+
+	ubifs_get_lprops(c);
+
+	/* Remap LEBs in master area */
+	for (lnum = UBIFS_MST_LNUM; lnum < UBIFS_LOG_LNUM; lnum++) {
+		err = fixup_leb_free_space(c, lnum,
+					   c->mst_offs + c->mst_node_alsz);
+		if (err)
+			goto out;
+	}
+
+	/* Remap LEBs in LPT area */
+	for (lnum = c->lpt_first; lnum <= c->lpt_last; lnum++) {
+		int free = c->ltab[lnum - c->lpt_first].free;
+		if (free > 0) {
+			err = fixup_leb_free_space(c, lnum, c->leb_size - free);
+			if (err)
+				goto out;
+		}
+	}
+
+	/* Unmap LEBs in orphans area */
+	for (lnum = c->orph_first; lnum <= c->orph_last; lnum++) {
+		err = fixup_leb_free_space(c, lnum, 0);
+		if (err)
+			goto out;
+	}
+
+	/* Remap LEBs in the main area */
+	for (lnum = c->main_first; lnum < c->leb_cnt; lnum++) {
+		lprops=ubifs_lpt_lookup(c, lnum);
+		if (IS_ERR(lprops)) {
+			err = PTR_ERR(lprops);
+			goto out;
+		}
+
+		if (lprops->free > 0) {
+			err = fixup_leb_free_space(c, lnum,
+						   c->leb_size - lprops->free);
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
+ * ubifs_fixup_free_space - find & fix all LEBs with free space.
+ * @c: UBIFS file-system description object
+ *
+ * This function fixes up LEBs containing free space on first mount, if the
+ * appropriate flag was set when the FS was created.  Each LEB with one or more
+ * empty pages (i.e. free-space-count > 0) is re-written, to make sure the
+ * free space is actually erased.  This is necessary for some NAND chips, since
+ * the free space may have been programmed like real "0xff" data (generating a
+ * non-0xff ECC), causing future writes to the not-really-erased pages to
+ * behave badly.  After fixup, the superblock flag is removed so that this is
+ * skipped for all future mounts.
+ */
+int ubifs_fixup_free_space(struct ubifs_info *c)
+{
+	int err = 0, sup_flags = 0;
+	struct ubifs_sb_node *sup;
+
+	ubifs_assert(c->space_fixup);
+	ubifs_assert(!c->ro_mount);
+
+	ubifs_msg("free-space fixup needed");
+
+	err = fixup_free_space(c);
+	if (err)
+		return err;
+
+	sup = ubifs_read_sb_node(c);
+	if (IS_ERR(sup))
+		return PTR_ERR(sup);
+
+	/* Free-space fixup is no longer required */
+	c->space_fixup = 0;
+
+	/* Set new flags, omitting free-space fixup */
+	sup_flags = 0;
+	if (c->big_lpt)
+		sup_flags |= UBIFS_FLG_BIGLPT;
+	sup->flags = cpu_to_le32(sup_flags);
+
+	err = ubifs_write_sb_node(c, sup);
+	if (err)
+		return err;
+
+	ubifs_msg("free-space fixup complete");
+	return err;
+}
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 6f0bfa9..43b3195 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1635,6 +1635,7 @@ int ubifs_write_master(struct ubifs_info *c);
 int ubifs_read_superblock(struct ubifs_info *c);
 struct ubifs_sb_node *ubifs_read_sb_node(struct ubifs_info *c);
 int ubifs_write_sb_node(struct ubifs_info *c, struct ubifs_sb_node *sup);
+int ubifs_fixup_free_space(struct ubifs_info *c);

 /* replay.c */
 int ubifs_validate_entry(struct ubifs_info *c,
-- 
1.6.3.3


-- 
Matthew L. Creech
