Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QHkIc-0007zj-6g
	for linux-mtd@lists.infradead.org; Wed, 04 May 2011 22:12:03 +0000
Received: by qwi2 with SMTP id 2so1326324qwi.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 May 2011 15:12:00 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 4 May 2011 18:12:00 -0400
Message-ID: <BANLkTikOosNid55BgDGqxab2pViieUKT4w@mail.gmail.com>
Subject: [PATCH v2 2/3] ubifs: add ubifs_fixup_free_space()
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
 fs/ubifs/sb.c    |  141 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/ubifs.h |    1 +
 2 files changed, 142 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 291f051..3e63b0b 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -651,3 +651,144 @@ out:
 	kfree(sup);
 	return err;
 }
+
+/**
+ * fixup_leb_free_space - remap/unmap a LEB containing free space.
+ * @c: UBIFS file-system description object
+ * @lprops: properties of the LEB to be fixed
+ *
+ * This function reads the contents of the given LEB, then remaps it to a
+ * new PEB, so that any empty pages are actually erased on flash (rather than
+ * being just all-0xff real data).  If the LEB is completely empty, it is
+ * simply unmappped.
+ */
+static int fixup_leb_free_space(struct ubifs_info *c,
+				const struct ubifs_lprops *lprops)
+{
+	int err = 0, aligned_len, len = c->leb_size - lprops->free;
+	void *sbuf = c->sbuf;
+
+	ubifs_assert(len >= 0);
+	ubifs_assert(len % c->min_io_size == 0);
+
+	if (len == 0) {
+		/* LEB has no valid data, just unmap it (if necessary) */
+		if (lprops->flags & LPROPS_TAKEN) {
+			dbg_mnt("unmap empty LEB %d", lprops->lnum);
+			err = ubi_leb_unmap(c->ubi, lprops->lnum);
+		}
+		return err;
+	}
+
+	dbg_mnt("fixup partially-empty LEB %d (len %d)", lprops->lnum, len);
+
+	/* Read the existing valid data for this LEB */
+	err = ubi_read(c->ubi, lprops->lnum, sbuf, 0, len);
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
+	return ubi_leb_change(c->ubi, lprops->lnum, sbuf, aligned_len,
+			      UBI_UNKNOWN);
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
+		if (lprops->free > 0) {
+			/* LEB with at least 1 free page */
+			err = fixup_leb_free_space(c, lprops);
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
+		goto out;
+
+	sup = ubifs_read_sb_node(c);
+	if (IS_ERR(sup)) {
+		err = PTR_ERR(sup);
+		goto out;
+	}
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
+		goto out;
+
+	ubifs_msg("free-space fixup complete");
+out:
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
